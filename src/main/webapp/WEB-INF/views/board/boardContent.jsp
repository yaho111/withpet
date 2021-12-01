<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
</head>
<body>
 
<table border=1 width=400 align="center">
	<caption>상세 페이지</caption>
	<tr>
		<td>작성자</td>
		<td>${board.com_writer}</td>
	</tr>
	<tr>
		<td>날짜</td>
		<td>
			<fmt:formatDate value="${board.com_reg }"
				pattern="yyyy-MM-dd "/>
		</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${board.com_readcnt }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${board.com_title }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<pre>${board.com_content }</pre>
			${com_content}
		</td>
	</tr>
  	<tr>
		<td colspan=2 align=center>
			<input type="button" value="목록" 
onClick="location.href='/boardList?page=${page}' ">
			
	 	<input type="button" value="수정" 
onClick="location.href='/boardupdateform?no=${board.com_no}&page=${page}' ">
			
			<input type="button" value="삭제" 
onClick="location.href='/boarddeleteform?no=${board.com_no}&page=${page}' ">
		</td> 	
	</tr>
	
</table>


</body>
</html>