<%-- 
Document   : registro
Created on : 19/03/2015, 01:20:28 PM
Author     : magdiel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="form-registro">
  <%
  String msj0 =  request.getParameter("msj0")!=null?request.getParameter("msj0"):"";
  String msj1 =  request.getParameter("msj1")!=null?request.getParameter("msj1"):"";
  String msj2 =  request.getParameter("msj2")!=null?request.getParameter("msj2"):"";
  String msj3 =  request.getParameter("msj3")!=null?request.getParameter("msj3"):"";
  %>
  <div class="mi-title"><span><h1>Registro</h1></span></div>

  <div class="formulario">
    <form method="post" action="registerController?accion=REGISTER" id="validate-form">
      <div class="row">
        <div class="col-md-4 col-md-offset-2">
          <span style="color:red"><%= msj2 %></span>
          <span style="color:red"><%= msj3 %></span>

          <div class="form-group">
            <label><h4>Nombre :</h4></label>                  
            <input type="text" class="form-control name" id="usr name" placeholder="Nombre" name="name" maxlength="45">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 col-md-offset-2">
          <div class="form-group">
            <label><h4> Apellido Paterno :</h4></label>
            <input type="text" class="form-control lastname1" id="usr lastname1" placeholder="Apellido Paterno" name="lastname1" maxlength="45">
          </div>
        </div>
        <div class="col-md-4">
          <div class="form-group">
            <label><h4>Apellido Materno :</h4></label>
            <input type="text" class="form-control lastname2" id="usr lastname2" placeholder="Apellido Materno" name="lastname2" maxlength="45">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <hr>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 col-md-offset-2">
          <div class="form-group">
            <label class="control-label"><h4>Número de cuenta :</h4></label>
            <input type="text" class="form-control accountnumber" id="usr" placeholder="Número de cuenta" name="accountnumber" maxlength="9" required>
            <span style="color:red"><%= msj1 %></span>
          </div>
        </div>
        <div class="col-md-4">
          <div class="form-group">
            <label><h4>Carrera:</h4></label>
            <select class="form-control" name="career">
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
      <div class="row">
        <div class="col-md-4 col-md-offset-2">
          <div class="form-group">
            <label class="control-label"><h4>Correo:</h4></label>
            <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email" maxlength="318">
            <span style="color:red"><%= msj0 %></span>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 col-md-offset-2">
          <div class="form-group">
            <label class="control-label"><h4>Contraseña :</h4></label>
            <input type="password" class="form-control" placeholder="Contraseña" name="password" id="pass">

          </div>
        </div>
        <div class="col-md-4">
          <div class="form-group">
            <label class="control-label"><h4>Confirma tu contraseña :</h4></label>
            <input type="password" class="form-control"  placeholder="Confirma tu contraseña" name="c_password" id="pass_c">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-3 col-md-offset-4">
          <br>
          <div class="form-group" style="float:right;">
            <a class="button-comp" href="videogames" title="Recrea Comunicación">Volver</a>
            <button type="submit" class="button-comp">Registrarme</button>
          </div>
        </div> 
      </div>
    </form>
  </div>