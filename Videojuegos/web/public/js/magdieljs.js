/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(window).load( function() {
            var n=0;
            $('#event_click').click(function(){
                n++;
                if((n % 2)==0){
                    if(jQuery('.form-index').attr("style")=="display: block;")
                        $('body').click(function() {
                            $(".form-index").fadeIn();
                        });
                    else
                        $('.form-index').fadeOut()
                }else{
                    if(jQuery('.form-index').attr("style")=="display: none;")
                      	$('body').click(function() {
                            $(".form-index").fadeOut();
                        });
                    else
                        $('.form-index').fadeIn()
                }
            });
            $('#registro').click(function() { 
                $('#page').fadeOut(100, function() { }); 
            });
            /**
            $('body').click(function() {
                $(".form-index").fadeOut();
            });
            **/
            
});
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