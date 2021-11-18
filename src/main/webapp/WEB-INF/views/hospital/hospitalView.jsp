<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
</head>
<body>
	<table border="1" width=600 align="center">
		<tr align="center">
			<td colspan=2><h2>${hospital.hos_name}</h2></td>
		</tr>
		<tr>
			<td>
				<c:if test="${empty hospital.hos_file}">
					<img src="${path}/hos_upload/hospitalimage.png" height="300" width="300" />
				</c:if>
				<c:if test="${not empty hospital.hos_file}">
					<img src="${path}/hos_upload/${hospital.hos_file}" height="300" width="300" />
				</c:if>
			</td>
			<td><h2>${hospital.hos_name }</h2></td>
		</tr>
		<tr>
			<td colspan=2>${hospital.hos_addr}</td>
		</tr>
		<tr>
			<td colspan=2>${hospital.hos_tel}</td>
		</tr>
		<tr>
			<td colspan=2>${hospital.hos_time}</td>
		</tr>
		<tr>
			<td colspan=2>${hospital.hos_content}</td>
		</tr>
		<tr>
			<td colspan=2>${hospital.hos_link}</td>
		</tr>
		<tr>
			<td>태그 자리</td>
		</tr>
	</table>
	
	<div align="center">
		<input type="button" value="목록" onClick="location.href='hospitalList?page=${page}'">
	</div>	
	<!-- Ajax 댓글 -->
	
	

</body>
</html>