<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 게시판</title>
</head>
<body>
	<div class="container" align="center">
		<h2>병원 게시판 글 작성</h2>
		<form action="insert" method="post" onsubmit="return check()" enctype="multipart/form-data">
			<table border=1 align="center" width="600">
				<tr>
					<th>병원 이름</th>
					<td><input type="text" name="hos_name"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="hos_writer"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="hos_addr"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="hos_tel"></td>
				</tr>
				<tr>
					<th>병원 이미지</th>
					<td><input type="file" name="hos_file1"></td>
				</tr>
				<tr>
					<th>위도</th>
					<td><input type="text" name= "hos_lat"></td>
				</tr>
				<tr>
					<th>경도</th>
					<td><input type="text" name= "hos_long"></td>
				</tr>
				<tr>
					<th>운영 시간</th>
					<td><input type="text" name= "hos_time"></td>
				</tr>
				<tr>
					<th>24시 여부</th>
					<td><input type="radio" name= "hos_24" value="Y">24시 운영
						<input type="radio" name= "hos_24" value="N">24시 운영 아님</td>
				</tr>
				<tr>
					<th>연중무휴 여부</th>
					<td><input type="radio" name= "hos_holiday" value="Y">연중무휴
						<input type="radio" name= "hos_holiday" value="N">연중무휴 아님</td>
				</tr>
				<tr>
					<th>주차 가능 여부</th>
					<td><input type="radio" name= "hos_parking" value="Y">주차 가능
						<input type="radio" name= "hos_parking" value="N">주차 불가</td>
				</tr>
				<tr>
					<th>병원 소개</th>
					<td><textarea rows="5" cols="30" name="hos_content"></textarea></td>
				</tr>
				<tr>
					<th>병원 홈페이지 링크</th>
					<td><input type="text" name="hos_link"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인">
					<input type="button" value="뒤로 가기" onClick="history.go(-1)"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>