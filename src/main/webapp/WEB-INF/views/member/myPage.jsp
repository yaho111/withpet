<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-19
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp"%>

<div class="container">
    <div class="row">
        ${member.name}님 페이지
    </div>
    <div class="row">
        <div class="col">
            프로필
        </div>
        <div class="col">
            ${member.profile}
        </div>
    </div>
    <div class="row">
        <div class="col">
            이메일
        </div>
        <div class="col">
            ${member.email}
        </div>
    </div>
    <div class="row">
        <div class="col">
            연락처
        </div>
        <div class="col">
            ${member.phone}
        </div>
    </div>
    <div class="row">
        <div class="col">
            가입일
        </div>
        <div class="col">
            <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${member.regdate}" />

        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp"%>