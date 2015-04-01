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


$('#gameForm').validate({   
    rules: {
        TITLE:{
            minlength: 3,
            //maxlength: 15,
            required: true
        }
        
    },
    messages:{
        TITLE:{
            minlength: "El título debe de ser mayor a 3 caracteres",
            required: "Inserta un título para el videojuego"
        }
    }
});

//$('gameForm').validator()


});
