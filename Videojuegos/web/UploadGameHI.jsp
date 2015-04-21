<%-- 
Document   : UploadGameHI.jsp
Author     : Claudia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
  <h1>Subir Videojuego</h1>
  <div class="panel panel-default">
    <div class="panel-body">
      <form id="gameForm" enctype="multipart/form-data" method="get" action="saveGame">
        
        <div class="row">
          <div class="col-lg-6">
            <div class="form-group">
              <label class="control-label" for="TITLE">Título</label>
              <input type="text" class="form-control input-group" name="TITLE" placeholder="Título" value="Videojuego1">
            </div>
          </div>
          <div class="col-lg-6">
            <div class="form-group">
              <label class="control-label" for="PRICE">Número de créditos</label>
              <div class="controls controls-row">
                <div class="col-lg-2">
                  <input type="radio" name="creditOptions" id="FREE" value="FREE" checked> Gratis
                </div>
                <div class="col-lg-3">
                  <input type="radio" name="creditOptions" id="CREDIT" value="CREDIT"> Crédito
                </div>
                <div class="col-lg-6">
                  <input class="form-control FREE input-group" name="PRICE" type="number" placeholder="Número de Créditos" disabled value="100">
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
                <option></option>
                <option>C (-5)</option>
                <option>E (+5)</option>
                <option>T (+13)</option>
                <option>M (+17)</option>
                <option>A (+18)</option>
              </select>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="form-group">
              <label class="control-label">Genero</label>
              <select name="GENRE" class="form-control">
                <option></option>
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
              <label class="control-label">Videojuego</label>
              <input type="file" class="form-control" name="GAME">
            </div>
          </div>
        </div><!--2-row-->
        <div class="row">
          <div class="col-lg-6">
            <div class="form-group">
              <label class="control-label">Descripción</label>
              <textarea rows="4" class="form-control" name="DESCRIPTION" placeholder="Descripción"></textarea>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="form-group">
              <label class="control-label">Portada</label>
              <input type="file" class="form-control" name="FRONT"/>
            </div>
            <div class="form-group">
              <label class="control-label">Video</label>
              <input type="url" class="form-control" name="VIDEO" placeholder="Url del video" value="https://www.youtube.com/watch?v=Mef-OEmw9vI">
            </div>
          </div>
        </div><!--3-row-->
        <div class="row">
          <div class="col-lg-12">
            <div class="text-center">
              <!--<input type="submit" class="btn btn-success" value="Subir" value="UPLOAD">-->
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

