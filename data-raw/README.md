# Rebuilding the seven data objects

The committed files under `data/` are fixed release snapshots. Following the
data-package workflow in *R Packages*, their origin and transformation code are
kept in `data-raw/`, which is excluded from the CRAN bundle by `.Rbuildignore`.

`build-data.R` downloads the seven recorded sources into a temporary directory,
checks each SHA-256 digest before processing it, standardises names and selected
types, marks character data as UTF-8, and writes one same-named object to each
`data/<object>.rda` file with xz compression.

The development-only packages required to rebuild the data are:

```r
install.packages(c("digest", "readxl"))
```

Run the script from the package root:

```r
source("data-raw/build-data.R")
```

A changed source digest stops the build. Inspect and document the upstream
change before updating `source-checksums.csv` or any distributed object.
