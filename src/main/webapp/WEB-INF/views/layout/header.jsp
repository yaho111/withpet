<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-17
  Time: 오후 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html>

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Withpet</title>
    <!-- jQuery-->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
    
    <style>
    	.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
		.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
		.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #238CFA;background: #238CFA url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
		.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
		.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    </style>
</head>

<body>
<!-- Navigation-->
<div class="container">
    <div class="row">
        <div class="col">
            <a class="navbar-brand" href="main.do"><img src="${path}/images/withpet_logo.png"></a>
        </div>
        <div class="col">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        </div>
        <div class="col">
            <button class="btn btn-outline-primary" type="submit">Search</button>
        </div>
        <div class="col">
            <c:if test="${sessionScope.id != null}">
                <form class="d-flex">
                    <input type="button" class="btn btn-outline-success" value="내 정보" onclick="location.href='myPage'">
                    <input type="button" class="btn btn-outline-success" value="로그아웃" onclick="location.href='logout'">
                </form>
            </c:if>
            <c:if test="${sessionScope.id == null}">
                <form class="d-flex">
                    <input type="button" class="btn btn-outline-success" value="회원 가입" onclick="location.href='joinForm'">
                    <input type="button" class="btn btn-outline-success" value="로그인" onclick="location.href='loginForm'">
                </form>
            </c:if>

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
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="boardList">커뮤니티</a></li>
                <li class="nav-item"><a class="nav-link" href="productList">스토어</a></li>
                <li class="nav-item"><a class="nav-link" href="hospitalList">병원</a></li>
                <li class="nav-item"><a class="nav-link" href="qnaList">Q&A</a></li>
                <li class="nav-item"><a class="nav-link" href="notList">공지사항</a></li>
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