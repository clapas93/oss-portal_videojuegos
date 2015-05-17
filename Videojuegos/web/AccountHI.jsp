<%-- 
Document   : profileUpdate
Created on : 20-mar-2015, 15:34:40
Author     : lalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="User.UserStudent"%>
<%
UserStudent student = (UserStudent)request.getAttribute("student");
%>
<link href="https://www.google.com/fonts#QuickUsePlace:quickUse/Family:Arvo:400,700" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="public/css/download_history/default.css" />
<link rel="stylesheet" type="text/css" href="public/css/download_history/component.css" />
<!-- <script src="public/js/download_history/modernizr.custom.js"></script> -->

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
          <h3>Créditos: <small><%=student.getCredits()%></small></h3>
        </div>
      </div>
    </div>
  </div>

<div class="md-modal md-effect-8" id="historial">
      <div class="md-content">
        <h3>Historial académico</h3>
        <div>
          <p>This is a modal window. You can do the following things with it:</p>
          <ul>
            <li><strong>Read:</strong> modal windows will probably tell you something important so don't forget to read what they say.</li>
            <li><strong>Look:</strong> a modal window enjoys a certain kind of attention; just look at it and appreciate its presence.</li>
            <li><strong>Close:</strong> click on the button below to close the modal.</li>
          </ul>
          <button class="md-close">Cerrar</button>
        </div>
      </div>
</div>

<div class="md-modal md-effect-8" id="descargas">
      <div class="md-content">
        <h3>Historial de descargas</h3>
        <div>
          <p>This is a modal window. You can do the following things with it:</p>
          <ul>
            <li><strong>Read:</strong> modal windows will probably tell you something important so don't forget to read what they say.</li>
            <li><strong>Look:</strong> a modal window enjoys a certain kind of attention; just look at it and appreciate its presence.</li>
            <li><strong>Close:</strong> click on the button below to close the modal.</li>
            <li><strong>Read:</strong> modal windows will probably tell you something important so don't forget to read what they say.</li>
            <li><strong>Look:</strong> a modal window enjoys a certain kind of attention; just look at it and appreciate its presence.</li>
            <li><strong>Close:</strong> click on the button below to close the modal.</li>
            <li><strong>Read:</strong> modal windows will probably tell you something important so don't forget to read what they say.</li>
            <li><strong>Look:</strong> a modal window enjoys a certain kind of attention; just look at it and appreciate its presence.</li>
            <li><strong>Close:</strong> click on the button below to close the modal.</li>
            <li><strong>Read:</strong> modal windows will probably tell you something important so don't forget to read what they say.</li>
            <li><strong>Look:</strong> a modal window enjoys a certain kind of attention; just look at it and appreciate its presence.</li>
            <li><strong>Close:</strong> click on the button below to close the modal.</li>
          </ul>
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