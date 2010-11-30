var scrollLock = false;
var page = 1;

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

  // scroll pagination
  $(window).scroll(function() {
    if (!scrollLock && ($(document).height()-$(window).height())-$(window).scrollTop()<=300) {
      scrollLock = true;
      page += 1;
      $('#pagination_wrapper').fadeIn();
      $.getScript('?page='+page, function() {
        $('#pagination_wrapper').fadeOut();
      });
    }
  });

});
