<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="../layout/header.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
</script>

</body>

<c:choose>
    <c:when test="${count == 0}">
<a style="font-size: larger; text-align: center;color : red;"> 장바구니가 비어있습니다 </a>
    </c:when>
    <c:otherwise>
<div class="container">
        <table class="table">
            <tr>
                <th width="140px">이미지</th>
                <th>상품명</th>
                <th>단가</th>
                <th>수량</th>
                <th>금액</th>
                <th>취소</th>
            </tr>
            <c:forEach var="row" items="${list}" varStatus="i">
                <tr>
                    <td width="140px">
                        <img src="${path}/upload/${row.pro_img}" width="120px" height="110px">
                    </td>
                    <td>
                            ${row.pro_name}
                    </td>
                    <td>
<%--                    <fmt:formatNumber pattern="###,###,###" value=" --%>
                         ${row.price}
<%--"/>--%>
                    </td>
                    <td>
                       ${row.ea}
                        <input type="hidden" name="pro_no" value="${row.pro_no}" />
                    </td>
                    <td>
<%--                        <fmt:formatNumber pattern="###,###,###" value="--%>
                        ${row.order_price}
<%--"/>--%>
                    </td>
                    <td>
                        <input type="button" class="btn btn-danger" onclick="location.href='${path}/basketDelete/?basket_no=${row.basket_no}'"value="상품 삭제"/>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="2">
                    <input type="button" class="btn btn-primary" onclick="location.href='${path}/productList'" value="추가 구매하기"/>
                </td>
                <td>
                    장바구니 금액 합계 : ${totalOrderPrice}
                </td>
                <td>
                    배송료 : ${shippingFee}
                </td>
                <td>
                    전체 주문금액 : ${allSum}
                </td>
                <td>
                    <input type="button" onclick="location.href='${path}/orderInsert'" class="btn btn-primary" value="결제하기"/>
                </td>
            </tr>
        </table>
</div>
    </c:otherwise>
</c:choose>
</html>
<%@ include file="../layout/footer.jsp"%>