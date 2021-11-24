<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script src="${path}/js/notice.js"></script>

<div align="center">
<h2>공지사항을 수정해주세요.</h2>

<form method="post" enctype="multipart/form-data" action="noticeUpdate"  onSubmit="return notice_check()"> 
<input type="hidden" name="not_no" value="${notice.not_no}">
<input type="hidden" name="pageNum" value="${pageNum}">
   <table>
    <tr>
     <th>관리자</th>
     <td>
     <input name="not_writer" id="not_writer" value="${notice.not_writer}"/><!-- 나중에 관리자 아이디 세션을 통해서 받음 -->
     </td>
    </tr>
    
    <tr>
     <th>공지 제목</th>
     <td>
      <input name="not_title" id="not_title" value="${notice.not_title}"/>
     </td>
    </tr>
    
    <!-- 공지 내용 API적용 예정 -->
    <tr>
     <th>사진 첨부</th>
     <td>
      <input type="file" name="not_file1" />
     </td>
    </tr>
    
    <tr>
     <th>공지 내용</th>
     <td>
      <pre><textarea name="not_content"  id="not_content">${notice.not_content}</textarea></pre>
     </td>
    </tr> 
    
   </table>
   

    <input type="submit" value="등록"/>
    <input type="reset" value="취소" onClick="history.back()"/>
  
  </form>
</div>

<%@ include file="../layout/footer.jsp"%>