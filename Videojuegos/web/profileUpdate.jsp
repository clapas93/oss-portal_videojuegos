<%-- 
    Document   : profileUpdate
    Created on : 20-mar-2015, 15:34:40
    Author     : antoniogalvan
    --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="games"></div>
<div id="gamesupdate">
  <div class="row">
    <div class="col-md-4">
      <h3> Actualizar Datos de Perfil</h3>
    </div>
    <div class="col-md-6">
        <form class='actualizaDatos form-horizontal' method ="POST" action="studentsave">
        <div class="form-group">
                <label>Nombre :</label>
                <input type='text'style="width:20em !important" name="nombre_s" size = 50 id='nombre'  class="form-control" required placeholder='Nombre(s) en la base de datos' id="formGroupInputSmall" placeholder="Small input">
              </div>

               <div class="form-group">
                <label> Apellido Paterno :</label>
                <input type='text' style="width:20em !important" size = 50 id ='apellidoPatertno'  class="form-control" required placeholder='Apellido Paterno en la base de datos'>
              </div>
            
            
                      
        <div class="form-group">
          <label> Carrera:</label>
          <select class="form-control" style="width:20em !important" >
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
          <label class="control-label"> Número de cuenta :</label>
          <input type='text'size = 50  style="width:20em !important"  id='num_cuenta'  class="form-control" required placeholder='Número en la base de datos'>
        </div>

        

          <div class="form-group">
            <label class="control-label">Contraseña :</label>
            <input type='password'  style="width:20em !important" class="form-control" value='Antonio ' size = 50 id='pass' required>
          </div>
          <div class="form-group">
            <label class="control-label">Confirmar Contraseña :</label>
            <input type='password'  style="width:20em !important"  class="form-control" value='Antonio ' size = 50 id='passCompare' required>
          </div>

          <div class="form-group">
           <a class="btn btn-primary" href="videogames" title="back">Cancelar</a>
           <button class="btn btn-primary submit">Actualizar Datos</button>  
         </div>
          
          
          
        </form>
      </div>
    </div>
  </div>





