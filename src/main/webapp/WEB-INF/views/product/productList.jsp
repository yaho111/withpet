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
                <a href="${path}/product/productDetail/${row.pro_name}">
                    <img src="${path}/images/${row.pro_no}" width="120ox" height="110px">
                </a>
            </td>
            <td align="center">
                <a href="${path}/product/productDetail/${row.pro_no}">${row.pro_name}</a><br>
                <a href="${path}/product/productEdit${row.pro_no}">[상품편집]</a>
            </td>
            <td>
                <fmt:formatNumber value="${row.price}" pattern="###,###,###"/>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

