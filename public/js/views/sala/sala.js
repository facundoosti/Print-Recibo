var year = $('#from').val();
$('.to').val(parseInt(year) + 1);
$(document).on('change', '#from', function() {
    var year = $('#from').val();
    $('.to').val(parseInt(year) + 1);
});