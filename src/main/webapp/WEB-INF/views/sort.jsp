<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 병원 게시판 정렬 -->
<script>
	function sortHos(){
		var sortValue = $("#sort").val();
		location.href="hospitalList?sortValue="+sortValue;
	}
</script>

<div align="right">
	<select name="sort" id="sort" onchange="sortHos()">
		<option value="recent" <c:if test="${sortValue == 'recent'}">${'selected'}</c:if> >최신순</option>
		<option value="readcnt"<c:if test="${sortValue == 'readcnt'}">${'selected'}</c:if> >조회순</option>
		<option value="likecnt"<c:if test="${sortValue == 'likecnt'}">${'selected'}</c:if> >추천순</option>
	</select>
</div>


