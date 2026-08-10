\name{seoul_bikes}
\alias{seoul_bikes}
\title{Hourly Seoul Bicycle-Rental Demand}
\format{A data frame with 8,760 rows and 14 variables:
\describe{
  \item{date}{Calendar date as an ISO \code{YYYY-MM-DD} string.}
  \item{rented_bikes}{Number of bicycles rented during the hour.}
  \item{hour}{Hour of day, 0 through 23.}
  \item{temperature_c, dew_point_c}{Temperatures in degrees Celsius.}
  \item{humidity_pct}{Relative humidity in percent.}
  \item{wind_speed_m_s}{Wind speed in metres per second.}
  \item{visibility_10m}{Visibility measured in 10-metre units.}
  \item{solar_radiation_mj_m2}{Solar radiation in MJ per square metre.}
  \item{rainfall_mm, snowfall_cm}{Rainfall in millimetres and snowfall in centimetres.}
  \item{season}{Season label.}
  \item{holiday}{Holiday-status label.}
  \item{functioning_day}{Whether the rental system was functioning.}
}}
\source{Seoul Bike Sharing Demand (2020), UCI Machine Learning Repository,
\doi{10.24432/C5F62R}. Licensed CC BY 4.0.}
\description{One year of hourly public bicycle-rental demand in Seoul with
weather and calendar predictors. Dates were converted to ISO strings and
variable names and units were standardised.}
\details{Rows form a time series and are not independent random observations.
Non-functioning periods can generate structural zeroes. Count analyses must
therefore consider overdispersion, temporal dependence and service status.}
\usage{seoul_bikes}
\keyword{datasets}
