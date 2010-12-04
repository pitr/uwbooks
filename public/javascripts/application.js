// Scroller
(function( $ ){
  var page = 1;

  var methods = {
    startScroller: function() {
      $(window).bind('scroll.scroller', function() {
        if (($(document).height()-$(window).height())-$(window).scrollTop() <= 300) {
          $.scroller({stop:true});
          page += 1;
          $('#pagination_wrapper').fadeIn();
          $.getScript('?page='+page, function() {
            $('#pagination_wrapper').fadeOut();
          });
        }
      });
    },
    stopScroller: function() {
      $(window).unbind('.scroller');
    }
  };

  $.scroller = function(options) {
    if(options && options.stop) {
      methods.stopScroller();
    } else {
      methods.startScroller();
    }
  };
})( jQuery );

$(document).ready(function() {

  // notice wrapper click
  $('#notice_wrapper').live('click', function() {
    $(this).slideUp();
    return false;
  });

  // book actions mouseover
  $('.book').live('mouseenter', function() {
    $(this).find('.book_actions').fadeIn(100);
  }).live('mouseleave', function() {
    $(this).find('.book_actions').fadeOut(100);
  });

});
