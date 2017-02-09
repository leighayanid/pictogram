$(function() {
    $('#masonry-container').masonry({
        itemSelector: '.box',
        columnWidth: 200,
        isAnimated: !Modernizr.csstransitions,
        isFitWidth: true
    });

    $('#maximage').maximage({
        cycleOptions: {
            fx: 'scrollHorz',
            speed: 800,
            timeout: 8000,
            prev: '#arrow_left',
            next: '#arrow_right'
        },
        onFirstImageLoaded: function() {
            jQuery('#cycle-loader').hide();
            jQuery('#maximage').fadeIn('fast');
        }
    });

});
