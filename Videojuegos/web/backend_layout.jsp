<%-- 
    Document   : backend_layout
    Created on : 19/03/2015, 01:57:59 PM
    Author     : lalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="icon" type="image/vnd.microsoft.icon" href="public/img/favicon.png"/>
  <title>Editar Videojuegos</title>
  <meta name="author" content="Claudia Medina"/>
  <link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="public/css/backend_style.css">
  <link rel="stylesheet" type="text/css" href="public/css/inside.css">
</head>


  <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
  <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="public/js/main.js"></script>
  <script type="text/javascript" src="public/js/credito.js"></script>
<body>
    <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">
          <img id="brand" style="height: 3em;"alt="pulsegames" src="public/img/logo.png">
        </a>
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>

      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav nav nav-pills pull-right">
          <li role="presentation" class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">Administrador <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li role="presentation"><a role="menuitem" tabindex="-1" href="AdministrarJuegos.jsp">Videojuegos</a></li>
              <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Préstamos</a></li>
              <li class="divider"></li>
              <li role="presentation"><a role="menuitem" tabindex="-1" href="index.jsp">Salir</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
<%@include file='EditarJuego.jsp'%>
</body>
</html>