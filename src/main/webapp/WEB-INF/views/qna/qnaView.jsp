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
			<td>${qna.qna_writer}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${qna.qna_readcnt}</td>
		</tr>
<%-- 		<tr>
			<td>
			<c:if test="${empty qna.qna_file}">
       			&nbsp;
       			</c:if> 
       			<c:if test="${!empty qna.qna_file}">
				<img src="${path}/upload/qna/${qna.qna_file}"
						height="100" width="100" />
				</c:if>
			</td>
		</tr> --%>
		<tr>
			<td><pre>${qna.qna_content}</pre></td>
		</tr>
	</table>

	<!-- 질문 : 사용자 -->
	<div id="login_menu" class="body-menu">
	
<%-- 	<c:if test="${!empty list && !empty sessionScope.id}">
	<c:forEach var="qnaMember" items="${list }"> --%>
		<c:if test="${sessionScope.role == 'great_manager'}"><!-- and 관리자 -->
		<!-- 답글 -->		 
		<input type="submit" class="form-control" value="답글" onClick="location.href='qnaReplyForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		<!-- 수정 -->
		<input type="submit" class="form-control" value="수정" onClick="location.href='qnaUpdateForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		<input type="submit" class="form-control" value="삭제" onClick="location.href='qnaDelete?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		</c:if>
<%-- 	</c:forEach> --%>
			
		<%-- <c:if test="${sessionScope.id == qna.qna_writer}"> --%><!-- and 사용자 -->
		<c:if test="${sessionScope.role == 'user' && sessionScope.id == qna.qna_writer}"><!-- and 사용자 -->
		<!-- 수정, 삭제 -->
		<input type="submit" class="form-control" value="수정" onClick="location.href='qnaUpdateForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		<input type="submit" class="form-control" value="삭제" onClick="location.href='qnaDelete?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		</c:if>
	<%-- </c:if> --%>
		
	
		
		<!-- 전체 : 목록으로 -->
		<input type="submit" class="form-control" value="목록" onClick="location.href='qnaList?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
	<%-- </c:if> --%>
	
	<!-- 답변  -->
	<%-- <c:if test="${qna.qna_lev == odd}"> --%>
		<%-- <c:if test="${sessionScope.id == qna.qna_writer}"><!-- and 관리자 -->
		<!-- 수정, 삭제 -->
		<input type="submit" value="수정" class="form-control" onClick="location.href='qnaUpdateForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		<input type="submit" value="삭제" class="form-control" onClick="location.href='qnaDelete?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		</c:if> --%>
		
		<%-- <c:if test="${sessionScope.id == qna.qna_writer}"><!-- and 사용자 -->
		<!-- 답변 -->
		<input type="submit" class="form-control" value="답글" onClick="location.href='qnaReplyForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		</c:if> 
		<!-- 전체 : 목록으로 -->
		<input type="submit" class="form-control" value="목록" onClick="location.href='qnaList?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' "> --%>
	<%-- </c:if> --%>
	
	</div>
	</div>
</section>
	
<%@ include file="../layout/footer.jsp"%>