LeafletWidget.methods.addMousePosition = function() {
  (function() {
   L.control.mousePosition().addTo(this);
  }).call(this);
};
