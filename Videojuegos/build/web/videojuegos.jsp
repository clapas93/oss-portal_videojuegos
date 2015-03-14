<%-- 
    Document   : main
    Created on : 13/03/2015, 01:48:01 AM
    Author     : lalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style type="text/css">
#pad{
  padding-left: 10em;
}
</style>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <div class="carousel-indicators">
      <div  data-target="#carousel-example-generic" data-slide-to="0" class="pad">
        <img src="public/img/morado.jpg" style="width:10em; margin: auto !important;">
      </div>
      <div data-target="#carousel-example-generic" data-slide-to="1"class="pad">
        <img src="public/img/morado.jpg" style="width:10em;margin: auto !important;">
      </div>
      <div data-target="#carousel-example-generic" data-slide-to="2"class="pad">
        <img src="public/img/morado.jpg" style="width:10em;margin: auto !important;">
      </div>
    </div>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active row">
        <div class="col-md-6">
          <img  src="public/img/morado.jpg" alt="...">
        </div>
        <div style="padding-left:3em;"class="col-md-6">
          <h1>Videojuego de Muestra 1</h1>
        </div>
        </div>
     <div class="item  row">
        <div class="col-md-6">
          <img  src="public/img/morado.jpg" alt="...">
        </div>
        <div style="padding-left:3em;"class="col-md-6">
          <h1>Videojuego de Muestra 2</h1>
        </div>
        </div>
        <div class="item  row">
        <div class="col-md-6">
          <img  src="public/img/morado.jpg" alt="...">
        </div>
        <div style="padding-left:3em;"class="col-md-6">
          <h1>Videojuego de Muestra 3</h1>
        </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
