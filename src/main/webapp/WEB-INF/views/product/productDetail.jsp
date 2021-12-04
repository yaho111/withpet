<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- 추천 버튼 클릭 시 -->
<script>
    function ProLikeButton(){
        if(${empty sessionScope.id}) {
            alert("로그인이 필요한 서비스입니다!");
            return false;

        }else if("${sessionScope.id}" == "${product.bus_id}"){
            alert("자신의 상품은 추천할 수 없습니다!");
            return false;

        }else {
            var ProLikeData = 'pro_no='+${product.pro_no}+'&id='+"${sessionScope.id}";
            $.post('${path}/ProLikeInsert', ProLikeData, function(message) {
                alert(message);
            });
            return false;
        }
    }
</script>


<!-- 댓글 처리 -->
<script type="text/javascript">
    /* 	window.onload=function() {

     } */
    $(function() {
        $('#proReList').load('${path}/proReList?pro_no=${product.pro_no}') // 리스트를 불러온다., 바꿔워야함

        // 댓글창 유효성 검사
        $('#proReInsert').click(function() {
            if (!pro_form.proReply_content.value) {
                alert('댓글 입력후에 클릭하시오');
                pro_form.proReply_content.focus();
                return false;
            }

            // 댓글 입력, 입력후
            var frmData = $('form').serialize();	// serialize() : 아래의 form태그를 읽는함수.
            $.post('${path}/proReInsert', frmData, function(data) {
                $('#proReList').html(data);
                pro_form.proReply_content.value = '';
            });
        });
    });
</script>
<!-- 댓글 처리 끝 -->

<!DOCTYPE html>
<html>
<head></head>
<body>

<section class="py-5">
<div class="container">

    <table class="table">
        <tr>
            <td colspan="2"><h2 class="body-title">${product.pro_name }</h2></td>
        </tr>
        <tr>
            <th>상품사</th>
            <td>${product.bus_id }</td>
        </tr>
        <tr>
            <th> 상품 이미지 </th>
            <td><img src = "${path}/upload/${product.pro_img}" width="400px"/></td>
        </tr>
        <tr>
            <th>상품 가격</th>
            <td><fmt:formatNumber pattern="###,###,###" value = "${product.price }"/> </td>
        </tr>
        <tr>
<c:if test="${sessionScope.role == 'user' || sessionScope.role == 'product_pro'|| sessionScope.role == 'master'}">
            <th> 구매 수량</th>
            <td>
                <form name="form1" method="post" action="${path}/basketInsert">
                    <div class="input-group" width="500px">
                    <input type="hidden" name="pro_no" value="${product.pro_no}">
                    <select name="ea" class="form-select">
                        <c:forEach begin="1" end="10" var="i">
                            <option value="${i}">${i}</option>
                        </c:forEach>

                    </select><input type="submit" value="장바구니에 담기" class="btn btn-primary">

                    </div>
                </form>
            </td>
        </tr>
        </c:if>
        <tr>
            <th>상품 소개 </th>
            <td>
                <li size="600px" style="list-style: none">${pro_content}</li>
            </td>
        </tr>
    </table>

    <div class="body-menu">
        <c:if test="${sessionScope.id != null}">
            <input type="button" value="추천"  class="btn btn-outline-secondary"
                   onClick="ProLikeButton()" >
        </c:if>
        <c:if test="${sessionScope.id == product.bus_id || sessionScope.role == 'product_pro'||
			          sessionScope.role == 'master'}">

            <input type="button" value="수정" class="btn btn-primary"
                   onClick="location.href='${path}/productWrite/?no=${product.pro_no}&page=${page}' ">

            <input type="button" value="삭제" class="btn btn-danger"
                   onClick="location.href='${path}/productDelete/?no=${product.pro_no}&page=${page}' ">
        </c:if>
        <input type="button" value="목록" class="btn btn-primary"
               onClick="${path}/productList">
    </div>

    <!-- 댓글 처리 -->
    <h2 class="text-primary">댓글</h2>
    <form name="pro_form" id="pro_form" >
        <input type="hidden" name="proReply_writer" value="${sessionScope.id}">
        <input type="hidden" name="pro_no" value="${product.pro_no}">
        <c:if test="${sessionScope.id != null}">
            <textarea name="proReply_content" rows="2"
                       class="form-control"></textarea>
        <div class="body-menu" align="right">
            <input type="button" value="확인" id="proReInsert"  class="btn btn-outline-secondary">
        </div>

        </c:if>
    </form>
</div><!-- css -->
</section><!-- css -->

<!-- 댓글 리스트 구역 -->
<c:if test="${sessionScope.id != null}">
    <div id="proReList"></div>
</c:if>
<!-- 댓글 처리 끝 -->


<%@ include file="../layout/footer.jsp"%>