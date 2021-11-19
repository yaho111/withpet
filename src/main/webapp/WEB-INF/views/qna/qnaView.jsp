<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>With Pet Q/A</title>
</head>
<body>
	<table>
		<tr>
			<td>제목</td>
			<td>${qna.qna_title}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${qna.qna_writer}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${qna.qna_readcnt}</td>
		</tr>
		<tr>
			<td>
			<c:if test="${empty qna.qna_file}">
       			&nbsp;
       			</c:if> 
       			<c:if test="${!empty qna.qna_file}">
				<img src="${path}/qnaupload/${qna.qna_file}"
						height="100" width="100" />
				</c:if>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><pre>${qna.qna_content}</pre></td>
		</tr>
	</table>
	
<%-- 	<c:if test="관리자  세션">
	답변, 삭제
	</c:if>
	<c:if test="작성자 세션">
	답변, 수정, 삭제
	</c:if>
	<c:if test="작성자외 세션">
	X
	</c:if> --%>
	
	<!-- 답글 -->
	<a href="qnaReplyForm"> 답글 </a>
	<!-- 수정 -->
	<a href="qnaUpdateForm"> 수정 </a>
	<!-- 삭제 -->
	<a href="qnaDeleteForm"> 삭제 </a>
	<!-- 목록으로 -->
	<a href="qnaList?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}"> 목록으로 </a>
	
	
	
<%-- <%@ include file="../layout/footer.jsp"%> --%>
</body>
</html>