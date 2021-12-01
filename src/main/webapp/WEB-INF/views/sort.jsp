<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 병원 게시판 정렬 -->
<script>
	function sortHos(){
		var sortValue = $("#sort").val();
		location.href="hospitalList?sortValue="+sortValue;
	}
</script>

<!-- 커뮤니티 게시판 정렬 -->
<script>
	function sortCom(){
		var sortValue = $("#sort").val();
		location.href="boardList?sortValue="+sortValue;
	}
</script>

<!-- 상품 게시판 정렬 -->
<script>
	function sortPro(){
		var sortValue = $("#sort").val();
		location.href="productList?sortValue="+sortValue;
	}
</script>