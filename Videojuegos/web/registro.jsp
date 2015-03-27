<%-- 
    Document   : registro
    Created on : 19/03/2015, 01:20:28 PM
    Author     : magdiel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="icon" type="image/vnd.microsoft.icon" href="public/img/logo2.0.png"/>
  <title>Pulse Games</title>
  <link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="public/css/style.css">
  <link rel="stylesheet" type="text/css" href="public/css/inside.css">
  <link rel="stylesheet" type="text/css" href="public/css/magdielstyle.css">
  <script type="text/javascript" src="public/js/validator.js"></script>
  <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
  <script type="text/javascript" src="public/js/main.js"></script>
  <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="public/js/magdieljs.js"></script>
  <link href="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" rel="stylesheet"></link>
  
</head>
<body>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">
        </a>
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>
      
    </div>
  </nav>

  <div class="form-registro">
    <div class="mi-title"><span>Registro</span></div>
    <hr size="2">  
      <div class="formulario">
        <form data-toggle="validator" role="form">
          <table border="0">
            <tr>
              <td>
                <div class="form-group">
                  <input type="text" class="form-control" id="usr" placeholder="Nombre" required>
                </div>
              </td>
              <td>
                <div class="form-group">
                  <input type="text" class="form-control" id="usr" placeholder="Apellidos" required>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <div class="form-group">
                  <input type="text" class="form-control" id="usr" placeholder="Número de cuenta" required>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <div class="form-group">
                  <select class="form-control">
                    <option value="">Actuaría</option>
                    <option value="">Biología</option>
                    <option value="">Ciencias de la Computación</option>
                    <option value="">Ciencias de la Tierra</option>
                    <option value="">Física</option>
                    <option value="">Matemáticas</option>
                  </select>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <div class="form-group">
                  <input type="email" class="form-control" id="inputEmail" placeholder="Email" data-error="Bruh, that email address is invalid" required>
                    <div class="help-block with-errors"></div>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <div class="form-group">
                  <div class="form-group">
                    <input type="password" data-minlength="6" class="form-control" id="inputPassword" placeholder="Contraseña" required>
              
                  </div>
                </div>
              </td>
              <td>
                <div class="form-group">
                  <input type="password" class="form-control" id="inputPasswordConfirm" data-match="#inputPassword" data-match-error="Whoops, these don't match" placeholder="Confirma tu contraseña" required>
                  <div class="help-block with-errors"></div>
                </div>
              </td>   
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>
                <div class="form-group" style="float:right;">
                  <a class="btn btn-primary" href="index.jsp" title="Recrea Comunicación">Volver</a>
                  <button type="submit" class="btn btn-primary">Registrarme</button>
                </div>
              </td>
            </tr>
          </table>
        </form>
      </div>
    </div>
<!--  
<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
            </button>
        </div>
    
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav pull-left">
                <li><a href="#">Contacto</a></li>
            </ul>
        </div>
    </div>
</nav>
-->
  <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
  <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="public/js/main.js"></script>
</body>
</html>

