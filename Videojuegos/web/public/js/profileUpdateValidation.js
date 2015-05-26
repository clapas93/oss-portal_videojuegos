$("#nombre").keypress(function(key) {
  if((key.charCode < 97 || key.charCode > 122) && (key.charCode < 65 || key.charCode > 90) && (key.charCode != 45)) return false;
});

$("#app").keypress(function(key) {
  if((key.charCode < 97 || key.charCode > 122) && (key.charCode < 65 || key.charCode > 90) && (key.charCode != 45)) return false;
});

$("#apm").keypress(function(key) {
  if((key.charCode < 97 || key.charCode > 122) && (key.charCode < 65 || key.charCode > 90) && (key.charCode != 45)) return false;
});

$(document).ready(function() {
    var password = $("#passCompare").val();
    if(password.length>0){
        $("#passCompare").keyup(validate);
    }
});


function validate() {
  var password1 = $("#pass").val();
  var password2 = $("#passCompare").val();
  if(password1 == password2) {
    $("#validate-status").css({'color':'green'});
    $("#validate-status").text("Las contraseñas coinciden");
    $("#actualizar").removeAttr("disabled");        
  }
  else {
    $("#validate-status").text("Las contraseñas no coinciden"); 
    $("#actualizar").attr("disabled","disabled"); 
  }

}
