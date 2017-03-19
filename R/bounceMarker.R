# https://github.com/maximeh/leaflet.bouncemarker

bounceMarkerDependency <- function() {
  list(
    htmltools::htmlDependency(
      "bouncemarker",
      "0.1.0",
      system.file("htmlwidgets/lib/bouncemarker", package = "leaflet.plugins"),
      script = c("bouncemarker.js", "bouncemarker-binding.js")#,
      #stylesheet = "leaflet-sidebar.css"
    ))
}

#' Add Bounce Markers to map
#' @param lat numeric latitude
#' @param lng numeric longitude
#' @param map map object created by [leaflet::leaflet]
#' @export
#' @importFrom htmltools htmlDependency
#' @import leaflet
#' @examples
#' # leaflet() %>% addTiles() %>% addBounceMarkers(49, 11)
addBounceMarkers = function(map, lat, lng) {
  map$dependencies <- c(map$dependencies, bounceMarkerDependency())
  invokeMethod(map, getMapData(map), 'addBounceMarkers', lat, lng)
}
