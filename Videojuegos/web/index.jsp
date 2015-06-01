<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String req =  request.getParameter("msg")!=null?request.getParameter("msg"):"";
%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="icon" type="image/vnd.microsoft.icon" href="public/img/favicon.png"/>
  <title>Pulse Games</title>
  <link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="public/css/portadastyle.css">
  <link rel="stylesheet" type="text/css" href="public/css/loginstyles.css">
  <link rel="stylesheet" type="text/css" href="public/css/checkout-cornerflat.css" />
  <link rel="stylesheet" type="text/css" href="public/css/demo.css" />
   <link rel="stylesheet" type="text/css" href="public/fonts/font-awesome.min.css" />
  <script type="text/javascript" src="public/js/jquery-2.1.3.js"></script>
  
  <script type="text/javascript" src="public/js/main.js"></script>
  <script type="text/javascript" src="public/js/bootstrapValidator.min.js"></script>
  <script type="text/javascript" src="public/js/jquery.validate.js"></script>
  <script type="text/javascript" src="public/js/validCampo.js"></script>
  <script type="text/javascript" src="public/js/validando.js"></script>
  <script type="text/javascript" src="public/js/loginstyles.js"></script>
  <script type="text/javascript" src="public/js/classie.js"></script>

</head>
<body>
  <nav class="navbar navbar-default">
   <div class="container-fluid">
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
                        <div style="margin-right: 12%" class="">
                            <span class="checkout__option checkout__option--silent checkout__cancel">
                                <i class="fa fa-angle-left"></i> Cancelar
                            </span>
                            <button type="submit" class="checkout__option">ENTRAR</button>
                            <i class="checkout__close checkout__cancel icon fa fa-fw fa-close"></i>
                            
                        </div>
                    </div>
                </form>
                </div>
                </div>
            </div>
                        <div class="mi-back hidden"></div>
	</div>
     <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        
     </div>
   </div>
 </nav>
<section id="front">
  <div id="logo" class="row">
    <svg viewBox="20 20 600 300">

      <!-- Symbol with text -->
      <symbol id="s-text">
        <text text-anchor="middle"
        x="50%"
        y="50%"
        dy=".20em"
        class="text"
        >
        Pulse Games
      </text>    
    </symbol>

    <!--Mask-->
    <mask id="m-text"
    maskunits="userSpaceOnUse"
    maskcontentunits="userSpaceOnUse">
    <use xlink:href="#s-text"
    class="text-mask">
  </use>
</mask>

<!-- Group with mask -->
<g mask="url(#m-text)">
  <!-- Masked content -->
  <!-- http://tympanus.net/codrops-playground/assets/images/posts/23145/image2.jpg -->
  <image xlink:href="public/img/morado.jpg"
  width="900"
  height="532"
  x="-30%"
  y="-20%">
</image>
</g>
</svg>

</div>
<div class="row">
  <div class="col-md-4 col-md-offset-4">
    <a href="videogames" ><img id="pressstart" src="public/img/press_start_color.png"></a>
  </div>
