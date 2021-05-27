
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body onload="start()">
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <a class="navbar-brand" href="home.jsp">web side</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="home.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="about.jsp">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="services.jsp">Services</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="contectUs.jsp">Contect US</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="order.jsp">Orders</a>
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
            <img src="raw/PDS.JPG" class="img-thumbnail" alt="PDS"
                 width="100%">
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card" style="width:100%;margin-top:5%">
                <a class="btn btn-success" href="home.jsp">Back to Home</a>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top:5%">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Price</th>
                <th scope="col">Description</th>
                <th scope="col">Delete</th>
            </tr>
            </thead>
            <tbody id="cartTable">

            </tbody>
        </table>
    </div>
    <footer class="footer font-small" style="background-color: #007E33">
        <div class="footer-copyright text-center py-3">&copy 2020 Copyright:
            <a href="home.jsp"> Deliver my parsel</a>
        </div>
    </footer>
</div>

<script>
    function start(){
        checkLogin();
        displayCart();
    }
    function displayCart(){
        $.ajax({
            url     : './cart',
            type    : 'POST',
            data     : {action:"displayCart"},
            dataType : 'json',
            success    : (data)=>{
                if(data)
                {
                    let n='';

                    data.result.forEach(function(value)
                    {
                        let delete_button = '<button type="button" class="btn btn-danger" data-toggle="modal" style="color: black" onclick="del(' + value.id + ')"><i class="material-icons" style="color:#5D0904">delete</i>Delete</button>';
                        n+="<tr><td>"+value.name+"</td><td>"+value.price+"</td><td>"+value.description+"</td><td>"+delete_button+"</td></tr>";


                    })
                    console.log(data);
                    document.getElementById("cartTable").innerHTML=n;
                }
            },
            failure:(error)=>{
                console.log(error);
            }
        });
    }
    function del(id) {
        $.ajax({
            url:'./cart',
            type:'POST',
            data:{
                action:"delete",
                id:id
            },
            dataType: 'json',
            success:(data)=>{
                displayCart();
            },
            failure:(error)=>{
                alert(error);
            }
        })
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

</script>

</body>
</html>
