\name{be_building_stock}
\alias{be_building_stock}
\title{Belgian Cadastral Building Stock in 2025}
\format{A data frame with 144 rows and 10 variables:
\describe{
  \item{characteristic}{Stable English code for the reported characteristic.}
  \item{characteristic_fr}{Original French characteristic label.}
  \item{country, country_fr}{English and source-language country labels.}
  \item{region, region_fr}{English and source-language region labels; blank
  source regions were labelled as the Belgium total.}
  \item{year}{Reference year (2025).}
  \item{building_type, building_type_fr}{English and source-language building-type labels.}
  \item{count}{Reported count; missing where the source table does not provide a cell.}
}}
\source{Statbel, Cadastral statistics of the building stock, official be.STAT
API view 43d7cdce-3647-4f5c-86f1-a4e0c864f692, retrieved 10 August 2026.
Licensed CC BY 4.0,
\url{https://bestat.statbel.fgov.be/bestat/api/views/43d7cdce-3647-4f5c-86f1-a4e0c864f692/result/CSV}.}
\description{Counts for nine cadastral building and dwelling characteristics,
four building types, Belgium as a whole and the three regions. English labels
were added while the French source labels were retained.}
\details{Rows are aggregate table cells, not individual buildings. Analyses
must avoid individual-level or causal interpretations. Missing counts are
source-table omissions, primarily footprint categories for apartment
buildings, and must not be recoded as zero.}
\usage{be_building_stock}
\keyword{datasets}
