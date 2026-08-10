#' Grouped Belgian Road-Accident Victim Counts in 2022
#'
#' Grouped victim counts by exact combinations of accident date, time, road,
#' victim and administrative characteristics. Codes were preserved,
#' French/Dutch labels retained, and English variable names added.
#'
#' @format A data frame with 82,876 rows and 45 variables:
#' \describe{
#'   \item{date, hour}{Accident date and hour.}
#'   \item{day_of_week_code, day_of_week_fr, day_of_week_nl}{Day code and
#'   French/Dutch labels.}
#'   \item{victims_total}{Total victim count in the grouped cell.}
#'   \item{uninjured_victims, slightly_injured, seriously_injured,
#'   dead_30_days}{Outcome counts.}
#'   \item{severe_victims}{Derived count: seriously injured plus dead within
#'   30 days.}
#'   \item{nonsevere_victims}{Derived count: uninjured plus slightly injured.}
#'   \item{built_up_area_code, built_up_area_fr, built_up_area_nl}{Built-up-area
#'   code and labels.}
#'   \item{victim_type_code, victim_type_fr, victim_type_nl}{Victim-type code
#'   and labels.}
#'   \item{road_user_type_code, road_user_type_fr, road_user_type_nl}{Road-user
#'   code and labels.}
#'   \item{road_type_code, road_type_fr, road_type_nl}{Road-type code and
#'   labels.}
#'   \item{light_condition_code, light_condition_fr,
#'   light_condition_nl}{Light-condition code and labels.}
#'   \item{age_group_code, age_group_fr, age_group_nl}{Age-group code and
#'   labels.}
#'   \item{municipality_code, municipality_fr,
#'   municipality_nl}{Municipality code and labels.}
#'   \item{district_code, district_fr, district_nl}{Administrative-district
#'   code and labels.}
#'   \item{province_code, province_fr, province_nl}{Province code and labels.}
#'   \item{region_code, region_fr, region_nl}{Region code and labels.}
#'   \item{sex_code, sex_fr, sex_nl}{Sex code and labels.}
#' }
#' @details A row is a grouped table cell, not necessarily one victim or one
#' crash. Consequently, binary individual-level logistic regression is not
#' appropriate. The data support contingency tables and grouped-binomial or
#' count analyses when frequencies are used correctly. Outcome components sum
#' to `victims_total`. Administrative codes are character strings to retain
#' leading zeroes.
#' @source Statbel and Belgian Federal Police, 2022 road-accident victim table,
#' licensed CC BY 4.0. Stable source snapshot retrieved from the
#' `rWSBIM1207` R package at Git commit
#' 3561033e7a99182664a0a20f603382b5539941f0:
#' <https://github.com/UCLouvain-CBIO/rWSBIM1207/tree/3561033e7a99182664a0a20f603382b5539941f0>
"be_accidents"

#' Belgian Cadastral Building Stock in 2025
#'
#' Counts for nine cadastral building and dwelling characteristics, four
#' building types, Belgium as a whole and the three regions. English labels
#' were added while the French source labels were retained.
#'
#' @format A data frame with 144 rows and 10 variables:
#' \describe{
#'   \item{characteristic}{Stable English code for the reported
#'   characteristic.}
#'   \item{characteristic_fr}{Original French characteristic label.}
#'   \item{country, country_fr}{English and source-language country labels.}
#'   \item{region, region_fr}{English and source-language region labels; blank
#'   source regions were labelled as the Belgium total.}
#'   \item{year}{Reference year (2025).}
#'   \item{building_type, building_type_fr}{English and source-language
#'   building-type labels.}
#'   \item{count}{Reported count; missing where the source table does not
#'   provide a cell.}
#' }
#' @details Rows are aggregate table cells, not individual buildings. Analyses
#' must avoid individual-level or causal interpretations. Missing counts are
#' source-table omissions, primarily footprint categories for apartment
#' buildings, and must not be recoded as zero.
#' @source Statbel, Cadastral statistics of the building stock, official
#' be.STAT API view 43d7cdce-3647-4f5c-86f1-a4e0c864f692, retrieved
#' 10 August 2026. Licensed CC BY 4.0.
#' <https://bestat.statbel.fgov.be/bestat/api/views/43d7cdce-3647-4f5c-86f1-a4e0c864f692/result/CSV>
"be_building_stock"

