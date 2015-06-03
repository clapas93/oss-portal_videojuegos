/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var inputs=null;
function send(form){
    inputs = $("#validate-form :input");
    var f = {};
    for(i = 0;i<inputs.length;i++){
        obj = inputs[i].name;
        val = inputs[i].value;
        //console.log(inputs[i]);
        f[obj]=val;
    }
    console.log(f);
    $.ajax({
        url:"registerController?accion=REGISTER",
        type:"POST",
        dataType:"json",
        contentType: 'application/json',
        data:f,
        success: function(data){
            console.log(data);
            alert(data.message);//aqui recibes el mensaje o numero de error dependiendo de eso mandas el pop up bello
            //si es caso bueno donde si se registro mandas la funcion 
            //redirectonsuccess = location.origin+"/videogames";
            //window.location=redirectonsuccess;
        },
        error: function(data){
            console.error(data);
        }
    });
}
$().ready(    
    function() {  
        // Configuramos la validación de los distintos campos del formulario
        //$("#validate-form")
        $("#validate-form").submit(function(e) {
                e.preventDefault();
            }).validate({
             
             submitHandler: function(form) {
                 send(form);
                /**/
            },
          // Empezamos por las reglas que se definirán
            /*rules: {
                password: {  
                    required: true, // Tiene que ser requerido el password
                    minlength: 8    // Tiene que tener un tamaño mayor o igual a 6 caracteres
                },
                c_password: {
                    required: true,  //Tiene que solicitar la confirmación de password
                    minlength: 8, //Debe de tener al menos 6 caracteres el password
                    equalTo: "#pass" //Verifica que sea igual al password
                },
                name: {
                    minlength: 3,    // Tiene que tener un tamaño mayor o igual a 3 caracteres
                    required: true // Tiene que ser requerido
                },
                lastname1: {
                    minlength: 3,    // Tiene que tener un tamaño mayor o igual a 3 caracteres
                    required: true  //Tiene que ser requeridos los apellidos
                },
                lastname2: {
                    minlength: 3,    // Tiene que tener un tamaño mayor o igual a 3 caracteres
                    required: true  //Tiene que ser requeridos los apellidos
                },
                email: {
                    required: true, //Solicita que se introduzca un mail
                    email: true //Condiciona a que tenga  estructura de un mail
                },
                accountnumber: {
                    required: true,
                    minlength: 9,
                    maxlength: 9
                }
                
            },*/
    
        messages: { // Se indica para cada campo y para cada regla el mensaje que quiero mostrar si no cumple.
            
      	    password: {
                required: "Por favor, introduce tu password",
        	minlength: "Debe de tener al menos 8 caracteres"
            },
      	    c_password: {
                required: "Por favor, introduce de nuevo tu password",
        	minlength: "Debe de tener al menos 8 caracteres",
        	equalTo: "Los password introducidos no son iguales"
            },
      	    name: {
        	required: "Introduce tu nombre",
        	minlength: "Debe tener al menos 3 caracteres"
      	    },
      	    lastname1: {
                minlength: "Debe tener al menos 3 caracteres",
        	required: "Introduce tu apellido materno"
      	    },
            lastname2: {
                minlength: "Debe tener al menos 3 caracteres",
                required: "Introduce tu apellido paterno"
      	    },
      	    email: {
                required: "Introduce tu mail",
        	email: "Introduce un formato valido, por ejemplo: mail@correo.com"
      	    },
            accountnumber: {
                required: "Introduce tu n&uacute;mero de cuenta",
                minlength: "Debe tener al menos 9 n&uacute;meros",
                maxlength: "Debe tener máximo 9 n&uacute;meros"
      	    }
      
        }
    });
     $("#validate-form").on('submit', function(e){
        var isvalidate=$("#validate-form").valid();
        if(isvalidate)
        {
            e.preventDefault();
           // alert(getvalues("myform"));
        }
    });
});

$(function(){
    //Para escribir solo letras

    $(".name").validCampo(" abcdefghijklmnñopqrstuvwxyzáéiou");
    $(".lastname1").validCampo(" abcdefghijklmnñopqrstuvwxyzáéiou");
    $(".lastname2").validCampo(" abcdefghijklmnñopqrstuvwxyzáéiou");
    $(".accountnumber").validCampo("1234567890");
});