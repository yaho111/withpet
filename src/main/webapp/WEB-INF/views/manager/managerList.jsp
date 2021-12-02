<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script>
$(function() {
		$('#managerListPage').load('${path}/managerListPage') // 리스트를 불러온다. 
		
	});
</script>

<section class="py-5">
	<div class="container">

		
	<div id="managerListPage"></div>
		
		
	</div>
</section>
<%@ include file="../layout/footer.jsp"%>