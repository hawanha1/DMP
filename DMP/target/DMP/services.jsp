<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Services</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

  <script
    src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>
var map;
var lat,lag

function getPos(){
	var x = document.getElementById("demo");
	 if (navigator.geolocation) {
		    navigator.geolocation.getCurrentPosition(showPosition);
		  } else { 
		    x.innerHTML = "Geolocation is not supported by this browser.";
		  }
	
	 function showPosition(position) {
		 lat= position.coords.latitude 
		 lag= position.coords.longitude;
		 console.log(lat,lag)
		 initialize();
		}
}


function initialize() {
	 
  var mapOptions = {
    zoom: 14,
    center: new google.maps.LatLng(lat,lag)
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
 
  new google.maps.Marker({
	    position: { lat: lat, lng: lag },
	    map,
	  });
  
}


google.maps.event.addDomListener(window, 'load', getPos);
</script>
</head>
<body onload="start()">
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
	<a class="navbar-brand" href="home.jsp">web side</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="nav-link" href="home.jsp">Home</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="about.jsp">About</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="services.jsp">Services</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="contectUs.jsp">Contect US</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="order.jsp">Orders</a>
			</li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="index.jsp" type="button"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
		</ul>
	</div>
</nav>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<img src="raw/PDS.JPG" class="img-thumbnail" alt="PDS"
					width="100%">
			</div>
		</div>
		<div class="row text-right" style="margin:5%">
			<a class="btn btn-success" style="border-radius:50%;" href="cartDisplay.jsp"><i class="fa fa-shopping-cart" style="font-size:24px"></i></a>
		</div>
		<div class="row" id="cardRow" style="margin-bottom:5%">

		</div>
		<div class="row">
			<div id="map-canvas" style="width:100%;height:300px;margin-bottom:5%"></div>
		</div>
	</div>
	<footer class="footer font-small" style="background-color: #007E33">
		<div class="footer-copyright text-center py-3">&copy 2020 Copyright:
			<a href="home.jsp"> Deliver my parsel</a>
		</div>
	</footer>
<script>
	function start() {
		checkLogin();
		displayProducts();
	}


	function checkLogin() {
		$.ajax({
			url: './loginUser',
			type: 'POST',
			data: {action: "checkLogin"},
			dataType: 'json',
			success: (data) => {
				if (data.status) {

				} else {
					window.location.href = 'login.jsp';
				}
			},
			failure: (error) => {
				console.log(error);
			}
		});
	}

	function displayProducts(){
		$.ajax({
			url:'./products',
			type:'POST',
			data:{
				action:'display'
			},
			dataType:'json',
			success:(data)=>{
				let card='';
				data.result.forEach(function(value)
				{
						card += '<div class="col-4">' +
								'<div class="card">' +
								'<div class="card-body">' +
								'<div class="card-title">' + value.name + '</div>' +
								'<div class="card-subtitle">RS.' + value.price + '</div><div class="card-text">' + value.description + '</div>' +
								'</div>' +
								'</div>' +
								'<a onclick="addToCart(' + value.id + ')" class="btn btn-success"> Add To Cart</a>' +
								'</div>' +
								'</div>'
				})
				document.getElementById("cardRow").innerHTML=card;
			},
			failure:(error)=>{
				console.log(error);
			}
		});
	}
	function addToCart(id){
		$.ajax({
			url:'./cart',
			type:'POST',
			data:{
				action:"addToCart",
				productId:id
			},
			success:(data)=>{
				if(data.status){
					console.log(data.status);
				}else{
					console.log(data.result);
				}
			},
			failure:(error)=>{
				console.log(error);
			}
		});
	}
</script>
</body>
</html>