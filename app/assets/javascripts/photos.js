$(function() {
    $('#masonry-container').masonry({
        itemSelector: '.box',
        columnWidth: 200,
        isAnimated: !Modernizr.csstransitions,
        isFitWidth: true
    });
     $('#masonry-myphotos').masonry({
        itemSelector: '.box',
        columnWidth: 100,
        isAnimated: !Modernizr.csstransitions
    });

});
