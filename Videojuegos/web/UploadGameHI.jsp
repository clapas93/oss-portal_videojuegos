<%-- 
    Document   : SubirJuego
    Author     : Claudia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="icon" type="image/vnd.microsoft.icon" href="public/img/logo2.0.png"/>
  <title>Subir Videojuegos</title>
  <meta name="author" content="Claudia Medina"/>
  <link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="public/css/backed_style.css">
  <link rel="stylesheet" type="text/css" href="public/css/inside.css">
</head>
<body>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">
          <img style="height:1.5em;" id="brand" alt="pulsegames" src="public/img/logo.png">
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
  
<div class="container">
    <h1>Subir Videojuego</h1>
    <br>
    <div class="row">
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div class="panel-body">
              <div class="row">
                <div class="col-lg-6">
                  <form role="form">
                    <div class="form-group">
                      <label>Titulo</label>
                      <input class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Clasificación</label>
                        <select class="form-control">
                          <option>Selcciona la clasificación</option>
                          <option>C</option>
                          <option>E</option>
                          <option>T</option>
                          <option>M</option>
                          <option>A</option>
                        </select>
                      <label>Genero</label>
                      <select class="form-control">
                          <option>Selecciona un genero</option>
                          <option>Acción</option>
                          <option>Lucha</option>
                          <option>Estrategia</option>
                          <option>Deporte</option>
                          <option>Carreras</option>
                          <option>Musical</option>
                          <option>Simulación</option>
                          <option>Vehiculos</option>
                          <option>Disparo</option>
                          <option>Rol/Destreza</option>
                          <option>Terror</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>Descripción</label>
                      <textarea rows="4" class="form-control"></textarea>
                    </div>
                  </form>
                </div> 

                <div class="col-lg-6">
                  <h3>Asigna el costo del videojuego</h3>
                  <form role="form">
                    <div class="controls controls-row">
                      <div class="col-lg-3">
                        <input type="radio" name="opcionesCredito" id="gratis" value="gratis" checked> Gratis
                      </div>
                      <div class="col-lg-3">
                        <input type="radio"  id="credito" name="opcionesCredito" id="credito" value="gratis"> Crédito
                      </div>
                      <div class="col-lg-6">
                        <label class="inline"><input class="gratis" type="text" id="numCreditos" placeholder="Número de Créditos" disabled="true"> </label>
                      </div>
                  </form>
                  <h3>Ubica tus archivos</h3>
                  <div class="form-group">
                    <label>Videojuego</label>
                    <input type="file">
                  </div>
                  <div class="form-group">
                    <label>Portada</label>
                    <input type="file">
                  </div>
                </div>

              </div> <!--row-->

              <div class="text-center">
                <button type="submit" class="btn btn-default">Subir</button>
                <button type="reset" class="btn btn-default">Limpiar</button>
              </div>

          </div> <!--panel body-->
        </div> <!--panel-default-->
      </div>
    </div>
  </div> <!--container-->

  <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
  <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="public/js/main.js"></script>
  <script type="text/javascript" src="public/js/credito.js"></script>

</body>
</html>

