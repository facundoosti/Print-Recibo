$(document).on('change', $('select'), function() {
    var producer_id = $('#producer_id').val()
    var seasson_id = $('#seasson_id').val()
    if (producer_id != 0) {

        $.get(host + '/stadistics/seasson/'+seasson_id+'/producers/' + producer_id, function(content) {
            $('#stadistics-producer').html(content);
        });

    } else {
        $('#stadistics-producer').empty();
    };
});
