$(document).ready( function() {
    var producer_id = $('#producer_id').val();
    var egress_barrel_id = $('#egress-barrel-id').val();
    $.get(host + '/egress_barrels/'+ egress_barrel_id+'/producers/' + producer_id + '/barriles_depositados', function(content) {
        $('#egress-barrels').html(content);        
    });
});