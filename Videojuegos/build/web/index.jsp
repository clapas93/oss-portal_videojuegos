<%-- 
    Document   : index
    Created on : 12/03/2015, 01:55:10 PM
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
</head>
<body>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
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
  <div id="logo" class="row">
    <svg viewBox="20 20 600 300">

        <!-- Symbol with text -->
        <symbol id="s-text">
          <text text-anchor="middle"
          x="50%"
          y="50%"
          dy=".35em"
          class="text"
          >
          Pulse Games
          </text>    
        </symbol>

      <!--Mask-->
      <mask id="m-text"
        maskunits="userSpaceOnUse"
        maskcontentunits="userSpaceOnUse">
        <use xlink:href="#s-text"
        class="text-mask">
        </use>
      </mask>

      <!-- Group with mask -->
      <g mask="url(#m-text)">
      <!-- Masked content -->
        <!-- http://tympanus.net/codrops-playground/assets/images/posts/23145/image2.jpg -->
        <image xlink:href="public/img/morado.jpg"
        width="900"
        height="532"
        x="-30%"
        y="-20%">
        </image>
      </g>
    </svg>
    
  </div>
  <div class="container">
<!--   <div id="entrar_row" class="row-fluid">
    <div class="col-md-5"></div>
    <button class="button button--nina button--border-thin button--round-s" data-text="Entrar">
    <span>E</span><span>n</span><span>t</span><span>r</span><span>a</span><span>r</span>
    </button>
  </div>
 -->  
  </div>
  <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
  <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="public/js/main.js"></script>
</body>
</html>
