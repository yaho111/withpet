<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>


<c:if test="${result == 1 }">
	<script>
		alert("삭제성공!");
		location.href = "./boardList";
	</script>
</c:if>




