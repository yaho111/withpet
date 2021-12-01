<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>상품 리스트</title>
</head>
<body>

<a href="${path}/productWrite/">글작성</a>
글갯수 : ${listcount }
<table class="table table-hover">
    <tr>
        <th>상품번호</th>
        <th>이미지</th>
        <th>상품명</th>
        <th>판매사</th>
        <th>조회수</th>
    </tr>

    <!-- 화면 출력 번호  -->
    <c:set var="num" value="${listcount-(page-1)*10 }"/>

    <c:forEach var="pl" items="${productList}">
        <c:choose>
            <c:when test="${pl.pro_del eq 'n' and pl.stock ne '0'}">
                <%--재고가 있고 삭제여부가 아닐경우--%>
                <tr>
                    <td align="center">
                        ${pl.pro_no}
                    </td>
                    <td>
                        <a href="${path}/productDetail/?no=${pl.pro_no}&page=${page}">
                            <img src="${path}/upload/${pl.pro_img}" width="120px" height="110px"></a>
                    </td>
                    <td>
                        <a href="${path}/productDetail/?no=${pl.pro_no}&page=${page}">
                                ${pl.pro_name}
                        </a>
                    </td>
                    <td>${pl.bus_id}</td>
                    <td>${pl.pro_readcnt }</td>
                </tr>
            </c:when>
            <c:otherwise>
                <tr>
                    <td align="center">
                        ${pl.pro_no}
                    </td>
                    <td colspan="4" align="center" style="color: red">
                        재고가 없거나, 삭제된 상품입니다.
                    </td>
                </tr>
            </c:otherwise>
        </c:choose>
<%--        <tr>--%>
<%--            <td>${num}--%>
<%--                <c:set var="num" value="${num-1}"/>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <a href="${path}/productDetail/?no=${pl.pro_no}&page=${page}">--%>
<%--                        ${pl.pro_name}--%>
<%--                </a>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <a href="${path}/productDetail/?no=${pl.pro_no}&page=${page}">--%>
<%--                    <img src="${path}/upload/${pl.pro_img}" width="120px" height="110px"></a>--%>
<%--            </td>--%>
<%--            <td>${pl.bus_id}</td>--%>
<%--            <td>${pl.pro_readcnt }</td>--%>
<%--        </tr>--%>
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
<%@ include file="../layout/footer.jsp"%>
