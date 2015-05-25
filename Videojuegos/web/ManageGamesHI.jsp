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
                  <% String frontUrl = ((Videogame)videogameList.get(i)).getFront();
                     String img = "public/videogames/fronts/" + frontUrl;
                     String htmlPage = ((Videogame)videogameList.get(i)).getRouteGame();%>
                  <!--<td><a href=<%=htmlPage%> target="_blank"><img src=<%=img%> height="100" width="100"></td></a>-->
                  <td><img src="<%=img%>" height="100" width="100"></td>
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
            </tbody>
          </table>
        </div><!--table responsive-->
      </div>
    </div>
  </div>
</div> <!--container-->