#' Simulated Heating and Cooling Loads for Residential Buildings
#'
#' Ecotect simulations for twelve residential-building forms under different
#' orientations and glazing arrangements. Variable names and units were
#' standardised; values were retained.
#'
#' @format A data frame with 768 rows and 10 variables:
#' \describe{
#'   \item{relative_compactness}{Dimensionless relative compactness.}
#'   \item{surface_area_m2, wall_area_m2, roof_area_m2}{Areas in square metres.}
#'   \item{overall_height_m}{Overall height in metres.}
#'   \item{orientation}{Coded orientation (2 through 5).}
#'   \item{glazing_area_fraction}{Glazed-area fraction.}
#'   \item{glazing_distribution}{Coded glazing-area distribution (0 through
#'   5).}
#'   \item{heating_load_kwh_m2, cooling_load_kwh_m2}{Simulated loads in kWh per
#'   square metre.}
#' }
#' @details A row is a simulated design configuration, not an observed occupied
#' building. Results should not be generalised beyond the simulation design and
#' assumptions. Treat the orientation and glazing-distribution codes as factors
#' when comparing their levels.
#' @source Tsanas, A. and Xifara, A. (2012), Energy Efficiency, UCI Machine
#' Learning Repository, \doi{10.24432/C51307}. Licensed CC BY 4.0.
"building_energy"

#' Concrete Mixes and Compressive Strength
#'
#' Concrete-mixture composition, test age and measured compressive strength.
#' Variable names and units were standardised; values were retained.
#'
#' @format A data frame with 1,030 rows and 9 variables:
#' \describe{
#'   \item{cement_kg_m3}{Cement content in kg per cubic metre.}
#'   \item{blast_furnace_slag_kg_m3}{Blast-furnace slag in kg per cubic metre.}
#'   \item{fly_ash_kg_m3}{Fly ash in kg per cubic metre.}
#'   \item{water_kg_m3}{Water in kg per cubic metre.}
#'   \item{superplasticizer_kg_m3}{Superplasticizer in kg per cubic metre.}
#'   \item{coarse_aggregate_kg_m3}{Coarse aggregate in kg per cubic metre.}
#'   \item{fine_aggregate_kg_m3}{Fine aggregate in kg per cubic metre.}
#'   \item{age_days}{Age at testing, in days.}
#'   \item{strength_mpa}{Compressive strength in megapascals.}
#' }
#' @details A row is one tested mix. Relationships are strongly nonlinear, so a
#' single untransformed linear age effect is mainly useful as a diagnostic
#' starting point. A comparison with a benchmark is not a certification or
#' structural-safety decision.
#' @source Yeh, I.-C. (1998), Concrete Compressive Strength, UCI Machine
#' Learning Repository, \doi{10.24432/C5PK67}. Licensed CC BY 4.0.
"concrete_strength"

