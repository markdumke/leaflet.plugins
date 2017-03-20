LeafletWidget.methods.addLeafletSidebar = function(options) {
  (function() {
    var sidebar = L.control.sidebar("sidebar", options).addTo(this); sidebar.open(); // id and options
  }).call(this);
};

LeafletWidget.methods.addPanel = function(layer_id, tab_name, pane, position) {
  (function() {
    var panelContent = {
      id: layer_id,   
      tab: tab_name,  
      pane: pane,     
      position: position    
    };
  sidebar.addPanel(panelContent); sidebar.open();
  }).call(this);
};
