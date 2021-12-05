<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script src="${path}/js/notice.js"></script>

<!-- jquery -->
<script type="text/javascript" src="jquery-3.4.1.min.js" ></script>
<!-- ckeditor 4 -->
<link rel="stylesheet" href="${path}//ckeditor/contents.css"> <%--content에 ckeditro 걸어두기--%>
<!-- <script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script> -->

<script type="text/javascript" src="${path}/ckeditor/ckeditor.js" ></script>

<section class="py-5">
    <div class="container-body">

<h2>Notice</h2>

<form method="post" enctype="multipart/form-data" action="noticeInsert"  onSubmit="return notice_check()"> 
   <table class="table">
    <tr>
     <th>관리자</th>
     <td>
     ${sessionScope.id}
     </td>
    </tr>
    
    <tr>
     <th>공지 제목</th>
     <td>
      <input name="not_title" id="not_title" class="form-control" />
     </td>
    </tr>
   
    <tr>
     <th>첨부파일</th>
     <td>
      <input type="file" name="not_file1" class="form-control" />
     </td>
    </tr>
    
    <tr>
     <th>공지 내용</th>
     <td>
      <textarea name="not_content" id="not_content" cols=40 rows=5 width="600px"></textarea>
      			<script type="text/javascript">
                    CKEDITOR.replace('not_content',{
                        filebrowserUploadUrl: '${pageContext.request.contextPath}/adm/fileUpload'
                        		// path = pageContext.request.contextPath
                    }); // 에디터로 생성
                </script >
     </td>
    </tr> 
    
   </table>
   
	<div class="body-menu" align="right">
    <input type="submit" value="등록" class="btn btn-primary"/>
    <input type="reset" value="취소" class="btn btn-danger" onClick="history.back()"/>
  	</div>
  </form>
</div>
</section>
<%@ include file="../layout/footer.jsp"%>