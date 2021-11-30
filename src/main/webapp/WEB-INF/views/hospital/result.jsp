<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp"%>

<!-- 병원 게시글 작성 후 메세지 -->
<c:if test="${insertResult == 1}">
	<script>
		alert("병원 등록이 완료되었습니다.");
		location.href="hospitalList"
	</script>
</c:if>   

<!-- 병원 게시글 수정 후 메세지 -->
<c:if test="${updateResult == 1}">
	<script>
		alert("병원 정보 수정이 완료되었습니다.");
		location.href="hospitalView?hos_no=${hos_no}&page=${page}";
	</script>
</c:if>  

<!-- 병원 게시글 삭제 후 메세지 -->
<c:if test="${deleteResult == 1}">
	<script>
		alert("병원 게시글 삭제가 완료되었습니다.");
		location.href="hospitalList?page=${page}";
	</script>
</c:if> 

<%@ include file="../layout/footer.jsp"%>
