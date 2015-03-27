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
  <link rel="icon" type="image/vnd.microsoft.icon" href="public/img/logo2.0.png"/>
  <title>Pulse Games</title>
  <link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="public/css/style.css">
  <link rel="stylesheet" type="text/css" href="public/css/inside.css">
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
          <li><a href="#">Nombre_Usuario</a></li>
        </ul>
      </div>
    </div>
  </nav>
<div class="container">
    <div class="row">
  <div class="col-md-5 col-md-offset-1">
    <h2> Actualizar Datos de Perfil</h2>
    </div>
  </div>
  <br>
  <div class="row">
    <div class="col-md-6 col-md-offset-4">
  <form class='actualizaDatos form-horizontal'>
  <div class="form-group">
    <label>Nombre :</label>
      <input type='text'size = 50 id='nombre'
      required placeholder='Nombre en la base de datos' id="formGroupInputSmall" placeholder="Small input">
  </div>
  
  <div class="form-group">
    <label> Apellidos :</label>
    <input
    type='text' size = 50 id ='apellidos' required
    placeholder='Apellidos en la base de datos'>
  </div>
  
  <div class="form-group">
    <label> Carrera:</label>
    <select class="form-controL" style="width:20em !important" >
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
    <label> Número de cuenta :</label>
    <input type='text'
    size = 50  id='num_cuenta' required placeholder='Número en la base
    de datos'>
  </div>

  <div class="form-group">
    <label> Correo electronico :</label
    ><input type='text'
    size = 50 id='email' required placeholder='email en la base de
    datos'>
  </div>

  <div class="form-group">
    <label>Contraseña :</label>
    <input type='password'
    value='Antonio ' size = 50 id='pass' required>
    </div>
   <div class="form-group">
    <label>Confirmar Contraseña :</label>
    <input type='password'
    value='Antonio ' size = 50 id='passCompare' required>
  </div>

  <div class="form-group">
   <button class="btn btn-primary submit">Actualizar Datos</button>  
   </div>
  </form>
  </div>
  </div>
</div>


    
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
  <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
  <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="public/js/main.js"></script>

  

  
</body>
</html>
