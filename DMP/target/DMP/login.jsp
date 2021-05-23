<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>LogIn</title>
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
                <h2 style="font-family:calibri">Sign In</h2>
            </div>

            <div class="mb-3">
                <input type="email" class="form-control" id="exampleInputEmailLogin" placeholder="email" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" id="exampleInputPasswordLogin" placeholder="password" required>
            </div>
            <select class="form-select" aria-label="Default select example" id="usertype">
                <option value="Admin">Admin</option>
                <option value="DeliveryBoy">Delivery Boy</option>
                <option value="Customer">Customer</option>
            </select>
            <div class="mb-3 form-check text-center">
                <button type="submit" class="text-center btn btn-success" style="margin-top:5%" onclick="selectUSerType()">LogIn</button>
            </div>

        </div>
        <div class="col-3"></div>
    </div>
</div>
<script>

    const selectUSerType=()=>{
        var userType=document.querySelector("#usertype")
        userType = userType.value

        if(userType==="Admin"){
            window.location.href = "admin.jsp";
        }
        else if(userType==="DeliveryBoy"){
            window.location.href="deliveryboy.jsp"
        }
        else
        {
            window.location.href="home.jsp"
        }

    }


</script>
<footer class="footer font-small" style="background-color: #007E33">
    <div class="footer-copyright text-center py-3">&copy 2020 Copyright:
        <a href="home.jsp"> Deliver my parsel</a>
    </div>
</footer>
</body>
</html>