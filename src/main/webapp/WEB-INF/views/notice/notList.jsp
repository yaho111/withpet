<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

		<!-- 글작성 버튼 -->
		<br> <a href="noticeInsertForm">글작성</a> <br>
	<div align="center">

		<!-- 목록 -->
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

				<!-- 화면 출력 번호  변수 정의 -->
				<c:set var="no" value="${no}"></c:set>

				<!-- 반복문 시작 -->
				<c:forEach var="notice" items="${list}">
					<tr>
						<th>${no}
						</th>
						<th>
						<a href="noticeView?not_no=${notice.not_no}&pageNum=${paging.currentPage}">
								${notice.not_title} </a>
						</th>
						<th>${notice.not_writer}</th>
						<th><fmt:formatDate value="${notice.not_reg}" pattern="yyyy/MM/dd HH:mm:ss EEE요일" /></th>
						<th>${notice.not_readcnt}</th>
					</tr>
					<c:set var="no" value="${no-1}" />
				</c:forEach>
			</c:if>
		</table>
		<!-- 목록 끝 -->
	</div>
	
	
	<div align="center">
	<!-- 검색 기능 -->
	<form action="noticeList">
		<!-- 검색 리스트 요청 -->
		<input type="hidden" name="pageNum" value="1">
		<!-- pageNum, search, keyword 값전달 -->
		<select name="search">
			<option value="not_title"
				<c:if test="${search=='not_title'}">selected="selected" </c:if>>제목</option>
			<option value="not_content"
				<c:if test="${search=='not_content'}">selected="selected" </c:if>>내용</option>
			<!-- DTO와 변수이르밍 같아야함 -->
			<option value="subcon"
				<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
		</select> <input type="text" name="keyword">
		<!-- dto -->
		<input type="submit" value="확인">
	</form>
	<!-- 글 검색 끝 -->	
	</div>
	
	<div align="center">
	<!-- 검색 했을 경우의 페이징 처리 -->
	<c:if test="${not empty keyword}">

		<!-- 1페이지로 이동 -->
		<c:if test="${paging.currentPage!=1}">
			<a href="noticeList?pageNum=1&search=${search}&keyword=${keyword}">
				<< </a>
		</c:if>
		&nbsp;
		
		<!-- 이전 블록이동 -->
		<c:if test="${paging.startPage > paging.rowPerPage }">
			<a
				href="noticeList?pageNum=${paging.startPage - 1}&search=${search}&keyword=${keyword}">
				< </a>
		</c:if>
		&nbsp;

		<!-- 번호 -->
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
			<c:if test="${paging.currentPage==i}">${i}</c:if>
			<c:if test="${paging.currentPage!=i}">
				<a href="noticeList?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a>
			</c:if>
		</c:forEach>

		<!-- 다음 블록으로 이동 -->
		<c:if test="${paging.endPage < paging.totalPage}">
			<a
				href="noticeList?pageNum=${paging.endPage + 1}&search=${search}&keyword=${keyword}">
				> </a>
		</c:if>
		&nbsp;

		<!-- 마지막 페이지 이동 -->
		<c:if test="${paging.currentPage!=paging.totalPage}">
			<a
				href="noticeList?pageNum=${paging.totalPage}&search=${search}&keyword=${keyword}">
				>> </a>
		</c:if>

	</c:if>
	
	<!-- 전체 목록의 페이징 처리 -->
	<c:if test="${empty keyword}">
		<!-- 1페이지로 이동 -->
		<c:if test="${paging.currentPage!=1}">
			<a href="noticeList?pageNum=1"> << </a>
		</c:if>
		&nbsp;
	
		<!-- 이전 블록이동 -->
		<c:if test="${paging.startPage > paging.rowPerPage}">
			<a href="noticeList?pageNum=${paging.startPage - 1}"> < </a>
		</c:if>
		&nbsp;

		<!-- 번호 -->
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
			<c:if test="${paging.currentPage==i}">${paging.currentPage}</c:if>
			<c:if test="${paging.currentPage!=i}">
				<a href="noticeList?pageNum=${i}">${i}</a>
			</c:if>
		</c:forEach>
		&nbsp;

		<!-- 다음 블록으로 이동 -->
		<c:if test="${paging.endPage < paging.totalPage}">
			<a href="noticeList?pageNum=${paging.endPage + 1}"> > </a>
		</c:if>
		&nbsp;

		<!-- 마지막 페이지 이동 -->
		<c:if test="${paging.currentPage!=paging.totalPage}">
			<a href="noticeList?pageNum=${paging.totalPage}"> >> </a>
		</c:if>

	</c:if>
	</div>

<%@ include file="../layout/footer.jsp"%>