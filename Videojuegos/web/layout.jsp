<!DOCTYPE html>
<%
String view = (String)request.getAttribute("view");
String footer = (String)request.getAttribute("footer");
String header = (String)request.getAttribute("header");
String bool1 = (String)request.getAttribute("bool1");
String bool2 =(String)request.getAttribute("bool2");
%>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="icon" type="image/vnd.microsoft.icon" href="public/img/favicon.png"/>

  <title>Pulse Games</title>

  <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
  <link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="public/css/style.css">
  <link rel="stylesheet" type="text/css" href="public/css/inside.css">
  <link rel="stylesheet" type="text/css" href="public/css/magdielstyle.css">

  <link rel="stylesheet" type="text/css" href="public/css/videogames/normalize.css" />
  <link rel="stylesheet" type="text/css" href="public/css/videogames/demo.css" />
  <link rel="stylesheet" type="text/css" href="public/css/videogames/component.css" />
  <script src="public/js/videogames/modernizr.custom.js"></script>
  <script src="public/js/videogames/isotope.pkgd.js"></script>
  <script src="public/js/videogames/classie.js"></script>
  <script src="public/js/videogames/helper.js"></script>
  <script src="public/js/videogames/grid3d.js"></script>

</head>
<body  style="display:none">
 <nav class="navbar navbar-default navbar-fixed-top">

  <% if(header == null ){ %>
  <div class="container-fluid">
   <div class="navbar-header">
     <a href="videogames"> <img src="public/img/brand.png" id="brandimage"></a>
     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
       <span class="sr-only">Toggle navigation</span>
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>
     </button>
   </div>
   <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
     <ul class="nav navbar-nav pull-right">
       <li ><a id="event_click" >Iniciar Sesión</a></li>
       <li><a id="registro" href="registro">Registrarse</a></li>
     </ul>
     <div class="form-index">
       <span style="color:#fff; font-size: 1.5em;">Datos de usuario</span>
       <hr color="#2c2c2c ">
       <div>
         <form id="loginForm" method="post" class="form-horizontal" action="loginController?accion=LOGIN">
           <div class="form-group">
             <label class="col-md-3 control-label">Usuario</label>
             <div class="col-md-7">
               <input type="email" class="form-control" name="usuario" placeholder="ejemplo@correo.com" autocomplete="off"/>
             </div>
           </div>
           <div class="form-group">
             <label class="col-md-3 control-label">Contraseña</label>
             <div class="col-md-7">
              <input type="password" class="form-control" name="password" placeholder="Contraseña"/>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-7">
              <span style="color:red"><%= request.getParameter("msg")!=null?request.getParameter("msg"):""%></span>
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
<div style="display:none"class="transparent"></div>

<div id="wrapper">
  <div id="container">
    <jsp:include page='<%= view %>' />
  <div class="clear"></div>
<jsp:include page='<%= footer %>' />
</div><!-- /container -->
</body>  
</html>




