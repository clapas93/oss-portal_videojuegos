<%-- 
Document   : profileUpdate
Created on : 20-mar-2015, 15:34:40
Author     : antoniogalvan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="User.UserStudent"%>
<link href="https://www.google.com/fonts#QuickUsePlace:quickUse/Family:Arvo:400,700" rel="stylesheet" type="text/css">

<style type="text/css">
a.button-comp{
  border: none;
  padding: 0.6em 1.2em;
  background: #083B56;
  color: #fff;
  font-family: 'Lato', Calibri, Arial, sans-serif;
  font-size: 1em;
  letter-spacing: 1px;
  text-transform: uppercase;
  cursor: pointer;
  display: inline-block;
  margin: 3px 2px;
  border-radius: 2px;
}
a.button-comp:hover {
  background: #773489;
  text-decoration: none;
}
button.button-comp{
  border: none;
  padding: 0.6em 1.2em;
  background: #083B56;
  color: #fff;
  font-family: 'Lato', Calibri, Arial, sans-serif;
  font-size: 1em;
  letter-spacing: 1px;
  text-transform: uppercase;
  cursor: pointer;
  display: inline-block;
  margin: 3px 2px;
  border-radius: 2px;
}
button.button-comp:hover {
  background: #773489;
  text-decoration: none;
}
</style>

<div id="games"></div>
<div id="gamesupdate">
  <div class="row">
    <div class="col-md-4 col-md-offset-2">
      <h1> Actualizar Datos de Perfil</h1>
    </div>
  </div>
  <%
  UserStudent student = (UserStudent)request.getAttribute("student");
  %>
  <form class='actualizaDatos form-horizontal' enctype="multipart/form-data" method ="POST" action="studentsave">
    <div class="row">


      <div class="col-md-4 col-md-offset-2">

        <div class="form-group">
          <label><h4>Nombre(s):</h4></label>
          <input type='text' value="<%= student.getName() %>" style="width:20em !important" name="nombre_s" size = 50 id='nombre'  class="form-control" maxlength="45" required placeholder='Nombre(s)' id="formGroupInputSmall" placeholder="Small input">
        </div>

      </div >     
    </div>

    <div class="row">
      <div class="col-md-4 col-md-offset-2">
        <div class="form-group">
          <label><h4>Apellido Paterno:</h4></label>
          <input type='text' value="<%= student.getLastname1() %>" style="width:20em !important" name="last_name1" size = 50 id ='apellidoPaterno' maxlength="45" class="form-control" required placeholder='Apellido Paterno'>
        </div>
      </div>
      <div class="col-md-4">
        <div class="form-group">
          <label><h4>Apellido Materno:</h4></label>
          <input type='text' value="<%= student.getLastname2() %>" style="width:20em !important" name="last_name2" size = 50 id ='apellidoMaterno' maxlength="45" class="form-control" required placeholder='Apellido Materno'>
        </div>
      </div>
    </div>

    <div class = "row">
      <div class="col-md-4 col-md-offset-2">
        <div class="form-group">
          <label> Carrera:</label>
          <select class="form-control" style="width:20em !important" name ="carrer"  >
            <option><%= student.getCareer() %></option>
            <option>-------------------------------------------------------------</option>
            <option>Actuaría</option>
            <option>Biología</option>
            <option>Ciencias de la Computación</option>
            <option>Ciencias de la Tierra</option>
            <option>Física</option>
            <option>Física Biomedica</option>
            <option>Matemáticas</option>
            <option>Matemáticas Aplicadas</option>
            <option>Manejo Sustentable de Zonas Costeras</option>
          </select>
        </div>
      </div>

    </div>

    <div class = "row">
      <div class="col-md-4 col-md-offset-2">

        <div class="form-group">
          <label class="control-label">Contraseña :</label>
          <input type='password'  style="width:20em !important" class="form-control" name="pass1" size = 50 id='pass'>
        </div>

      </div>
      <div class="col-md-4">
        <div class="form-group">
          <label class="control-label">Confirmar Contraseña :</label>
          <input type='password'  style="width:20em !important"  class="form-control" name="pass2" size = 50 id='passCompare'>
          <p style="color:red" id="validate-status"></p>
        </div>
      </div>
    </div>

    <div class = "row">
      <div class="col-md-4 col-md-offset-2">
        <div class="form-group <%if(!student.getHistory().equals("")){ out.print("hidden");}else{ out.print("");}%>">
          <label for="exampleInputFile">Actualiza historial.</label>
          <input type="file" accept=".pdf" id="InputFile" name="fileUpload">
          <p style="color:#92C0D8;"class="help-block">Solicita credito subiendo tu historial academico.</p>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <div class="form-group">
          <a class="button-comp" href="videogames" title="back">Cancelar</a>
          <button id="actualizar" class="button-comp">Actualizar Datos</button>  
        </div>
      </div>
    </div>
  </form>
</div>

<script type="text/javascript">
$("#num_cuenta").keypress(function(key) {
  if(key.charCode < 48 || key.charCode > 57) return false;
});

$("#nombre").keypress(function(key) {
  if((key.charCode < 97 || key.charCode > 122) && (key.charCode < 65 || key.charCode > 90) && (key.charCode != 45)) return false;
});

$("#apellidoPaterno").keypress(function(key) {
  if((key.charCode < 97 || key.charCode > 122) && (key.charCode < 65 || key.charCode > 90) && (key.charCode != 45)) return false;
});

$("#apellidoMaterno").keypress(function(key) {
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

</script>
