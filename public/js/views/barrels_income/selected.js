$(document).ready( function() {
  $( "#income_barrel_id" ).change(function() {
    if($("#income_barrel_id option:selected" ).text() == ""){    	
			$(".barrelSRL").removeAttr('disabled');
    }else{
			$("#barrelSRL2").removeAttr('checked');
    	$(".barrelSRL").attr('disabled','disabled') ;
    };
  });

  $( ".barrelSRL" ).click(function() {
    if($("#barrelSRL2" ).is(":checked")){    	
    	$("#income_barrel_id").text("") ;
    	$("#income_barrel_id").attr('disabled','disabled') ;
    }else{
			$("#income_barrel_id").removeAttr('disabled');
    };
  });


  $('#load').on('click', function() {
      var $this = $(this);
    $this.button('loading');
      setTimeout(function() {
         $this.button('reset');
     }, 12000);
  });
});