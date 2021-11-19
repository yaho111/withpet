<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>WithPet</title>
<!-- <link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
	$(function() {
		$("#accordion").accordion({
			collapsible : true
		});
	});
</script>  아코디언 -->
</head>
<body>

	총 질문 갯수 = ${qna.totalData}
	<br>
	<a href="qnaInsertForm">글작성</a>
	<br>


	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>

		<c:if test="${empty list}">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>

		
		<c:if test="${not empty list}">
			<c:set var="no" value="${no}"></c:set>
			<c:forEach var="qna" items="${list }">
						<tr>
							<th>${no}</th>
							<th><a
								href="qnaView?qna_no=${qna.qna_no}&pageNum=${paging.currentPage}">
									${qna.qna_title} </a></th>
							<th>${qna.qna_writer}</th>
							<th>${qna.qna_reg}</th>
							<th>${qna.qna_readcnt}</th>
						</tr>
				<c:set var="no" value="${no - 1}" />
			</c:forEach>
		</c:if>

	</table>


	<!-- 검색 기능 -->
	<form action="qnaList">
		<!-- 검색 리스트 요청 -->
		<input type="hidden" name="pageNum" value="1">
		<!-- pageNum, search, keyword 값전달 -->
		<%-- 		<select name="boardSelect">
			<option value="allBoard"
			 	<c:if test="${boardSelect=='allBoard'}">selected="selected" </c:if> >게시판 전체</option>
			<option value="hospital"
				<c:if test="${boardSelect=='hospital'}">selected="selected" </c:if>>병원</option>
			<option value="community"
				<c:if test="${boardSelect=='community'}">selected="selected" </c:if>>커뮤니티</option>
			<option value="product"
				<c:if test="${boardSelect=='product'}">selected="selected" </c:if>>쇼핑몰</option>
			<option value="member"
				<c:if test="${boardSelect=='member'}">selected="selected" </c:if>>회원</option>
		</select>  --%>
		<select name="search">
			<option value="qna_title"
				<c:if test="${search=='qna_title'}">selected="selected" </c:if>>제목</option>
			<option value="qna_content"
				<c:if test="${search=='qna_content'}">selected="selected" </c:if>>내용</option>
			<!-- DTO와 변수이르밍 같아야함 -->
			<option value="subcon"
				<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
		</select> <input type="text" name="keyword">
		<!-- dto -->
		<input type="submit" value="확인">
	</form>



	<!-- 검색 했을 경우의 페이징 처리 -->
	<c:if test="${not empty keyword}">

		<!-- 1페이지로 이동 -->
		<c:if test="${paging.currentPage!=1}">
			<a href="qnaList?pageNum=1&search=${search}&keyword=${keyword}">
				<< </a>
		</c:if>

		<!-- 이전 블록이동 -->
		<c:if test="${paging.startPage > paging.block }">
			<a
				href="qnaList?pageNum=${paging.startPage - 1}&search=${search}&keyword=${keyword}">
				< </a>
		</c:if>

		<!-- 번호 -->
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
			<c:if test="${paging.currentPage==i}">${i}</c:if>
			<c:if test="${paging.currentPage!=i}">
				<a href="qnaList?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a>
			</c:if>
		</c:forEach>

		<!-- 다음 블록으로 이동 -->
		<c:if test="${paging.endPage < paging.allPage}">
			<a
				href="qnaList?pageNum=${paging.endPage + 1}&search=${search}&keyword=${keyword}">
				> </a>
		</c:if>

		<!-- 마지막 페이지 이동 -->
		<c:if test="${paging.currentPage!=paging.allPage}">
			<a
				href="qnaList?pageNum=${paging.allPage}&search=${search}&keyword=${keyword}">
				>> </a>
		</c:if>

	</c:if>

	<!-- 전체 목록의 페이징 처리 -->
	<c:if test="${empty keyword}">
		<!-- 1페이지로 이동 -->
		<c:if test="${paging.currentPage!=1}">
			<a href="qnaList?pageNum=1"> << </a>
		</c:if>

		<!-- 이전 블록이동 -->
		<c:if test="${paging.startPage > paging.block}">
			<a href="qnaList?pageNum=${paging.startPage - 1}"> < </a>
		</c:if>

		<!-- 번호 -->
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
			<c:if test="${paging.currentPage==i}">${paging.currentPage}</c:if>
			<c:if test="${paging.currentPage!=i}">
				<a href="qnaList?pageNum=${i}">${i}</a>
			</c:if>
		</c:forEach>

		<!-- 다음 블록으로 이동 -->
		<c:if test="${paging.endPage < paging.allPage}">
			<a href="qnaList?pageNum=${paging.endPage + 1}"> > </a>
		</c:if>

		<!-- 마지막 페이지 이동 -->
		<c:if test="${paging.currentPage!=paging.allPage}">
			<a href="qnaList?pageNum=${paging.allPage}"> >> </a>
		</c:if>

	</c:if>

<%-- 	<%@ include file="../layout/footer.jsp"%> --%>
</body>
</html>