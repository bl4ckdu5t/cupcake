$(function(){
  /* Auto disappear notifications */
  $(".notify").filter(":visible").delay(6000).slideUp('slow');
	/* Off-Canvas Navigation Toggle */
	$('#js-toggle-nav').click(function(){
		$('html').toggleClass('openNav');
	});
	/* Smooth Scroll for in page links */
	$('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {

      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
  /* History back buttons */
  $('#js-historyBack').click(function(){
    window.history.back();
  });
  /* Show page menus */
  $('#js-page-menu-trigger').click(function(){
    $('#js-page-menu').slideToggle();
  });
  /* Closing notification */
  $('.notify-clear').click(function(){
    $(this).closest('.notify').slideUp();
  });
});