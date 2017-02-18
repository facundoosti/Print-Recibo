$(document).on('blur', '#peso_bruto', function() {
    var peso_bruto = parseInt($('#peso_bruto').val());
    var tara = parseInt($('#tara').val());
    if ( peso_bruto!= 0) {
    	$('#peso_neto').val(peso_bruto - tara);
    };
});

