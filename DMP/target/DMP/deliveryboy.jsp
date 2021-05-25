<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>delivery Boy</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<body onload="start()">

<nav class="navbar navbar-expand-lg navbar-inverse">
	<div class="container-fluid">
		<a class="navbar-brand" href="admin.jsp">Navbar</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="admin.jsp">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="users.jsp" tabindex="-1" aria-disabled="true">User</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="deliveryboy.jsp" tabindex="-1" aria-disabled="true">Delivery Boy</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="products.jsp" tabindex="-1" aria-disabled="true">Products</a>
				</li>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</ul>
			</ul>
		</div>
	</div>
</nav>


<div class="container">
		<div class="row">
			<div class="col-12">
				<img src="raw/PDS.JPG" class="img-thumbnail" alt="PDS" width="100%">
			</div>
		</div>
		<div class="row text-center" style="margin-top:5%">
			<a class="btn btn-success" href="addDeliveryBoy.jsp">Add Delivery Boy</a>
		</div>
		<div class="row" style="margin-top:5%">
			<table class="table table-stripd">
  				<thead>
    				<tr>
      					<th scope="col">name</th>
      					<th scope="col">email</th>
      					<th scope="col">delete</th>
    				</tr>
  				</thead>
  			<tbody id="deliveryBoyTable">

  			</tbody>
		</table>
	</div>
</div>
    <footer class="footer font-small" style="background-color: #007E33">
        <div class="footer-copyright text-center py-3">&copy 2020 Copyright:
            <a href="home.jsp"> Deliver my parsel</a>
        </div>
    </footer>
<script>

	function start(){
		deliveryBoyDisplay();
		checkLogin();
	}
	function checkLogin(){
		$.ajax({
			url:'./loginUser',
			type:'POST',
			data:{action:"checkLogin"},
			dataType: 'json',
			success:(data)=>{
				if(data.status){
				}else{
					window.location.href='login.jsp';
				}
			},
			failure:(error)=>{
				console.log(error);
			}
		});
	}
	function deliveryBoyDisplay(){

		$.ajax({
			url:'./deliveryBoy',
			type:'POST',
			data:{
				action:"display"
			},
			dataType:'json',
			success:(data)=>{
				if(data)
				{
					let n='';

					data.result.forEach(function(value)
					{
						let delete_button = '<button type="button" class="btn btn-danger" data-toggle="modal" style="color: black" onclick="del(' + value.id + ')"><i class="material-icons" style="color:#5D0904">delete</i>Delete</button>';
						n+="<tr><td>"+value.name+"</td><td>"+value.email+"</td><td>"+delete_button+"</td></tr>";


					})
					document.getElementById("deliveryBoyTable").innerHTML=n;
				}
			},
			failure:(error)=>{
				console.log(error);
			}
		})
	}
	function del(id){
		$.ajax({
			url:'./deliveryBoy',
			type:'POST',
			data:{
				action:"delete",
				id:id
			},
			dataType: 'json',
			success:(data)=>{
				deliveryBoyDisplay();
			},
			failure:(error)=>{
				alert(error);
			}
		})
	}
</script>
</body>
</html>