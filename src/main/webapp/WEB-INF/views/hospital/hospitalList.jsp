<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp"%>

<style type="text/css">
	a {text-decoration:none}
</style>

<%--@ include file="../sort.jsp" --%>

	<table border="1" width=900 align="center">
		
			<h3 align="center">동물병원 게시판</h3>
		
		<tr>
			<th>번호</th>
			<th colspan=2>동물병원 이름</th>
			<th>위치</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="6">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list}">
			<c:set var="no1" value="${no}"></c:set>
			<c:forEach var="hospital" items="${list}">
				<tr>
					<td>${no1}</td>
					
					<td align="center">
					<c:if test="${empty hospital.hos_file}">
						<img src="${path}/hos_upload/hospitalimg.jpg" height="130" width="130" />
					</c:if>
					<c:if test="${not empty hospital.hos_file}">
						<img src="${path}/hos_upload/${hospital.hos_file}" height="130" width="130" />
					</c:if>
						</td>
					<td><a
						href="hospitalView?hos_no=${hospital.hos_no}&page=${paging.currentPage}">
							${hospital.hos_name}</a></td>
					<td>${hospital.hos_loc}</td>
					<td>${hospital.hos_writer}</td>
					<td>${hospital.hos_reg}</td>
					<td>${hospital.hos_readcnt}</td>
				</tr>
				<c:set var="no1" value="${no1 - 1}" />
			</c:forEach>
		</c:if>
	</table>
	<p></p>
	<form action="hospitalList" align=center>
		<input type="hidden" name="page" value="1">
		<select name="search">
			<option value="hos_name"
				<c:if test="${search=='hos_name'}">selected="selected" </c:if>>병원 이름</option>
			<option value="hos_loc"
				<c:if test="${search=='hos_loc'}">selected="selected" </c:if>>위치</option>
			<option value="hos_content"
				<c:if test="${search=='hos_content'}">selected="selected" </c:if>>내용</option>
			<option value="hos_writer"
				<c:if test="${search=='hos_writer'}">selected="selected" </c:if>>작성자</option>
		</select> 
			
		<input type="text" name="keyword" value="${keyword}"> <input type="submit" value="확인">
	</form>
	<br>
	<a href="insertForm">글쓰기</a><br>

	<div align=center>
	<!-- 검색했을 경우의 페이징 처리 -->
	<c:if test="${not empty keyword}">
	
		<!-- 1 페이지로 이동 -->
		<c:if test="${paging.startPage > 10}">
			<a href="hospitalList?page=1&search=${search}&keyword=${keyword}"> << </a>
		</c:if>
		
		<!-- 이전 블럭으로 이동 -->
		<c:if test="${paging.startPage > paging.pagePerBlk}">
			<a href="hospitalList?page=${paging.startPage - 1}&search=${search}&keyword=${keyword}"> < </a>
		</c:if>
		
		<!-- 페이지 번호 -->
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
			<c:if test="${paging.currentPage==i}">${i}</c:if>
			<c:if test="${paging.currentPage!=i}"><a href="hospitalList?page=${i}&search=${search}&keyword=${keyword}">${i}</a></c:if>		
		</c:forEach>
		
		<!-- 다음 블럭으로 이동 -->
		<c:if test="${paging.endPage < paging.totalPage}">
			<a href="hospitalList?page=${paging.endPage + 1}&search=${search}&keyword=${keyword}"> > </a>
		</c:if>
		
		<!-- 마지막 페이지로 이동 -->
		<c:if test="${paging.endPage < paging.totalPage}">
			<a href="hospitalList?page=${paging.totalPage}&search=${search}&keyword=${keyword}"> >> </a>
		</c:if>
	</c:if>

	<!-- 전체 목록의 페이징 처리 -->
	<c:if test="${empty keyword}">
		
		<!-- 1 페이지로 이동 -->
		<c:if test="${paging.startPage > 10}">
			<a href="hospitalList?page=1"> << </a>
		</c:if>
		
		<!-- 이전 블럭으로 이동 -->
		<c:if test="${paging.startPage > paging.pagePerBlk}">
			<a href="hospitalList?page=${paging.startPage - 1}"> < </a>
		</c:if>
		
		<!-- 페이지 번호 -->
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
			<c:if test="${paging.currentPage==i}">${i}</c:if>
			<c:if test="${paging.currentPage!=i}"><a href="hospitalList?page=${i}">${i}</a></c:if>
		</c:forEach>
		
		<!-- 다음 블럭으로 이동 -->
		<c:if test="${paging.endPage < paging.totalPage}">
			<a href="hospitalList?page=${paging.endPage + 1}"> > </a>
		</c:if>
		
		<!-- 마지막 페이지로 이동 -->
		<c:if test="${paging.endPage < paging.totalPage}">
			<a href="hospitalList?page=${paging.totalPage}"> >> </a>
		</c:if>
	</c:if>
	</div>

<%@ include file="../layout/footer.jsp"%>