/* Copyright (C) YOOtheme GmbH, http://www.gnu.org/licenses/gpl.html GNU/GPL */

jQuery(function($) {

    var config = $('html').data('config') || {};

    // Social buttons
    $('article[data-permalink]').socialButtons(config);

});


jQuery(function($){
	$(window).on('scroll', function(){
		if( $(window).scrollTop()>50 ){
			$('.tm-headerbar-bg').addClass('menu-fixed');
		} else {
			$('.tm-headerbar-bg').removeClass('menu-fixed');
		}
	});

	
	
});

//Parallax//////////////////////////////
(function(e){var t=e(window);var n=t.height();t.resize(function(){n=t.height()});e.fn.parallax=function(r,i,s){function l()
{o.each(function(){a=o.offset().top});if(s){u=function(e){return e.outerHeight(true)}}else{u=function(e){return e.height()
}}if(arguments.length<1||r===null)r="55%";if(arguments.length<2||i===null)i=.5;if(arguments.length<3||s===null)s=true;var f=t.scrollTop();o.each
(function(){var t=e(this);var s=t.offset().top;var l=u(t);if(s+l<f||s>f+n){return}o.css("backgroundPosition",r+" "+Math.round((a-f)*i)+"px")})
}var o=e(this);var u;var a;var f=0;t.bind("scroll",l).resize(l);l()}})(jQuery)
jQuery(document).ready(function($) {
$(" .tm-block-bottom-a").addClass("fixed-background").parallax("55%", 0.7);

 //To top scroller//////////////////////////
    jQuery(window).scroll(function () {
        if (jQuery(this).scrollTop() === 0) {
            jQuery(".tm-totop-scroller").addClass("totop-idden");
        } else {
            jQuery(".tm-totop-scroller").removeClass("totop-hidden");
        }
    });

});

