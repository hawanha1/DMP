<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
		<div class="row" style="margin: 5%">
			<div class="col-6 text-center">
				<a type="button" class="btn btn-success" href="users.jsp" style="width: 100%;margin: 5%">users</a>
			</div>
			<div class="col-6 text-center">
				<a type="button" class="btn btn-success" href="products.jsp" style="width: 100%;margin: 5%">products</a>
			</div>
		</div>
		<div class="row" style="margin-bottom:5%">
			<div class="col-4">
				<div class="card" style="width: 18rem;">
  					<div class="card-body">
    					<h5 class="card-title">User's Count</h5>
    					<p class="card-text text-center" id="userCount" style="size: 42px"></p>
  					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card" style="width: 18rem;">
  					<div class="card-body">
    					<h5 class="card-title">Delivery Client's Count</h5>
    					<p class="card-text text-center" id="deliveryCount" style="size: 42px"></p>
  					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card" style="width: 18rem;">
  					<div class="card-body">
    					<h5 class="card-title">Product's Count</h5>
    					<p class="card-text text-center" id="productCount" style="size: 42px"></p>
  					</div>
				</div>
			</div>
		</div>

	</div>
<footer class="footer font-small" style="background-color: #007E33">
	<div class="footer-copyright text-center py-3">&copy 2020 Copyright:
		<a href="home.jsp"> Deliver my parsel</a>
	</div>
</footer>

	<script>

		function start(){
			checkLogin();
			userCount();
			productCount();
			deliveryCount();
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
        function userCount(){
            $.ajax({
                url:'./addUser',
                type:'POST',
                data:{action:"displayUsers"},
                dataType: 'json',
                success:(data)=>{

                    document.getElementById("userCount").innerHTML=data.result.length;
                },
                failure:(error)=>{
                    console.log(error);
                }
            })
        }


        function productCount(){
			$.ajax({
				url:'./products',
				type:'POST',
				data:{action:"display"},
				dataType: 'json',
				success:(data)=>{
                    document.getElementById("productCount").innerHTML=data.result.length;
				},
				failure:(error)=>{
					console.log(error);
				}
			})
		}

		function deliveryCount(){
			$.ajax({
				url:'./deliveryBoy',
				type:'POST',
				data:{action:"display"},
				dataType: 'json',
				success:(data)=>{
                    document.getElementById("deliveryCount").innerHTML=data.result.length;
				},
				failure:(error)=>{
					console.log(error);
				}
			})
		}


	</script>



</body>
</html>