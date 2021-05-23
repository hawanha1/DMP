<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

</head>
<body>
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
			<table class="table table-stripd">
  				<thead>
    				<tr>
      					<th scope="col">#</th>
      					<th scope="col">First</th>
      					<th scope="col">Last</th>
      					<th scope="col">Handle</th>
      					<th scope="col">delete</th>
    				</tr>
  				</thead>
  			<tbody>
    			<tr>
      				<th scope="row">1</th>
      				<td>Mark</td>
      				<td>Otto</td>
      				<td>@mdo</td>
      				<td><a href="delete.jsp" class="btn btn-success">delete</a>
    			</tr>
   				<tr>
      				<th scope="row">2</th>
      				<td>Jacob</td>
      				<td>Thornton</td>
      				<td>@fat</td>
      				<td><a href="delete.jsp" class="btn btn-success">delete</a>
    			</tr>
    			<tr>
      				<th scope="row">3</th>
      				<td colspan="2">Larry the Bird</td>
      				<td>@twitter</td>
      				<td><a href="delete.jsp" class="btn btn-success">delete</a>
    			</tr>
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
</html>