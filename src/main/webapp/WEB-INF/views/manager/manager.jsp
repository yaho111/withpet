<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<section class="py-5">
    <div class="container-body">


<h3 align="center">${sessionScope.id}님 환영합니다.</h3>
<input type="submit" value="회원 목록" onclick="location.href='memberList'" class="form-control">
<input type="submit" value="관리자 목록" onclick="location.href='managerList'" class="form-control">
<input type="submit" value="사업자 목록" onclick="location.href='businessListForm'" class="form-control">




    </div>
</section>
<%@ include file="../layout/footer.jsp"%>