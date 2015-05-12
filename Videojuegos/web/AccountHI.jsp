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
<div id="games"></div>
<div id="account">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <h1>Mi Cuenta</h1>
        </div>
    </div>
   
   <div class="row">
       <div class="col-md-6 col-md-offset-2">
           <div class="row">
                <div class="col-md-6">
                    <h3>Nombre: <small><%=student.getName()%></small></h3>
                </div>
                <div class="col-md-6">
                    <h3>Apellidos: <small><%=student.getLastname1()%> <%=student.getLastname2()%></small></h3>
                </div>
        </div>
       </div>
   </div>
</div>


