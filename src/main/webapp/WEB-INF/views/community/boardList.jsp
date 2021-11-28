<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>



	<a href="boardForm">글작성</a> 글갯수 : ${paging.total}
	<table border=1 align="center" width=800 class="table table-striped">
		<caption>커뮤니티 게시판 목록</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>추천수</th>
		</tr>

	    <c:if test="${empty list}">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>


		<c:if test="${not empty list}">
			
			<!-- 화면 출력 번호  변수 정의 -->
			<!--   <c:set var="pp" value="${listcount-(page-1)*10 }" />-->
		
			<c:set var="com_no1" value="${com_no}"/>	
			
			<!-- 반복문 시작 -->
			<c:forEach var="community" items="${list }">
				<tr> 
		
					<th>		
						${com_no1}											
					
					<c:set var="com_no1" value="${com_no1-1}"/>	
					</th>
					<th>					
						<div align="center">
							<a href="boardContent?com_no=${community.com_no}&page=${currentPage}">
								${community.com_title} </a>
						</div>
					</th>
					<th>${community.com_writer}</th>
					<th><fmt:formatDate value="${community.com_reg}" pattern="YYYY/MM/dd EEE요일"/></th>
					<th>${community.com_readcnt}</th>
				    <th>${community.com_likecnt}</th>     
				</tr>
			</c:forEach>
		</c:if>
	</table>	
	<!-- 목록 끝 -->

	<form action="boardList" align="center">
		<input type="hidden" name="pageNum" value="1"> 
		<select	name="search">
			<option value="com_title"
				<c:if test="${search=='com_title'}">selected="selected" </c:if>>제목</option>
			<option value="com_content"
				<c:if test="${search=='com_content'}">selected="selected" </c:if>>내용</option>
			<option value="com_writer"
				<c:if test="${search=='com_writer'}">selected="selected" </c:if>>작성자</option>

		</select> <input type="text" name="keyword"> 
		<input type="submit" value="확인">
	</form>

	<ul class="pagination" style="text-align:center">
			<!-- 검색 했을 경우의 페이징 처리 -->
			<c:if test="${not empty keyword}">
				<c:if test="${startPage > 10 }">
					<li><a
						href="boardList?pageNum=${startPage - 1}&search=${search}&keyword=${keyword}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li <c:if test="${currentPage==i}">class="active"</c:if>><a
						href="boardList?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a></li>
				</c:forEach>
				<c:if test="${endPage < totalPage}">
					<li><a
						href="boardList?pageNum=${endPage + 1}&search=${search}&keyword=${keyword}">다음</a></li>
				</c:if>
			</c:if>
			
			<!-- 전체 목록의 페이징 처리 -->
			<c:if test="${empty keyword}">
				<c:if test="${startPage > 10 }">
					<li><a href="boardList?pageNum=${startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li <c:if test="${currentPage==i}">class="active"</c:if>>
						<a href="boardList?pageNum=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${endPage < totalPage}">
					<li><a href="boardList?pageNum=${endPage + 1}">다음</a></li>
				</c:if>
			</c:if>
	</ul>

		
</body>
  </html>

	<%@ include file="../layout/footer.jsp"%>
	
		<!-- jquery -->
<script type="text/javascript" src="jquery-3.4.1.min.js" ></script>
<!-- ckeditor 4 -->
<link rel="stylesheet" href="${path}//ckeditor/contents.css"> <%--content에 ckeditro 걸어두기--%>
<!-- <script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script> -->

<script type="text/javascript" src="${path}/ckeditor/ckeditor.js" ></script>
	
