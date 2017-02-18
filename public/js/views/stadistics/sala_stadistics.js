
$(function() {
	seasson_id = $('#seasson_id').val()
  if (seasson_id != '') {
	  $.get(host + '/sala_statistics/seasson/'+seasson_id, function(content) {
	      $('#stadistics-sala').html(content);
	  });	
  }  
});


$(document).on('change','#seasson_id', function() {
	seasson_id = $('#seasson_id').val()
  $.get(host + '/sala_statistics/seasson/'+seasson_id, function(content) {
      $('#stadistics-sala').html(content);
  });
});

