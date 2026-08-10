# Development-only script for rebuilding the seven distributed data objects.
# This file is excluded from the package bundle by .Rbuildignore.

required_packages <- c("digest", "readxl")
missing_packages <- required_packages[
  !vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)
]
if (length(missing_packages)) {
  stop(
    "Install the development packages before rebuilding: ",
    paste(missing_packages, collapse = ", "),
    call. = FALSE
  )
}

package_root <- normalizePath(".", mustWork = TRUE)
if (!file.exists(file.path(package_root, "DESCRIPTION"))) {
  stop("Run this script from the urbstatdata package root.", call. = FALSE)
}

manifest <- read.csv(
  file.path(package_root, "data-raw", "source-checksums.csv"),
  stringsAsFactors = FALSE,
  check.names = FALSE
)

download_directory <- file.path(tempdir(), "urbstatdata-sources")
dir.create(download_directory, recursive = TRUE, showWarnings = FALSE)
dir.create(file.path(package_root, "data"), showWarnings = FALSE)

download_source <- function(object_name) {
  source_row <- manifest[manifest$object == object_name, , drop = FALSE]
  stopifnot(nrow(source_row) == 1L)

  destination <- file.path(download_directory, source_row$source_filename)
  download.file(source_row$source_url, destination, mode = "wb", quiet = TRUE)

  actual_hash <- digest::digest(
    file = destination,
    algo = "sha256",
    serialize = FALSE
  )
  if (!identical(actual_hash, source_row$sha256)) {
    stop(
      "SHA-256 mismatch for ", object_name, ". Expected ",
      source_row$sha256, " but received ", actual_hash, ".",
      call. = FALSE
    )
  }

  destination
}

extract_archive <- function(archive, object_name) {
  destination <- file.path(download_directory, object_name)
  dir.create(destination, recursive = TRUE, showWarnings = FALSE)
  unzip(archive, exdir = destination)
  destination
}

find_source_file <- function(directory, filename) {
  candidates <- list.files(directory, recursive = TRUE, full.names = TRUE)
  match <- candidates[tolower(basename(candidates)) == tolower(filename)]
  if (length(match) != 1L) {
    stop("Could not resolve exactly one source file named ", filename, ".")
  }
  match
}

mark_utf8 <- function(x) {
  if (is.character(x)) {
    return(enc2utf8(x))
  }
  if (is.data.frame(x)) {
    x[] <- lapply(x, mark_utf8)
  }
  x
}

save_dataset <- function(object, object_name) {
  object <- mark_utf8(as.data.frame(object, stringsAsFactors = FALSE))
  assign(object_name, object, envir = environment())
  save(
    list = object_name,
    file = file.path(package_root, "data", paste0(object_name, ".rda")),
    envir = environment(),
    version = 3,
    compress = "xz"
  )
}

as_integer <- function(x) as.integer(round(as.numeric(x)))

# New Taipei City real-estate valuation data.
taipei_archive <- download_source("taipei_housing")
taipei_directory <- extract_archive(taipei_archive, "taipei_housing")
taipei_housing <- as.data.frame(readxl::read_excel(find_source_file(
  taipei_directory,
  "Real estate valuation data set.xlsx"
)))
names(taipei_housing) <- c(
  "transaction_id", "transaction_year", "house_age_years", "mrt_distance_m",
  "nearby_stores", "latitude", "longitude", "price_10000_twd_per_ping"
)
taipei_housing$transaction_id <- as_integer(taipei_housing$transaction_id)
taipei_housing$nearby_stores <- as_integer(taipei_housing$nearby_stores)
save_dataset(taipei_housing, "taipei_housing")

# Residential-building energy simulations.
energy_archive <- download_source("building_energy")
energy_directory <- extract_archive(energy_archive, "building_energy")
building_energy <- as.data.frame(readxl::read_excel(find_source_file(
  energy_directory,
  "ENB2012_data.xlsx"
)))
names(building_energy) <- c(
  "relative_compactness", "surface_area_m2", "wall_area_m2", "roof_area_m2",
  "overall_height_m", "orientation", "glazing_area_fraction",
  "glazing_distribution", "heating_load_kwh_m2", "cooling_load_kwh_m2"
)
building_energy$orientation <- as_integer(building_energy$orientation)
building_energy$glazing_distribution <- as_integer(
  building_energy$glazing_distribution
)
save_dataset(building_energy, "building_energy")

# Concrete compressive strength.
concrete_archive <- download_source("concrete_strength")
concrete_directory <- extract_archive(concrete_archive, "concrete_strength")
concrete_strength <- as.data.frame(readxl::read_excel(find_source_file(
  concrete_directory,
  "Concrete_Data.xls"
)))
names(concrete_strength) <- c(
  "cement_kg_m3", "blast_furnace_slag_kg_m3", "fly_ash_kg_m3", "water_kg_m3",
  "superplasticizer_kg_m3", "coarse_aggregate_kg_m3",
  "fine_aggregate_kg_m3", "age_days", "strength_mpa"
)
concrete_strength$age_days <- as_integer(concrete_strength$age_days)
save_dataset(concrete_strength, "concrete_strength")

