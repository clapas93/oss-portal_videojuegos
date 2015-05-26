
var host = "http://"+location.hostname+"/";
window.fbAsyncInit = function() {
	FB.init({
		appId      : '298260070297864',
		xfbml      : true,
		version    : 'v2.3'
	});

// ADD ADDITIONAL FACEBOOK CODE HERE
};

(function(d, s, id){
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {return;}
	js = d.createElement(s); js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

function share(){
	$(".sharefacebook").click(function(){
		share_title=$(this).attr("gtitle");
		share_pic=$(this).attr("pic");
		FB.ui({
			method:'feed',  
			name: share_title,
			description: "Consigue los mejores juegos.",
			link: host,
			picture: location.hostname+"/public/videogames/fronts/"+share_pic+".jpg",
		}, function(response){});
	});
	$(".sharetwitter").click(function(){
		share_title=$(this).attr("gtitle");
		share_tw(share_title);
	});
}

function share_tw(share_title) {
	var width  = 400,
	height = 400,
	left   = ($(window).width()  - width)  / 2,
	top    = ($(window).height() - height) / 2,
	url    =  "https://twitter.com/intent/tweet?&text="  
	+ "Los mejores juegos como: "+share_title+ " solo en &hashtags=pulsegames" +'  '+"&url="+host;
	opts   = 'status=1' +
	',width='  + width  +
	',height=' + height +
	',top='    + top    +
	',left='   + left;
	win = window.open(url, 'twitter', opts);
	return false;
}

var info = new Array();
var credit = 0;
var session = false;
var j = 0;

$( document ).ready(function() {
  $('body').fadeIn(3000);
	console.log( "ready!" );
	share();
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
			},2000);
			setTimeout(function(){
				insertdiv();
			},500);

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

	for(var i = info.length-1; i >= 0; i--){
		console.log(info[i]);
		console.log(i);
		var cont = "";
		cont='<div>'+
		'<div class="container">'+
		'<div class="row">'+
		'<div class="col-md-12"><h1 class="text-center">'+info[i].id+'  '+info[i].title+'</h1></div>'+
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
			'<h3>Mis cr&eacute;ditos: <span id="'+i+'">'+credit+'</span></h3>'+
			'</div>';
			if(credit<info[i].price&&(info[i].price>0)){
				cont+='<div class="col-md-6">'+
				'<p class="msj">Cr&eacute;ditos insuficientes</p>'+
				'</div>';
			}else{
				cont+='<div class="col-md-6">'+
				'<p class="msj"></p>'+
				'</div>';
			}
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
		'<h3 class="precio">'+info[i].price+' cr&eacute;ditos</h3>'+
		'</div>';
		if(info[i].price>0){
			if(credit<info[i].price){
			}else{
				cont+='<div class="col-md-3">'+
				'<button credit="'+i+'" idGame='+info[i].id+' price="'+info[i].price+'" class="btn btn-success accion" >Comprar</button>'+
				'</div>';
			}
		}else{
			cont+='<div class="col-md-3">'+
			'<button idGame='+info[i].id+' class="btn btn-primary freedownload" >Descargar</button>'+
			'</div>';
		}

		cont+='<div class="col-md-1"></div>'+
		'</div>'+
		'</div>'+
		'<div class="col-md-6">'+
		'<div class="row">'+
		'<h3 class="espacio">Comparte</h3>'+
		'<div class="col-md-6">'+
		'<div gtitle="'+info[i].title+'" pic="'+info[i].front+'" class="sharefacebook">'+
		'<i class="fa fa-facebook fbicon"></i>'+
		'</div>'+
		'</div>'+
		'<div class="col-md-6">'+
		'<div gtitle="'+info[i].title+'" class="sharetwitter">'+
		'<i class="fa fa-twitter twiticon"></i>'+
		'</div>'+
		'</div>'+
		'</div>'+
		'</div>'+
		'</div>'+
		'</div>'+
		'</div>';  
		$(".content").prepend(cont); 
	}
	j+=3;
	/*$(".content").append(
		'<span class="loading"></span>'+
		'<span class="icon close-content"></span>');*/
	clickfun();
	share();
}

function loadGames() {
	$("#spinner").fadeOut();
	$(".loadsec").empty();
	var $inser = "";

	for(var i = $('#games .isotope-demo >').length; i < info.length && i < $('#games .isotope-demo >').length + 3; i++){
		var s = '<div class="element-item" ><img class="thumbimage" src="public/videogames/fronts/'+info[i].front+'" /></div>'; 
		$inser = $inser + s ;
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

	$(".accion").click(function(){
		var idGame = $(this).attr("idGame");
		var idC = $(this).attr("credit");
		var price = parseInt($(this).attr("price"));
		var credit = parseInt($("#"+idC).text());
		//console.log(idGame);
		/*console.log(credit);
		console.log(price);*/
		$.ajax({
			type:"POST",
			url: "transaction" ,
			dataType: "json",
			data:{idGame:idGame},
			success: function(data){
				var name = data.name;
				var creditd = data.credit;
				console.log(data);
				$("#"+idC).text(creditd);
				$(".msj").text("Juego Comprado");
				$(".msj").css({"color":"green"});
				$(".msj").fadeIn('slow');
				//window.location.replace("http://localhost:8080/Videojuegos/DownloadFileServlet?game="+name);
                                window.location.replace("http://localhost:8084/Videojuegos/DownloadFileServlet?game="+name);
				setTimeout(function(){
					$(".msj").text("");
					$(".msj").fadeOut('slow');
				},4000)
			},
			error: function(data){
				console.error(data);
			}
		});
	});

	$(".freedownload").click(function(){
		var idGame = $(this).attr("idGame");
		$.ajax({
			type:"POST",
			url: "transaction" ,
			dataType: "json",
			data:{idGame:idGame},
			success: function(data){
				var name = data.name;
				var creditd = data.credit;
				console.log(data);
				$(".msj").text("Juego Descargado");
				$(".msj").css({"color":"green"});
				$(".msj").fadeIn('slow');
				//window.location.replace("http://localhost:8080/Videojuegos/DownloadFileServlet?game="+name);
                                window.location.replace("http://localhost:8084/Videojuegos/DownloadFileServlet?game="+name);
				setTimeout(function(){
					$(".msj").text("");
					$(".msj").fadeOut('slow');
				},4000)
			},
			error: function(data){
				console.error(data);
			}
		});

	});
}