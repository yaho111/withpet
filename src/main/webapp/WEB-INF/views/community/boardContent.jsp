<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<!-- 댓글 처리 -->
<script type="text/javascript">
	/* 	window.onload=function() {
	
	 } */
	$(function() {
		$('#comReList').load('${path}/comReList?com_no=${community.com_no}') // 리스트를 불러온다., 바꿔워야함
		
		// 댓글창 유효성 검사
		$('#comReInsert').click(function() {
			if (!com_form.comReply_content.value) {
				alert('댓글 입력 후에 클릭하세요');
				com_form.comReply_content.focus();
				return false;
			}
			
			// 댓글 입력, 입력후 
			var frmData = $('form').serialize();	// serialize() : 아래의 form태그를 읽는함수. 			  
			$.post('${path}/comReInsert', frmData, function(data) {
				$('#comReList').html(data);
				com_form.comReply_content.value = '';
			});
		});
	});
</script>
<!-- 댓글 처리 끝 --> 

<!-- ckeditor 4 -->
<link rel="stylesheet" href="${path}//ckeditor/contents.css">
<%--content에 ckeditro 걸어두기--%>
<!-- <script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script> -->

<script type="text/javascript" src="${path}/ckeditor/ckeditor.js"></script>

<!--   글 삭제 confirm 창 띄우기 -->
<script>
	function deleteCheck(){
		if(confirm("정말로 삭제하시겠습니까?") == true){	// 확인
			location.href="boardDelete?com_no=${community.com_no}&page=${page}"
		}else{										// 취소
			alert("취소되었습니다.");
			return false;
		}
	}
</script>
<script>
	function ComLikeButton(){
		if(${empty sessionScope.id}) {
			alert("로그인이 필요한 서비스입니다!");
			return false;
			
		}else if("${sessionScope.id}" == "${community.com_writer}"){
			alert("자신의 글은 추천할 수 없습니다!");
			return false;
	
		}else {
			var ComLikeData = 'com_no='+${community.com_no}+'&id='+"${sessionScope.id}";		
			$.post('${path}/ComLikeInsert', ComLikeData, function(message) {
				alert(message);
			});
			return false;
		}
	}
</script>
<section class="py-5">
	<div class="container-body">
		<form method=post action="boardDelete">
			<input type="hidden" name="com_no" value="${community.com_no}">
			<input type="hidden" name="page" value="${page}">
			<!--  <table class="table">-->
			<table id="boardContent_table" class="table" border=1 width=500
				align=center>
				<h2 class="body-title" align="center">상세페이지</h2>

				<tr>
					<td>작성자</td>
					<td>${community.com_writer}</td>
				</tr>
				<tr>
					<td>날짜</td>
					<td><fmt:formatDate value="${community.com_reg }"
							pattern="yyyy-MM-dd EE요일 " /></td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${community.com_readcnt }</td>
				</tr>
				<tr>
					<td>추천수</td>
					<td>${community.com_likecnt }</td>
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${community.com_title }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${community.com_content }</td>
				</tr>
				<tr>
					<td colspan=2 align="center"><input type="button" value="추천"
						class="btn btn-outline-secondary" onClick="ComLikeButton()">
					</td>
				</tr>
			</table>

			<div id="boardContent_menu" class="body-menu" align="center">
				<c:if test="${sessionScope.id == community.com_writer}">
					<input type="button" value="수정" class="btn btn-outline-secondary"
						onClick="location.href='boardUpdateForm?com_no=${community.com_no}&page=${page}'">
					<input type="button" value="삭제" class="btn btn-outline-secondary"
						onClick="deleteCheck()">
				</c:if>
				<input type="button" value="목록" class="btn btn-outline-secondary"
					onClick="location.href='boardList?page=${page}'">
			</div>

		</form>

		<p>
			<!-- 위의 자바스크립에 값을 전달해줘야함 -->
		<form name="com_form" id="com_form">
			<input type="hidden" name="comReply_writer"
				value="${sessionScope.id}"> <input type="hidden"
				name="com_no" value="${community.com_no}">
			<c:if test="${sessionScope.id != null}">
				  <input type="text" value="댓글" class="form-control"
					readonly="readonly" style="text-align: center;">
				<textarea name="comReply_content" rows="2"
					style="width: 100%; border: 0; resize: none;"></textarea>
				<input type="button" value="확인" id="comReInsert"
					class="form-control">
			</c:if>
		</form>

	</div>
</section>

<div id="comReList"></div>

<%@ include file="../layout/footer.jsp"%>