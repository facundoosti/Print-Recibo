$(document).on('change', '#producer_id', function() {
    var producer_id = $('#producer_id').val()
    var ic_id = $('#ic-id').val()
    if ( producer_id != 0) {
        $.get(host + '/income_drawers/'+ic_id+'/producers/' + producer_id + '/apiarios', function(content) {
		        $('#apiarios').html(content);
		    	$('#apiario').select2();
		    });
    } else {
        $('#apiarios').empty();
    };
});