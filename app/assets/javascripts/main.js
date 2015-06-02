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
/**
  Client-Side Cookie Management
**/
var today = new Date();
var expiry = new Date(today.getTime() + 30 * 24 * 3600 * 1000); // plus 30 days

function setCookie(name, value){
  document.cookie=name + "=" + escape(value) + "; path=/; expires=" + expiry.toGMTString();
}

function getCookie(name){
  var re = new RegExp(name + "=([^;]+)");
  var value = re.exec(document.cookie);
  return (value != null) ? unescape(value[1]) : null;
}

var expired = new Date(today.getTime() - 24 * 3600 * 1000); // less 24 hours
function deleteCookie(name){
  document.cookie=name + "=null; path=/; expires=" + expired.toGMTString();
}