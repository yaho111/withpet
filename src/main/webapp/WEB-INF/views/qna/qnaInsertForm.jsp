<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script src="${path}/js/qna.js"></script>

<!-- jquery -->
<script type="text/javascript" src="jquery-3.4.1.min.js" ></script>
<!-- ckeditor 4 -->
<link rel="stylesheet" href="${path}//ckeditor/contents.css"> <%--content에 ckeditro 걸어두기--%>
<!-- <script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script> -->

<script type="text/javascript" src="${path}/ckeditor/ckeditor.js" ></script>

<section class="py-5">
    <div class="container-body">
<form method="post" enctype="multipart/form-data" action="qnaInsert"
	onSubmit="return qna_check()">
	<h2>Q/A 작성</h2>
	<table class="table">
		<tr>
			<th>글쓴이</th>
			<td><input name="qna_writer" id="qna_writer" class="form-control" value="${sessionScope.id}" readonly="readonly"/>
			</td>
		</tr>

	<tr>
			<th>질문 제목</th>
			<td><input name="qna_title" id="qna_title" class="form-control" /></td>
	</tr>
	
    <tr>
    	<th>공개 여부</th>
		<td>
		<label class="form-check-label" for="qna_secret_Y">공개</label>
		<input type="radio" name="qna_secret" id="qna_secret_Y" value="Y" class="radio" checked="checked" />&nbsp;&nbsp;&nbsp;&nbsp;
		<label class="form-check-label" for="qna_secret_N">비공개</label>		
    	<input type="radio" name="qna_secret" id="qna_secret_N" value="N" class="radio" />&nbsp;
		</td>
    </tr>
        
    <tr>
     <th>질문 내용</th>
     <td>
      <textarea class="" name="qna_content" id="qna_content" cols=40 rows=5 width="600px"></textarea>
      			<script type="text/javascript">
                    CKEDITOR.replace('qna_content',{
                        filebrowserUploadUrl: '${path}/adm/fileUpload'
                        		// path = pageContext.request.contextPath
                    }); // 에디터로 생성
                </script >
     </td>
    </tr> 
    
   </table>
   
	<div id="login_menu" class="body-menu">
    <input type="submit" value="등록" class="btn btn-primary" />
    <input type="reset" value="취소" onClick="history.back()" class="btn btn-danger" />
  	</div>
  </form>
</div>
</section>
<%@ include file="../layout/footer.jsp"%>