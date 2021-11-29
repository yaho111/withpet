<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<section class="py-5">
	<div class="container-body">
	<form method=post action="boardWrite" enctype="multipart/form-data">
		<table id="boardForm_table" border=1 width=500 align=center >
			<h3 align="center">글작성</h3>
			<tr>
				<th>아이디</th>
				<td><input type=text name="com_writer" class="form-control"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type=text name="com_title" class="form-control"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols=40 rows=5 name="com_content" class="form-control"></textarea></td>
			</tr>
			<tr>
			  	<th>첨부파일</th>
				<td><input type="file" name="com_file1" class="form-control"></td>
			</tr>
			  <tr>			
				<td colspan=2 align=center>
				<input type=submit value="글작성" class="btn btn-primary">
					<input type="button" value="취소" class="btn btn-danger" onclick="history.back(-1)"></td>  
			</tr>
		</table>
		
	</form>
        	</div>
</section>
<%@ include file="../layout/footer.jsp"%> 