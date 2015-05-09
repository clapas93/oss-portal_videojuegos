<%-- 
    Document   : profileUpdate
    Created on : 20-mar-2015, 15:34:40
    Author     : antoniogalvan
    --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="User.UserStudent"%>
<div id="games"></div>
<div id="gamesupdate">
  <div class="row">
    <div class="col-md-4 col-md-offset-4">
      <h3> Actualizar Datos de Perfil</h3>
    </div>
  </div>
    <%
    UserStudent student = (UserStudent)request.getAttribute("student");
    
    %>
   <div class="row">
    <form class='actualizaDatos form-horizontal' enctype="multipart/form-data" method ="POST" action="studentsave">

    <div class="col-md-4 col-md-offset-2">
        
        <div class="form-group">
                <label>Nombre :</label>
                <input type='text' value="<%= student.getName() %>" style="width:20em !important" name="nombre_s" size = 50 id='nombre'  class="form-control" maxlength="45" required placeholder='Nombre(s)' id="formGroupInputSmall" placeholder="Small input">
              </div>

               <div class="form-group">
                <label> Apellido Paterno :</label>
                <input type='text' value="<%= student.getLastname1() %>" style="width:20em !important" name="last_name1" size = 50 id ='apellidoPatertno' maxlength="45" class="form-control" required placeholder='Apellido Paterno'>
              </div>
            
              <div class="form-group">
                <label> Apellido Materno :</label>
                <input type='text' value="<%= student.getLastname2() %>" style="width:20em !important" name="last_name2" size = 50 id ='apellidoMaterno' maxlength="45" class="form-control" required placeholder='Apellido Materno'>
              </div>
            
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
      <div class="col-md-6">
        <div class="form-group">
          <label class="control-label"> Número de cuenta :</label>
          <input type='text' value="<%= student.getAccountnumber() %>" size = 50  style="width:20em !important" name="numberacc" id='num_cuenta'  maxlength="9" class="form-control" required placeholder='Número en la base de datos' READONLY>
        </div>
            
        <div class="form-group">
            <label class="control-label">Contraseña :</label>
            <input type='password'  style="width:20em !important" class="form-control" name="pass1" size = 50 id='pass' required>
          </div>
          <div class="form-group">
            <label class="control-label">Confirmar Contraseña :</label>
            <input type='password'  style="width:20em !important"  class="form-control" name="pass2" size = 50 id='passCompare' required>
            <p style="color:red" id="validate-status"></p>
          </div>
          <div class="form-group <%if(!student.getHistory().equals("")){ out.print("hidden");}else{ out.print("");}%>">
            <label for="exampleInputFile">Actualiza historial.</label>
            <input type="file" accept=".pdf" id="InputFile" name="fileUpload">
            <p style="color:#92C0D8;"class="help-block">Solicita credito subiendo tu historial academico.</p>
          </div>
      </div>
       <div class="row">
        <div class="col-md-4 col-md-offset-4">
          <div class="form-group">
            <a class="btn btn-primary" href="videogames" title="back">Cancelar</a>
            <button id="actualizar" class="btn btn-primary submit">Actualizar Datos</button>  
          </div>
        </div>
        </div>
     </form>
    </div>
  </div>
<script type="text/javascript">
$("#num_cuenta").keypress(function(key) {
    if(key.charCode < 48 || key.charCode > 57) return false;
});

$("#nombre").keypress(function(key) {
if((key.charCode < 97 || key.charCode > 122) && (key.charCode < 65 || key.charCode > 90) && (key.charCode != 45)) return false;
});

$("#apellidoPatertno").keypress(function(key) {
if((key.charCode < 97 || key.charCode > 122) && (key.charCode < 65 || key.charCode > 90) && (key.charCode != 45)) return false;
});

$("#apellidoMaterno").keypress(function(key) {
if((key.charCode < 97 || key.charCode > 122) && (key.charCode < 65 || key.charCode > 90) && (key.charCode != 45)) return false;
});

$(document).ready(function() {
  $("#passCompare").keyup(validate);
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



