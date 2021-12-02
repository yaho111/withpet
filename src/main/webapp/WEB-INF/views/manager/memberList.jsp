<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<script>
$(function() {
		$('#memberListPage').load('${path}/memberListPage') // 리스트를 불러온다. 
		
	});
</script>



<!-- 회원 유형이 일반 회원만 보이도록 설정해야함 -->

<section class="py-5">
    <div class="container">

<div id="memberListPage"></div>

</div>
</section>
<%@ include file="../layout/footer.jsp"%>