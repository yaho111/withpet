<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>

	<a href="/boardForm">글작성</a> 글갯수 : ${listcount}
	<table border=1 align="center" width=800>
		<caption>커뮤니티 게시판 목록</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>

		<!-- 화면 출력 번호  -->
		<c:set var="num" value="${listcount-(page-1)*10 }" />

		<c:forEach var="board" items="${boardList}">

			<tr>
				<td>${num}<c:set var="num" value="${num-1}" />
				</td>
				<td><a href="/boardContent?no=${board.com_no}&page=${page}">
						${board.com_title} </a></td>
				<td>${board.com_writer}</td>
				<td><fmt:formatDate value="${board.com_reg}"
						pattern="yyyy-MM-dd" /> </td>
				<td>${board.com_readcnt }</td>
			</tr>
		</c:forEach>
	</table>


	<!-- 페이지 처리 -->
	<center>
		<c:if test="${listcount > 0}">

			<!-- 1page로 이동 -->
			<a href="/boardList?page=1" style="text-decoration: none"> < </a>

			<!-- 이전 블럭으로 이동 -->
			<c:if test="${startPage > 10 }">
				<a href="/boardList?page=${startPage-10 }">[이전]</a>
			</c:if>

			<!-- 각 블럭에 10개의 페이지 출력 -->
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == page }">
					<!-- 현재 페이지 -->
			[${i}]
		</c:if>
				<c:if test="${i != page }">
					<!-- 현재 페이지가 아닌 경우 -->
					<a href="/boardList?page=${i}">[${i}]</a>
				</c:if>
			</c:forEach>

			<!-- 다음 블럭으로 이동 -->
			<c:if test="${endPage < pageCount }">
				<a href="/boardList?page=${startPage+10}">[다음]</a>
			</c:if>

			<!-- 마지막 페이지로 이동 -->
			<a href="/boardList?page=${pageCount }" style="text-decoration: none">
				> </a>

		</c:if>
	</center>





</body>
</html>