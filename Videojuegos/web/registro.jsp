<%-- 
    Document   : registro
    Created on : 19/03/2015, 01:20:28 PM
    Author     : magdiel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<br>
<br>
<br>
  <div class="form-registro">
<%
    String msj0 =  request.getParameter("msj0")!=null?request.getParameter("msj0"):"";
    String msj1 =  request.getParameter("msj1")!=null?request.getParameter("msj1"):"";
    String msj2 =  request.getParameter("msj2")!=null?request.getParameter("msj2"):"";
    String msj3 =  request.getParameter("msj3")!=null?request.getParameter("msj3"):"";
%>
    <div class="mi-title"><span>Registro</span></div>
    
      <div class="formulario">
        <form method="post" action="registerController?accion=REGISTER" id="validate-form">
            
            <div class="col-md-4 col-md-offset-2">
                <span style="color:red"><%= msj2 %></span>
                <span style="color:red"><%= msj3 %></span>
                
                <div class="form-group">
                  <label>Nombre :</label>                  
                  <input type="text" class="form-control name" id="usr name" placeholder="Nombre" name="name">
                </div>
              
                <div class="form-group">
                    <label> Apellido Paterno :</label>
                  <input type="text" class="form-control lastname1" id="usr lastname1" placeholder="Apellido Materno" name="lastname1">
                </div>
             
                <div class="form-group">
                    <label> Apellido Materno :</label>
                  <input type="text" class="form-control lastname2" id="usr lastname2" placeholder="Apellido Paterno" name="lastname2">
                </div>
                
                <div class="form-group">
                    <label class="control-label">Correo :</label>
                  <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email">
                  <span style="color:red"><%= msj0 %></span>
                </div>
                
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label> Carrera:</label>
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
                
                    <div class="form-group">
                        <label class="control-label"> Número de cuenta :</label>
                        <input type="text" class="form-control accountnumber" id="usr" placeholder="Número de cuenta" name="accountnumber" required>
                        <span style="color:red"><%= msj1 %></span>
                    </div>
                
                <div class="form-group">
                    <label class="control-label">Contraseña :</label>
                    <input type="password" data-minlength="6" class="form-control" placeholder="Contraseña" name="password" id="pass">
              
                </div>
              
                <div class="form-group">
                    <label class="control-label">Confirma tu contraseña :</label>
                  <input type="password" class="form-control"  placeholder="Confirma tu contraseña" name="c_password">
                </div>
            </div>
            <div class="col-md-4 col-md-offset-4">
                <div class="form-group" style="float:right;">
                    <a class="btn btn-primary" href="videogames" title="Recrea Comunicación">Volver</a>
                    <button type="submit" class="btn btn-primary">Registrarme</button>
                </div>
            </div> 
        </form>
      </div>
    </div>
