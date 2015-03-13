$(document).ready(function(){
$("input[name=opcionesCredito][id=gratis]").click(function(){
    var related_class=$(this).val();
    $('.'+related_class).prop('disabled',true);
});


$("input[name=opcionesCredito][id=credito]").click(function(){
    var related_class=$(this).val();
    $('.'+related_class).prop('disabled',false);
});
});