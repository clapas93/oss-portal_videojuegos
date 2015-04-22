<%-- 
    Document   : layout
    Created on : 13/03/2015, 01:57:51 AM
    Author     : lalo
--%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="icon" type="image/vnd.microsoft.icon" href="public/img/favicon.png"/>
  <link href='http://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
  <title>Pulse Games</title>
  <link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="public/css/style.css">
  <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
</head>
<%
        String view = (String)request.getAttribute("view");
        String footer = (String)request.getAttribute("footer");
        String header = (String)request.getAttribute("header");
        String bool1 = (String)request.getAttribute("bool1");
        String bool2 =(String)request.getAttribute("bool2");
%>
<body class="hidden">
  <nav class="navbar navbar-default navbar-fixed-top">
      
      <% if(header == null && bool1 != "1"){ %>
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
          <img src="public/img/brand.png" id="brandimage">
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav pull-right">
          <li ><a id="event_click" >Iniciar Sesión</a></li>
          <li><a id="registro" href="registro">Registrarse</a></li>
        </ul>
          
        <div class="form-index">
            <span style="color:#fff; font-size: 1.5em;">Datos de usuario</span>
            <hr color="#2c2c2c">
            <div>
                <form id="loginForm" method="post" class="form-horizontal" action="#">
				 <div class="form-group">
					 <label class="col-md-3 control-label">Usuario</label>
					 <div class="col-md-7">
						 <input type="text" class="form-control" name="usuario" placeholder="ejemplo@correo.com"/>
					 </div>
				 </div>
				 <div class="form-group">
		 			<label class="col-md-3 control-label">Contraseña</label>
					 <div class="col-md-7">
						 <input type="password" class="form-control" name="password" placeholder="Contraseña"/>
					 </div>
				 </div>
				 <div class="form-group">
					 <div class="col-md-5 col-md-offset-3">
						 <button type="submit" class="btn btn-default">Entrar</button>
					 </div>
				 </div>
                </form>
            </div>
        </div>
      </div>
    </div>
    <%} else { %>
    <div>
        <jsp:include page='<%= header %>' /> 
    </div>
        <% } %>
</nav>
  <section id="games">
        <jsp:include page='<%= view %>' />
  </section>
        <jsp:include page='<%= footer %>' />
  
</html>

