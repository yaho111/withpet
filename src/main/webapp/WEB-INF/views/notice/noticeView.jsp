<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 댓글 아작스 기술 필요 -->



<body>
	<table>
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
		<tr>
			<td>
			<c:if test="${empty notice.not_file}">
       			&nbsp;
       			</c:if> 
       			<c:if test="${!empty notice.not_file}">
				<img src="${path}/upload/notice/${notice.not_file}"
						height="100" width="100" />
				</c:if>
			</td>
		</tr>
		<tr>
			<td><pre>${notice.not_content}</pre></td>
		</tr>
	</table>
<!-- 관리자 -->
<input type="submit" value="수정" onClick="location.href='noticeUpdateForm?pageNum=${paging.currentPage}&not_no=${notice.not_no}' ">
<input type="submit" value="삭제" onClick="location.href='noticeDelete?pageNum=${paging.currentPage}&not_no=${notice.not_no}' ">

<!-- 사용자 + 관리자 -->
<input type="submit" value="목록" onClick="location.href='noticeList?pageNum=${paging.currentPage}&not_no=${notice.not_no}' ">

<!-- 댓글 -->
<!-- <input type="submit" value="" onClick=""> -->

</body>
</html>
<%-- <%@ include file="../layout/footer.jsp"%> --%>