<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<c:if test="${result == 1 }">
	<script>
		alert("수정 성공");
		console.log(${page});
 		location.href="boardContent?com_no=${com_no}&page=${page}";  
  	</script>
</c:if>

<c:if test="${result != 1 }">
	<script>
		alert("수정 실패");
		history.go(-1);
	</script>
</c:if>


