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

  <h2>게시판 입력폼</h2>
  <form method="post" enctype="multipart/form-data" action="qnaReply"  onSubmit="return qna_check()"> 
  <input type="hidden" name="qna_no" value="${qna.qna_no}" />
  <input type="hidden" name="qna_ref" value="${qna.qna_ref}" />
  <input type="hidden" name="qna_lev" value="${qna.qna_lev}" />
  <input type="hidden" name="qna_seq" value="${qna.qna_seq}" />
  <input type="hidden" name="pageNum" value="${pageNum}" />
  <input type="hidden" name="qna_secret" value="${qna.qna_secret}">
  
  <!-- if : 관리자 -->
  <!-- <input type="hidden" name="qna_title" id="qna_title" value="Answer"/> -->
  <!-- if : 질문자 -->
  <!-- <input type="hidden" name="qna_title" id="qna_title" value="Question Again"/> -->
  
   <table class="table">
    <tr>
     <th>관리자</th>
     <td>
     <input class="form-control" name="qna_writer" id="qna_writer" /><!-- 나중에 관리자 아이디 세션을 통해서 받음 -->
     </td>
    </tr>
    
	<tr>
     <th>답글 제목</th>
     <td>
      	<input class="form-control" type="text" name="qna_title" id="qna_title" value="Answer ${qna.qna_title}" readonly="readonly"/>
     </td>
    </tr>
    <tr>
    

	<tr>     
     <th>사진 첨부</th>
     <td>
      <input class="btn btn-outline-secondary" type="file" name="qna_file1" />
     </td>
    </tr>
    
   
    <tr>
     <th>답글 내용</th>
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
   

    <input type="submit" value="등록" class="btn btn-primary"/>
    <input type="reset" value="취소" class="btn btn-danger" onClick="history.back()"/>
  
  </form>
 </div>
 </section>

<%@ include file="../layout/footer.jsp"%>