#' Room-Sensor Measurements and Occupancy
#'
#' Time-ordered measurements from a controlled room-sensor experiment, paired
#' with the observed number of occupants.
#'
#' @format A data frame with 10,129 rows and 20 variables:
#' \describe{
#'   \item{date, time}{Measurement date (ISO string) and clock time.}
#'   \item{s1_temp_c, s2_temp_c, s3_temp_c, s4_temp_c}{Four temperature-sensor
#'   readings in degrees Celsius.}
#'   \item{s1_light_lux, s2_light_lux, s3_light_lux, s4_light_lux}{Four
#'   light-sensor readings.}
#'   \item{s1_sound_v, s2_sound_v, s3_sound_v, s4_sound_v}{Four sound-sensor
#'   readings.}
#'   \item{s5_co2_ppm}{CO2 concentration in parts per million.}
#'   \item{s5_co2_slope}{Estimated CO2 slope.}
#'   \item{s6_pir, s7_pir}{Passive-infrared sensor indicators.}
#'   \item{occupancy_count}{Observed number of room occupants, 0 through 3.}
#'   \item{occupied}{Derived indicator: 1 when `occupancy_count > 0`, otherwise
#'   0.}
#' }
#' @details A row is a measurement time, not an independent sampled room. The
#' derived `occupied` field is provided as a convenient binary outcome. Serial
#' dependence, sensor placement and the controlled setting limit ordinary
#' independent-observation inference and external generalisation.
#' @source Singh, A. P. and Chaudhari, S. (2018), Room Occupancy Estimation,
#' UCI Machine Learning Repository, \doi{10.24432/C5P605}. Licensed CC BY 4.0.
"room_occupancy"

#' Hourly Seoul Bicycle-Rental Demand
#'
#' One year of hourly public bicycle-rental demand in Seoul with weather and
#' calendar predictors. Dates were converted to ISO strings and variable names
#' and units were standardised.
#'
#' @format A data frame with 8,760 rows and 14 variables:
#' \describe{
#'   \item{date}{Calendar date as an ISO `YYYY-MM-DD` string.}
#'   \item{rented_bikes}{Number of bicycles rented during the hour.}
#'   \item{hour}{Hour of day, 0 through 23.}
#'   \item{temperature_c, dew_point_c}{Temperatures in degrees Celsius.}
#'   \item{humidity_pct}{Relative humidity in percent.}
#'   \item{wind_speed_m_s}{Wind speed in metres per second.}
#'   \item{visibility_10m}{Visibility measured in 10-metre units.}
#'   \item{solar_radiation_mj_m2}{Solar radiation in MJ per square metre.}
#'   \item{rainfall_mm, snowfall_cm}{Rainfall in millimetres and snowfall in
#'   centimetres.}
#'   \item{season}{Season label.}
#'   \item{holiday}{Holiday-status label.}
#'   \item{functioning_day}{Whether the rental system was functioning.}
#' }
#' @details Rows form a time series and are not independent random observations.
#' Non-functioning periods can generate structural zeroes. Count analyses must
#' therefore consider overdispersion, temporal dependence and service status.
#' @source Seoul Bike Sharing Demand (2020), UCI Machine Learning Repository,
#' \doi{10.24432/C5F62R}. Licensed CC BY 4.0.
"seoul_bikes"

#' New Taipei City Real-Estate Valuation Data
#'
#' Market-historical records collected from the Sindian District of New Taipei
#' City, Taiwan. Variable names were standardised and units were made explicit;
#' values were otherwise retained.
#'
#' @format A data frame with 414 rows and 8 variables:
#' \describe{
#'   \item{transaction_id}{Source row identifier.}
#'   \item{transaction_year}{Transaction year expressed as a decimal year.}
#'   \item{house_age_years}{Age of the house, in years.}
#'   \item{mrt_distance_m}{Distance to the nearest MRT station, in metres.}
#'   \item{nearby_stores}{Number of convenience stores in the living circle.}
#'   \item{latitude, longitude}{WGS84 coordinates.}
#'   \item{price_10000_twd_per_ping}{Unit-area price in 10,000 New Taiwan
#'   dollars per ping.}
#' }
#' @details A row is a transaction. The observational data support descriptive,
#' associational and predictive analyses, but do not identify causal effects of
#' MRT proximity or nearby services. A ping is approximately 3.306 square
#' metres.
#' @source Yeh, I.-C. (2018), Real Estate Valuation, UCI Machine Learning
#' Repository, \doi{10.24432/C5J30W}. Licensed CC BY 4.0.
"taipei_housing"
