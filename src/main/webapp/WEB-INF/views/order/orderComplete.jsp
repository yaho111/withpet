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

<table class="table">

        <thead> 주문이 완료되었습니다! </thead>
    <tbody>
    <tr>
        <th colspan="4"> 배송정보 </th>
    </tr>
    <tr>
        <th> 결제자 </th>
        <td> ${order.name} </td>
    </tr>
    <tr>
        <th> 우편번호</th>
        <td> ${post} </td>
        <th> 주소 </th>
        <td>${address} / ${specificAddress} </td>
    </tr>
    <tr>
        <th> 총 결제금액 </th>
        <td colspan="3"> ${order.ord_price}</td>
    </tr>
    <c:forEach var="row" items="${list}" varStatus="i">
        <tr>
            <th>주문번호</th>
            <td>${order.o_no}</td>
            <th>주문 승인번호</th>
            <td>${merchantUid}</td>
        </tr>
        <tr>
            <th>상품명</th>
            <td> <img src="${path}/upload/${row.pro_img}" width="120px" height="110px"> (${row.pro_no})${row.pro_name} </td>
            <th> 가격 및 수량</th>
            <td> ${row.price}원 / ${row.ea}개 </td>
        </tr>
    </c:forEach>
    </tbody>
<tfoot>

</tfoot>

</table>



</body>
</html>
<%@ include file="../layout/footer.jsp"%>