<!DOCTYPE html>
<%
String view = (String)request.getAttribute("view");
String footer = (String)request.getAttribute("footer");
String header = (String)request.getAttribute("header");
String bool1 = (String)request.getAttribute("bool1");
String bool2 =(String)request.getAttribute("bool2");
String req =  request.getParameter("msg")!=null?request.getParameter("msg"):"";
%>

<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="icon" type="image/vnd.microsoft.icon" href="public/img/favicon.png"/>

  <title>Pulse Games</title>

  <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
  <link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="public/css/style.css">
  <link rel="stylesheet" type="text/css" href="public/css/inside.css">
  <link rel="stylesheet" type="text/css" href="public/css/loginstyles.css">
  <link rel="stylesheet" type="text/css" href="public/css/checkout-cornerflat.css" />
  <link rel="stylesheet" type="text/css" href="public/css/demo.css" />
 <!-- <link rel="stylesheet" type="text/css" href="fonts/font-awesome.min.css" />-->

  <link rel="stylesheet" type="text/css" href="public/css/videogames/normalize.css" />
  <link rel="stylesheet" type="text/css" href="public/css/videogames/component.css" />
  <script src="public/js/videogames/modernizr.custom.js"></script>
  <script src="public/js/videogames/isotope.pkgd.js"></script>
  <script src="public/js/videogames/classie.js"></script>
  <script src="public/js/videogames/helper.js"></script>
  <script src="public/js/videogames/grid3d.js"></script>
  <script type="text/javascript" src="public/js/classie.js"></script>

</head>
<body  style="display:none">
 <nav class="navbar navbar-default navbar-fixed-top">

  <% if(header == null ){ %>
  <div class="container-fluid">
    <div class="navbar-header">
     <a href="videogames"> <img src="public/img/brand.png" id="brandimage"></a>
     
     <div class="checkout">
            <a class="checkout__button p-login" href=""><!-- Fallback location -->
                <span class="checkout__text ">   Login   </span>
            </a>
            <a class="checkout__button p-reg" href="registro"><!-- Fallback location -->
                <span class="checkout__text ">   Registro   </span>
            </a>
            <div class="checkout__order hidden">
		<div class="checkout__order-inner">
                <div>
                <form id="loginForm" method="post" class="form-horizontal" action="loginController?accion=LOGIN">
                    <div class="form-group">
                        <label class="col-md-3 control-label">Usuario</label>
                            <div class="col-md-8">
                                <input type="email" class="form-control" name="usuario" placeholder="ejemplo@correo.com"/>
                            </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Contraseña</label>
                        <div class="col-md-8">
                            <input type="password" class="form-control" name="password" placeholder="Contraseña"/>
                        </div>
                    </div>
                    <div class="form-group asset">
                        <div class="col-md-7">
                            <span style="color:red"><%= req %></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="" style="margin-right: 12%">
                            <span class="checkout__option checkout__option--silent checkout__cancel">
                                <i class="fa fa-angle-left"></i> Cancelar
                            </span>
                            <button type="submit" class="checkout__option">ENTRAR</button>
                            <button class="checkout__close checkout__cancel">
                                <i class="icon fa fa-fw fa-close"></i>Close</button>
                        </div>
                    </div>
                </form>
                </div>
                </div>
            </div>
	</div>
   </div>
   <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
       
     
     
 </div>
</div>
<%} else { %>
<div>
  <jsp:include page='<%= header %>' /> 
</div>
<% } %>
</nav>
<div style="display:none"class="transparent"></div>

<div id="wrapper">
  <div id="container">
    <jsp:include page='<%= view %>' />
  <div class="clear"></div>
<jsp:include page='<%= footer %>' />
</div><!-- /container -->
</div>
<script>
			(function() {
				[].slice.call( document.querySelectorAll( '.checkout' ) ).forEach( function( el ) {
					var openCtrl = el.querySelector( '.checkout__button' ),
						closeCtrls = el.querySelectorAll( '.checkout__cancel' );

					openCtrl.addEventListener( 'click', function(ev) {
						ev.preventDefault();
						classie.add( el, 'checkout--active' );
					} );

					[].slice.call( closeCtrls ).forEach( function( ctrl ) {
						ctrl.addEventListener( 'click', function() {
							classie.remove( el, 'checkout--active' );
						} );
					} );
				} );
			})();
                        if($('body').width() >= 600){
                            $('.checkout__order').removeClass('hidden');
                        }else{
                            console.log("pato");
                            $('.checkout__button.p-login').click(function(){
                                if($('.checkout__order').hasClass('hidden'))
                                    $('.checkout__order').removeClass('hidden');
                                else
                                    $('.checkout__order').addClass('hidden');
                            });
                            $('.checkout__cancel').click(function(){
                                if($('.checkout__order').hasClass('hidden'))
                                    $('.checkout__order').removeClass('hidden');
                                else
                                    $('.checkout__order').addClass('hidden');
                            });
                        }
		
</script>
</body>  
</html>




