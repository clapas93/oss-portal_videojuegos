<%-- 
    Document   : LoansHI
    Created on : 5/04/2015, 10:49:37 PM
    Author     : lalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
    <h1>Nuevas Solicitudes</h1>
    <br>
    <div class="row">
      <div class="col-lg-12">
        <div class="dataTable_wrapper">
          <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover table-condensed">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Nombre</th>
                  <th>Correo</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>Eduardo Miranda</td>
                  <td>eduardomiranda@ciencias.unam.mx</td>
                  <td>
                    <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#123">Ver Detalle</button>
                  </td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>Pedro Banana</td>
                  <td>banana@mico.com</td>
                  <td>
                    <button class="btn btn-primary" type="button">Ver Detalle</button>
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
<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="123"tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title text-center" id="myModalLabel">Detalle de Solicitud</h4>
      </div>
      <div class="modal-body">
          <div class="row">
              <div class="col-md-6">
                  <embed src="public/historiales/123.pdf" width="450" height="500" alt="historial">
              </div>
              <div class="col-md-6">
                   <div class="form-group">
                    <label>Nombre(s)</label>
                    <p>Luis Eduardo</p>
                  </div>
                  <div class="form-group">
                    <label>Apellido(s) </label>
                    <p>Miranda Sánchez</p>
                  </div>
                  <div class="form-group">
                    <label>Nímero de cuenta </label>
                    <p><strong>309199814</strong></p>
                  </div>
                  <div class="form-group">
                    <label>Correo</label>
                    <p>eduardomiranda@ciencias.unam.mx</p>
                  </div>
                  <div class="form-group">
                    <label>Carrera </label>
                    <p>Ciencias de la Computación</p>
                  </div>
                  <br>
                  <br>
                  <br>
                  <div class="form-group">
                    <label>Asignar Credito </label>
                     <div class="row">
                        <div class="col-sm-4">
                          <input type="text" class="form-control" name="credito" value="">
                        </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Denegar</button>
        <button type="button" class="btn btn-success">Dar Crédito</button>
      </div>
    </div>
  </div>
</div>