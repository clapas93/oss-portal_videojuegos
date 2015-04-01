<%-- 
    Document   : ManageGamesHI.jsp
    Author     : Claudia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="icon" type="image/vnd.microsoft.icon" href="public/img/favicon.png"/>
  <title>ManageGamesHI</title>
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
    <h1>Videojuegos en el sistema</h1>
    <div class="row">
        <form class="navbar-form" role="search">
            <div class="input-group pull-right">
                <input type="text" class="form-control" placeholder="Clave o título" name="q">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <br><button type="submit" class="btn btn-large btn-success pull-right">Subir Videojuego</button>
        </div>
    </div>
    <br>
    <div class="row">
      <div class="col-lg-12">
        <div class="dataTable_wrapper">
          <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover table-condensed">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Portada</th>
                  <th>Titulo</th>
                  <th>Video</th>
                  <th>Clasificación</th>
                  <th>Genero</th>
                  <th>Descripción</th>
                  <th>Créditos</th>
                  <th>Descargas</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td><img src="public/img/videojuegos.jpg" height="70" width="100" class="img-rounded"></td>
                  <td>Juego1</td>
                  <td>url</td>
                  <td>M</td>
                  <td>Aventura</td>
                  <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus semper dui dui, in iaculis ipsum finibus eu. Integer a rutrum eros, eu dignissim eros. Aliquam ultricies vitae odio ut laoreet. In mattis dolor ligula, sit amet eleifend lectus congue at. Curabitur vel nunc pulvinar, pretium nisi non, lacinia elit. Etiam porttitor et felis quis pretium. Nullam lacinia posuere risus, eget hendrerit massa maximus vehicula.</td>
                  <td>200</td>
                  <td>100</td>
                  <td>
                    <button class="btn btn-warning" type="button">Editar</button>
                    <br><br>
                    <button class="btn btn-danger" type="button">Eliminar</button>
                  </td>
                </tr>
                <tr>
                  <td>2</td>
                  <td><img src="public/img/videojuegos.jpg" height="70" width="100" class="img-rounded"></td>
                  <td>Juego2</td>
                  <td>url</td>
                  <td>T</td>
                  <td>Simulacion</td>
                  <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus semper dui dui, in iaculis ipsum finibus eu. Integer a rutrum eros, eu dignissim eros. Aliquam ultricies vitae odio ut laoreet. In mattis dolor ligula, sit amet eleifend lectus congue at. Curabitur vel nunc pulvinar, pretium nisi non, lacinia elit. Etiam porttitor et felis quis pretium. Nullam lacinia posuere risus, eget hendrerit massa maximus vehicula.</td>
                  <td>150</td>
                  <td>500</td>
                  <td>
                    <button class="btn btn-warning" type="button">Editar</button>
                    <br><br>
                    <button class="btn btn-danger" type="button">Eliminar</button>
                  </td>
                </tr>
                <tr>
                  <td>3</td>
                  <td><img src="public/img/videojuegos.jpg" height="70" width="100" class="img-rounded"></td>
                  <td>Juego3</td>
                  <td>url</td>
                  <td>E</td>
                  <td>Lucha</td>
                  <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus semper dui dui, in iaculis ipsum finibus eu. Integer a rutrum eros, eu dignissim eros. Aliquam ultricies vitae odio ut laoreet. In mattis dolor ligula, sit amet eleifend lectus congue at. Curabitur vel nunc pulvinar, pretium nisi non, lacinia elit. Etiam porttitor et felis quis pretium. Nullam lacinia posuere risus, eget hendrerit massa maximus vehicula.</td>
                  <td>80</td>
                  <td>40</td>
                  <td>
                    <button class="btn btn-warning" type="button">Editar</button>
                    <br><br>
                    <button class="btn btn-danger" type="button">Eliminar</button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div><!--table responsive-->
        </div>
        <nav>
          <ul class="pager">
            <li class="previous disabled"><a href="#"><span aria-hidden="true">&larr;</span> Anterior</a></li>
            <li class="next"><a href="#">Siguiente <span aria-hidden="true">&rarr;</span></a></li>
          </ul>
        </nav>
      </div>
    </div>
  </div> <!--container-->
  <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
  <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="public/js/main.js"></script>
</body>
</html>
