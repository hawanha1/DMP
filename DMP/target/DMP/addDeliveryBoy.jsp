<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Add delivery Boy</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

</head>
<body onload="checkLogin()">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<img src="raw/PDS.JPG" class="img-thumbnail" alt="PDS" width="100%">
			</div>
		</div>
		<div class="row" style="margin-top:5%">
			<div class="col-3"></div>
			<div class="col-6">
				<div class="col-12" style="text-align:center">
					<h2 style="font-family:calibri">Add Delivery Boy</h2>
				</div>
					<div class="mb-3">
    					<input type="text" class="form-control" id="inputDeliveryBoyEmail" placeholder="email" required>
  					</div>
  					<div class="mb-3">
    					<input type="text" class="form-control" id="inputDeliveryBoyName" placeholder="name" required>
  					</div>
  					<div class="mb-3">
    					<input type="password" class="form-control" id="inputDeliveryBoyPassword" placeholder="Password" required>
  					</div>
					<div class="mb-3 form-check text-center">
  						<button type="submit" class="text-center btn btn-success" style="margin-top:5%" onclick="addDeliveryBoy()">Add</button>
  					</div>
			</div>
			<div class="col-3"></div>
		</div>
	</div>
	<footer class="footer font-small" style="background-color: #007E33">
		<div class="footer-copyright text-center py-3">&copy 2020 Copyright:
			<a href="home.jsp"> Deliver my parsel</a>
		</div>
	</footer>
	<script>
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
		function addDeliveryBoy(){
			$.ajax({
				url:'./deliveryBoy',
				type:'POST',
				data:{
					action:'addDeliveryBoy',
					email:document.getElementById("inputDeliveryBoyEmail").value,
					password:document.getElementById("inputDeliveryBoyPassword").value,
					name:document.getElementById("inputDeliveryBoyName").value
				},
				dataType:'json',
				success:(data)=>{
					if(data.status){
						window.location.href='deliveryboy.jsp';
					}else{
						alert("email already exist");
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