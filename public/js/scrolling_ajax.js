function scrolling(total_groups){
  var track_load = 2; //total loaded record group(s)
  var loading  = false; //to prevents multipal ajax loads
  
  $(window).scroll(function() { //detect page scroll
    //user scrolled to bottom of the page?
    if($(window).scrollTop() + $(window).height() == $(document).height()){
      //there's more data to load
      if(track_load <= total_groups && loading==false){
        loading = true; //prevent further ajax loading
        $('.spinner').show(); //show loading image
        
        //load data from the server using a HTTP POST request
        $.get('adverts',{'page': track_load}, function(data){
          $(".adverts_list").append(data); //append received data into the element
          //hide loading image
          $('.spinner').hide(); //hide loading image once data is received
          track_load++; //loaded group increment
          loading = false; 
      
        }).fail(function(xhr, ajaxOptions, thrownError) { //any errors?
          $('.spinner').hide(); //hide loading image
          loading = false;
        });
      }
    }
  });
}