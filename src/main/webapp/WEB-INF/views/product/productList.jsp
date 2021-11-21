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

<a href="boardform.do">글작성</a>
글갯수 : ${listcount }
<table border=1 align="center" width=800>
    <caption>게시판 목록</caption>
    <tr>
        <th>상품번호</th>
        <th>상품명</th>
        <th>이미지</th>
        <th>상품사</th>
        <th>조회수</th>
    </tr>

    <!-- 화면 출력 번호  -->
    <c:set var="num" value="${listcount-(page-1)*10 }"/>

    <c:forEach var="pl" items="${productList}">
        <tr>
            <td>${num}
                <c:set var="num" value="${num-1}"/>
            </td>
            <td>
                <a href="${path}/productDetail/?no=${pl.pro_no}&page=${page}">
                        ${pl.pro_name}
                </a>
            </td>
            <td>
                <a href="${path}/productDetail/?no=${pl.pro_name}&page=${page}">
                    <img src="${path}/images/${pl.pro_no}" width="120ox" height="110px"></a>
            </td>
            <td>${pl.bus_id}</td>
            <td>${pl.pro_readcnt }</td>
        </tr>
    </c:forEach>
</table>

<!-- 페이지 처리 -->
<center>
    <c:if test="${listcount > 0}">

        <!-- 1page로 이동 -->
        <a href="${path}/productList/?page=1" style="text-decoration:none"> < </a>

        <!-- 이전 블럭으로 이동 -->
        <c:if test="${startPage > 10 }">
            <a href="${path}/productList/?page=${startPage-10 }">[이전]</a>
        </c:if>

        <!-- 각 블럭에 10개의 페이지 출력 -->
        <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <c:if test="${i == page }">		<!-- 현재 페이지 -->
                [${i}]
            </c:if>
            <c:if test="${i != page }">		<!-- 현재 페이지가 아닌 경우 -->
                <a href="${path}/productList/?page=${i}">[${i}]</a>
            </c:if>
        </c:forEach>

        <!-- 다음 블럭으로 이동 -->
        <c:if test="${endPage < pageCount }">
            <a href="${path}/productList/?page=${startPage+10}">[다음]</a>
        </c:if>

        <!-- 마지막 페이지로 이동 -->
        <a href="${path}/productList/?page=${pageCount }"
           style="text-decoration:none"> > </a>

    </c:if>
</center>

</body>
</html>

