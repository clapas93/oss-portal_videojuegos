$("#nombre").keypress(function(key) {
  if((key.charCode < 97 || key.charCode > 122) && (key.charCode < 65 || key.charCode > 90) && (key.charCode != 45)) return false;
});

$("#app").keypress(function(key) {
  if((key.charCode < 97 || key.charCode > 122) && (key.charCode < 65 || key.charCode > 90) && (key.charCode != 45)) return false;
});

$("#apm").keypress(function(key) {
  if((key.charCode < 97 || key.charCode > 122) && (key.charCode < 65 || key.charCode > 90) && (key.charCode != 45)) return false;
});

$("#password").keypress(function(key) {
  if(key.charCode == 39) return false;
});

$("#password-check").keypress(function(key) {
  if(key.charCode == 39) return false;
});

jQuery(function(){
        $("#submit").click(function(){
        $(".error").hide();
        var hasError = false;
        var passwordVal = $("#password").val();
        var nombre = $("#nombre").val();
        var app = $("#app").val();
        var apm = $("#apm").val();
        var checkVal = $("#password-check").val();
        if (passwordVal != checkVal ) {
            $("#password-check").after('<span class="error">Las contraseñas no coinciden</span>');
            hasError = true;
        }else if((passwordVal != ''&&checkVal != '')&&passwordVal.length <= 8){
            $("#password-check").after('<span class="error">La contrase&nacute;a debe tener al menos 8 caracteres.</span>');
            hasError = true;
        }
         if(nombre.length <= 3){
            $("#nombre").after('<span class="error">El nombre debe tener mas de 3 caracteres</span>');
            hasError = true;
        }
         if(app.length <= 3){
            $("#app").after('<span class="error">El nombre debe tener mas de 3 caracteres</span>');
            hasError = true;
        }
         if(apm.length <= 3){
            $("#apm").after('<span class="error">El nombre debe tener mas de 3 caracteres</span>');
            hasError = true;
        }
        if(hasError == true) {return false;}
    });
});
$("#darBaja").click(function(){
	$.ajax({
    type:"POST",
		url: "deleteStudent" ,
		dataType: "json",
		contentType: 'application/json',
		success: function(data){
			//window.location.replace("http://localhost:8080/Videojuegos/index.jsp");
                        window.location.replace("http://localhost:8084/Videojuegos/");
		},
		error: function(data){
			console.error(data);
		}
	});
});