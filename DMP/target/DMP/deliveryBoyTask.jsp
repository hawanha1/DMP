<%--
  Created by IntelliJ IDEA.
  User: Hamza
  Date: 25/05/2021
  Time: 4:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <title>Delivery Boy</title>

    <script
    src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
        var map;
        var lat,lag

        function getPos(){
            var x = document.getElementById("map-canvas");
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
<div class="container">
    <div class="row">
        <div class="col-12">
            <img src="raw/PDS.JPG" class="img-thumbnail" alt="PDS"
                 width="100%">
        </div>
    </div>
    <div id="datahere">
        here you show data
    </div>
    <div class="row">
        <div id="map-canvas" style="width:100%;height:300px;margin-bottom:5%"></div>
    </div>
</div>
<footer class="footer font-small" style="background-color: #007E33">
    <div class="footer-copyright text-center py-3">&copy 2020 Copyright:
        <a href="home.jsp"> Deliver my parsel</a>
    </div>
</footer>
</body>
</html>
