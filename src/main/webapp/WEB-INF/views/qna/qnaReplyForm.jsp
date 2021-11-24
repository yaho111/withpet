<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script src="${path}/js/qna.js"></script>

  <h2>게시판 입력폼</h2>
  <form method="post" enctype="multipart/form-data" action="qnaReply"  onSubmit="return qna_check()"> 
  <input type="hidden" name="qna_no" value="${qna.qna_no}" />
  <input type="hidden" name="qna_ref" value="${qna.qna_ref}" />
  <input type="hidden" name="qna_lev" value="${qna.qna_lev}" />
  <input type="hidden" name="qna_seq" value="${qna.qna_seq}" />
  <input type="hidden" name="pageNum" value="${pageNum}" />
  
  <!-- if : 관리자 -->
  <!-- <input type="hidden" name="qna_title" id="qna_title" value="Answer"/> -->
  <!-- if : 질문자 -->
  <!-- <input type="hidden" name="qna_title" id="qna_title" value="Question Again"/> -->
  
   <table>
    <tr>
     <th>관리자</th>
     <td>
     <input name="qna_writer" id="qna_writer" /><!-- 나중에 관리자 아이디 세션을 통해서 받음 -->
     </td>
    </tr>
    
	<tr>
     <th>답글 제목</th>
     <td>
      	<input type="text" name="qna_title" id="qna_title" value="Answer ${qna.qna_title}" readonly="readonly"/>
     </td>
    </tr>
    <tr>
     <th>사진 첨부</th>
     <td>
      <input type="file" name="qna_file1" />
     </td>
    </tr>
    
    <tr>
     <th>답글 내용</th>
     <td>
      <textarea name="qna_content"  id="qna_content"></textarea>
     </td>
    </tr> 
    
   </table>
   

    <input type="submit" value="등록"/>
    <input type="reset" value="취소" onClick="history.back()"/>
  
  </form>

<%@ include file="../layout/footer.jsp"%>