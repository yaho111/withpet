<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<!-- 비밀 글입니다. 구현 필요 -->

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
				<img src="${path}/upload/qna/${qna.qna_file}"
						height="100" width="100" />
				</c:if>
			</td>
		</tr>
		<tr>
			<td><pre>${qna.qna_content}</pre></td>
		</tr>
	</table>
	
<%-- 
	<c:if test="${qna_lev == 짝수}">
		<c:if test="관리자  세션">
		답변, 삭제
		</c:if>
		<c:if test="작성자 세션">
		답변, 수정, 삭제
		</c:if>
		<c:if test="작성자외 세션">
		X
		</c:if> 
	<c:if test="${qna_lev == 홀수}">
		<c:if test="관리자  세션">
		수정, 삭제
		</c:if>
		<c:if test="작성자 세션">
		x
		</c:if>
		<c:if test="작성자외 세션">
		X
		</c:if> 
	
	--%>
	
	<!-- 답글 -->
	<%-- <a href="qnaReplyForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}"> 답글 </a> --%>
	<input type="submit" value="답글" onClick="location.href='qnaReplyForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
	<!-- 수정 -->
	<%-- <a href="qnaUpdateForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}"> 수정 </a> --%>
	<input type="submit" value="수정" onClick="location.href='qnaUpdateForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
	<!-- 삭제 -->
	<%-- <a href="qnaDelete?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}"> 삭제 </a> --%>
	<input type="submit" value="삭제" onClick="location.href='qnaDelete?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
	<!-- 목록으로 -->
	<%-- <a href="qnaList?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}"> 목록으로 </a> --%>
	<input type="submit" value="목록" onClick="location.href='qnaList?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
	
<%@ include file="../layout/footer.jsp"%>