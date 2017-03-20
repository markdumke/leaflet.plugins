# Source: https://github.com/nickpeihl/leaflet-sidebar-v2
leafletSidebarDependency <- function() {
  list(
    htmltools::htmlDependency(
      "leaflet-sidebar",
      "2.7.0", # change this?
      system.file("htmlwidgets/lib/leaflet-sidebar", package = "leaflet.sidebar"),
      script = c("leaflet-sidebar.min.js"),
      stylesheet = "leaflet-sidebar.css"
    ))
}

#' Add responsive sidebar to the map
#'
#' @param map a map widget object
#' @return modified map
#' @import htmltools
#' @export
#' @seealso [Github: leaflet-sidebar](https://github.com/nickpeihl/leaflet-sidebar-v2)
#' @examples
#' library(leaflet)
#' leaflet() %>% addTiles() %>% addResponsiveSidebar()
addResponsiveSidebar <- function(map) {
  map$dependencies <- c(map$dependencies, leafletSidebarDependency())
  invokeMethod(map, getMapData(map), 'leaflet-sidebar')
}

# leaflet() %>% addTiles() %>% addResponsiveSidebar()

# l <- leaflet() %>% addTiles() %>% setView(0, 52, 5)
# 
# f <- function (map, lng = NULL, lat = NULL, data = getMapData(map)){
#   pts = derivePoints(data, lng, lat, missing(lng), missing(lat), "addMarkers")
#   invokeMethod(map, data, "addMarkers", pts$lat, pts$lng)
# }
# 
# l %>% f(51, 5)
# 
# l %>% htmlwidgets::onRender("
#     function(el, x) {
#       var myMap = this;
#           L.marker([51.5, -0.09]).addTo(mymap)
#           .bindPopup('A pretty CSS3 popup.<br> Easily customizable.')
#           .openPopup();
#     }")
# 
# 
# library(leaflet)
# library(htmlwidgets)
# 
# # This example uses browser geolocation. RStudio users:
# # this won't work in the Viewer pane; try popping it
# # out into your system web browser.
# leaflet() %>% addTiles() %>%
#   onRender("
#     function(el, x) {
# L.marker([48.85, 2.35],
#   {
#     boolean bounceOnAdd,
#     object bounceOnAddOptions,
#     function bounceOnAddCallback
#   }).addTo(this);
#     }
#   ")
