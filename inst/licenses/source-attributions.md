# Dataset sources, licences and changes

All downloads were fixed on 10 August 2026. Exact SHA-256 checksums and the
development-only rebuilding script are maintained in `data-raw/` in the source
repository: <https://github.com/mariocools/urbstatdata/tree/main/data-raw>.

The CC BY 4.0 licence text is available at
<https://creativecommons.org/licenses/by/4.0/>. The citations below identify
the original data sets, and the accompanying notes state the changes made in
this data package.

## UCI datasets

The following datasets were downloaded from the UCI Machine Learning
Repository and are licensed CC BY 4.0:

* Real Estate Valuation, I-Cheng Yeh (2018), DOI 10.24432/C5J30W.
* Energy Efficiency, Athanasios Tsanas and Angeliki Xifara (2012),
  DOI 10.24432/C51307.
* Concrete Compressive Strength, I-Cheng Yeh (1998), DOI 10.24432/C5PK67.
* Seoul Bike Sharing Demand (2020), DOI 10.24432/C5F62R.
* Room Occupancy Estimation, Adarsh Pal Singh and Sachin Chaudhari (2018),
  DOI 10.24432/C5P605.

Changes were limited to stable snake-case variable names, ISO-formatted date
strings, explicit units in names where the source supplied them, and the
derived binary `occupied` field in `room_occupancy`.

## Belgian road-accident victims

`be_accidents` derives from Statbel and Belgian Federal Police data for 2022,
licensed CC BY 4.0. The fixed RDS snapshot was retrieved from the
GPL-2-licensed `rWSBIM1207` R package at commit
3561033e7a99182664a0a20f603382b5539941f0. The data remain attributed to
Statbel and the Federal Police; `rWSBIM1207` is credited as the retrieval
mirror. Variables were renamed and two grouped outcome totals were derived:
`severe_victims` and `nonsevere_victims`.

## Belgian building stock

`be_building_stock` derives from Statbel's 2025 cadastral building-stock view,
licensed CC BY 4.0, retrieved through the official be.STAT API. French source
labels are retained and English labels were added. No statistical
values were changed.
