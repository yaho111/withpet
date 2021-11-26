<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<form method=post action="boardUpdate">
	<input type="hidden" name="com_no" value="${community.com_no}">
  <input type="hidden" name="page" value="${page}"> 
	<table class="table">
		<h3 align="center">글수정</h3> 
	
		<tr>
			<th>작성자명</th>
			<td><input type=text name="com_writer"
				value="${community.com_writer}"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type=text name="com_title"
				value="${community.com_title }"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols=40 rows=5 name="com_content">${community.com_content}</textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td><textarea cols=40 rows=5 name="com_file">${community.com_file}</textarea></td>
		</tr>
		<tr>
			<td colspan=2 align=center>
			<input type="submit" value="글수정"/>
			<input type="button" value="이전" onclick="history.back(-1)"></td>
			</td>
		</tr>
	</table>
</form>

<%@ include file="../layout/footer.jsp"%>
