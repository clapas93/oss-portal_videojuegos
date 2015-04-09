<%-- 
    Document   : backend_layout
    Created on : 19/03/2015, 01:57:59 PM
    Author     : lalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String view = (String)request.getAttribute("view");
  String title = (String)request.getAttribute("title");
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="icon" type="image/vnd.microsoft.icon" href="public/img/favicon.png"/>
  <title><%= title %></title>
  <meta name="author" content="Claudia Medina"/>
  <link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="public/css/backend_style.css">
  <link rel="stylesheet" type="text/css" href="public/css/inside.css">
  
  <link rel="stylesheet" type="text/css" href="public/css/formvalidation/formValidation.css">
  <link rel="stylesheet" type="text/css" href="public/css/formvalidation/formValidation.min.css">
  
</head>

<body>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
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
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Administrador 
                <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li role="presentation"><a role="menuitem" href="managegames">
                      <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Videojuegos</a>
              </li>
              <li role="presentation"><a role="menuitem" href="loanapplications">
                      <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Préstamos</a></li>
              <li class="divider"></li>
              <li role="presentation"><a role="menuitem" href="index.jsp">
                      <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Salir</a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
    
    <jsp:include page='<%= view %>' />
    
    <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
    <!--<script type="text/javascript" src="public/js/jquery.min.js"></script>-->
    
    <!--<script type="text/javascript" src="public/js/jquery.validate.js"></script>-->
    <!--<script type="text/javascript" src="public/js/jquery.validate.min.js"></script>-->
    
    <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="public/js/main.js"></script>
    
    <script type="text/javascript" src="public/js/formvalidation/formValidation.min.js"></script>
    <script type="text/javascript" src="public/js/formvalidation/formValidation.js"></script>
    <script type="text/javascript" src="public/js/formvalidation/framework/bootstrap.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="public/css/bootstrap-select.min.css">
    <script type="text/javascript" src="public/js/bootstrap-select.min.js"></script>
    
    <script type="text/javascript" src="public/js/videogames/uGame.js"></script>
    
</body>
</html>