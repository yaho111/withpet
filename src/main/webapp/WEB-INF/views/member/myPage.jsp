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
        <table class="table">
            <tr>
                <strong>${member.name}</strong> 님 페이지
            </tr>
            <tr>
                <th>프로필</th>
                <td>
                    <c:if test="${member.profile == null}">

                    </c:if>
                    <c:if test="${member.profile != null}">
                        <img src="${path}/upload/${member.profile}" width="100" height="100"/>
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
            <input class="btn btn-outline-secondary" type="button" value="펫 등록"
                   onclick="location.href='petEnrollForm'">
            <input class="btn btn-outline-secondary" type="button" value="사업자 등록"
                   onclick="location.href='businessEnrollForm'">
            <input class="btn btn-outline-secondary" type="button" value="내 사업"
                   onclick="location.href='businessList'">
            <input class="btn btn-outline-secondary" type="button" value="정보 수정"
                   onclick="location.href='infoUpdateForm'">
            <input class="btn btn-outline-secondary" type="button" value="회원 탈퇴"
                   onclick="location.href='memberDeleteForm'">
        </div>
    </div>
</section>

<%@ include file="../layout/footer.jsp" %>