<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%@ include file="../layout/header.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<section class="py-5">
<div class="container-body">
<table class="table">
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
  <tr>
    <th>상품명</th>
    <th>단가</th>
    <th>수량</th>
    <th>주문금액</th>
  </tr>

<c:forEach var="row" items="${list}" varStatus="i">

  <tr>
    <td>${row.pro_name}</td>
    <td>${row.price}</td>
    <td>${row.ea}</td>
    <td>${row.price * row.ea}</td>
  </tr>
</c:forEach>
  <tr>
    <td>상품 총 금액 : ${totalOrderPrice}</td>
    <td>배송료 : ${shippingFee}</td>
    <td>총 결제 금액${allSum}</td>
    <td><input type="button" onclick="cancelPay()" value="주문 취소" class="btn-danger"/></td>
  </tr>
</table>
</div>
</section>
<script>
  function cancelPay() {
    $.ajax({
      "url": "${path}/canceliamport/${impuid}/?o_no=${order.o_no}",  // 예: http://www.myservice.com/payments/cancel
      "type": "POST",
      "contentType": "application/json",
      "data": JSON.stringify({
        "merchant_uid": "${merchantUid}", // 예: ORD20180131-0000011
        "cancel_request_amount": ${allSum}, // 환불금액
        "reason": "테스트 결제 환불" // 환불사유
      }),
      "dataType": "json"
    });
    alert("주문 취소 완료")
    location.href = "${path}/orderList" }
</script>

</body>
</html>


<%@ include file="../layout/footer.jsp"%>