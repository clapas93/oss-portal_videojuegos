/*$(function() {
function pulsate(element) {
    $(element || this).delay(100).fadeOut(1000).delay(50).fadeIn(800, pulsate); 
}
    pulsate($('#logo'))

});
*/



$( document ).ready(function() {
	function pulse(elem, duration, easing, props_to, props_from, until) {
	elem.animate( props_to, duration, easing,
		function() {
			if ( until() == false )
			{            
				pulse(elem, duration, easing, props_from, props_to, until);
			}
		});
}
	pulse($('#front'), 1500, 'swing', {opacity:0.15}, {opacity:1}, function() { return false; });
});

$(document).ready(function () {
    $('body').fadeIn(1000).removeClass('hidden');
});