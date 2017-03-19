# leaflet.plugins

R package to make leaflet plugins available to R users.

## Installation
```r
devtools::install_github("markdumke/leaflet.plugins")
```

## Add Bounce Markers to map

See https://github.com/maximeh/leaflet.bouncemarker.
```r
library(leaflet.plugins)
leaflet() %>% addTiles() %>% addBounceMarkers(49, 11)
```
