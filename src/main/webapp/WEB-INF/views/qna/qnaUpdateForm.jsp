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

  <form method="post" enctype="multipart/form-data" action="qnaUpdate"  onSubmit="return qna_check()"> 
  <input type="hidden" name="qna_no" value="${qna.qna_no}">
  <input type="hidden" name="pageNum" value="${pageNum}">
  <input type="hidden" name="qna_secret" value="${qna.qna_secret}">
   <table class="table">
    <tr>
     <th>글쓴이</th>
     <td>
     ${sessionScope.id}
     </td>
    </tr>
        
    <tr>
     <th>질문 제목</th>
     <td>
      <input class="form-control" name="qna_title" id="qna_title" value="${qna.qna_title}"/>
     </td>
    </tr>
    
    <tr>
     <th>사진 첨부</th>
     <td>
      <input type="file" name="qna_file1" class="btn btn-outline-secondary"/>
     </td>
    </tr>
    
    <tr>
     <th>질문 내용</th>
     <td>
      <textarea class="" name="qna_content" id="qna_content" cols=40 rows=5 width="600px">${qna.qna_content}</textarea>
      			<script type="text/javascript">
                    CKEDITOR.replace('qna_content',{
                        filebrowserUploadUrl: '${path}/adm/fileUpload'
                        		// path = pageContext.request.contextPath
                    }); // 에디터로 생성
                </script >
     </td>
    </tr> 
    
   </table>
   

    <input type="submit" value="등록" class="form-control"/>
    <input type="reset" value="취소" class="form-control" onClick="history.back()"/>
  
  </form>

</div>
</section>
<%@ include file="../layout/footer.jsp"%>