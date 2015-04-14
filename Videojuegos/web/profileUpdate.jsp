<%-- 
    Document   : profileUpdate
    Created on : 20-mar-2015, 15:34:40
    Author     : antoniogalvan
    --%>

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
      <link rel="stylesheet" type="text/css" href="public/css/inside.css">
      <link rel="stylesheet" type="text/css" href="public/css/magdielstyle.css">
      <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
    </head>
<body >
      <nav class="navbar navbar-default navbar-fixed-top">
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
</nav>
<div id="games"></div>
<div id="gamesupdate">
  <div class="row">
    <div class="col-md-4">
      <h3> Actualizar Datos de Perfil</h3>
    </div>
    <div class="col-md-6">
      <form class='actualizaDatos form-horizontal'>
        
          <div class="row">
            <div class="col-md-5">
              <div class="form-group">
                <label>Nombre :</label>
                <input type='text'style="width:20em !important" size = 50 id='nombre'  class="form-control" required placeholder='Nombre en la base de datos' id="formGroupInputSmall" placeholder="Small input">
              </div>
            </div>
            <div class="col-md-5 col-sm-offset-1">
               <div class="form-group">
                <label> Apellidos :</label>
                <input type='text' style="width:20em !important" size = 50 id ='apellidos'  class="form-control" required placeholder='Apellidos en la base de datos'>
              </div>
            </div>
          </div>
        <div class="form-group">
          <label> Carrera:</label>
          <select class="form-control" style="width:20em !important" >
            <option>-------------------------------------</option>
            <option>Actuaría</option>
            <option>Biología</option>
            <option>Ciencias de la Computación</option>
            <option>Ciencias de la Tierra</option>
            <option>Física</option>
            <option>Física Biomedica</option>
            <option>Matemáticas</option>
            <option>Matemáticas Aplicadas</option>
            <option>Manejo Sustentable de Zonas Costeras</option>
          </select>
        </div>
        <div class="form-group">
          <label class="control-label"> Número de cuenta :</label>
          <input type='text'size = 50  style="width:20em !important"  id='num_cuenta'  class="form-control" required placeholder='Número en la base de datos'>
        </div>

        <div class="form-group">
          <label class="control-label"> Correo electronico :</label
            ><input type='text' size = 50 id='email' style="width:20em !important"  class="form-control" required placeholder='email en la base de datos'>
          </div>

          <div class="form-group">
            <label class="control-label">Contraseña :</label>
            <input type='password'  style="width:20em !important" class="form-control" value='Antonio ' size = 50 id='pass' required>
          </div>
          <div class="form-group">
            <label class="control-label">Confirmar Contraseña :</label>
            <input type='password'  style="width:20em !important"  class="form-control" value='Antonio ' size = 50 id='passCompare' required>
          </div>

          <div class="form-group">
           <button class="btn btn-primary submit">Actualizar Datos</button>  
         </div>
        </form>
      </div>
    </div>
  </div>
<div id="footer" class="navbar navbar-default navbar-fixed-bottom">
  <p><a href="#">Contacto</a></p>
  </div>
<script type="text/javascript" src="public/js/magdieljs.js"></script>
  <script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
  <script type="text/javascript" src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
  <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="public/css/style.css">
  <link rel="stylesheet" type="text/css" href="public/css/inside.css">
  <link rel="stylesheet" type="text/css" href="public/css/magdielstyle.css">
  <script type="text/javascript" src="public/js/main.js"></script>
</body>
</html>
