<%-- 
Document   : profileUpdate
Created on : 20-mar-2015, 15:34:40
Author     : lalo
--%>

<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="User.UserStudent"%>
<%@page import="TransactionsController.Transactions"%>
<%
UserStudent student = (UserStudent)request.getAttribute("student");
%>
<link rel="stylesheet" type="text/css" href="public/css/download_history/default.css" />
<link rel="stylesheet" type="text/css" href="public/css/download_history/component.css" />

<div id="games"></div>
<div id="account">
  <div class="row">
    <div class="col-md-3 col-md-offset-2">
      <h1>Mi Cuenta</h1>
    </div>
  </div>

  <div class="row">
    <br>
    <div class="col-md-2 col-md-offset-2">
      <img src="public/img/person-icon.png" width="100">
    </div>
    <div class="col-md-6">
      <div class="row">
        <div class="col-md-6">
          <h3>Nombre: <small><%=student.getName()%></small></h3>
        </div>
        <div class="col-md-6">
          <h3>Apellidos: <small><%=student.getLastname1()%> <%=student.getLastname2()%></small></h3>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <h3>Num. Cuenta: <small><%=student.getAccountnumber()%></small></h3>
        </div>
        <div class="col-md-6">
          <h3>Carrera: <small><%=student.getCareer()%></small></h3>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <h3>Correo: <small><%=student.getStudentemail()%></small></h3>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <h3>Créditos: <small><%=student.getCredits()%></small></h3>
        </div>
      </div>
    </div>
  </div>

  <div class="md-modal md-effect-8" id="historial">
    <div class="md-content">
      <h3>Historial académico</h3>
      <div>
        <%
        String history = student.getHistory();
        String emb ="";
        if(!history.equals("")){
        emb += "<p><embed src='public/historiales/" + history + "' width='100%' height='250' alt='historial'></p>";
      }else{
      emb = "<form enctype='multipart/form-data' method='POST' action='historysave'> "
      + "<br>"
      + "<center><input type='file' accept='.pdf' id='InputFile' name='historypdf'></center>"
      + "<br>"
      + "<button type='submit' class='btn btn-success'>Subir</button>"
      + "<br><br>"
      + "</form>";
    }
    out.println(emb);
    %>
    <button class="md-close">Cerrar</button>
  </div>
</div>
</div>
<!--<p><embed src="public/historiales/<%=student.getHistory()%>" width="100%" height="250" alt="historial"></p>-->

<div class="md-modal md-effect-8" id="descargas">
  <div class="md-content">
    <h3>Historial de descargas</h3>
    <div>
      <div class="dataTable_wrapper">
        <div class="table-responsive">
          <table class="table table-condensed">
            <thead>
              <tr>
                <th>Fecha</th>
                <th>Titulo</th>
                <th>Genero</th>
                <th>Ejecutable</th>
              </tr>
            </thead>
            <tbody>
              <% 
              String email = student.getStudentemail();
              Transactions t = new Transactions();
              LinkedList<String> downloadHistory = t.getHistory(email);
              for(int i = 0; i<downloadHistory.size();i+=5){
              if(downloadHistory.get(i).equals("1")){
              String title = "";
              %>
              <%="<tr id='row"+i+"'>"%>
              <% for(int j = i+1; j<i+5;j++){
              if(j==i+2){
              title = downloadHistory.get(j);%>
              <td><%=title%></td>
              <% }else{
              if(j==i+4){
              String path = "public/videogames/games/";%>  
              <td><a href="<%=path + downloadHistory.get(j)%>" download ="<%=title%>">
                <span class="glyphicon glyphicon-download" aria-hidden="true"></span>
              </a></td>
              <%}else{%>
              <td><%=downloadHistory.get(j)%></td>
              <%} }
}//end for j
}%>
<%="</tr>"%>
<%}%>
</tbody>
</table>
</div>
</div>
<button class="md-close">Cerrar</button>
</div>
</div>
</div>

<div class="row">
  <div class="main clearfix">
    <div class="col-md-4 col-md-offset-2">
      <button class="md-trigger" data-modal="historial">Historial</button>
    </div>
    <div class="col-md-4">
      <button class="md-trigger" data-modal="descargas">Descargas</button>
    </div>
  </div>
</div>


</div> <!--account-->

<script src="public/js/download_history/classie.js"></script>
<script src="public/js/download_history/modalEffects.js"></script>