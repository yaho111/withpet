<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="../layout/header.jsp"%>
<section class="py-5">
<div class="container">
<table class="table">
    <h2 class="body-title"> 주문이 완료되었습니다!</h2>
    <tr>
        <th> 결제자 </th>
        <td colspan="3"> ${order.name} </td>
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
</table>
</div>
</section>

<section class="py-5">
    <div class="container">
        <table class="table">
            <h2 class="body-title">주문 상품 정보</h2>
        <tr>
            <th>주문번호</th>
            <td>${order.o_no}</td>

            <th>주문 승인번호</th>
            <td>${merchantUid}</td>
        </tr>
    <c:forEach var="row" items="${list}" varStatus="i">
        <tr>
            <th>상품명</th>
            <td> <img src="${path}/upload/${row.pro_img}" width="120px" height="110px"> ${row.pro_name} </td>
            <th> 가격 및 수량</th>
            <td> ${row.price}원 / ${row.ea}개 </td>
        </tr>
    </c:forEach>
</table>
        <div class="body-menu">
            <input type="button" class="btn btn-primary"  onClick="location.href='${path}/orderList' " align="right" value="주문 내역 확인">
        </div>
</div>
</section>


<%@ include file="../layout/footer.jsp"%>