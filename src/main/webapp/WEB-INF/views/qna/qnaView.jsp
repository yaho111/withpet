<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>



<!-- 비밀 글입니다. 구현 필요 -->
<section class="py-5">
    <div class="container">

	<table class="table">
		<tr>
			<th>제목</th>
			<td>${qna.qna_title}</td>
		</tr>
		<tr>
			<th>작성자</th>
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
			<th>조회수</th>
			<td>${qna.qna_readcnt}</td>
		</tr>
		<tr>
			<th></th>
			<td><pre>${qna.qna_content}</pre></td>
		</tr>
	</table>

<br>

	<!-- 질문 : 사용자 -->
	
	<div id="login_menu" class="body-menu">
	<c:if test="${qna.qna_lev == 0}"><!-- 원문 -->
		<!-- 관리자 -->
		<c:if test="${sessionScope.role == 'qna' || 
                      sessionScope.role == 'master' || sessionScope.role == 'notice' || 
                      sessionScope.role == 'community' || sessionScope.role == 'hospital' || sessionScope.role == 'product'}">
	 	<input type="submit" class="btn btn-outline-secondary" value="답글" onClick="location.href='qnaReplyForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		<input type="submit" class="btn btn-outline-secondary" value="수정" onClick="location.href='qnaUpdateForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		<input type="submit" class="btn btn-outline-secondary" value="삭제" onClick="deleteCheck()">
		</c:if>

		<!-- 사용자 -->
		<c:if test="${sessionScope.id == qna.qna_writer}">
		<input type="submit" class="btn btn-outline-secondary" value="수정" onClick="location.href='qnaUpdateForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		<input type="submit" class="btn btn-outline-secondary" value="삭제" onClick="deleteCheck()">
		</c:if>
	</c:if>
	<c:if test="${qna.qna_lev != 0}"><!-- 답글 -->
		<c:if test="${sessionScope.role == 'qna' || 
                      sessionScope.role == 'master' || sessionScope.role == 'notice' || 
                      sessionScope.role == 'community' || sessionScope.role == 'hospital' || sessionScope.role == 'product'}">
        <input type="submit" class="btn btn-outline-secondary" value="수정" onClick="location.href='qnaUpdateForm?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
		<input type="submit" class="btn btn-outline-secondary" value="삭제" onClick="deleteCheck()">
        </c:if>
	</c:if>
		<!-- 전체 : 목록으로 -->
		<input type="submit" class="btn btn-outline-secondary" value="목록" onClick="location.href='qnaList?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}' ">
	
	</div>
	
	</div>
</section>

<script>
	function deleteCheck() {
		if (confirm("정말로 삭제하시겠습니까?") == true) { // 확인
			location.href="qnaDelete?pageNum=${paging.currentPage}&qna_no=${qna.qna_no}"
		} else { // 취소
			alert("취소되었습니다.");
			return false;
		}
	}
</script>

<%@ include file="../layout/footer.jsp"%>