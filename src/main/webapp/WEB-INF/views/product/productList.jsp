<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>상품 리스트</title>
</head>
<body>
<script>
    $(document).ready(function(){
        $("#btnAdd").click(function(){
            location.href="${path}/product/productWrite";
        });
        $("#btnEdit").click(function(){
            location.href="${path}/product/productEdit";
        });
    });
</script>


<h2>상품목록</h2>
<%--<c:if test="${sessionScope.adminId != null}">--%>
<button type="button" id="btnAdd">상품등록</button><br>
<%--</c:if>--%>
<table border="1">
    <tr>
        <th>상품ID</th>
        <th>상품이미지</th>
        <th>상품명</th>
        <th>가격</th>
    </tr>
    <c:forEach var="row" items="${list}">
        <tr>
            <td>
                    ${row.pro_name}
            </td>
            <td>
                <a href="${path}/productDetail/${row.pro_name}">
                    <img src="${path}/images/${row.pro_no}" width="120ox" height="110px">
                </a>
            </td>
            <td align="center">
                <a href="${path}/productDetail/${row.pro_no}">${row.pro_name}</a><br>
                <a href="${path}/productEdit${row.pro_no}">[상품편집]</a>
            </td>
            <td>
                <fmt:formatNumber value="${row.price}" pattern="###,###,###"/>
            </td>
        </tr>
    </c:forEach>
    <c:if test="${listcount > 0}">

        <!-- 1page로 이동 -->
        <a href="/productList/?page=1" style="text-decoration:none"> < </a>

        <!-- 이전 블럭으로 이동 -->
        <c:if test="${startPage > 10 }">
            <a href="productList/?page=${startPage-10 }">[이전]</a>
        </c:if>

        <!-- 각 블럭에 10개의 페이지 출력 -->
        <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <c:if test="${i == page }">		<!-- 현재 페이지 -->
                [${i}]
            </c:if>
            <c:if test="${i != page }">		<!-- 현재 페이지가 아닌 경우 -->
                <a href="productList/?page=${i}">[${i}]</a>
            </c:if>
        </c:forEach>

        <!-- 다음 블럭으로 이동 -->
        <c:if test="${endPage < pageCount }">
            <a href="productList/?page=${startPage+10}">[다음]</a>
        </c:if>

        <!-- 마지막 페이지로 이동 -->
        <a href="productList/?page=${pageCount }"
           style="text-decoration:none"> > </a>

    </c:if>
</table>
</body>
</html>

