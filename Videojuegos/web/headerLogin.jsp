<%-- 
    Document   : headerLogin
    Created on : 12/04/2015, 06:35:28 PM
    Author     : magdiel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <div class="navbar-header">
          <a href="videogames"> <img src="public/img/brand.png" id="brandimage"></a>
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
    </div>


    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav nav nav-pills pull-right">
            
          <li role="presentation" class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="Logout" role="button" aria-expanded="false">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span> <%=session.getAttribute("userStudent")%>
                <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li role="presentation"><a role="menuitem" href="updatestudent">
                      <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>Editar mi perfil </a>
              </li>
              <li role="presentation"><a role="menuitem" href="myaccount">
                      <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>Mis Cuenta</a></li>
              <li class="divider"></li>
              <li role="presentation"><a role="menuitem" href="logoutController">
                      <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Salir</a>
              </li>
            </ul>
          </li>
        </ul>
    </div>
  
