LeafletWidget.methods.addLeafletSidebar = function(id, options) { // id and options
  (function() {
  var sidebar = L.control.sidebar("thisid", options).addTo(this);
  }).call(this);
};

LeafletWidget.methods.addPanel = function(sidebar_id, layer_id, tab_name, pane, position) {
  (function() {
    var panelContent = {
      id: layer_id,   
      tab: tab_name,  
      pane: pane,     
      position: position    
    };
  thisid.addPanel(panelContent); thisid_id.open(layer_id);
  }).call(this);
};

LeafletWidget.methods.removeLeafletSidebar = function() {
    this.controls.remove();
};

LeafletWidget.methods.openLeafletSidebar = function(tab_id) {
  (function() {
    this.sidebar.open(tab_id);
  }).call(this);
};


LeafletWidget.methods.closeLeafletSidebar = function() {
  (function() {
    this.sidebar.close();
  }).call(this);
};
