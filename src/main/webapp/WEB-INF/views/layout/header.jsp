<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-17
  Time: 오후 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<html>

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Withpet</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${path}/assets/favicon.ico"/>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${path}/css/styles.css" rel="stylesheet"/>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${path}/js/scripts.js"></script>
</head>

<body>
<!-- Navigation-->
<div class="container">
    <div class="row">
        <div class="col">
            <a class="navbar-brand" href="#!"><img src="${path}/images/withpet_logo.png"></a>
        </div>
        <div class="col">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        </div>
        <div class="col">
            <button class="btn btn-outline-primary" type="submit">Search</button>
        </div>
        <div class="col">
            <form class="d-flex">
                <button class="btn btn-outline-success" type="submit">
                    <!-- <i class="bi-cart-fill me-1"></i> -->
                    회원가입
                    <!-- <span class="badge bg-dark text-white ms-1 rounded-pill">0</span> -->
                </button>
                <button class="btn-outline-success" >
                    <!-- <i class="bi-cart-fill me-1"></i> -->
                    로그인
                    <!-- <span class="badge bg-dark text-white ms-1 rounded-pill">0</span> -->
                </button>
            </form>
        </div>

    </div>

</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">커뮤니티</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">스토어</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">병원</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Q&A</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">공지사항</a></li>
                <!-- <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">All Products</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                            <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                        </ul>
                    </li> -->
            </ul>


        </div>
    </div>
</nav>