<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 게시판</title>

<style type="text/css">
	a {text-decoration:none}
</style>

</head>
<body>

	<table border="1" width=900 align="center">
		<caption>
			<h2>동물병원 게시판</h2>
		</caption>
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
						<img src="${path}/hos_upload/hospitalimage.png" height="130" width="130" />
					</c:if>
					<c:if test="${not empty hospital.hos_file}">
						<img src="${path}/hos_upload/${hospital.hos_file}" height="130" width="130" />
					</c:if>
						</td>
					<td><a
						href="hospitalView?hos_no=${hospital.hos_no}&page=${pp.currentPage}">
							${hospital.hos_name}</a></td>
					<td>${hospital.hos_addr}</td>
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
		<input type="hidden" name="page" value="1"> <select
			name="search">
			<option value="subject"
				<c:if test="${search=='subject'}">selected="selected" </c:if>>병원
				이름</option>
			<option value="content"
				<c:if test="${search=='content'}">selected="selected" </c:if>>내용</option>
			<option value="writer"
				<c:if test="${search=='writer'}">selected="selected" </c:if>>작성자</option>
			<option value="subcon"
				<c:if test="${search=='subcon'}">selected="selected" </c:if>>병원
				이름+내용</option>
		</select> <input type="text" name="keyword"> <input type="submit"
			value="확인">
	</form>
	<br>
	<a href="insertForm">글쓰기</a><br>

	<div align=center>
	<!-- 검색했을 경우의 페이징 처리 -->
	<c:if test="${not empty keyword}">
			<a href="hospitalList?page=1&search=${search}&keyword=${keyword}"> << </a>
		<c:if test="${pp.startPage > pp.pagePerBlk}">
			<a href="hospitalList?page=${pp.startPage - 1}&search=${search}&keyword=${keyword}"> < </a>
		</c:if>
		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<c:if test="${pp.currentPage==i}">${i}</c:if>
			<c:if test="${pp.currentPage!=i}"><a href="hospitalList?page=${i}&search=${search}&keyword=${keyword}">${i}</a></c:if>		
		</c:forEach>
		<c:if test="${pp.endPage < pp.totalPage}">
			<a href="hospitalList?page=${pp.endPage + 1}&search=${search}&keyword=${keyword}"> > </a>
		</c:if>
			<a href="hospitalList?page=${pp.totalPage}&search=${search}&keyword=${keyword}"> >> </a>
	</c:if>

	<!-- 전체 목록의 페이징 처리 -->
	<c:if test="${empty keyword}">
			<a href="hospitalList?page=1"> << </a>
		<c:if test="${pp.startPage > pp.pagePerBlk}">
			<a href="hospitalList?page=${pp.startPage - 1}"> < </a>
		</c:if>
		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<c:if test="${pp.currentPage==i}">${i}</c:if>
			<c:if test="${pp.currentPage!=i}"><a href="hospitalList?page=${i}">${i}</a></c:if>
		</c:forEach>
		<c:if test="${pp.endPage < pp.totalPage}">
			<a href="hospitalList?page=${pp.endPage + 1}"> > </a>
		</c:if>
			<a href="hospitalList?page=${pp.totalPage}"> >> </a>
	</c:if>
	</div>
	
</body>
</html>