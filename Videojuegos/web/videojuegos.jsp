<%-- 
Document   : main
Created on : 13/03/2015, 01:48:01 AM
Author     : lalo
--%>

<%@page import="ManageGames.Videogame"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
List<Videogame> game = (List)request.getAttribute("games");
%> 
<!--videogame.jsp-->
  <script type="text/javascript" src="public/js/jssor.js"></script>
  <script type="text/javascript" src="public/js/jssor.slider.js"></script>
  <script type="text/javascript" src="public/js/slider.js"></script>
  <link rel="stylesheet" type="text/css" href="public/css/slider.css">
<div id="slider1_container" class="slider1_container">
<div u="slides" class="slidesdiv">
    <%for(int i = 0; i<game.size();i++){%>
    <div>
    <img u="thumb" src="public/img/1920/thumb.jpg" />
    <div u="caption" class="captiondiv">
    <img class="video" video="<%=((Videogame)game.get(i)).getVideoUrl()%>" src="public/img/video.jpg">
    </div>
    <div class="title" > <%=((Videogame)game.get(i)).getTitle() %>
    </div>
    <div class="slidercontent">
     <div class="row">
        <div class="col-md-12">
            <%=((Videogame)game.get(i)).getDescription() %>
        </div>
      </div>
      <br>
      <br>
      <div class="row">
        <div class="col-md-6">
          Genero: <%=((Videogame)game.get(i)).getGenre() %>
        </div>
      </div>
      <br>
      <br>
      <div class="row">
        <div class="col-md-6">
          Clasificación <%=((Videogame)game.get(i)).getClassification() %>
        </div>
      </div>
      <br>
      <br>
      <br>
      <div class="row">
        <div class="col-md-6">
          Precio: <%=((Videogame)game.get(i)).getPrice() %> creditos
        </div>
        <div class="col-md-6">
        <button class="btn btn-success">Comprar</button>
        </div>
      </div>
    </div>
    </div>
    <%}%>
  <div>
    <img u="thumb" src="public/img/1920/thumb.jpg" />
    <div u="caption" class="captiondiv">
     <!-- <iframe width="420" height="315" src="https://www.youtube.com/embed/DGBwXH5P218" frameborder="0"  allowfullscreen></iframe> -->
    <img class="video" video="https://www.youtube.com/embed/DGBwXH5P218" src="public/img/video.jpg">
    </div>
    <div class="title" >Game 1
    </div>
    <div class="slidercontent">
     <div class="row">
        <div class="col-md-12">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nunc eros, lacinia quis tempor a, sodales non urna. Ut gravida, nisi ut vestibulum vulputate, nisi augue luctus leo, vitae facilisis neque magna quis odio. Fusce eleifend condimentum nibh ut maximus. Sed vel pharetra quam, ac interdum erat. In ex lacus, dapibus in sapien a, mollis ultrices urna. Sed eget eros luctus, lobortis massa eget, porta diam. Morbi id feugiat ligula, sed iaculis neque. Maecenas feugiat posuere tellus ut consequat. Morbi nec velit at magna interdum commodo. Integer rhoncus eget magna ut molestie. Aliquam accumsan sagittis enim a elementum. Aliquam vitae scelerisque lorem. Duis sed justo risus. Nullam sagittis rutrum odio, at viverra ante tempor eget. Fusce accumsan mollis magna, quis sollicitudin ante gravida et. Pellentesque a finibus elit.
        </div>
      </div>
      <br>
      <br>
      <div class="row">
        <div class="col-md-6">
          Precio: 10 creditos
        </div>
        <div class="col-md-6">
        <button class="btn btn-success">Comprar</button>
        </div>
      </div>
    </div>
  </div>

  <div>
    <img u="thumb" src="public/img/1920/thumb2.png" />
    <div u="caption" class="captiondiv">
     <!-- <iframe width="420" height="315" src="https://www.youtube.com/embed/D5QXhxGUvuA" frameborder="0" allowfullscreen></iframe> -->
     <img class="video" video="https://www.youtube.com/embed/DGBwXH5P218" src="public/img/video.jpg">
    </div>
    <div class="title">
      Game 2
    </div>
    <div class="slidercontent">
      <div class="row">
        <div class="col-md-12">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nunc eros, lacinia quis tempor a, sodales non urna. Ut gravida, nisi ut vestibulum vulputate, nisi augue luctus leo, vitae facilisis neque magna quis odio. Fusce eleifend condimentum nibh ut maximus. Sed vel pharetra quam, ac interdum erat. In ex lacus, dapibus in sapien a, mollis ultrices urna. Sed eget eros luctus, lobortis massa eget, porta diam. Morbi id feugiat ligula, sed iaculis neque. Maecenas feugiat posuere tellus ut consequat. Morbi nec velit at magna interdum commodo. Integer rhoncus eget magna ut molestie. Aliquam accumsan sagittis enim a elementum. Aliquam vitae scelerisque lorem. Duis sed justo risus. Nullam sagittis rutrum odio, at viverra ante tempor eget. Fusce accumsan mollis magna, quis sollicitudin ante gravida et. Pellentesque a finibus elit.
        </div>
      </div>
      <br>
      <br>
      <div class="row">
        <div class="col-md-6">
          Precio: 10 creditos
        </div>
        <div class="col-md-6">
        <button class="btn btn-success">Comprar</button>
        </div>
      </div>
    </div>
  </div>

  <div>
    <img u="thumb" src="public/img/1920/thumb3.png" />
     <div u="caption" class="captiondiv">
     <!-- <iframe width="420" height="315" src="https://www.youtube.com/embed/PT6ivWqZv-c" frameborder="0" allowfullscreen></iframe> -->
     <img class="video" video="https://www.youtube.com/embed/DGBwXH5P218" src="public/img/video.jpg">
    </div>
    <div class="title">
      Game 3
    </div>
    <div  class="slidercontent">
     <div class="row">
        <div class="col-md-12">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nunc eros, lacinia quis tempor a, sodales non urna. Ut gravida, nisi ut vestibulum vulputate, nisi augue luctus leo, vitae facilisis neque magna quis odio. Fusce eleifend condimentum nibh ut maximus. Sed vel pharetra quam, ac interdum erat. In ex lacus, dapibus in sapien a, mollis ultrices urna. Sed eget eros luctus, lobortis massa eget, porta diam. Morbi id feugiat ligula, sed iaculis neque. Maecenas feugiat posuere tellus ut consequat. Morbi nec velit at magna interdum commodo. Integer rhoncus eget magna ut molestie. Aliquam accumsan sagittis enim a elementum. Aliquam vitae scelerisque lorem. Duis sed justo risus. Nullam sagittis rutrum odio, at viverra ante tempor eget. Fusce accumsan mollis magna, quis sollicitudin ante gravida et. Pellentesque a finibus elit.
        </div>
      </div>
      <br>
      <br>
      <div class="row">
        <div class="col-md-6">
          Precio: 10 creditos
        </div>
        <div class="col-md-6">
        <button class="btn btn-success">Comprar</button>
        </div>
      </div>
    </div>
  </div>
