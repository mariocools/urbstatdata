\name{concrete_strength}
\alias{concrete_strength}
\title{Concrete Mixes and Compressive Strength}
\format{A data frame with 1,030 rows and 9 variables:
\describe{
  \item{cement_kg_m3}{Cement content in kg per cubic metre.}
  \item{blast_furnace_slag_kg_m3}{Blast-furnace slag in kg per cubic metre.}
  \item{fly_ash_kg_m3}{Fly ash in kg per cubic metre.}
  \item{water_kg_m3}{Water in kg per cubic metre.}
  \item{superplasticizer_kg_m3}{Superplasticizer in kg per cubic metre.}
  \item{coarse_aggregate_kg_m3}{Coarse aggregate in kg per cubic metre.}
  \item{fine_aggregate_kg_m3}{Fine aggregate in kg per cubic metre.}
  \item{age_days}{Age at testing, in days.}
  \item{strength_mpa}{Compressive strength in megapascals.}
}}
\source{Yeh, I.-C. (1998), Concrete Compressive Strength, UCI Machine
Learning Repository, \doi{10.24432/C5PK67}. Licensed CC BY 4.0.}
\description{Concrete-mixture composition, test age and measured compressive
strength. Variable names and units were standardised; values were retained.}
\details{A row is one tested mix. Relationships are strongly nonlinear, so a
single untransformed linear age effect is mainly useful as a diagnostic
starting point. A comparison with a benchmark is not a certification
or structural-safety decision.}
\usage{concrete_strength}
\keyword{datasets}
