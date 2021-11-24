<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp"%>


<c:if test="${result == 1 }">
	<script>
		alert("파일은 1MB까지 업로드 가능합니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 2 }">
	<script>
		alert("첨부파일은 jpg, gif, png 파일만 업로드 가능합니다.");
		history.go(-1);
	</script>
</c:if>

<%@ include file="../layout/footer.jsp"%>