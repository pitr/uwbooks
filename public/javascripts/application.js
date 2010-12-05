// ISBN callback
function listEntries(booksInfo) {
  // Create a DIV for each book
  if(booksInfo.responseData.results.length < 1) return;

  var book = booksInfo.responseData.results[0];

  if($("#books_title").val() == '')   $("#books_title").val(book.titleNoFormatting);
  if($("#books_author").val() == '')  $("#books_author").val(book.authors);
  $('#thumb').attr('src', book.tbUrl);
}

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

  $("#books_isbn").live('focusout', function(){
    var isbn = ISBN.parse($(this).val().replace(/[- _]/g, ''));
    if(!isbn || !isbn.isValid()) {
        return;
    }

    $(this).val(isbn.isIsbn10() ? isbn.asIsbn10(true) : isbn.asIsbn13(true));

    var scriptElement = document.createElement("script");
    scriptElement.setAttribute("id", "jsonScript");
    //scriptElement.setAttribute("src","http://books.google.com/books?bibkeys=" + escape($("#isbn").val()));
    scriptElement.setAttribute("src","https://ajax.googleapis.com/ajax/services/search/books?v=1.0&q=" +
      escape(isbn.asIsbn13()) +
      "&callback=listEntries");
    scriptElement.setAttribute("type", "text/javascript");
    document.documentElement.firstChild.appendChild(scriptElement);

    return false;
  });

  // book actions mouseover
  $('.book').live('mouseenter', function() {
    $(this).find('.book_actions').fadeIn(100);
  }).live('mouseleave', function() {
    $(this).find('.book_actions').fadeOut(100);
  });

});
