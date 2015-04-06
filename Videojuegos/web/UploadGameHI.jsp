<%-- 
    Document   : UploadGameHI.jsp
    Author     : Claudia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <div class="container">
        <h1>Subir Videojuego</h1>
        <div class="panel panel-default">
          <div class="panel-body">
            <form id="gameForm" enctype="multipart/form-data">
                
              <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label class="control-label" for="TITLE">Título</label>
                        <div class="input-group">
                        <input type="text" class="form-control" name="TITLE" placeholder="Título">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <label class="control-label" for="PRICE">Número de créditos</label>
                        <div class="controls controls-row">
                          <div class="col-lg-2">
                              <input type="radio" name="creditOptions" id="FREE" value="FREE" checked> Gratis
                          </div>
                          <div class="col-lg-3">
                            <input type="radio" name="creditOptions" id="CREDIT" value="CREDIT"> Crédito
                          </div>
                          <div class="col-lg-6">
                            <input class="form-control FREE" name="PRICE" type="number" id="numCredits" placeholder="Número de Créditos" disabled>
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
                            <input type="file" class="form-control" name="VIDEOGAME">
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
                            <input type="url" class="form-control" name="VIDEO" placeholder="Url del video">
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
