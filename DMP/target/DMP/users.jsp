<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

</head>
<body onload="start()">
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
	<a class="navbar-brand" href="admin.jsp">web side</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="nav-link" href="admin.jsp">Home</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="users.jsp">users</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
					Delivery Client
				</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="deliveryboy.jsp">Delivery Client List</a>
					<a class="dropdown-item" href="addDeliveryBoy.jsp">Add Delivery Cient</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="productNavbardrop" data-toggle="dropdown">
					products
				</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="products.jsp">Products List</a>
					<a class="dropdown-item" href="addproduct.jsp">Add Product</a>
				</div>
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
				<img src="raw/PDS.JPG" class="img-thumbnail" alt="PDS" width="100%">
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="card" style="width:100%;margin-top:5%">
  					<a class="btn btn-success" href="deliveryboy.jsp">Delivery Boy</a>
				</div>
			</div>
		</div>
		<div class="row" style="margin-top:5%">
			<table class="table table-striped">
  				<thead>
    				<tr>
      					<th scope="col">name</th>
      					<th scope="col">email</th>
      					<th scope="col">phone</th>
      					<th scope="col">delete</th>
    				</tr>
  				</thead>
  			<tbody id="userTable">

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
		userDisplay();
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

	function userDisplay(){
			$.ajax({
			url     : './addUser',
			type    : 'POST',
			data     : {action:"displayUsers"},
			dataType : 'json',
			success    : (data)=>{
				if(data)
				{
					let n='';

					data.result.forEach(function(value)
					{
						let delete_button = '<button type="button" class="btn btn-danger" data-toggle="modal" style="color: black" onclick="del(' + value.id + ')"><i class="material-icons" style="color:#5D0904">delete</i>Delete</button>';
						n+="<tr><td>"+value.name+"</td><td>"+value.email+"</td><td>"+value.phone+"</td><td>"+delete_button+"</td></tr>";


					})
					document.getElementById("userTable").innerHTML=n;
				}
			},
			failure:(error)=>{
				console.log(error);
			}
		});
	}
	function del(id) {
		$.ajax({
			url:'./addUser',
			type:'POST',
			data:{
				action:"deleteUser",
				id:id
			},
			dataType: 'json',
			success:(data)=>{
				userDisplay();
			},
			failure:(error)=>{
				alert(error);
			}
		})
	}
</script>
</body>
</html>