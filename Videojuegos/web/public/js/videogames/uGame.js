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
                    // revalidate the class when it is changed
                    $('#gameForm').formValidation('revalidateField', 'CLASS');
                })
        .end()
      .find('[name="GENRE"]')
                .selectpicker()
                .change(function(e) {
                    // revalidate the genre when it is changed
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
                    },
                    integer:{
                        message:'Debe de ser un número entero.'
                    },
                    between:{
                        min:1,
                        max:10000,
                        message:'El número de créditos debe de ser mayor a 1 y menor a 10000.'
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
                    },
                    stringLength:{
                        min: 20,
                        message:'La descripción debe de ser por lo menos de 20 caracteres.'
                    }
                }
            },
            GAME: {
                validators: {
                    notEmpty:{
                        message:'Indica la ubicación del archivo.'
                    },
                    file: {
                        extension: 'bin,zip,tar,tgz',
                        type: 'application/mac-binary,application/macbinary,application/octet-stream,application/x-binary,application/x-macbinary,application/x-compressed,application/x-zip-compressed,application/zip,application/x-tar,application/gnutar,application/x-compressed',
                        message: 'Solo puedes subir .bin, .zip, .tar, .tgz.'
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
                        minSize: 32400, //180*180
                        maxSize: 4194304,   // 2048 * 2048
                        message: 'El archivo seleccionado no es valido (jpeg,jpg,png).'
                    }
                }
            },
            VIDEO:{
                validators:{
                    notEmpty:{
                        message:'Especifica la dirección url del video.'
                    },
                    uri:{
                        message: 'Ingresa una url valida (Ver: http://formvalidation.io/validators/uri/).'
                    }
                }
            }
        }
    });

});
