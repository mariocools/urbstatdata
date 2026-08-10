\name{building_energy}
\alias{building_energy}
\title{Simulated Heating and Cooling Loads for Residential Buildings}
\format{A data frame with 768 rows and 10 variables:
\describe{
  \item{relative_compactness}{Dimensionless relative compactness.}
  \item{surface_area_m2, wall_area_m2, roof_area_m2}{Areas in square metres.}
  \item{overall_height_m}{Overall height in metres.}
  \item{orientation}{Coded orientation (2 through 5).}
  \item{glazing_area_fraction}{Glazed-area fraction.}
  \item{glazing_distribution}{Coded glazing-area distribution (0 through 5).}
  \item{heating_load_kwh_m2, cooling_load_kwh_m2}{Simulated loads in kWh per square metre.}
}}
\source{Tsanas, A. and Xifara, A. (2012), Energy Efficiency, UCI Machine
Learning Repository, \doi{10.24432/C51307}. Licensed CC BY 4.0.}
\description{Ecotect simulations for twelve residential-building forms under
different orientations and glazing arrangements. Variable names and units
were standardised; values were retained.}
\details{A row is a simulated design configuration, not an observed occupied
building. Results should not be generalised beyond the simulation design and
assumptions. Treat the orientation and glazing-distribution codes as factors
when comparing their levels.}
\usage{building_energy}
\keyword{datasets}