# Hourly Seoul bicycle-rental demand.
seoul_archive <- download_source("seoul_bikes")
seoul_directory <- extract_archive(seoul_archive, "seoul_bikes")
seoul_bikes <- read.csv(
  find_source_file(seoul_directory, "SeoulBikeData.csv"),
  fileEncoding = "windows-1252",
  stringsAsFactors = FALSE,
  check.names = FALSE
)
names(seoul_bikes) <- c(
  "date", "rented_bikes", "hour", "temperature_c", "humidity_pct",
  "wind_speed_m_s", "visibility_10m", "dew_point_c",
  "solar_radiation_mj_m2", "rainfall_mm", "snowfall_cm", "season", "holiday",
  "functioning_day"
)
seoul_bikes$date <- format(as.Date(seoul_bikes$date, "%d/%m/%Y"), "%Y-%m-%d")
seoul_bikes$rented_bikes <- as_integer(seoul_bikes$rented_bikes)
seoul_bikes$hour <- as_integer(seoul_bikes$hour)
seoul_bikes$humidity_pct <- as_integer(seoul_bikes$humidity_pct)
seoul_bikes$visibility_10m <- as_integer(seoul_bikes$visibility_10m)
save_dataset(seoul_bikes, "seoul_bikes")

# Controlled room-occupancy experiment.
occupancy_archive <- download_source("room_occupancy")
occupancy_directory <- extract_archive(occupancy_archive, "room_occupancy")
room_occupancy <- read.csv(
  find_source_file(occupancy_directory, "Occupancy_Estimation.csv"),
  stringsAsFactors = FALSE,
  check.names = FALSE
)
names(room_occupancy) <- c(
  "date", "time", "s1_temp_c", "s2_temp_c", "s3_temp_c", "s4_temp_c",
  "s1_light_lux", "s2_light_lux", "s3_light_lux", "s4_light_lux",
  "s1_sound_v", "s2_sound_v", "s3_sound_v", "s4_sound_v", "s5_co2_ppm",
  "s5_co2_slope", "s6_pir", "s7_pir", "occupancy_count"
)
room_occupancy$date <- format(
  as.Date(room_occupancy$date, "%Y/%m/%d"),
  "%Y-%m-%d"
)
integer_columns <- c(
  "s1_light_lux", "s2_light_lux", "s3_light_lux", "s4_light_lux", "s6_pir",
  "s7_pir", "occupancy_count"
)
room_occupancy[integer_columns] <- lapply(
  room_occupancy[integer_columns],
  as_integer
)
room_occupancy$occupied <- as.integer(room_occupancy$occupancy_count > 0L)
save_dataset(room_occupancy, "room_occupancy")

# Belgian cadastral building stock.
building_source <- download_source("be_building_stock")
be_building_stock <- read.csv(
  building_source,
  fileEncoding = "UTF-8-BOM",
  stringsAsFactors = FALSE,
  check.names = FALSE,
  na.strings = c("", "NA")
)
names(be_building_stock) <- c(
  "characteristic_fr", "country_fr", "region_fr", "year", "building_type_fr",
  "count"
)
characteristics <- c(
  "Nombre de bâtiments" = "buildings_total",
  "Nombre de bâtiments érigés après 1981" = "built_after_1981",
  "Nombre de bâtiments ayant une superficie bâtie au sol inférieure à 45 m²" =
    "footprint_below_45_m2",
  "Nombre de bâtiments ayant une superficie bâtie au sol de 45 à 64 m²" =
    "footprint_45_to_64_m2",
  "Nombre de bâtiments ayant une superficie bâtie au sol de 65 à 104 m²" =
    "footprint_65_to_104_m2",
  "Nombre de bâtiments ayant une superficie bâtie au sol supérieure à 104 m²" =
    "footprint_above_104_m2",
  "Nombre de bâtiments équipés de chauffage central ou de conditionnement d’air" =
    "central_heating_or_air_conditioning",
  "Nombre de bâtiments comportant au moins une salle de bains" =
    "at_least_one_bathroom",
  "Nombre de logements" = "dwellings_total"
)
regions <- c(
  "Région flamande" = "Flanders",
  "Région de Bruxelles-Capitale" = "Brussels-Capital",
  "Région wallonne" = "Wallonia",
  "Belgique (total)" = "Belgium (total)"
)
building_types <- c(
  "Maisons de type fermé" = "Closed building",
  "Maisons de type demi-fermé" = "Semi-detached building",
  "Maisons de type ouvert, fermes, châteaux" = "Open building, farm or castle",
  "Buildings et immeubles à appartements" = "Apartment building"
)
be_building_stock$region_fr[is.na(be_building_stock$region_fr)] <-
  "Belgique (total)"
