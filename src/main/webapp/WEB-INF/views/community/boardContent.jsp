<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
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

<form method=post action="delete">
	<input type="hidden" name="com_no" value="${community.com_no}">
	<input type="hidden" name="page" value="${page}">
	<table class="table">
		<h2 class="body-title">상세페이지</h2>

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
			<td>제목</td>
			<td>${community.com_title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><pre>${community.com_content }</pre></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td><pre>${community.com_file }</pre></td>
		</tr>
	
</table>
<div align="center">
		<c:if test="${sessionScope.id == community.com_writer}">
			<input type="button" value="수정"
				onClick="location.href='boardUpdateForm?com_no=${community.com_no}&page=${page}'">
		  	<input type="button" value="삭제"
				onClick="deleteCheck()">
			<!--  	<input type="button" value="♥like" 
                onClick="location.href='./boardList?page=${page}' ">  	-->			
		</c:if>
			<input type="button" value="목록"
				onClick="location.href='boardList?page=${page}'">
	</div>

	<%@ include file="../layout/footer.jsp"%> 