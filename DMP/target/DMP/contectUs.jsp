
<html>
<head>
    <title>Contect Us</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script
            src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
        var map;
        var lat,lag

        function getPos(){
            var x = document.getElementById("demo");
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                x.innerHTML = "Geolocation is not supported by this browser.";
            }

            function showPosition(position) {
                lat= position.coords.latitude
                lag= position.coords.longitude;
                console.log(lat,lag)
                initialize();
            }
        }


        function initialize() {

            var mapOptions = {
                zoom: 14,
                center: new google.maps.LatLng(lat,lag)
            };
            map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);

            new google.maps.Marker({
                position: { lat: lat, lng: lag },
                map,
            });

        }


        google.maps.event.addDomListener(window, 'load', getPos);
    </script>
</head>
<body>
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
        <div class="col-sm-6">
            <div class="card">
                <div class="card-header">
                    USA - Central Office
                </div>
                <div class="card-boy">
                    24000 Mercantile Road, #7 <br/>Beachwood,OH,44122<br/>USA.<br/><b>Phone:</b> + 1-859-215-0159<br/>(8:00am - 6:00pm Eastern Standard Time)<br/><b>e-mail:</b>lexingtonky.office@gmail.com
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="card">
                <div class="card-header">
                    London - United Kingdom
                </div>
                <div class="card-body">
                    145-157 St John Street<br/>London<br/>EC1V4PY<br/>United Kingdom<br/><b>Phone:</b> + 44-207-078-4149<br/>(9:00am - 5:00pm British Standard Time)<br/><b>e-mail:</b>london.office@gmail.com
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">Colombo - Sri Lanka<div>
                <div class="card-body">
                    <div class="card-text col-sm-12">
                        <div class="col-sm-4">
                            <span style="color: greenyellow"><b>Corporate Office</b></span><br/>400/60/9<br/>Sarana Road<br/>Colombo 7<br/>Sri Lanka.<br/><b>Phone:</b> + 94-11-7551111(Hotline)
                        </div>
                        <div class="col-sm-4">

                            <span style="color: greenyellow"><b>Head Office</b></span><br/>237/22<br/>Vijayakumaratunga Mawatha<br/>Colombo 5<br/>Sri Lanka.<br/><b>Phone:</b> + 94-11-7551111(Hotline)<br/><b>Fax:</b> + 94-11-2823332<br/>(6:00am - 9:30pm Sri Lanka Time)<br/><b>e-mail:</b> colombo.office@kapruka.com
                        </div>
                        <div class="col-sm-4">
                            <span style="color: greenyellow"><b>Mall Outlet</b></span><br/>No 8, 1 st Floor<br/>Liberty Plaza<br/>Colombo 3<br/>Sri Lanka.<br/><b>Phone:</b> + 94-11-2372178<br/>(10:00am - 6:00pm Sri Lanka Time)
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</div>

    <div class="row">
        <div id="map-canvas" style="width:100%;height:300px;margin:5%"></div>
    </div>
</div>
<footer class="footer font-small" style="background-color: #007E33">
    <div class="footer-copyright text-center py-3">&copy 2020 Copyright:
        <a href="home.jsp"> Deliver my parsel</a>
    </div>
</footer>
</body>
</html>
