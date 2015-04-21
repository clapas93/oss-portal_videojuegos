<%-- 
    Document   : LoansHI
    Created on : 5/04/2015, 10:49:37 PM
    Author     : lalo
--%>
<%@ page import ="java.util.List" %>
<%@ page import ="Loans.Loan" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
List loans = (List)request.getAttribute("loans");
%>


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
                <%for(int i = 0; i<loans.size();i++){%>
                  <%="<tr id='row"+i+"'>"%>
                  <td><%=i%></td>
                  <td><%=((Loan)loans.get(i)).getName()+" "+((Loan)loans.get(i)).getLastName1()+" "+((Loan)loans.get(i)).getLastName2() %></td>
                  <td><%=((Loan)loans.get(i)).getEmail() %></td>
                  <td>
                    <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#<%=i%>">Ver Detalle</button>
                  </td>
                  <%="</tr>"%>
                <%}%>
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

<%for(int i = 0; i<loans.size();i++){%>
<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="<%=i%>"tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title text-center" id="myModalLabel">Detalle de Solicitud</h4>
      </div>
      <div class="modal-body">
          <div class="row">
              <div class="col-md-6">
                  <embed src="public/historiales/<%=((Loan)loans.get(i)).getHistory()%>" width="450" height="500" alt="historial">
              </div>
              <div class="col-md-6">
                   <div class="form-group">
                    <label>Nombre(s)</label>
                    <p><%=((Loan)loans.get(i)).getName()%></p>
                  </div>
                  <div class="form-group">
                    <label>Apellido(s) </label>
                    <p><%=((Loan)loans.get(i)).getLastName1()+" "+((Loan)loans.get(i)).getLastName2()%></p>
                  </div>
                  <div class="form-group">
                    <label>Nímero de cuenta </label>
                    <p><strong><%=((Loan)loans.get(i)).getAccountNumber()%></strong></p>
                  </div>
                  <div class="form-group">
                    <label>Correo</label>
                    <p><%=((Loan)loans.get(i)).getEmail() %></p>
                  </div>
                  <div class="form-group">
                    <label>Carrera </label>
                    <p><%=((Loan)loans.get(i)).getCareer() %></p>
                  </div>
                  <br>
                  <br>
                  <br>
                  <div class="form-group">
                    <label>Asignar Credito </label>
                     <div class="row">
                        <div class="col-sm-4">
                          <input id="credito<%=i%>" type="text" class="form-control" name="credito" value="">
                        </div>
                      </div>
                  </div>
                  <div class="form-group">
                    <label id="mensaje<%=i%>"></label>
                  </div>
              </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" value="<%=i%>" class="btn btn-primary"data-dismiss="modal">Cerrar</button>
        <button type="button" email="<%=((Loan)loans.get(i)).getEmail() %>" value="<%=i%>" class="btn btn-danger denyloan">Denegar</button>
        <button type="button" email="<%=((Loan)loans.get(i)).getEmail() %>" value="<%=i%>" class="btn btn-success giveloan">Dar Crédito</button>
      </div>
    </div>
  </div>
</div>
<%}%>

<script type="text/javascript">


$(".denyloan").click(function(){//funcion clic se activa cuando dan click a un objeto de la clase .denyloan
  var email = $(this).attr("email");//obtengo el atributo email del boton (se puede poner cualquier tipo de atributo en las etiquetas html)
  var val = $(this).val(); // obtiene el valor del traibuto value, para este caso seria el ID
  var row = "#row"+val;//Obtengo la referencia a la fila que se ha imprimido #row0, #row1...
  var mod = '#'+val;//Obtengo la referencia a la ventana popup
  $.ajax({// llamada asincrona
    type: "POST",//metodo post
    url: 'denyloan',//ruta a la cual se invocara el metodo post, el controlador al recibir esta llamada debe poner el status del prestamo a denegado, cambia el prestamo que coincida con el email que se le mandara
    dataType: "json", //Tipo de dato que se enviara y que se espera recibir
    data:{email:email}, // Datos que se enviaran email del prestamo
    success: function(data){ // si la llamada no devuelve errores 
      console.log(data);// imprimir en consola
      $(row).remove(); // Si la llamada fue satisfactoria entonces se ha cambiado el status del prestamo en la base por lo que podemos eliminar la fila de los prestamos. el metodo remove elimina por completo la fila.
      $(mod).modal('hide'); //escondemos el popup
    },
    error: function(data){ //si la llamada devuelve errores
      console.log(data);//Imprimimos en consola.
      $(mod).modal('hide');//escondemos el popup
    }
  });
});

$(".giveloan").click(function(){
  var email = $(this).attr("email");
  var val = $(this).val();
  var inp = "#credito"+val;
  var value = $(inp).val();
  console.log(inp);
  var msj = "#mensaje"+val;
  var mod = '#'+val;
  var row = "row"+val;
  var tr = "#"+row;
  if(value==""){
    $(inp).css({'border-color':'red'});
    $(msj).css({'color':'red'});
    $(msj).append("No puedes dar 0 crédito");
  }else{
    console.log(value);
    $.ajax({
    type: "POST",
      url: 'grantloan',
      dataType: "json",
      data:{email:email,credit:value},
      success: function(data){
        console.log(data);
        $(tr).remove();
        $(mod).modal('hide');
      },
      error: function(data){
        console.log(data);
        $(msj).css({'color':'red'});
        $(msj).append("No puedes dar 0 crédito");
      }
    });
  }
});

</script>
