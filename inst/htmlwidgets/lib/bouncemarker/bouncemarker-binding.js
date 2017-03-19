LeafletWidget.methods.addBounceMarkers = function(lat, lng) {
  (function() {
   L.marker([lat, lng],
  {
    bounceOnAdd: true,
    bounceOnAddOptions: {duration: 500, height: 100},
    bounceOnAddCallback: function() {console.log("done");}
  }).addTo(this);
  }).call(this);
};

