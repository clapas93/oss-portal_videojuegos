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
    <div class="mi-title"><span>Registro</span></div>
    <hr size="2">  
      <div class="formulario">
        <form data-toggle="validator" role="form" method="post" action="registerController?accion=REGISTER" id="validate-form">
          <table border="0">
            <tr>
              <td>
                <div class="form-group">
                  <input type="text" class="form-control" id="usr name" placeholder="Nombre" name="name" required>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <div class="form-group">
                  <input type="text" class="form-control" id="usr lastname1" placeholder="Apellido Paterno" name="lastname1" required>
                </div>
              </td>
              <td>
                <div class="form-group">
                  <input type="text" class="form-control" id="usr lastname2" placeholder="Apellido Materno" name="lastname2">
                </div>
              </td>
            </tr>
            <tr>
                <td>
                
                    <div class="form-group">
                        <select class="form-control" name="career">
                            <option>Actuaría</option>
                            <option>Biología</option>
                            <option>Ciencias de la Computación</option>
                            <option>Ciencias de la Tierra</option>
                            <option>Física</option>
                            <option>Matemáticas</option>
                        </select>
                    </div>
                </td>
                <td>
                    <div class="form-group">
                        <input type="number" class="form-control" id="usr" placeholder="Número de cuenta" name="accountnumber" required>
                    </div>
                </td>
            </tr>
            <tr>
              <td>
                <div class="form-group">
                  <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email" required>
                    <div class="help-block with-errors"></div>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <div class="form-group">
                  <div class="form-group">
                    <input type="password" data-minlength="6" class="form-control" placeholder="Contraseña" name="password" id="pass" required>
              
                  </div>
                </div>
              </td>
              <td>
                <div class="form-group">
                  <input type="password" class="form-control"  placeholder="Confirma tu contraseña" name="c_password" required>
                  <div class="help-block with-errors"></div>
                </div>
              </td>   
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>
                <div class="form-group" style="float:right;">
                  <a class="btn btn-primary" href="videogames" title="Recrea Comunicación">Volver</a>
                  <button type="submit" class="btn btn-primary">Registrarme</button>
                </div>
              </td>
            </tr>
          </table>
        </form>
      </div>
    </div>