be_building_stock <- within(be_building_stock, {
  characteristic <- unname(characteristics[characteristic_fr])
  country <- "Belgium"
  region <- unname(regions[region_fr])
  building_type <- unname(building_types[building_type_fr])
  year <- as_integer(year)
  count <- as.numeric(count)
})
be_building_stock <- be_building_stock[c(
  "characteristic", "characteristic_fr", "country", "country_fr", "region",
  "region_fr", "year", "building_type", "building_type_fr", "count"
)]
save_dataset(be_building_stock, "be_building_stock")

# Belgian road-accident victim counts.
accident_source <- download_source("be_accidents")
be_accidents <- readRDS(accident_source)
accident_names <- c(
  DT_DAY = "date", DT_HOUR = "hour", CD_DAY_OF_WEEK = "day_of_week_code",
  TX_DAY_OF_WEEK_DESCR_FR = "day_of_week_fr",
  TX_DAY_OF_WEEK_DESCR_NL = "day_of_week_nl", MS_VICT = "victims_total",
  MS_VIC_OK = "uninjured_victims", MS_SLY_INJ = "slightly_injured",
  MS_SERLY_INJ = "seriously_injured", MS_DEAD_30_DAYS = "dead_30_days",
  CD_BUILD_UP_AREA = "built_up_area_code",
  TX_BUILD_UP_AREA_DESCR_NL = "built_up_area_nl",
  TX_BUILD_UP_AREA_DESCR_FR = "built_up_area_fr", CD_VICT_TYPE = "victim_type_code",
  TX_VICT_TYPE_DESCR_FR = "victim_type_fr", TX_VICT_TYPE_DESCR_NL = "victim_type_nl",
  CD_ROAD_USER_TYPE = "road_user_type_code",
  TX_ROAD_USR_TYPE_DESCR_FR = "road_user_type_fr",
  TX_ROAD_USR_TYPE_DESCR_NL = "road_user_type_nl", CD_ROAD_TYPE = "road_type_code",
  TX_ROAD_TYPE_DESCR_FR = "road_type_fr", TX_ROAD_TYPE_DESCR_NL = "road_type_nl",
  CD_LIGHT_COND = "light_condition_code",
  TX_LIGHT_COND_DESCR_FR = "light_condition_fr",
  TX_LIGHT_COND_DESCR_NL = "light_condition_nl", CD_AGE_CLS = "age_group_code",
  TX_AGE_CLS_DESCR_FR = "age_group_fr", TX_AGE_CLS_DESCR_NL = "age_group_nl",
  CD_MUNTY_REFNIS = "municipality_code", TX_MUNTY_DESCR_FR = "municipality_fr",
  TX_MUNTY_DESCR_NL = "municipality_nl", CD_DSTR_REFNIS = "district_code",
  TX_ADM_DSTR_DESCR_FR = "district_fr", TX_ADM_DSTR_DESCR_NL = "district_nl",
  CD_PROV_REFNIS = "province_code", TX_PROV_DESCR_FR = "province_fr",
  TX_PROV_DESCR_NL = "province_nl", CD_RGN_REFNIS = "region_code",
  TX_RGN_DESCR_FR = "region_fr", TX_RGN_DESCR_NL = "region_nl",
  CD_SEX = "sex_code", TX_SEX_DESCR_FR = "sex_fr", TX_SEX_DESCR_NL = "sex_nl"
)
matched_names <- names(be_accidents) %in% names(accident_names)
names(be_accidents)[matched_names] <- unname(
  accident_names[names(be_accidents)[matched_names]]
)
be_accidents$date <- format(as.Date(be_accidents$date), "%Y-%m-%d")
count_columns <- c(
  "victims_total", "uninjured_victims", "slightly_injured",
  "seriously_injured", "dead_30_days"
)
be_accidents[count_columns] <- lapply(be_accidents[count_columns], as_integer)
zero_pad <- function(x, width) {
  missing <- is.na(x) | trimws(as.character(x)) == ""
  answer <- sprintf(paste0("%0", width, "d"), as.integer(as.character(x)))
  answer[missing] <- NA_character_
  answer
}
for (code_name in c(
  "municipality_code", "district_code", "province_code", "region_code"
)) {
  be_accidents[[code_name]] <- zero_pad(be_accidents[[code_name]], 5L)
}
be_accidents$severe_victims <- with(
  be_accidents,
  seriously_injured + dead_30_days
)
be_accidents$nonsevere_victims <- with(
  be_accidents,
  uninjured_victims + slightly_injured
)
save_dataset(be_accidents, "be_accidents")

message("Rebuilt seven data objects in ", file.path(package_root, "data"), ".")