</div>
</section>
<canvas id="mainCanvas"></canvas>
<div id="output"></div>    
<div style="display:none"class="transparent"></div>
<script>
(function(){function w(){h.globalCompositeOperation="source-over";h.fillStyle="rgba(8,8,12,"+v+")";h.fillRect(0,0,f,k);h.globalCompositeOperation="lighter";.75>v&&(v+=.05);D=s-x;E=t-y;x=s;y=t;for(var a=f/1.15,l=f/8,p=f/2,r=Math.random,F=Math.abs,w=Math.sqrt,A=Math.cos,B=Math.sin,C=Math.atan2,G=1350;G--;){var e=H[G],g=e.x,c=e.y,d=e.vX,b=e.vY,q=g-s,m=c-t,n=w(q*q+m*m),m=C(m,q),q=A(m),m=B(m);if(z&&n<p)var u=14*(1-n/p),d=d+(q*u+.5-r()),b=b+(m*u+.5-r());n<a&&(u=(1-n/a)*f*.0014,d-=q*u,b-=m*u);n<l&&(n=(1-
  n/l)*f*2.2E-4,d+=D*n,b+=E*n);d*=.96;b*=.96;F(d);F(b);g+=d;c+=b;g>f?g-=f:0>g&&(g=f+g);c>k?c-=k:0>c&&(c=k+c);e.vX=d;e.vY=b;e.x=g;e.y=c;d=e;b=g/f*Math.PI*2;c=c/k*Math.PI;b={theta:b,phi:c,x:-100*Math.sin(c)*Math.sin(b),y:-100*Math.cos(c),z:-100*Math.sin(c)*Math.cos(b)};d.pos3D=b;e.pos3D.z-=200;-299>e.pos3D.z||(d=300/(300+e.pos3D.z),b=e.pos3D.x*d+f/2,c=e.pos3D.y*d+k/2,h.fillStyle=e.color,h.beginPath(),h.arc(b,c,d,0,I,!0),h.closePath(),h.fill())}}function r(a){f=document.documentElement.clientWidth;k=document.documentElement.clientHeight;
  p.width=f;p.height=k}function A(a){a=a?a:window.event;s=x=a.pageX;t=y=a.pageY;document.onmousemove=B}function B(a){a=a?a:window.event;s=a.pageX;t=a.pageY}function C(a){z=!0;return!1}function J(a){return z=!1}function K(){this.color="rgb("+Math.floor(255*Math.random())+","+Math.floor(255*Math.random())+","+Math.floor(255*Math.random())+")";this.size=this.vY=this.vX=this.x=this.y=0;this.pos3D={x:0,y:0,z:100}}var p,h,f=1E3,k=560,H=[],I=2*Math.PI,v=0,s,t,D=0,E=0,x=0,y=0,z=!1;window.onload=function(){p=
    document.getElementById("mainCanvas");if(p.getContext){document.getElementById("outer");document.getElementById("canvasContainer");h=p.getContext("2d");window.moveTo(0,0);window.resizeTo(screen.width,screen.height);r(null);for(var a=1350;a--;){var l=new K;l.x=.5*f;l.y=.5*k;l.vX=Math.cos(a)*Math.random()*40;l.vY=Math.sin(a)*Math.random()*20;l.size=2;H[a]=l}document.onmousemove=A;window.onresize=r;r(null);setInterval(w,33)}}})();
    </script>
    
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
function menorWidth(){
    $('.checkout__button.p-login').click(function(){
        $('.checkout__order').fadeIn();
        if($('.checkout__order').hasClass('hidden'))
            $('.checkout__order').removeClass('hidden');
        else
            $('.checkout__order').addClass('hidden');
        
        if($('.mi-back').hasClass('hidden'))
            $('.mi-back').removeClass('hidden');
        else
            $('.mi-back').addClass('hidden');
        
        
    });
    $('.checkout__cancel').click(function(){
        $('.mi-back').addClass('hidden');
        
        $('.checkout__order').addClass('hidden');
    });
}

function mayorWidth(){
    $('.checkout__order').removeClass('hidden');
    $('.checkout__button.p-login').click(function(){
        
        if($('.mi-back').hasClass('hidden')){
             $('.mi-back').removeClass('hidden');
        }else{
             $('.mi-back').addClass('hidden');
             $( ".checkout__cancel" ).trigger( "click" );
        }
    });
    $('.checkout__cancel').click(function(){
        if($('.mi-back').hasClass('hidden')){
            $('.mi-back').removeClass('hidden');
        }else{
            $('.mi-back').addClass('hidden');
        }
    });
    $('.mi-back').click(function(){
        $( ".checkout__cancel" ).trigger( "click" );
        if($('.mi-back').hasClass('hidden')){
            $('.mi-back').removeClass('hidden');
        }else{
            $('.mi-back').addClass('hidden');
        }
    });
}
var width = $(window).width();
if(width >= 600){
    mayorWidth();
}else{
    menorWidth();                 
}

$(window).resize(function(){
      if(width >= 600){
            mayorWidth();
      }else{
           menorWidth();                 
      }
});
                        
    </script>

  </body>
</html>
