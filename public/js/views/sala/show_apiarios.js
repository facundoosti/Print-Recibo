var apiarios = $('.apiario');

apiarios = $.map(apiarios, function(apiario){
	return  { name:apiario.dataset.name,
					  lat:parseFloat(apiario.dataset.lat),
					  lng:parseFloat(apiario.dataset.lng)
				  }
});

url = GMaps.staticMapURL({
  zoom: 9,
  mapType:'hybrid',
  markers: apiarios,
  key: 'AIzaSyCeEg8IA3s1tgq7Xe64kBfPm7tMJR7VlEc'
});

$('<img/>').attr('src', url)
  .appendTo('#map');
