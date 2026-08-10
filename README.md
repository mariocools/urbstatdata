# urbstatdata

`urbstatdata` is a data-only R package that distributes seven documented data
sets from transport, traffic safety, urban planning, construction and
architectural engineering. It exports no functions and has no runtime package
dependencies.

## Installation

Install the development version from GitHub with:

```r
install.packages("remotes")
remotes::install_github("mariocools/urbstatdata")
```

After acceptance on CRAN, the package can be installed with:

```r
install.packages("urbstatdata")
```

## Data sets

| Object | Rows | Columns | Subject |
|---|---:|---:|---|
| `taipei_housing` | 414 | 8 | Real-estate valuation in New Taipei City |
| `building_energy` | 768 | 10 | Simulated residential heating and cooling loads |
| `concrete_strength` | 1,030 | 9 | Concrete composition and compressive strength |
| `seoul_bikes` | 8,760 | 14 | Hourly bicycle-rental demand in Seoul |
| `be_accidents` | 82,876 | 45 | Grouped Belgian road-accident victim counts |
| `be_building_stock` | 144 | 10 | Belgian cadastral building-stock counts |
| `room_occupancy` | 10,129 | 20 | Room sensors and observed occupancy |

The objects are lazy-loaded and can be accessed directly:

```r
library(urbstatdata)

head(taipei_housing)
summary(room_occupancy$occupancy_count)
```

Use the corresponding help page for definitions, provenance and limitations:

```r
?taipei_housing
?be_accidents
```

## Sources and licences

The five international data sets originate from the UCI Machine Learning
Repository. The two Belgian data sets originate from Statbel, with the road
accident data jointly attributed to the Belgian Federal Police. The source
licence is CC BY 4.0 for each distributed data set. Full attribution and the
changes made to each source are recorded in `inst/COPYRIGHTS`,
`inst/licenses/source-attributions.md`, and the seven help pages.
