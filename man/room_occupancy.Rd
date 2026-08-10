\name{room_occupancy}
\alias{room_occupancy}
\title{Room-Sensor Measurements and Occupancy}
\format{A data frame with 10,129 rows and 20 variables:
\describe{
  \item{date, time}{Measurement date (ISO string) and clock time.}
  \item{s1_temp_c, s2_temp_c, s3_temp_c, s4_temp_c}{Four temperature-sensor readings in degrees Celsius.}
  \item{s1_light_lux, s2_light_lux, s3_light_lux, s4_light_lux}{Four light-sensor readings.}
  \item{s1_sound_v, s2_sound_v, s3_sound_v, s4_sound_v}{Four sound-sensor readings.}
  \item{s5_co2_ppm}{CO2 concentration in parts per million.}
  \item{s5_co2_slope}{Estimated CO2 slope.}
  \item{s6_pir, s7_pir}{Passive-infrared sensor indicators.}
  \item{occupancy_count}{Observed number of room occupants, 0 through 3.}
  \item{occupied}{Derived indicator: 1 when \code{occupancy_count > 0}, otherwise 0.}
}}
\source{Singh, A. P. and Chaudhari, S. (2018), Room Occupancy Estimation,
UCI Machine Learning Repository, \doi{10.24432/C5P605}. Licensed CC BY 4.0.}
\description{Time-ordered measurements from a controlled room-sensor
experiment, paired with the observed number of occupants.}
\details{A row is a measurement time, not an independent sampled room. The
derived \code{occupied} field is provided as a convenient binary outcome.
Serial dependence, sensor placement and the controlled setting limit ordinary
independent-observation inference and external generalisation.}
\usage{room_occupancy}
\keyword{datasets}
