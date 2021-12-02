<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>



<!-- 비밀 글입니다. 구현 필요 -->
<section class="py-5">
    <div class="container">

	<table class="table">
		<tr>
			<td>제목</td>
			<td>${qna.qna_title}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>
			<c:if test="${qna.qna_lev == 0}">
			${qna.qna_writer}
			</c:if>
			<c:if test="${qna.qna_lev != 0}">
			관리자
			</c:if>
			</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${qna.qna_readcnt}</td>
		</tr>
		<tr>
			<td><pre>${qna.qna_content}</pre></td>
		</tr>
	</table>

<br>

	<!-- 질문 : 사용자 -->
	
	<div id="login_menu" class="body-menu">
	

		<c:if test="${sessionScope.role == 'master'}"><!-- and 관리자 -->
		<!-- 답글 -->		 
		<input type="submit" class="btn btn-outline-secondary" value="답글" onClick="location.href='qnaReplyForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		<!-- 수정 -->
		<input type="submit" class="btn btn-outline-secondary" value="수정" onClick="location.href='qnaUpdateForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		<input type="submit" class="btn btn-outline-secondary" value="삭제" onClick="location.href='qnaDelete?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		</c:if>

		<c:if test="${sessionScope.role == 'user' && sessionScope.id == qna.qna_writer}"><!-- and 사용자 -->
		<!-- 수정, 삭제 -->
		<input type="submit" class="btn btn-outline-secondary" value="수정" onClick="location.href='qnaUpdateForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		<input type="submit" class="btn btn-outline-secondary" value="삭제" onClick="location.href='qnaDelete?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		</c:if>
	
		<!-- 전체 : 목록으로 -->
		<input type="submit" class="btn btn-outline-secondary" value="목록" onClick="location.href='qnaList?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
	
	</div>
	</div>
</section>
	
<%@ include file="../layout/footer.jsp"%>