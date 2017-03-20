LeafletWidget.methods.addLeafletSidebar = function(options, pane, pane2) {
  (function() {
    var sidebar = L.control.sidebar('sidebar', options).addTo(this); // id and options
    /* add a new panel */
    var panelContent = {
      id: 'userinfo',                     // UID, used to access the panel
      tab: 'Tab1',  // content can be passed as HTML string,
      pane: pane,        // DOM elements can be passed, too
      position: 'top'                  // vertical alignment, 'top' or 'bottom'
    };
    var panelContent2 = {
      id: 'userinfo2',                     
      tab: 'Tab2',  
      pane: pane2,    
      position: 'top'               
    }; 
    
  sidebar.addPanel(panelContent); sidebar.addPanel(panelContent2); sidebar.open('userinfo');
  }).call(this);
};

