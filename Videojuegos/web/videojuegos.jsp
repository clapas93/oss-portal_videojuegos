<%-- 
Document   : main
Created on : 13/03/2015, 01:48:01 AM
Author     : lalo
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="grid3d horizontal" id="grid3d">
  <div class="grid-wrap" id="games">
    <div class="grid isotope rainbowed isotope-demo">
    </div>
  </div><!-- /grid-wrap -->
  <div class="content">    
  </div>
</section>

<!-- <img id="spinner" src="public/img/hex-loader2.gif">
  <div id="load" style="display:none"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span></div> -->
<script type="text/javascript">
  var info = new Array();
  var credit = 0;
  var session = false;
  var j = 0;
  $( document ).ready(function() {
    console.log( "ready!" );
    $.ajax({
    url: "getvideogames" ,
    dataType: "json",
    contentType: 'application/json',
    success: function(data){
      $.each(data, function(index, elem) { 
        info.push(elem)
      });
      setTimeout(function(){
        loadGames();
      },1000);

    },
    error: function(data){
      console.error(data);
    }
  });

  $.ajax({
    url: "getusercredits" ,
    dataType: "json",
    contentType: 'application/json',
    success: function(data){
      credit = data.credits;
      session = data.session;
    },
    error: function(data){
      console.error(data);
    }
  });
});
  



  var option = {itemSelector: '.element-item', layoutMode: 'masonry' };
  $container = $('#games .isotope-demo').isotope(option);

  function insertdiv(){
    
    for(var i = 0; i < info.length && i < j + 6; i++){
      var cont = "";
      cont='<div>'+
        '<div class="container">'+
          '<div class="row">'+
            '<div class="col-md-4 col-md-offset-4"><h1>'+info[i].title+'</h1></div>'+
          '</div>'+
          '<div class="row">'+
            '<div class="col-md-6">'+
              '<img class="video" video="'+info[i].video+'" src="public/img/video.jpg">'+
            '</div>'+
            '<div class="col-md-6">'+
              '<p>'+info[i].description+'<p>'+
            '</div>'+
          '</div>'  +
          '<br>';
          if(session){
            cont+='<div class="row">'+
              '<div class="col-md-6">'+
                '<div class="row">'+
                  '<div class="col-md-6">'+
                    '<h3>Mis créditos: <span>'+credit+'</span></h3>'+
                  '</div>';
            if(credit<info[i].price&&(info[i].price>0)){
              cont+='<div class="col-md-6">'+
                '<p class="msj">Créditos insuficientes</p>'+
              '</div>';
            }else{}
              cont+='</div>'+
              '</div>' +
            '</div>';
          }else{

          }

          cont+='<div class="row">'+
            '<div class="col-md-6">'+
              '<div class="row">'+
                '<div class="col-md-1"></div>'+
                  '<div class="col-md-3">'+
                    '<h2>Precio:</h2>'+
                  '</div>'+
                 '<div class="col-md-3">'+
                  '<h3 class="precio">'+info[i].price+'</h3>'+
                '</div>';
                if(info[i].price>0){
                  if(credit<info[i].price){
                  }else{
                    cont+='<div class="col-md-3">'+
                    '<button class="btn btn-success accion" >Comprar</button>'+
                  '</div>';
                  }
                }else{
                  cont+='<div class="col-md-3">'+
                    '<button class="btn btn-primary accion" >Descargar</button>'+
                  '</div>';
                }

                cont+='<div class="col-md-1"></div>'+
              '</div>'+
            '</div>'+
            '<div class="col-md-6"></div>'+
         '</div>'+
        '</div>'+
      '</div>';  
      $(".content").append(cont); 
    }
    j+=3;
    $(".content").append(
      '<span class="loading"></span>'+
      '<span class="icon close-content"></span>');
    clickfun();
  }

  function loadGames() {
    setTimeout(function(){
        insertdiv();
    },500);
    $("#spinner").fadeOut();
    $(".loadsec").empty();
    var $inser = "";
    
    for(var i = $('#games .isotope-demo >').length; i < info.length && i < $('#games .isotope-demo >').length + 6; i++){
      $inser += '<div class="element-item" ><figure><img src="public/videogames/fronts/'+info[i].front+'" /></figure></div>'; 
    }
    if(i >= info.length){
        $(".loadMore").fadeOut();
    }
    $inser = $($inser);
    $container.append( $inser ).isotope( 'addItems', $inser );
    $container.isotope(option);
    setTimeout(function(){
      
      $("html, body").animate({ scrollTop: $("body").height()+800 }, 1200);
      new grid3D( document.getElementById( 'grid3d' ) );
    },500);

    if(info.length<=i){
      $("#load").fadeOut();
      $("#morediv").fadeIn();
    }else{
      $("#load").fadeIn();
    }
  }
  </script>


  <div class="videodiv" >
    <div class="videoframe">
    </div>
    <div>
      <img id="close"src="public/img/x.png">
    </div>
  </div>
  

  <script type="text/javascript">
  function clickfun(){  
    $(".video").click(function(){
      var vid = $(this).attr("video");
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
    
    $(".loadMore").click(function(){
      loadGames();
    });
    
    
    
  }
  
  </script>
  
  <div class="loadMore">
    <span  id="flecha" class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
  </div>
  
  
  <style type="text/css">
      #flecha{
        font-size: 4em;
        left: 23%;
        top: 27%;
      }
      .loadMore{
          position: fixed;
          background-color: #083B56;
          width: 7em;
          height: 7em;
          border-radius: 50%;
          right: 6%;
        bottom: 5%;
        cursor:pointer;
      }
      
  .accion{
    position: relative;
    margin-top: 20%;
  }

  .precio{
    position: relative;
    margin-top: 24%;
  }
  h3>span{
    font-weight: bold;
  }
  .msj{
    padding-top: 17px;
    color: red;
  }
  .element-item{
    border-radius: 5px;
    padding: 10px;
    background-color:rgba(11, 11, 11, 0.62);
    width: 27%;
    height: auto;
    margin: 1em;
    
  }

  </style>