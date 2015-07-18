$(function(){
  /* Posting Project at stage 3 */
  $('.color-box').change(function(){
    $(this).siblings('.color-box__preview').css('background', '#'+$(this).val());
  });
  $('#js-projectPost').submit(function(e){
    e.preventDefault();
    var url = $(this).prop('action'), data = $(this).serialize();
    $.ajax({
      type: 'POST',
      url: url,
      data: data
    }).done(function(response){
      if(response.status == 'success'){
        setCookie('postStep4', 'saved');
        location.replace('?step=4');
      }
    }).fail(function(response){ console.log(response.responseText); });
  });
  /* Taking orders */
  $('.js-orderPackage').click(function(){
    var designType = $(this).data('type'), Package = $(this).data('package');
    setCookie('postStep2', designType);
    setCookie('postStep3', Package);
  });
  /* Calvary to the rescue */
  $('#js-calvary').click(function(){
    console.log("I am Calvary!");
    var request = $(this).data('request');
    var usertype = $(this).data('usertype');
    var urlprefix = location.protocol + '//' + location.host + '/';
    if(request == 'switch'){
      urlprefix += usertype == 'designer' ? 'customer-account' : 'designer-account';
      window.location.replace(urlprefix);
    }else if(request == 'create'){
      url = urlprefix+'calvary';
      $.ajax({
        type: 'POST',
        url: url,
        data: 'usertype='+usertype
      }).done(function(response){
        if(response.status == 'success'){
          urlprefix += usertype == 'designer' ? 'customer-account' : 'designer-account';
          window.location.replace(urlprefix);
        }else{
          alert(response.status);
        }
      });
    }
  });
  /* Selecting Team member images with data value */
  $('.team-member').each(function() {
      $(this).css('background-image', 'url(' + $(this).data('img') + ')');
  });
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