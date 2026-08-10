\name{be_accidents}
\alias{be_accidents}
\title{Grouped Belgian Road-Accident Victim Counts in 2022}
\format{A data frame with 82,876 rows and 45 variables. It includes:
\describe{
  \item{date, hour}{Accident date and hour.}
  \item{day_of_week_code, day_of_week_fr, day_of_week_nl}{Day code and French/Dutch labels.}
  \item{victims_total}{Total victim count in the grouped cell.}
  \item{uninjured_victims, slightly_injured, seriously_injured, dead_30_days}{Outcome counts.}
  \item{severe_victims}{Derived count: seriously injured plus dead within 30 days.}
  \item{nonsevere_victims}{Derived count: uninjured plus slightly injured.}
  \item{built_up_area_code, built_up_area_fr, built_up_area_nl}{Built-up-area code and labels.}
  \item{victim_type_code, victim_type_fr, victim_type_nl}{Victim-type code and labels.}
  \item{road_user_type_code, road_user_type_fr, road_user_type_nl}{Road-user code and labels.}
  \item{road_type_code, road_type_fr, road_type_nl}{Road-type code and labels.}
  \item{light_condition_code, light_condition_fr, light_condition_nl}{Light-condition code and labels.}
  \item{age_group_code, age_group_fr, age_group_nl}{Age-group code and labels.}
  \item{municipality_code, municipality_fr, municipality_nl}{Municipality code and labels.}
  \item{district_code, district_fr, district_nl}{Administrative-district code and labels.}
  \item{province_code, province_fr, province_nl}{Province code and labels.}
  \item{region_code, region_fr, region_nl}{Region code and labels.}
  \item{sex_code, sex_fr, sex_nl}{Sex code and labels.}
}}
\source{Statbel and Belgian Federal Police, 2022 road-accident victim table,
licensed CC BY 4.0. Stable source snapshot retrieved from the
\pkg{rWSBIM1207} R package at Git commit
3561033e7a99182664a0a20f603382b5539941f0,
\url{https://github.com/UCLouvain-CBIO/rWSBIM1207/tree/3561033e7a99182664a0a20f603382b5539941f0}.}
\description{Grouped victim counts by exact combinations of accident date,
time, road, victim and administrative characteristics. Codes were preserved,
French/Dutch labels retained, and English variable names added.}
\details{A row is a grouped table cell, not necessarily one victim or one
crash. Consequently, binary individual-level logistic regression is not
appropriate. The data support contingency tables and grouped-binomial or
count analyses when frequencies are used correctly. Outcome components sum to
\code{victims_total}. Administrative codes are character strings to retain
leading zeroes.}
\usage{be_accidents}
\keyword{datasets}
