<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-19
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp" %>
<section class="py-5">
    <div class="container-body">

        <h2 class="body-title">
            <strong>${member.name}</strong> 님 페이지
        </h2>
        <table class="table">
            <tr>
                <th>프로필</th>
                <td>
                    <c:if test="${member.profile == null}">

                    </c:if>
                    <c:if test="${member.profile != null}">
                        <img class="profile" src="${path}/upload/${member.profile}" width="100" height="100"/>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    ${member.email}
                </td>
            </tr>
            <tr>
                <th>연락처</th>
                <td>
                    ${member.phone}
                </td>
            </tr>
            <tr>
                <th>가입일</th>
                <td>
                    <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${member.regdate}"/>
                </td>
            </tr>
        </table>
        <div class="body-menu">


            <input class="btn btn-outline-secondary" type="button" value="정보 수정"
                   onclick="location.href='infoUpdateForm'">
            <input class="btn btn-outline-secondary" type="button" value="회원 탈퇴"
                   onclick="location.href='memberDeleteForm'">

        </div>
    </div>
</section>
<section class="py-5">
    <div class="container">
        <h2 class="body-title">나의 펫 목록</h2>
        <div class="body-menu">
            <input class="btn btn-outline-secondary" type="button" value="펫 등록"
                   onclick="location.href='petEnrollForm'">
        </div>
        <table class="table">
            <tr>
                <th>프로필</th>
                <th>이름</th>
                <th>종류</th>
                <th>품종</th>
                <th>성별</th>
                <th>생일</th>
                <th>특이사항</th>
                <th>메뉴</th>
            </tr>
            <c:forEach var="pet" items="${petList}">
                <tr>
                    <c:if test="${pet.pet_photo != null}">
                        <td><img class="profile" src="${path}/upload/${pet.pet_photo}" height="200" width="200"/></td>
                    </c:if>
                    <c:if test="${pet.pet_photo == null}">
                        <td></td>
                    </c:if>
                    <td>${pet.pet_name}</td>
                    <td>${pet.pet_sort}</td>
                    <td>${pet.pet_kind}</td>
                    <td>${pet.pet_gender}</td>
                    <td>${pet.pet_birth}</td>
                    <td>${pet.pet_info}</td>
                    <td>
                        <div class="input-group">
                            <input type="button" class="btn btn-outline-secondary" value="수정"
                                   onclick = "location.href ='${path}/petUpdateForm?pet_no=${pet.pet_no}'">
                            <input type="button" class="btn btn-outline-secondary" value="삭제"
                                   onclick = "location.href = '${path}/deletePet?pet_no=${pet.pet_no}'">
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</section>
<section class="py-5">
    <div class="container">
        <h2 class="body-title">결제 내역</h2>
        <c:choose>
            <c:when test="${empty orderList}">
            <table class="table">
                <tr>
                    <th>주문번호</th>
                    <th>상품명</th>
                    <th>결제 일시</th>
                    <th>총 결제금액</th>
                </tr>
                <tr>
                    <td colspan="4">
                        결제가 완료된 상품이 없습니다.
                    </td>
                </tr>
            </table>
            </c:when>
            <c:otherwise>
                <table class="table">
                    <tr>
                        <th>주문번호</th>
                        <th>상품명</th>
                        <th>결제 일시</th>
                        <th>총 결제금액</th>
                    </tr>
                    <c:forEach var="row" items="${orderList}" varStatus="i">
                        <c:choose>
                            <c:when test="${row.ord_step eq '주문취소'}">
                                <tr><td colspan="4"> 취소된 주문입니다.</td></tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td>${row.o_no}</td>
                                    <td><a href = "${path}/orderDetail?o_no=${row.o_no}"> ${row.pro_name} </a>
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${row.ord_regdate}" pattern="yyyy-MM-dd HH:mm"/>
                                    </td>
                                    <td>${row.ord_price}</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </table>

            </c:otherwise>
        </c:choose>
    </div>
</section>

<%@ include file="../layout/footer.jsp" %>