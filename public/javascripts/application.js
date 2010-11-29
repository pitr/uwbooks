$(document).ready(function() {

  $('#notice_wrapper').live('click', function() {
    $(this).fadeOut(800);
    return false;
  });

  $('.book').live('mouseenter', function() {
    $(this).find('.book_actions').fadeIn(100);
  }).live('mouseleave', function() {
    $(this).find('.book_actions').fadeOut(100);
  });

});
