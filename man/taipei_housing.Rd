\name{taipei_housing}
\alias{taipei_housing}
\title{New Taipei City Real-Estate Valuation Data}
\format{A data frame with 414 rows and 8 variables:
\describe{
  \item{transaction_id}{Source row identifier.}
  \item{transaction_year}{Transaction year expressed as a decimal year.}
  \item{house_age_years}{Age of the house, in years.}
  \item{mrt_distance_m}{Distance to the nearest MRT station, in metres.}
  \item{nearby_stores}{Number of convenience stores in the living circle.}
  \item{latitude, longitude}{WGS84 coordinates.}
  \item{price_10000_twd_per_ping}{Unit-area price in 10,000 New Taiwan dollars per ping.}
}}
\source{Yeh, I.-C. (2018), Real Estate Valuation, UCI Machine Learning
Repository, \doi{10.24432/C5J30W}. Licensed CC BY 4.0.}
\description{Market-historical records collected from the Sindian District of
New Taipei City, Taiwan. Variable names were standardised and units were made
explicit; values were otherwise retained.}
\details{A row is a transaction. The observational data support descriptive,
associational and predictive analyses, but do not identify causal effects of
MRT proximity or nearby services. A ping is approximately 3.306 square metres.}
\usage{taipei_housing}
\keyword{datasets}
