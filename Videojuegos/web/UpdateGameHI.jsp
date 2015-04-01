<%-- 
    Document   : UpdateGameHI.jsp
    Author     : Claudia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="icon" type="image/vnd.microsoft.icon" href="public/img/favicon.png"/>
  <title>UpdateGamesHI</title>
  <meta name="author" content="Claudia Medina"/>
  <link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="public/css/backend_style.css">
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
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Administrador 
                <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li role="presentation"><a role="menuitem" href="ManageGamesHI.jsp">
                      <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Videojuegos</a>
              </li>
              <li role="presentation"><a role="menuitem" href="#">
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
    
    <div class="container">
        <h1>Editar Videojuego</h1>
        <div class="panel panel-default">
          <div class="panel-body">
            <form role="form">
            <div class="row">
                <div class="col-lg-6">
                          <div class="form-group">
                            <label>Título</label>
                            <input class="form-control" placeholder="Título en BD">
                          </div>
                </div>
                <div class="col-lg-6">
                        <label>Número de créditos</label>
                        <div class="controls controls-row">
                          <div class="col-lg-2">
                              <input type="radio" name="creditOptions" id="free" value="free" checked> Gratis
                          </div>
                          <div class="col-lg-3">
                            <input type="radio" name="creditOptions" id="credit" value="free"> Crédito
                          </div>
                          <div class="col-lg-6">
                            <input class="form-control free" type="text" id="numCredits" placeholder="Número de Créditos en BD" disabled="true">
                          </div>
                        </div>
                </div>
            </div><!--1-row-->
              <div class="row">
                <div class="col-lg-3">
                          <div class="form-group">
                            <label>Clasificación</label>
                            <select class="form-control">
                              <option>Clasificación en BD</option>
                              <option>C</option>
                              <option>E</option>
                              <option>T</option>
                              <option>M</option>
                              <option>A</option>
                            </select>
                          </div>
                </div>
                  <div class="col-lg-3">
                          <div class="form-group">
                            <label>Genero</label>
                            <select class="form-control">
                              <option>Genero en BD</option>
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
                  </div>
                  <div class="col-lg-6">
                        <div class="form-group">
                            <label>Videojuego</label>
                            <input type="file">
                        </div>
                  </div>
            </div><!--2-row-->
            <div class="row">
                <div class="col-lg-6">
                        <div class="form-group">
                            <label>Descripción</label>
                              <textarea rows="4" class="form-control" placeholder="Descripción en BD"></textarea>
                        </div>
                </div>
                <div class="col-lg-6">
                        <div class="form-group">
                            <label>Portada</label>
                            <input type="file">
                        </div>
                        <div class="form-group">
                            <label>Video del Demo</label>
                            <input type="file">
                        </div>
                </div>
            </div><!--3-row-->
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-center">
                        <button type="submit" class="btn btn-default">Subir</button>
                        <button type="reset" class="btn btn-default">Limpiar</button>
                    </div>
                </div>
            </div>
            </form>
          </div><!--panel-body-->
        </div><!--panel-->
    </div>
    
    <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
    <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="public/js/main.js"></script>
    <script type="text/javascript" src="public/js/uGame.js"></script>
    
</body>
</html>