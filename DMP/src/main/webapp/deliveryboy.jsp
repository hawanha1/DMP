<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>delivery Boy</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

</head>
<body>
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
      					<th scope="col">#</th>
      					<th scope="col">First</th>
      					<th scope="col">Last</th>
      					<th scope="col">Handle</th>
      					<th scope="col">delete</th>
      					<th scope="col">edit</th>
    				</tr>
  				</thead>
  			<tbody>
    			<tr>
      				<th scope="row">1</th>
      				<td>Mark</td>
      				<td>Otto</td>
      				<td>@mdo</td>
      				<td><a href="delete.jsp" class="btn btn-danger">delete</a>
      				<td><a href="edit.jsp" class="btn btn-success">edit</a>
    			</tr>
   				<tr>
      				<th scope="row">2</th>
      				<td>Jacob</td>
      				<td>Thornton</td>
      				<td>@fat</td>
      				<td><a href="delete.jsp" class="btn btn-danger">delete</a>
      				<td><a href="edit.jsp" class="btn btn-success">edit</a>
    			</tr>
    			<tr>
      				<th scope="row">3</th>
      				<td colspan="2">Larry the Bird</td>
      				<td>@twitter</td>
      				<td><a href="delete.jsp" class="btn btn-danger">delete</a>
      				<td><a href="edit.jsp" class="btn btn-success">edit</a>
    			</tr>
  			</tbody>
		</table>
	</div>
</div>
	
</body>
</html>