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
