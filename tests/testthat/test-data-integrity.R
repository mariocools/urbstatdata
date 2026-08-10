dataset_names <- c(
  "be_accidents",
  "be_building_stock",
  "building_energy",
  "concrete_strength",
  "room_occupancy",
  "seoul_bikes",
  "taipei_housing"
)

expected_rows <- c(
  be_accidents = 82876L,
  be_building_stock = 144L,
  building_energy = 768L,
  concrete_strength = 1030L,
  room_occupancy = 10129L,
  seoul_bikes = 8760L,
  taipei_housing = 414L
)

expected_columns <- c(
  be_accidents = 45L,
  be_building_stock = 10L,
  building_energy = 10L,
  concrete_strength = 9L,
  room_occupancy = 20L,
  seoul_bikes = 14L,
  taipei_housing = 8L
)

load_dataset <- function(object_name) {
  data_environment <- new.env(parent = emptyenv())
  data(
    list = object_name,
    package = "urbstatdata",
    envir = data_environment
  )
  get(object_name, envir = data_environment, inherits = FALSE)
}

objects <- lapply(dataset_names, load_dataset)
names(objects) <- dataset_names

test_that("the package publishes exactly seven documented data sets", {
  data_index <- data(package = "urbstatdata")$results

  expect_setequal(data_index[, "Item"], dataset_names)
  expect_length(objects, 7L)
  expect_true(all(vapply(objects, is.data.frame, logical(1))))
})

test_that("data-set dimensions match the documentation", {
  expect_identical(vapply(objects, nrow, integer(1)), expected_rows)
  expect_identical(vapply(objects, ncol, integer(1)), expected_columns)
  expect_true(all(vapply(objects, function(x) !anyDuplicated(names(x)), logical(1))))
})

test_that("key variables and ranges are preserved", {
  expect_equal(objects$taipei_housing$transaction_id, seq_len(414L))
  expect_true(all(objects$taipei_housing$mrt_distance_m >= 0))

  expect_true(all(objects$building_energy$heating_load_kwh_m2 > 0))
  expect_true(all(objects$building_energy$cooling_load_kwh_m2 > 0))

  expect_true(all(objects$concrete_strength$age_days > 0))
  expect_true(all(objects$concrete_strength$strength_mpa > 0))

  expect_true(all(objects$seoul_bikes$hour %in% 0:23))
  expect_true(all(objects$seoul_bikes$rented_bikes >= 0))

  expect_true(all(objects$room_occupancy$occupied %in% 0:1))
  expect_equal(
    objects$room_occupancy$occupied,
    as.integer(objects$room_occupancy$occupancy_count > 0)
  )
})

test_that("Belgian grouped counts retain their accounting identities", {
  expect_identical(
    objects$be_accidents$victims_total,
    objects$be_accidents$uninjured_victims +
      objects$be_accidents$slightly_injured +
      objects$be_accidents$seriously_injured +
      objects$be_accidents$dead_30_days
  )
  expect_identical(
    objects$be_accidents$severe_victims,
    objects$be_accidents$seriously_injured +
      objects$be_accidents$dead_30_days
  )
  expect_identical(
    objects$be_accidents$nonsevere_victims,
    objects$be_accidents$uninjured_victims +
      objects$be_accidents$slightly_injured
  )

  expect_equal(sort(unique(objects$be_building_stock$year)), 2025)
  expect_length(unique(objects$be_building_stock$characteristic), 9L)
  expect_length(unique(objects$be_building_stock$region), 4L)
  expect_equal(sum(is.na(objects$be_building_stock$count)), 16L)
})
