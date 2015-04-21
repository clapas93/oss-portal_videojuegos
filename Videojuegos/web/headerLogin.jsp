<%-- 
    Document   : headerLogin
    Created on : 12/04/2015, 06:35:28 PM
    Author     : magdiel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <script type="text/javascript" src="public/js/magdieljs.js"></script>
  <script type="text/javascript" src="public/js/jquery.validate.js"></script>
  <script type="text/javascript" src="public/js/validCampo.js"></script>
  <script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
  <script type="text/javascript" src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
  <link rel="stylesheet" type="text/css" href="public/css/backend_style.css">  
  <link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">

<!-- Versión compilada y comprimida del JavaScript de Bootstrap -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

    <div class="navbar-header">
          <img src="public/img/brand.png" id="brandimage">
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
            <a class="dropdown-toggle" data-toggle="dropdown" href="Logout" role="button" aria-expanded="false">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span> <%=session.getAttribute("nomUsuario")%>
                <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li role="presentation"><a role="menuitem" href="managegames">
                      <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Videojuegos</a>
              </li>
              <li role="presentation"><a role="menuitem" href="loanapplications">
                      <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Préstamos</a></li>
              <li class="divider"></li>
              <li role="presentation"><a role="menuitem" href="logoutController">
                      <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Salir</a>
              </li>
            </ul>
          </li>
        </ul>
    </div>
  
  <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="public/css/style.css">
  <link rel="stylesheet" type="text/css" href="public/css/inside.css">
  <link rel="stylesheet" type="text/css" href="public/css/magdielstyle.css">
  <script type="text/javascript" src="public/js/main.js"></script>