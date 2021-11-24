<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script src="${path}/js/qna.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>With Pet Q/A</title>
</head>
<body>

  <form method="post" enctype="multipart/form-data" action="qnaInsert"  onSubmit="return qna_check()"> 
   <table>
    <tr>
     <th>글쓴이</th>
     <td>
     <input name="qna_writer" id="qna_writer" /><!-- 나중에 관리자 아이디 세션을 통해서 받음 -->
     </td>
    </tr>
    
<!--     <tr>
     <th>질문 게시판</th>
     <th>
     <select id="qna_select" name="qna_select">
     	<option value="">게시판 선택</option>                                  
     	<option value="병원">병원</option>
     	<option value="커뮤니티">커뮤니티</option>
     	<option value="쇼핑몰">쇼핑몰</option>
     	<option value="회원">회원</option>
     </select>
     </th>
    </tr> -->
    
    <tr>
     <th>질문 제목</th>
     <td>
      <input name="qna_title" id="qna_title" />
     </td>
    </tr>
    
    <tr>
     <th>사진 첨부</th>
     <td>
      <input type="file" name="qna_file1" />
     </td>
    </tr>
    
    <tr>
     <th>질문 내용</th>
     <td>
      <textarea name="qna_content"  id="qna_content"></textarea>
     </td>
    </tr> 
    
   </table>
   

    <input type="submit" value="등록"/>
    <input type="reset" value="취소" onClick="history.back()"/>
  
  </form>
<%-- <%@ include file="../layout/footer.jsp"%> --%>
</body>
</html>