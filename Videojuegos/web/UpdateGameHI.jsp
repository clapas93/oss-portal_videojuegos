<%-- 
Document   : UpdateGameHI.jsp
Author     : Claudia
--%>

<%@ page import ="ManageGames.Videogame" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Videogame videogameId = (Videogame)request.getAttribute("videogameId");
%>

<div class="container">
  <h1>Editar Videojuego</h1>
  <div class="panel panel-default">
    <div class="panel-body">
      <form id="gameForm" enctype="multipart/form-data" method="get" action="editGame">
          <div class="col-lg-6 hidden">
            <div class="form-group">
              <input type="text" class="form-control input-group" name="ID" value=<%=((Videogame)videogameId).getId()%>>
            </div>
          </div>
        <div class="row">
          <div class="col-lg-6">
            <div class="form-group">
              <label class="control-label" for="TITLE">Título</label>
              <input type="text" class="form-control input-group" name="TITLE" value=<%=((Videogame)videogameId).getTitle()%>>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="form-group">
              <% Float pf = ((Videogame)videogameId).getPrice();
              int p = (int)(Math.round(pf)); %>
              <label class="control-label" for="PRICE">Número de créditos</label>
              <div class="controls controls-row">
                <div class="col-lg-2">
                  <input type="radio" name="creditOptions" id="FREE" value="FREE" <%if(p==0.0){ out.print("checked");}%>> Gratis
                </div>
                <div class="col-lg-3">
                  <input type="radio" name="creditOptions" id="CREDIT" value="CREDIT" <%if(p>0){ out.print("checked");}%>> Crédito
                </div>
                <div class="col-lg-6">
                  <input class="form-control FREE input-group" name="PRICE" type="number" placeholder="Número de Créditos" <%if(p==0.0){ out.print("disabled");}%> value=<%out.print(p);%>>
                </div>
              </div>
            </div>
          </div>
        </div><!--1-row-->
        <div class="row">
          <div class="col-lg-3">
            <div class="form-group">
              <label class="control-label">Clasificación</label>
              <select name="CLASS" class="form-control">
                <% String c = ""; c= ((Videogame)videogameId).getClassification();%>
                <option <%if(c.equals("C")){ out.print("select");}%> >C (-5)</option>
                <option <%if(c.equals("E")){ out.print("select");}%> >E (+5)</option>
                <option <%if(c.equals("T")){ out.print("select");}%> >T (+13)</option>
                <option <%if(c.equals("M")){ out.print("select");}%> >M (+17)</option>
                <option <%if(c.equals("C")){ out.print("select");}%> >A (+18)</option>
              </select>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="form-group">
              <label class="control-label">Genero</label>
              <select name="GENRE" class="form-control">
                <% String g = ""; g= ((Videogame)videogameId).getGenre();%>
                <option <%if(g.equals("Acción")){ out.print("select");}%> >Acción</option>
                <option <%if(g.equals("Lucha")){ out.print("select");}%> >Lucha</option>
                <option <%if(g.equals("Estrategia")){ out.print("select");}%> >Estrategia</option>
                <option <%if(g.equals("Deporte")){ out.print("select");}%> >Deporte</option>
                <option <%if(g.equals("Carreras")){ out.print("select");}%> >Carreras</option>
                <option <%if(g.equals("Musical")){ out.print("select");}%> >Musical</option>
                <option <%if(g.equals("Simulación")){ out.print("select");}%> > Simulación</option>
                <option <%if(g.equals("Vehiculos")){ out.print("select");}%> >Vehiculos</option>
                <option <%if(g.equals("Disparos")){ out.print("select");}%> >Disparo</option>
                <option <%if(g.equals("Rol")){ out.print("select");}%> >Rol/Destreza</option>
                <option <%if(g.equals("Terror")){ out.print("select");}%> >Terror</option>
              </select>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="form-group">
              <label class="control-label">Videojuego</label>
              <input type="file" class="form-control" name="GAME">
            </div>
          </div>
        </div><!--2-row-->
        <div class="row">
          <div class="col-lg-6">
            <div class="form-group">
              <label class="control-label">Descripción</label>
              <textarea rows="4" class="form-control" name="DESCRIPTION" placeholder="Descripción"><% out.print(((Videogame)videogameId).getDescription());%></textarea>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="form-group">
              <label class="control-label">Portada</label>
              <input type="file" class="form-control" name="FRONT"/>
            </div>
            <div class="form-group">
              <label class="control-label">Video</label>
              <input type="url" class="form-control" name="VIDEO" placeholder="Url del video" value=<%=((Videogame)videogameId).getVideoUrl()%>>
            </div>
          </div>
        </div><!--3-row-->
        <div class="row">
          <div class="col-lg-12">
            <div class="text-center">
              <button type="submit" class="btn btn-success">Subir</button>
              <button type="reset" class="btn btn-primary">Limpiar</button>
              <a href="managegames" role="button" class="btn btn-large btn-danger">Cancelar</a>
            </div>
          </div>
        </div>
      </form>
    </div><!--panel-body-->
  </div><!--panel-->
</div>