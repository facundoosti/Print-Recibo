var callBarrels = function(producer_id) {
    $.get(host + '/producers/' + producer_id + '/barrels', function(content) {
        var response = $.parseJSON(content)
            //Listan Envases y Tambores
        $('#envases').html(response.envases);
        $('#tambores').html(response.tambores);

        //Se muestra el Partial EditBarrel
        $('.selectable-barrels').selectable({
            selected: function(event, ui) {
                var barrel_id = ui.selected.dataset.id;
                $.get(host + '/barrels/fill/' + barrel_id + '/edit', function(content) {
                    $('.edit-barrel').html(content);
                    $('.barrelForm').on('submit', function(event){
                        event.preventDefault();
                        $.ajax({
                            url:  $(this).attr('action'),
                            type: 'PUT',
                            data: $(this).serialize(),
                            dataType: 'json',
                            success:function(data){
                                $('.tab-pane').empty();
                                callBarrels(data.producer_id);
                            }
                        });
                    });
                });
            }
        });
        
        //Se limpian los elementos
        $('a[data-toggle="tab"]').on('shown.bs.tab', function() {
            $('.selectable .ui-selected').removeClass('ui-selected')
            $('.edit-barrel').empty();
        });        
    });
};

$(document).on('change', '#producer_id', function() {
    var producer_id = $('#producer_id').val()
    if ( producer_id!= 0) {
        callBarrels(producer_id);
    } else {
        $('.tab-pane').empty();
    };
});
