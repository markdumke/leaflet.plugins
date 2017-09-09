# Source: https://github.com/ardhi/Leaflet.MousePosition

MousePositionDependency <- function() {
  list(
    htmltools::htmlDependency(
      "mousePosition",
      "0.1.0",
      system.file("htmlwidgets/lib/addMousePosition", package = "leaflet.plugins"),
      script = c("L.Control.MousePosition.js", "addMousePosition-binding.js")
    ))
}

#' Add Mouse Position to map
#' 
#' Add coordinates of current mouse position to map.
#' 
#' @param map map object created by [leaflet::leaflet]
#' @export
#' @seealso [Github: Leaflet.MousePosition](https://github.com/ardhi/Leaflet.MousePosition)
#' @examples
#' library(leaflet)
#' # leaflet() %>% addTiles() %>% addMousePosition()
addMousePosition = function(map) {
  map$dependencies <- c(map$dependencies, MousePositionDependency())
  invokeMethod(map, getMapData(map), 'addMousePosition')
}
