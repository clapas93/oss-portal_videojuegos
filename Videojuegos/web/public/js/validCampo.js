/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/** Función que sirve para que en algunos campos, solo se introduzcaa caracteres de un sólo tipo **/

(function(a) {
	a.fn.validCampo=function(b) {
		a(this).on({
			keypress:function(a){
				var c=a.which,d=a.keyCode, e=String.fromCharCode(c).toLowerCase(), f=b;
				(-1!=f.indexOf(e)||9==d||37!=c&&37==d||39==d&&39!=c||8==d||46==d&&46!=c)&&161!=c||a.preventDefault()
			}
		})
	}
})
(jQuery);
