var lat = parseFloat($('#lat').val());
var lng = parseFloat($('#lng').val());
var coordenadas = {lat: lat, lng: lng};
url = GMaps.staticMapURL({
  center: coordenadas,
  zoom: 9,
  mapType:'hybrid',
  markers: [{lat:lat,lng:lng}],
  key: 'AIzaSyCeEg8IA3s1tgq7Xe64kBfPm7tMJR7VlEc'
});

$('<img/>').attr('src', url)
  .appendTo('#map');