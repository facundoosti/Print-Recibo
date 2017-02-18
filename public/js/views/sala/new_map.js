var map;
var lat = parseFloat($('#latitud').val());
var lng = parseFloat($('#longitud').val());
var co = {lat: lat, lng: lng};
function initMap() {
  map =  new GMaps({
	  div: '#map',
	  zoom: 6,
		center: co,
	  mapType:'hybrid',
	  click: function(e) {
	  	if (map.markers.length == 1) { 
	  		map.removeMarkers();
	  	};
	  	map.addMarker({
			  position:e.latLng
			});
			$('#latitud').val(e.latLng.lat());
			$('#longitud').val(e.latLng.lng());
		}
	});
	GMaps.geolocate({
	  success: function(position) {
	    map.setCenter(position.coords.latitude, position.coords.longitude);
	  },
	  error: function(error) {
	    alert('Geolocation failed: '+error.message);
	  },
	  not_supported: function() {
	    alert("Your browser does not support geolocation");
	  }
	});
};