$(document).ready(function(){
    
$("input[name=creditOptions][id=FREE]").click(function(){
    var related_class=$(this).val();
    $('.'+related_class).prop('disabled',true);
    $('.'+related_class).prop('placeholder',"0");
});


$("input[name=creditOptions][id=CREDIT]").click(function(){
    //var related_class=$(this).val();
    $('.FREE').prop('disabled',false);
});


$('#gameForm')
  .find('[name="CLASS"]')
            .selectpicker()
            .change(function(e) {
                // revalidate the color when it is changed
                $('#gameForm').formValidation('revalidateField', 'CLASS');
            })
    .end()
  .find('[name="GENRE"]')
            .selectpicker()
            .change(function(e) {
                // revalidate the color when it is changed
                $('#gameForm').formValidation('revalidateField', 'GENRE');
            })
    .end()
  .formValidation({
    framework: 'bootstrap',
    excluded: ':disabled',
    icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        TITLE:{
            validators: {
                notEmpty:{
                    message:'El título es un campo requerido con una longitud mayor a 2 caracteres.'
                },
                stringLength:{
                    min: 2,
                    message:'El titulo debe de ser por lo menos de 2 caracteres.'
                }
            }
        },
        PRICE:{
            validators:{
                notEmpty:{
                    message:'Especifica el número de creditos.'
                }
            }
        },
        CLASS:{
            validators:{
                notEmpty:{
                    message:'Elige la clasificación.'
                }
            }
        },
        GENRE:{
            validators:{
                notEmpty:{
                    message:'Elige el genero.'
                }
            }
        },
        DESCRIPTION: {
            validators:{
                notEmpty:{
                    message:'Escribe una descripción del juego.'
                }
            }
        },
        VIDEOGAME: {
            validators: {
                notEmpty:{
                    message:'Indica la ubicación del archivo.'
                },
                file: {
                    //extension: 'jpeg,jpg,png',
                    //type: 'image/jpeg,image/png',
                    message: 'El archivo seleccionado no es valido.'
                }
            }
        },
        FRONT: {
            validators: {
                notEmpty:{
                    message:'Indica la ubicación del archivo.'
                },
                file: {
                    extension: 'jpeg,jpg,png',
                    type: 'image/jpeg,image/png',
                    //maxSize: 2097152,   // 2048 * 1024
                    message: 'El archivo seleccionado no es valido (jpeg,jpg,png).'
                }
            }
        },
        VIDEO:{
            validators:{
                notEmpty:{
                    message:'Especifica la dirección url del video.'
                },
                uri: {
                        message: 'Ingresa una url valida(Ver: http://formvalidation.io/validators/uri/).'
                    }
            }
        }
    }
});

//$('gameForm').validator()


});
