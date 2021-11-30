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
				alert('댓글 입력후에 클릭하시오');
				not_form.notReply_content.focus();
				return false;
			}
			
			// 댓글 입력, 입력후 
			var frmData = $('form').serialize();	// 아래의 form태그를 읽는다. 			  
			$.post('${path}/notReInsert', frmData, function(data) {
				$('#notReList').html(data);
				not_form.notReply_content.value = '';
			});
		});
	});
</script>


<section class="py-5">
    <div class="container">
	<h2>Notice</h2>
	<table class="table">
		<tr>
			<td>제목</td>
			<td>${notice.not_title}</td>
		</tr>
		<tr>
			<td>작성자</td><!-- 관리자 세션 -->
			<td>${notice.not_writer}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${notice.not_readcnt}</td>
		</tr>
		<%-- <tr>
			<td>
			<c:if test="${empty notice.not_file}">
       			&nbsp;
       			</c:if> 
       			<c:if test="${!empty notice.not_file}">
				<img src="${path}/upload/notice/${notice.not_file}"
						height="100" width="100" />
				</c:if>
			</td>
		</tr> --%>
		<tr>
			<td colspan="2"><pre>${notice.not_content}</pre></td>
		</tr>
	</table>
<div id="login_menu" class="body-menu">
<!-- 관리자 -->
<input type="submit" class="form-control" value="수정" onClick="location.href='noticeUpdateForm?not_no=${notice.not_no}&pageNum=${paging.currentPage}' ">
<input type="submit" class="form-control" value="삭제" onClick="location.href='noticeDelete?not_no=${notice.not_no}&pageNum=${paging.currentPage}' ">

<!-- 사용자 + 관리자 -->
<input type="submit" class="form-control" value="목록" onClick="location.href='notList?not_no=${notice.not_no}&pageNum=${paging.currentPage}' ">
</div>

<p>
		<form name="not_form" id="not_form">
			<input type="hidden" name="notReply_writer" value="${sessionScope.id}">
			<input type="hidden" name="not_no" value="${notice.not_no}"> 
			<c:if test="${sessionScope.id != null}">
			<input type="text" value="댓글" class="form-control" readonly="readonly" style="text-align:center;" >
			<textarea name="notReply_content" rows="2" style="width:100%; border: 0; resize: none;"></textarea>
			<input type="button" value="확인" id="notReInsert" class="form-control">
			</c:if>
		</form>
		
	</div>
</section>
			
		
		<div id="notReList"></div>

<%@ include file="../layout/footer.jsp"%>