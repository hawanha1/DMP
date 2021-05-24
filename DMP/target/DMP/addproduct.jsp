<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Add Product</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

</head>
<body>
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
					<h2 style="font-family:calibri">Add Product</h2>
				</div>
					<div class="mb-3">
    					<input type="text" class="form-control" id="inputProductName" placeholder="Name" required>
  					</div>
  					<div class="mb-3">
    					<input type="text" class="form-control" id="inputProductPrice" placeholder="Price" required>
  					</div>
  					<div class="mb-3">
    					<input type="text" class="form-control" id="inputProductDescription" placeholder="description" required>
  					</div>
					<div class="mb-3 form-check text-center">
  						<button type="submit" class="text-center btn btn-success" style="margin-top:5%" onclick="addProduct()">Add</button>
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
		function addProduct(){
			$.ajax({
				url:'./products',
				type:'POST',
				data:{
					action:'addProduct',
					name:document.getElementById("inputProductName").value,
					price:document.getElementById("inputProductPrice").value,
					description:document.getElementById("inputProductDescription").value
				},
				dataType:'json',
				success:(data)=>{
					if(data.status){
						window.location.href='products.jsp';
					}else{
						alert("product already exist");
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