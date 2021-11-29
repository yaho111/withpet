<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<!-- ckeditor 4 -->
<link rel="stylesheet" href="${path}//ckeditor/contents.css">
<%--content에 ckeditro 걸어두기--%>
<!-- <script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script> -->

<script type="text/javascript" src="${path}/ckeditor/ckeditor.js"></script>

<!--   글 삭제 confirm 창 띄우기 -->
<script>
	function deleteCheck(){
		if(confirm("정말로 삭제하시겠습니까?") == true){	// 확인
			location.href="delete?com_no=${community.com_no}&page=${page}"
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
			$.post('${path}/hosLikeInsert', ComLikeData, function(message) {
				alert(message);
			});
			return false;
		}
	}
</script>
<section class="py-5">
	<div class="container-body">
		<form method=post action="delete">
			<input type="hidden" name="com_no" value="${community.com_no}">
			<input type="hidden" name="page" value="${page}">
			<!--  <table class="table">-->
			<table id="boardContent_table" class="table" border=1 width=500 align=center>
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
					 <td> ${community.com_content }</td>
				</tr>
			</table>
			<div id="boardContent_menu" class="body-menu" align="center">
				<c:if test="${sessionScope.id == community.com_writer}">
					<input type="button" value="수정" class="btn btn-outline-secondary"
						onClick="location.href='boardUpdateForm?com_no=${community.com_no}&page=${page}'">
					<input type="button" value="삭제" class="btn btn-outline-secondary"
						onClick="deleteCheck()">
					<!--  	<input type="button" value="♥like" 
                onClick="location.href='./boardList?page=${page}' ">  	-->
				</c:if>
				<tr>
					<td colspan=2 align="center"><input type="button" value="추천"
						class="btn btn-outline-secondary" onClick="ComLikeButton()">
					</td>
				</tr>
				<input type="button" value="목록" class="btn btn-outline-secondary"
					onClick="location.href='boardList?page=${page}'">
			</div>
		</form>
	</div>
</section>

<%@ include file="../layout/footer.jsp"%>


