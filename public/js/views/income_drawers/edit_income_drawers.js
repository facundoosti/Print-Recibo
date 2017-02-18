$(document).ready( function() {
    var producer_id = $('#producer_id').val();
    var ic_id = $('#ic-id').val();
    $.get(host + '/income_drawers/'+ ic_id+'/producers/' + producer_id + '/apiarios/edit', function(content) {
        $('#apiarios').html(content);
		    $('#apiario').select2();
    });
    $('#apiario').select2();       
});