<%@ page language="java" contentType="text/html; ISO-8859-1" %>
<%@include file="assets/css.jsp" %>

<html>
<head>
    <title>Online Bookstore</title>
    <%@include file="assets/css.jsp" %>
    <style type="text/css">
        .back-img {
            background: url("assets/img/bg.png");
            height: 70vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;

        }

        .crd-ho:hover {
            background-color: #e8ebe9;
        }

    </style>
</head>
<body>
<%@include file="assets/navigationbar.jsp" %>
<div class="container-fluid back-img">
    <h1 class="text-center text-danger">nline Bookstore Management System</h1>
</div>


<div class="container" style="background-color: #e8ebe9">


    <h3 class="text-center">Recent Book</h3>
    <div class="row col-md-12">
        <div class="col-md-4">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="assets/img/book1.jpg" style="width: 135px; height: 200px">
                    <p>Data Structures and Algorithms in Java(2nd Edition)</p>
                    <p>Robert Lafore</p>
                    <div class="row text-center">
                        <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i>Add cart</a>
                        <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-danger btn-sm ml-1">$ 47.32</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="assets/img/book2.jpg" style="width: 135px; height: 200px">
                    <p>Introduction to Algorithms(3rd Edition)</p>
                    <p>T.H. Cormen</p>
                    <div class="row text-center">
                        <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i>Add cart</a>
                        <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-danger btn-sm ml-1">$ 49.87</a>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-md-4">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="assets/img/book3.webp" style="width: 135px; height: 200px">
                    <p>Computer Networking(Eighth Edition)</p>
                    <p>James F.Kurose</p>
                    <div class="row text-center">
                        <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i>Add cart</a>
                        <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-success btn-sm ml-1">$ 39.64</a>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-md-4">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="assets/img/book1.jpg" style="width: 135px; height: 200px">
                    <p>Discrete Mathematics And Its Applications(7th Edition)</p>
                    <p>Kenneth Rosen</p>
                    <div class="row text-center">
                        <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i>Add cart</a>
                        <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-danger btn-sm ml-1">$ 189.78</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file="assets/footer.jsp"%>
</body>
</html>
