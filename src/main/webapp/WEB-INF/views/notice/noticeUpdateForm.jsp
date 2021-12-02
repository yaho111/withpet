<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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

<form method="post" enctype="multipart/form-data" action="noticeUpdate" onSubmit="return notice_check()"> 
<input type="hidden" name="not_no" value="${notice.not_no}">
<input type="hidden" name="pageNum" value="${pageNum}">

   <table class="table">
    <tr>
     <th>관리자</th>
     <td>
     <input name="not_writer" id="not_writer" value="${notice.not_writer}" class="form-control"/><!-- 나중에 관리자 아이디 세션을 통해서 받음 -->
     </td>
    </tr>
    
    <tr>
     <th>공지 제목</th>
     <td>
      <input name="not_title" id="not_title" value="${notice.not_title}" class="form-control"/>
     </td>
    </tr>
    
    <!-- 공지 내용 API적용 예정 -->
    <tr>
     <th>사진 첨부</th>
     <td>
      <input type="file" name="not_file1" class="form-control"/>
     </td>
    </tr>
    
    <tr>
     <th>공지 내용</th>
     <td>
      <textarea class="" name="not_content" id="not_content" cols=40 rows=5 width="600px">${notice.not_content}</textarea>
      			<script type="text/javascript">
                    CKEDITOR.replace('not_content',{
                        filebrowserUploadUrl: '${path}/adm/fileUpload'
                        		// path = pageContext.request.contextPath
                    }); // 에디터로 생성
                </script >
     </td>
    </tr> 
    
   </table>
   
    <input type="submit" value="등록" class="form-control"/>
    <input type="reset" value="취소" onClick="history.back()" class="form-control"/>
  
  </form>
  </div>
</section>

<%@ include file="../layout/footer.jsp"%>