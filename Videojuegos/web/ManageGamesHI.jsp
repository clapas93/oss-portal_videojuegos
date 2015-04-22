<%-- 
Document   : ManageGamesHI.jsp
Author     : Claudia
--%>

<%@ page import ="java.util.List" %>
<%@ page import ="ManageGames.Videogame" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
List videogameList = (List)request.getAttribute("videogameList");
%>

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
      <br><a href="uploadgame" role="button" class="btn btn-large btn-success pull-right">Subir Videojuego</a>
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
                <th><div class="hidden-xs">Descripción</div></th>
                <th>Créditos</th>
                <th>Descargas</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody>
              <%for(int i = 0; i<videogameList.size();i++){%>
                  <%="<tr id='row"+i+"'>"%>
                  <td><%=((Videogame)videogameList.get(i)).getId()%></td>
                  <td><%=((Videogame)videogameList.get(i)).getFront()%></td>
                  <td><%=((Videogame)videogameList.get(i)).getTitle()%></td>
                  <td><a href=<%=((Videogame)videogameList.get(i)).getVideoUrl()%>>video</a></td>
                  <td><%=((Videogame)videogameList.get(i)).getClassification()%></td>
                  <td><%=((Videogame)videogameList.get(i)).getGenre()%></td>
                  <td><div class="hidden-xs"><%=((Videogame)videogameList.get(i)).getDescription()%></div></td>
                  <td> <% Float pf = ((Videogame)videogameList.get(i)).getPrice();
                        out.print((int)(Math.round(pf))); %></td>
                  <td><%=((Videogame)videogameList.get(i)).getDownloads()%></td>
                  <td>
                  <a href="updategame?ID=<%=((Videogame)videogameList.get(i)).getId()%>" role="button" class="btn btn-large btn-primary" name="uploadG">Editar</a>
                  <br><br>
                  <button class="btn btn-danger deleteCM" row="<%=i%>" role="button" name="deleteGame" value=<%=((Videogame)videogameList.get(i)).getId()%>>Eliminar</button>
                </td>
                  <%="</tr>"%>
                <%}%>
              <tr>
                <td>1</td>
                <td><img src="public/img/videojuegos.jpg" height="70" width="100" class="img-rounded"></td>
                <td>Juego1</td>
                <td>url</td>
                <td>M</td>
                <td>Aventura</td>
                <td><div class="hidden-xs">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus semper dui dui, in iaculis ipsum finibus eu. Integer a rutrum eros, eu dignissim eros. Aliquam ultricies vitae odio ut laoreet. In mattis dolor ligula, sit amet eleifend lectus congue at. Curabitur vel nunc pulvinar, pretium nisi non, lacinia elit. Etiam porttitor et felis quis pretium. Nullam lacinia posuere risus, eget hendrerit massa maximus vehicula.</div></td>
                <td>200</td>
                <td>100</td>
                <td>
                  <a href="updategame" role="button" class="btn btn-large btn-primary">Editar</a>
                  <br><br>
                  <button class="btn btn-danger deleteCM" type="button">Eliminar</button>
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