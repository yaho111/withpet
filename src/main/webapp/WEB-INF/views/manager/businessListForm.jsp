<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<script>
$(function() {
	$('#businessListPage').load('${path}/businessListPage') // 리스트를 불러온다. 
	$('#selectWaitAccept').load('${path}/selectWaitAccept?bus_no=${business.bus_no}') // 리스트를 불러온다. 
	
});
</script>

<section class="py-5">
	<div class="container">
	
	<input type="submit" value="관리자 메인 페이지" onclick="location.href='manager'" class="form-control">

		<!-- 검색 기능 -->
		<form action="businessListPage">
			<!-- 검색 리스트 요청 -->
			<input type="hidden" name="pageNum" value="1">
			<!-- pageNum, search, keyword 값전달 -->
			<select name="search" class="form-select">
				<option value="id"
					<c:if test="${search=='id'}">selected="selected" </c:if>>아이디</option>
				<option value="name"
					<c:if test="${search=='이름'}">selected="selected" </c:if>>이름</option>
			</select> 
			<input type="text" name="keyword" class="form-control">
			<input type="submit" value="확인" class="form-control">
		</form>
		<br> <br>
		<!-- 글 검색 끝 -->


	<div id="businessListPage"></div>
	<br>
	<div id="selectWaitAccept"></div>
		
	</div>
	</section>
<%@ include file="../layout/footer.jsp"%>