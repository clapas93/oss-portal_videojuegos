<%-- 
    Document   : AdministarJuegos
    Author     : Claudia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="icon" type="image/vnd.microsoft.icon" href="public/img/logo2.0.png"/>
  <title>Administrar Videojuegos</title>
  <meta name="author" content="Claudia Medina"/>
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
    <h1>Videojuegos en el sistema</h1>
    <div class="row">
      <div class="col-lg-12">
        <p>
          <a href="SubirJuego.jsp" class="btn btn-large btn btn-success pull-right" type="submit">Subir Videojuego</a>
          <form class="form-search">
            <div class="input-append">
              <input type="text" class="span2 search-query" placeholder="Buscar Videojuego">
              <button type="button" class="btn btn-default" aria-label="Left Align"><span class="add-on glyphicon glyphicon-search" aria-hidden="true"></span></button>
            </div>
          </form> 
        </p>
      </div>
    </div>
    <br>
    <div class="row">
      <div class="col-lg-12">
        <div class="dataTable_wrapper">
            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
              <thead>
                <tr>
                  <th>Portada</th>
                  <th>Título</th>
                  <th>Clasificación</th>
                  <th>Genero</th>
                  <th>Descripción</th>
                  <th>Créditos</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><img src="public/img/videojuegos.jpg" height="70" width="100" class="img-rounded"></td>
                  <td>Juego1</td>
                  <td>M</td>
                  <td>Aventura</td>
                  <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus semper dui dui, in iaculis ipsum finibus eu. Integer a rutrum eros, eu dignissim eros. Aliquam ultricies vitae odio ut laoreet. In mattis dolor ligula, sit amet eleifend lectus congue at. Curabitur vel nunc pulvinar, pretium nisi non, lacinia elit. Etiam porttitor et felis quis pretium. Nullam lacinia posuere risus, eget hendrerit massa maximus vehicula.</td>
                  <td>200</td>
                  <td>
                    <p><a href="EditarJuego.jsp" class="btn btn-primary" type="button">Editar</a></p>
                    <p><button class="btn btn-primary btn btn-danger" type="button">Eliminar</button></p>
                  </td>
                </tr>
                <tr>
                  <td><img src="public/img/videojuegos.jpg" height="70" width="100" class="img-rounded"></td>
                  <td>Juego2</td>
                  <td>T</td>
                  <td>Simulación</td>
                  <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus semper dui dui, in iaculis ipsum finibus eu. Integer a rutrum eros, eu dignissim eros. Aliquam ultricies vitae odio ut laoreet. In mattis dolor ligula, sit amet eleifend lectus congue at. Curabitur vel nunc pulvinar, pretium nisi non, lacinia elit. Etiam porttitor et felis quis pretium. Nullam lacinia posuere risus, eget hendrerit massa maximus vehicula.</td>
                  <td>150</td>
                  <td>
                    <p><button class="btn btn-primary" type="button">Editar</button></p>
                    <p><button class="btn btn-primary btn btn-danger" type="button">Eliminar</button></p>
                  </td>
                </tr>
                <tr>
                  <td><img src="public/img/videojuegos.jpg" height="70" width="100" class="img-rounded"></td>
                  <td>Juego3</td>
                  <td>E</td>
                  <td>Lucha</td>
                  <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus semper dui dui, in iaculis ipsum finibus eu. Integer a rutrum eros, eu dignissim eros. Aliquam ultricies vitae odio ut laoreet. In mattis dolor ligula, sit amet eleifend lectus congue at. Curabitur vel nunc pulvinar, pretium nisi non, lacinia elit. Etiam porttitor et felis quis pretium. Nullam lacinia posuere risus, eget hendrerit massa maximus vehicula.</td>
                  <td>80</td>
                  <td>
                    <p><button class="btn btn-primary" type="button">Editar</button></p>
                    <p><button class="btn btn-primary btn btn-danger" type="button">Eliminar</button></p>
                  </td>
                </tr>
                <tr>
                  <td><img src="public/img/videojuegos.jpg" height="70" width="100" class="img-rounded"></td>
                  <td>Juego4</td>
                  <td>C</td>
                  <td>Carrera</td>
                  <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus semper dui dui, in iaculis ipsum finibus eu. Integer a rutrum eros, eu dignissim eros. Aliquam ultricies vitae odio ut laoreet. In mattis dolor ligula, sit amet eleifend lectus congue at. Curabitur vel nunc pulvinar, pretium nisi non, lacinia elit. Etiam porttitor et felis quis pretium. Nullam lacinia posuere risus, eget hendrerit massa maximus vehicula.</td>
                  <td>60</td>
                  <td>
                    <p><button class="btn btn-primary" type="button">Editar</button></p>
                    <p><button class="btn btn-primary btn btn-danger" type="button">Eliminar</button></p>
                  </td>
                </tr>
                <tr>
                  <td><img src="public/img/videojuegos.jpg" height="70" width="100" class="img-rounded"></td>
                  <td>Juego5</td>
                  <td>A</td>
                  <td>Terror</td>
                  <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus semper dui dui, in iaculis ipsum finibus eu. Integer a rutrum eros, eu dignissim eros. Aliquam ultricies vitae odio ut laoreet. In mattis dolor ligula, sit amet eleifend lectus congue at. Curabitur vel nunc pulvinar, pretium nisi non, lacinia elit. Etiam porttitor et felis quis pretium. Nullam lacinia posuere risus, eget hendrerit massa maximus vehicula.</td>
                  <td>80</td>
                  <td>
                    <p><button class="btn btn-primary" type="button">Editar</button></p>
                    <p><button class="btn btn-primary btn btn-danger" type="button">Eliminar</button></p>
                  </td>
                </tr>
              </tbody>
            </table>
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
