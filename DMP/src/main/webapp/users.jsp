<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">


</head>
<body onload="userDisplay()">
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