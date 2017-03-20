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
#' @param id character id
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
#' leaflet() %>% addTiles() %>% addLeafletSidebar(id = "a", options = list(position = "right")) %>% 
#'   addPanel(sidebarId = "a", layerId = "Tab1", tab_name = "Tab1", pane = pane1)
#' 
#' }
#' 
addLeafletSidebar <- function(map, id, options = NULL) {
  map$dependencies <- c(map$dependencies, leafletSidebarDependency())
  invokeMethod(map, getMapData(map), 'addLeafletSidebar', id, options)
}

#' @rdname addLeafletSidebar
#' @export
#'
#' @examples
#' library(leaflet)
#' leaflet() %>% addTiles() %>% addLeafletSidebar(id = "a", options = list(position = "right")) %>% 
#'   removeLeafletSidebar()
removeLeafletSidebar <- function(map) { # sidebar_id
  map$dependencies <- c(map$dependencies, leafletSidebarDependency())
  invokeMethod(map, getMapData(map), 'removeLeafletSidebar')
}

#' @rdname addLeafletSidebar
#' @export
openLeafletSidebar <- function(map, tab_id) { # sidebar_id
  map$dependencies <- c(map$dependencies, leafletSidebarDependency())
  invokeMethod(map, getMapData(map), 'openLeafletSidebar', tab_id)
}

#' @rdname addLeafletSidebar
#' @export
closeLeafletSidebar <- function(map) { # sidebar_id
  map$dependencies <- c(map$dependencies, leafletSidebarDependency())
  invokeMethod(map, getMapData(map), 'closeLeafletSidebar')
}


#' Add panel to leaflet sidebar
#'
#' @inheritParams addLeafletSidebar
#' @param sidebarId id of the sidebar
#' @param layerId id of the panel
#' @param tab_name character the name of the panel
#' @param pane character html content
#' @param position character: top or bottom
#'
#' @return modified map
#' @export
addPanel <- function(map, sidebarId, layerId, tab_name, pane, position = "top") {
  map$dependencies <- c(map$dependencies, leafletSidebarDependency())
  invokeMethod(map, getMapData(map), 'addPanel', sidebarId, layerId, tab_name, pane, position)
}

#' @rdname addPanel
#' @export
removePanel <- function(map, sidebarId, layerId, tab_name) {
  map$dependencies <- c(map$dependencies, leafletSidebarDependency())
  invokeMethod(map, getMapData(map), 'removePanel', sidebarId, layerId, tab_name)
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

