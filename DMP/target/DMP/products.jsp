<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

</head>
<body onload="start()">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<img src="raw/PDS.JPG" class="img-thumbnail" alt="PDS" width="100%">
			</div>
		</div>
		<div class="row text-center" style="margin-top:5%">
			<a class="btn btn-success" href="addproduct.jsp">Add Product</a>
		</div>
		<div class="row" style="margin-top:5%">
			<table class="table table-stripd">
  				<thead>
    				<tr>
      					<th scope="col">Name</th>
      					<th scope="col">price</th>
      					<th scope="col">description</th>
      					<th scope="col">delete</th>
    				</tr>
  				</thead>
  			<tbody id="productTable">
  			</tbody>
		</table>
	</div>
</div>
	<footer class="footer font-small" style="background-color: #007E33">
		<div class="footer-copyright text-center py-3">&copy 2020 Copyright:
			<a href="home.jsp"> Deliver my parsel</a>
		</div>
	</footer>
</body>

<script>
	function start(){
		productDisplay();
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
	function productDisplay(){

		$.ajax({
			url:'./products',
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
						n+="<tr><td>"+value.name+"</td><td>"+value.price+"</td><td>"+value.description+"</td><td>"+delete_button+"</td></tr>";


					})
					document.getElementById("productTable").innerHTML=n;
				}
			},
			failure:(error)=>{
				console.log(error);
			}
		})
	}
	function del(id){
		$.ajax({
			url:'./products',
			type:'POST',
			data:{
				action:"delete",
				id:id
			},
			dataType: 'json',
			success:(data)=>{
				productDisplay();
			},
			failure:(error)=>{
				alert(error);
			}
		})
	}
</script>
</html>