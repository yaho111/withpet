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
        <th width="140px">이미지</th>
        <th>상품명</th>
        <th>단가</th>
        <th>수량</th>
        <th>금액</th>
    </tr>
    <c:forEach var="row" items="${list}" varStatus="i">
        <tr>
            <td width="140px">
                <img src="${path}/upload/${row.pro_img}" width="120px" height="110px">
            </td>
            <td>
                    ${order.pro_name}
            </td>
            <td>
                    ${row.price}
            </td>
            <td>
               ${row.ea}
                <input type="hidden" name="pro_no" value="${row.pro_no}" />
            </td>
            <td>
                    ${row.price * row.ea}
            </td>
            <td>

            </td>
        </tr>
    </c:forEach>
</table>

<table class="table">
    <thead>배송지 정보</thead>

    <tr>
        <th>결제자</th>
        <td>${order.name}</td>
    </tr>
        <th>주소</th>
        <td>${address} ${specificAddress}</td>
    <tr>
        <th>우편번호</th>
        <td>${post}</td>
    </tr>
    <tr>
        <th>번호</th>
        <td>${order.phone}</td>
    </tr>

    <tr>
        <th>상품 금액 합</th>
        <td>${totalOrderPrice}</td>
    </tr>
    <tr>
        <th>배송료</th>
        <td> ${shippingFee} </td>
    </tr>
    <tr>
        <th>결제금액</th>
        <td>${allSum}</td>
    </tr>
    <tr>
        <th>결제</th>
        <td><button id="check_module" type="button" class="btn btn-primary">결제하기</button></td>
    </tr>

</table>
    </div>
</section>


<script>
    $("#check_module").click(function () {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp87253702');
        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        IMP.request_pay({
            pg: 'inicis', // version 1.1.0부터 지원.
            /*
                'kakao':카카오페이,
                html5_inicis':이니시스(웹표준결제)
                    'nice':나이스페이
                    'jtnet':제이티넷
                    'uplus':LG유플러스
                    'danal':다날
                    'payco':페이코
                    'syrup':시럽페이
                    'paypal':페이팔
                */
            pay_method: 'card',
            /*
                'samsung':삼성페이,
                'card':신용카드,
                'trans':실시간계좌이체,
                'vbank':가상계좌,
                'phone':휴대폰소액결제
            */
            merchant_uid: '${order.o_no}' + new Date().getTime(),
            /*
                m
             */
            name: '${pro_name}',
            //결제창에서 보여질 이름
            amount: ${allSum},
            //가격
            buyer_name: '${order.name}',
            buyer_tel: '${order.phone}',
            buyer_addr: '${address}+${specificAddress}',
            buyer_postcode: "${post}",
            m_redirect_url: 'https://example.com/mobile/complete'
            /*
                모바일 결제시,
                결제가 끝나고 랜딩되는 URL을 지정
                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
                */
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;

// jQuery로 HTTP 요청
                $.ajax({
                    type : "POST",
                    async : false,
                    url : "${path}/verifyIamport/" + rsp.imp_uid + "?o_no=${order.o_no}"
                }).done(function(data) {
                    console.log(data);

                    if(data.code !== 0) {
                        alert(data.msg);
                        return false;
                    } else if (rsp.paid_amount == data.imp.response.amount) {
                        // 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
                        alert("결제가 완료되었습니다.");
                        location.href = "${path}/orderComplete?o_no=${order.o_no}";
                    } else {
                        alert("금액이 일치하지 않습니다. 다시 한번 시도해주세요.");
                    }
                });
      }
    });})
</script>


</body>
</html>
<%@ include file="../layout/footer.jsp"%>
