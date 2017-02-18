var clean_inputs = function() {
        $('#egress-barrels').empty();
        $('#renapa-input').css('display','none');
        $('#renapa').text("")
};

$(document).on('change', '#producer_id', function() {
    var producer_id = $('#producer_id').val()
    if (producer_id != 0) {   
        $('#renapa-input').css('display','block');
        renapa = $('#producer_id').find(':selected')
                                  .data('renapa')
        $('#renapa').val(renapa);
        $.get(host + '/egress_barrels/producers/' + producer_id + '/deposit_barrels', function(content) {
            $('#egress-barrels').html(content);
            
            $('#all').click(function(){
                $('.checkbox-barrels').prop('checked', true);
            });
        });

    } else {
        clean_inputs();
    };
});

$(document).on('change', '#checkbox-porcentaje', function() {
    var check = $('#checkbox-porcentaje');
    clean_inputs();
    if (check.is(':checked')) { 
        $('#egress-producer-barrels').hide();
        $.get(host + '/egress_barrels/porcentaje/deposit_barrels', function(content) {
            $('#egress-barrels').html(content);
            
            $('#all').click(function(){
                $('.checkbox-barrels').prop('checked', true);
            });
        });
    }
    else{
        $('#egress-producer-barrels').show();
    }
});



/**
        $('#submit').on('submit', function(event){
            event.preventDefault();
            total =  $('.checkbox:checked').length;
            if (total == 0) {
                alert('Usted debe seleccionar al menos un Tambor');
            }
        });
*/