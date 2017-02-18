var map;
var lat = parseFloat($('#latitud').val());
var lng = parseFloat($('#longitud').val());
var co = {lat: lat, lng: lng};
function initMap() {
  map =  new GMaps({
	  div: '#map',
	  zoom: 18,
	  center: co,
	  mapType:'hybrid',
	  click: function(e) {
	  	if (map.markers.length == 1) { 
	  		map.removeMarkers();
	  	};
	  	var nombreApiario = $('#name').val();
	  	map.addMarker({
			  position:e.latLng,
				title: nombreApiario 
			});
			$('#latitud').val(e.latLng.lat());
			$('#longitud').val(e.latLng.lng());
		}
	});

	map.addMarker({position:co})
};
