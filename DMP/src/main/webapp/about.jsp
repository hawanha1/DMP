<%--
  Created by IntelliJ IDEA.
  User: Hamza
  Date: 26/05/2021
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
        <h2>Overview</h2>
        Kapruka.com is Sri Lanka’s first and largest e-commerce enterprise. Its core business is retail e-commerce in Sri Lanka. In addition to e-commerce, Kapruka has ventured into “Last-mile delivery”, “Cross border e-com exports”, “SME marketplace”, “Classifieds”, “Payment Solutions”. Additionally, Kapruka features “Amazon/eBay simulated imports”, “Fresh Fruits/Vegetable/Flower Farming”, “B2B Baking Services” and “Highend Coffee Houses.”
    </div>
    <div class="row">
        <h2>History</h2>
        Kapruka.com was found in 2005 by Dulith Herath with a small capital of less than 1000$ in hand. Since then it has grown into a multi-billion rupee enterprise without any external investors. The organic growth of Kapruka to date is a unique attribute of the strong business model.
    </div>
    <div class="row">
        <h2>Founder</h2>
        Dulith Herath is an entrepreneur, web-technologies specialist, Founder and the Chairman of Kapruka.com, Sri Lanka’s largest e-commerce organization. He is widely credited for setting the bar for Sri Lanka’s online business strategies and web-based benchmarks. Dulith possesses strong technical skills that fuse innovation and new technology-based business models in Sri Lanka. He is also an advocate for improving government policies on tech start-ups and intellectual properties. Incidentally, Dulith Herath is a recipient of the prestigious Eisenhower Fellowship.

        Before forming Kapruka, Dulith Herath served as a Development Specialist at Dell Perot Systems where he designed robust software/web applications for DELL client’s use with the aim of optimizing operational efficiency. Additionally, he also worked as an Application Architect at Microsoft. There he directed and designed new applications from conception to completion while overseeing the technical staff involved with development projects. Dulith is a graduate of the University of Kentucky, USA with a Bachelor of Science Degree in Computer Science.
    </div>
</div>

<footer class="footer font-small" style="background-color: #007E33">
    <div class="footer-copyright text-center py-3">&copy 2020 Copyright:
        <a href="home.jsp"> Deliver my parsel</a>
    </div>
</footer>
</body>
</html>
