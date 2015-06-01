<%-- 
Document   : main
Created on : 13/03/2015, 01:48:01 AM
Author     : lalo
--%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<section class="grid3d horizontal" id="grid3d">
  <div class="grid-wrap hstg" id="games">
    <div class="grid isotope rainbowed isotope-demo">
    </div>
  </div><!-- /grid-wrap -->
  <div class="content">
    <span class="loading"></span>
    <span class="icon close-content"></span>
  </div>
</section>
<div class="videodiv" >
  <div class="videoframe">
  </div>
  <div>
    <img id="close"src="public/img/x.png">
  </div>
</div>
<div class="loadMore">
  <span  id="flecha" class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
</div>
<script type="text/javascript" src="public/js/videogames/videogames.js"></script>
 <style type="text/css">


.hstg{
  position: relative;
  display: block;
  margin-left: 4em;
  margin-right: auto;
  margin-bottom: 0;
}

</style>