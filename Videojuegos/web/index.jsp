
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="icon" type="image/vnd.microsoft.icon" href="public/img/favicon.png"/>
  <link href='http://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
  <title>Pulse Games</title>
  <link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="public/css/style.css">
  <link rel="stylesheet" type="text/css" href="public/css/magdielstyle.css">
  <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
  <script type="text/javascript" src="public/js/magdieljs.js"></script>
  <script type="text/javascript" src="public/js/main.js"></script>
  <script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
  <script type="text/javascript" src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
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
          <li ><a id="event_click" >Iniciar Sesión</a></li>
          <li><a id="registro" href="registro">Registrarse</a></li>
        </ul>
          
        <div class="form-index">
            <span style="color:#fff; font-size: 1.5em;">Datos de usuario</span>
            <hr color="#2c2c2c">
            <div>
                <form id="loginForm" method="post" class="form-horizontal" action="loginController?accion=LOGIN">
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
  </nav>
  <section id="front" class="">
    <div id="logo" class="row">
    <svg viewBox="20 20 600 300">

        <!-- Symbol with text -->
        <symbol id="s-text">
          <text text-anchor="middle"
          x="50%"
          y="50%"
          dy=".20em"
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
  <div >
      <a href="videogames" ><img id="pressstart" src="public/img/press_start_color.png"></a>
  </div>
  </section>
</body>
</html>
