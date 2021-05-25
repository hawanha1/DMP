<html>
<head>
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

</head>
<body onload="deleteLogin()">
<div class="container">
    <div class="row">
       <div class="col-12">
            <img src="raw/PDS.JPG" class="img-thumbnail" alt="PDS"
                 width="100%">
        </div>
    </div>
    <div class="row" style="margin-top: 5%">
        <div class="col-3"></div>
        <div class="col-6">
            <div class="col-12" style="text-align: center">
                <h2 style="font-family: calibri">SIGN UP</h2>
            </div>
            <div class="mb-3">
                <label for="exampleInputTel" class="form-label" style="opacity: 0.4; font-family: calibri">13XX1234567(Use Pattern "[0-9]{3}-[0-9]{2}-[0-9]{3}")</label>
                <input type="tel" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" class="form-control" id="exampleInputTel" required>
            </div>
            <div class="mb-3">
                <input type="text" class="form-control" id="exampleInputName" placeholder="Name" required>
            </div>
            <div class="mb-3">
                <input type="email" class="form-control" id="exampleInputEmailSignUp" aria-describedby="emailHelp" placeholder="Email Address" required>
                <div id="emailHelp" class="form-text">This Email will be used for Sign In and password retrival, So make sure to use right Email.</div>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control"	id="exampleInputPasswordSignUP" placeholder="Password" required>
            </div>
            <div class="mb-3 form-check text-center">
                <a class="btn btn-success" href="https://www.google.com/maps" role="button">Delivery Location</a>
            </div>
            <p class="center">
                if you already have an account <a href="login.jsp">login?</a>
            </p>
            <div class="mb-3 form-check text-center">
                <button type="submit" class="text-center btn btn-success" onclick="addUser()">SignUp</button>
            </div>
        </div>
        <div class="col-3"></div>
    </div>
</div>

<script type="text/javascript">
    function deleteLogin(){
        $.ajax({
            url:'./loginUser',
            type:'POST',
            data:{action:"deleteLogin"},
            dataType: 'json',
            success:(data)=>{
            },
            failure:(error)=>{
                console.log(error);
            }
        });
    }
    function addUser(){
        $.ajax({
            url:'./addUser',
            type:'POST',
            data:{
                action:"addUser",
                tel:document.getElementById("exampleInputTel").value,
                email:document.getElementById("exampleInputEmailSignUp").value,
                password:document.getElementById("exampleInputPasswordSignUP").value,
                name:document.getElementById("exampleInputName").value
            },
            dataType:'json',
            success:(data)=>{
                if(data.status){
                    window.location.href='login.jsp';
                   }else{
                    alert(data.result);
                }
            },
            failure:(error)=>{
                console.log("error");
            }
        });
    }
</script>
<footer class="footer font-small" style="background-color: #007E33">
    <div class="footer-copyright text-center py-3">&copy 2020 Copyright:
        <a href="home.jsp"> Deliver my parsel</a>
    </div>
</footer>
</body>
</html>