var clean_inputs = function() {
        $('#filling-barrels').empty();
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
        
        $.get(host + '/deposit_barrels/producers/' + producer_id + '/filling_barrels', function(content) {
            $('#filling-barrels').html(content);
            
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
        $('#deposit-producer-barrels').hide();
        $.get(host + '/deposit_barrels/porcentaje/filling_barrels', function(content) {
            $('#filling-barrels').html(content);
            
            $('#all').click(function(){
                $('.checkbox-barrels').prop('checked', true);
            });
        });
    }
    else{
        $('#deposit-producer-barrels').show();
    }
});