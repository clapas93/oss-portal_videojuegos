<%-- 
    Document   : layout
    Created on : 13/03/2015, 01:57:51 AM
    Author     : lalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="icon" type="image/vnd.microsoft.icon" href="public/img/favicon.png"/>
  <title>Pulse Games</title>
  <link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="public/css/style.css">
  <link rel="stylesheet" type="text/css" href="public/css/inside.css">
    <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>

  <script type="text/javascript" src="public/js/jssor.js"></script>

  <script type="text/javascript" src="public/js/jssor.slider.js"></script>

</head>
<body>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">
          <img id="brand" alt="pulsegames" src="public/img/logo.png">
        </a>
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav pull-right">
          <li><a href="#">Iniciar Sesión</a></li>
          <li><a href="#">Registrarse</a></li>
        </ul>
      </div>
    </div>
  </nav>
  
    <%@include file='videojuegos.jsp'%>
  
  <div id="footer">
   
          <p><a href="#">Contacto</a></p>
  </div>
  <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="public/js/main.js"></script>
</body>
</html>

