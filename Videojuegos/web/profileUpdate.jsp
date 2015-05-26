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
            <label ><h4>Nombre(s):</h4></label>
            <input type='text' class="form-control" style="width:25em !important" value="<%= student.getName() %>"  name="nombre_s" id="nombre" maxlength="45">
            </div>
        </div>     
      </div>
            
            <div class="row">
        <div class="col-md-4 col-md-offset-2">
            <div class="form-group">
            <label ><h4>Apellido Paterno:</h4></label>
            <input type='text' class="form-control" style="width:25em !important" value="<%= student.getLastname1()%>"  name="last_name1" id="app" maxlength="45">
            </div>
        </div>     
        <div class="col-md-4">
            <div class="form-group">
            <label ><h4>Apellido Materno:</h4></label>
            <input type='text' class="form-control" style="width:25em !important" value="<%= student.getLastname2()%>"  name="last_name2" id="apm" maxlength="45">
            </div>
        </div>     
      </div>
    
    <div class="row">
        <div class="col-md-4 col-md-offset-2">
           <div class="form-group">
            <label><h4>Carrera:</h4></label>
            <select class="form-control" style="width:25em !important" name="career">
              <% String c = ""; c= student.getCareer();%>
              <option <%if(c.equals("Actuaría")){ out.print("selected");}%>>Actuaría</option>
              <option <%if(c.equals("Biología")){ out.print("selected");}%>>Biología</option>
              <option <%if(c.equals("Ciencias de la Computación")){ out.print("selected");}%>>Ciencias de la Computación</option>
              <option <%if(c.equals("Ciencias de la Tierra")){ out.print("selected");}%>>Ciencias de la Tierra</option>
              <option <%if(c.equals("Física")){ out.print("selected");}%>>Física</option>
              <option <%if(c.equals("Física Biomedica")){ out.print("selected");}%>>Física Biomedica</option>
              <option <%if(c.equals("Matemáticas")){ out.print("selected");}%>>Matemáticas</option>
              <option <%if(c.equals("Matemáticas Aplicadas")){ out.print("selected");}%>>Matemáticas Aplicadas</option>
              <option <%if(c.equals("Manejo Sustentable de Zonas Costeras")){ out.print("selected");}%>>Manejo Sustentable de Zonas Costeras</option>
            </select>
           </div>
        </div>
        </div>

    <div class = "row">
      <div class="col-md-4 col-md-offset-2">

        <div class="form-group">
            <label ><h4>Contraseña :</h4></label>
          <input type='password'  style="width:25em !important" class="form-control" name="pass1" id='pass'>
        </div>

      </div>
      <div class="col-md-4">
        <div class="form-group">
            <label ><h4>Confirmar Contraseña :</h4></label>
          <input type='password'  style="width:25em !important"  class="form-control" name="pass2" id='passCompare'>
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
            <center>
          <a class="button-comp" href="videogames" title="back">Cancelar</a>
          <button id="actualizar" class="button-comp">Actualizar Datos</button>  
            </center>
        </div>
      </div>
    </div>
  </form>
</div>
          
<div class="Baja">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <form enctype="multipart/form-data"  method ="POST" action="deleteStudent">
                <center><button id="darBaja" class="button-comp" style="background:red">Dar de Baja</button></center>
            </form>
        </div>
    </div>
</div>

          
<script type="text/javascript">
$("#darBaja").click(function(){
	$.ajax({
		url: "deleteStudent" ,
		dataType: "json",
		contentType: 'application/json',
		success: function(data){
			window.location.replace("http://localhost:8080/Videogames/");
		},
		error: function(data){
			console.error(data);
		}
	});
});
</script>
<script type="text/javascript" src="public/js/profileUpdateValidation.js"></script>