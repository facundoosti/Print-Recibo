$(document).ready( function() {
    var producer_id = $('#producer_id').val();
    var deposit_barrel_id = $('#deposit-barrel-id').val();
    $.get(host + '/deposit_barrels/'+ deposit_barrel_id+'/producers/' + producer_id + '/filling_barrels', function(content) {
        $('#filling-barrels').html(content);        
    });
});