</div>

<div u="thumbnavigator" class="jssort01" style="position: absolute; width: 800px; height: 100px; left:20%; bottom: 0px;">
<!-- Thumbnail Item Skin Begin -->
<style>

</style>
<div class="slidethumb" u="slides" style="cursor: move;">
  <div u="prototype" class="p" style="position: absolute; width: 72px; height: 72px; top: 0; left: 0;">
    <div class=w><div u="thumbnailtemplate" style=" width: 100%; height: 100%; border: none;position:absolute; top: 0; left: 0;"></div></div>
    <div class=c>
    </div>
  </div>
</div>
<!-- Thumbnail Item Skin End -->
</div>
<!-- Arrow Left -->
<span u="arrowleft" class="jssora21l" style="width: 55px; height: 55px; top: 123px; left: 8px;">
</span>
<!-- Arrow Right -->
<span u="arrowright" class="jssora21r" style="width: 55px; height: 55px; top: 123px; right: 8px">
</span>
<!-- Arrow Navigator Skin End -->
</div>
<div class="videodiv" >
  <div class="videoframe">

  </div>
<div>
  <img id="close"src="public/img/x.png">
</div>
</div>

<style type="text/css">
.videoframe{
  width: 90%;
  height: 90%;
  position: absolute;
  top:0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
}

#close {
  color:white;
  line-height: 12px;
  width: 3em;
  font-family: tahoma;
  margin-top: 1px;
  margin-right: 2px;
  position:absolute;
  top:0;
  right:0;
}
.videodiv {
  display: none;
  z-index: 11;
  position:fixed;
  top: 0 ;
  padding:0;
  margin:0;
  width: 100%;
  height: 100%;
  background-color:rgba(25,25,25,1); 
}

</style>
 <script type="text/javascript">
  $(".video").click(function(){
    var vid = $(this).attr("video");
    console.log(vid);
    $(".captiondiv").fadeOut(400);
    $(".slidercontent").fadeOut(800);
    $(".slidethumb").fadeOut(1200);
    $(".jssort01").fadeOut(1600);
    $(".title").fadeOut(2000);
    var vapp ='<iframe width="100%" height="100%" src="'+vid+'?autoplay=0&showinfo=0&controls=0" frameborder="0" allowfullscreen>';
    $(".videoframe").append(vapp);
    $(".videodiv").fadeIn(2400);
    
  });

  $("#close").click(function(){
    $(".videoframe").empty();
    $(".videodiv").fadeOut(400);
    $(".captiondiv").fadeIn(800);
    $(".slidercontent").fadeIn(1200);
    $(".slidethumb").fadeIn(1600);
    $(".jssort01").fadeIn(2000);
    $(".title").fadeIn(2400);
  });
  
</script>