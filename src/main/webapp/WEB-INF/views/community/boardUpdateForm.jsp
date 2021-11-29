<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<section class="py-5">
    <div class="container-body">
<form method=post action="boardUpdate">
<table id="boardForm_table" border=1 width=500 align=center >
	<input type="hidden" name="com_no" value="${community.com_no}">
  <input type="hidden" name="page" value="${page}"> 
		<h3 align="center">글수정</h3> 
	
		<tr>
			<th>아이디</th>
			<td><input type=text name="com_writer"
				value="${community.com_writer}" class="form-control"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type=text name="com_title"
				value="${community.com_title }" class="form-control"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols=40 rows=5 name="com_content" class="form-control">${community.com_content}</textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
				<td><input type="file" name="com_file1" class="form-control"></td>
				
			</tr>
			<!-- <td><textarea cols=40 rows=5 name="com_file">${community.com_file}</textarea></td> -->
		</tr>
		<div id="boardUpdateForm_menu" class="body-menu">
		<tr>
			<td colspan=2 align=center>
			<input type="submit" value="글수정" class="btn btn-primary"/>
			<input type="button" value="취소" class="btn btn-danger" onclick="history.back(-1)"></td>
			</td>
		</tr>
		</div>
	</table>
</form>
</div>
</section>
<%@ include file="../layout/footer.jsp"%>

<!-- jquery -->
<script type="text/javascript" src="jquery-3.4.1.min.js" ></script>
<!-- ckeditor 4 -->
<link rel="stylesheet" href="${path}//ckeditor/contents.css"> <%--content에 ckeditro 걸어두기--%>
<!-- <script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script> -->

<script type="text/javascript" src="${path}/ckeditor/ckeditor.js" ></script>
