$(document).on('change','#producer_id', function(){
  if ( $('#producer_id').val() != 0 ){
    $.get(host + '/producers/' + $('#producer_id').val() + '/elvirtuososrl/barrels', function ( content ) { 
      $('#barrelsAssignedByCompany').text(
        "Tambores marcados de la Sala: " + content
      );
    });
  }else{
    $('#barrelsAssignedByCompany').text(" ");
  };    
});