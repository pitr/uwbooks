$(document).ready(function() {

  $('#notice_wrapper').live('click', function() {
    $(this).slideUp();
    return false;
  });

  $('.book').live('mouseenter', function() {
    $(this).find('.book_actions').fadeIn(100);
  }).live('mouseleave', function() {
    $(this).find('.book_actions').fadeOut(100);
  });

  var scrollLock = false;
  var page = 1;
  $(window).scroll(function() {
    $('#footer').html(($(document).height()-$(window).height())-$(window).scrollTop());
    if(!scrollLock && ($(document).height()-$(window).height())-$(window).scrollTop()<=300) {
      scrollLock = true;
      page += 1;
      $.getScript('?page='+page, function() {
        scrollLock = false;
      });
    }
  });

});
