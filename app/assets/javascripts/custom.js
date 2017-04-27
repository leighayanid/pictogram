 $(function() {
     jQuery('#maximage').maximage({
         cycleOptions: {
             fx: 'fade',
             easing: 'easeOutCubic',
             speed: 1000,
             timeout: 4000,
             prev: '#arrow_left',
             next: '#arrow_right'
         },
         onFirstImageLoaded: function() {
             jQuery('#cycle-loader').hide();
             jQuery('#maximage').fadeIn('fast');
         }
     });
 });

 $(function() {
  var preview = $(".img_preview img");

    $("#files").change(function(event){
       var input = $(event.currentTarget);
       var file = input[0].files[0];
       var reader = new FileReader();
       reader.onload = function(e){
           image_base64 = e.target.result;
           preview.attr("src", image_base64);
       };
       reader.readAsDataURL(file);
    });
});