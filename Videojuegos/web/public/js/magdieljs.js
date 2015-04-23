/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var n=0;
$(window).load( function() {
 var clicked = false;
            $('#event_click').click(function(e){
                if(!clicked){
                    $(".form-index").fadeIn();
                    $(".transparent").fadeIn();
                    clicked = true;
                }else{
                    $(".form-index").fadeOut();
                    $(".transparent").fadeOut();
                    clicked = false;
                }
            });
            $(".transparent").click(function(){
                $(".form-index").fadeOut();
                $(".transparent").fadeOut();
            });
});
/*$(window).load(function(){
    $('.navbar.navbar-default').click(function(){
                $(".form-index").fadeOut();
            });
});*/

$( document ).ready(function() {
    $('#loginForm').bootstrapValidator({
	 message: 'Este valor no es valido',
	 feedbackIcons: {
		 valid: 'glyphicon glyphicon-ok',
		 invalid: 'glyphicon glyphicon-remove',
		 validating: 'glyphicon glyphicon-refresh'
	 },
	 fields: {
		 usuario: {
			 validators: {
				 notEmpty: {
					 message: 'El nombre de usuario es requerido'
				 }
			 }
		 },
		 password: {
			 validators: {
				 notEmpty: {
					 message: 'La contraseña es requerida'
				 }
			 }
		 }
	 }
    });
});

