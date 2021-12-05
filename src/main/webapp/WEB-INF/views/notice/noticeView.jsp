<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<script type="text/javascript">
	/* 	window.onload=function() {

	 } */
	$(function() {
		$('#notReList').load('${path}/notReList?not_no=${notice.not_no}') // 리스트를 불러온다.

		// 댓글창 유효성 검사
		$('#notReInsert').click(function() {
			if (!not_form.notReply_content.value) {
				alert('댓글 입력 후에 클릭하세요');
				not_form.notReply_content.focus();
				return false;
			}

			// 댓글 입력, 입력후
			var frmData = $('form').serialize(); // 아래의 form태그를 읽는다.
			$.post('${path}/notReInsert', frmData, function(data) {
				$('#notReList').html(data);
				not_form.notReply_content.value = '';
			});
		});
	});
</script>
<section class="py-5">
	<div class="container">
		<h2 class="body-title">Notice</h2>
		<table class="table">
			<tr>
				<th>제목</th>
				<td>${notice.not_title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<!-- 관리자 세션 -->
				<td>${notice.not_writer}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${notice.not_readcnt}</td>
			</tr>
			<tr>
				<th>첨부 파일</th>
				<td><c:if test="${empty notice.not_file}">
                        &nbsp;
                    </c:if> 
                    <c:if test="${!empty notice.not_file}">                	
						<a href='${path}/upload/notice/${notice.not_file}' download>${notice.not_file}</a>
					</c:if></td>
			</tr>
			<tr>
				<td colspan="2"><pre>${notice.not_content}</pre></td>
			</tr>
		</table>
		<div id="login_menu" class="body-menu">
			<!-- 관리자 -->
			<c:if
				test="${sessionScope.role == 'master' || sessionScope.role == 'notice'}">
				<input type="button" class="btn btn-outline-secondary" value="수정"
					onClick="location.href='noticeUpdateForm?not_no=${notice.not_no}&pageNum=${paging.currentPage}' ">
				<input type="button" class="btn btn-outline-secondary" value="삭제"
					onClick="deleteCheck()">

				<script>
				function deleteCheck() {
					if (confirm("정말로 삭제하시겠습니까?") == true) { // 확인
						location.href="noticeDelete?not_no=${notice.not_no}&pageNum=${paging.currentPage}"
					} else { // 취소
						alert("취소되었습니다.");
						return false;
					}
				}
				</script>

			</c:if>
			<!-- 사용자 + 관리자 -->
			<input type="button" class="btn btn-outline-secondary" value="목록"
				onClick="location.href='notList?not_no=${notice.not_no}&pageNum=${paging.currentPage}' ">
		</div>


		<h2 class="text-primary">댓글</h2>
		<form name="not_form" id="not_form">
			<input type="hidden" name="notReply_writer"
				value="${sessionScope.id}"> <input type="hidden"
				name="not_no" value="${notice.not_no}">
			<c:if test="${sessionScope.id != null}">
				<textarea class="form-control" name="notReply_content" rows="2"></textarea>
				<input type="button" value="확인" id="notReInsert"
					class="btn btn-outline-secondary">
			</c:if>
		</form>
	</div>
	<div id="notReList"></div>
</section>


<%@ include file="../layout/footer.jsp"%>