$(function(){
  /* Scroll back to top function */
  $(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $('.scrollup').fadeIn();
    } else {
        $('.scrollup').fadeOut();
    }
  });
  $('.scrollup').click(function () {
    $("html, body").animate({
      scrollTop: 0
    }, 600);
    return false;
  });
  /* Auto disappear notifications and adjusting headers without relative position to take notification */
  $(".notify:not(.notify-fixed)").filter(":visible").delay(6000).slideUp('slow');
  $(".notify").filter(":visible").siblings('.header').css('position','relative');
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