# Source: https://github.com/nickpeihl/leaflet-sidebar-v2
leafletSidebarDependency <- function() {
  list(
    htmltools::htmlDependency(
      "leaflet-sidebar",
      "0.1.0",
      system.file("htmlwidgets/lib/leaflet-sidebar", package = "leaflet.plugins"),
      script = c("leaflet-sidebar.js", "leaflet-sidebar-binding.js"),
      stylesheet = "leaflet-sidebar.css"
    ))
}

#' Add responsive sidebar to a leaflet map
#'
#' Types of events: Opening, closing and content
#'
#' @param map a map widget object
#' @param options list of options, e.g. `options = list(position = "right")`
#' @return modified map
#' @import htmltools
#' @export
#' @seealso [Github: leaflet-sidebar](https://github.com/nickpeihl/leaflet-sidebar-v2)
#' @examples
#' \dontrun{
#' library(leaflet)
#' pane1 <- ' <h1 class="sidebar-header"> Tab1
#' <span class="sidebar-close"><i class="fa fa-caret-left"></i></span></h1>
#' <p>A responsive sidebar for <a href="http://leafletjs.com/">Leaflet</a>.</p>
#' '
#' pane2 <- '<h1 class="sidebar-header">Tab2<span class="sidebar-close"><i class="fa fa-caret-left"></i></span></h1>'
#' leaflet() %>% addTiles() %>% addLeafletSidebar(options = list(position = "right")) %>% 
#'   addPanel(layerId = "Tab1", tab_name = "Tab1", pane = pane)
#' 
#' }
#' 
addLeafletSidebar <- function(map, options) {
  map$dependencies <- c(map$dependencies, leafletSidebarDependency())
  invokeMethod(map, getMapData(map), 'addLeafletSidebar', options)
}


#' Add panel to leaflet sidebar
#'
#' @inheritParams addLeafletSidebar
#' @param tab_name character the name of the tab
#' @param position character: top or bottom
#'
#' @return modified map
#' @export
addPanel <- function(map, layerId, tab_name, pane, position = "top") {
  map$dependencies <- c(map$dependencies, leafletSidebarDependency())
  invokeMethod(map, getMapData(map), 'addPanel', layerId, tab_name, position)
}

# sidebar.addPanel(panelContent);
#   sidebar.removePanel('userinfo');
#   sidebar.disablePanel('userinfo');
# sidebar.enablePanel('userinfo');

#   sidebar.open('userinfo');
#   sidebar.close();

# sidebar.on('content', function(e) {
#   // e.id contains the id of the opened panel
# })

