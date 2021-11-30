<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp"%>

<style type="text/css">
	a {text-decoration:none}
</style>

<%@ include file="../sort.jsp" %>

<section class="py-5">
    <div class="container">

	<table class="table table-hover">
		
		<h3 align="center">동물병원 게시판</h3>
		
		<div align="right">
			<select name="sort" id="sort" class="form-select" onchange="sortHos()">
				<option value="recent" <c:if test="${sortValue == 'recent'}">${'selected'}</c:if> >최신순</option>
				<option value="readcnt"<c:if test="${sortValue == 'readcnt'}">${'selected'}</c:if> >조회순</option>
				<option value="likecnt"<c:if test="${sortValue == 'likecnt'}">${'selected'}</c:if> >추천순</option>
			</select>
		</div>
			
		<tr>
			<th>번호</th>
			<th colspan=2>동물병원 이름</th>
			<th>위치</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>추천수</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="6">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list}">
			<c:set var="no1" value="${no}"></c:set>
			<c:forEach var="hospital" items="${list}">
				<tr>
					<td>${no1}</td>
					
					<td align="center">
					<c:if test="${empty hospital.hos_file}">
						<img src="${path}/upload/hospital/hospitalimg.jpg" height="130" width="130" />
					</c:if>
					<c:if test="${not empty hospital.hos_file}">
						<img src="${path}/upload/hospital/${hospital.hos_file}" height="130" width="130" />
					</c:if>
						</td>
					<td><a
						href="hospitalView?hos_no=${hospital.hos_no}&page=${paging.currentPage}">
							${hospital.hos_name}</a></td>
					<td>${hospital.hos_loc}</td>
					<td>${hospital.hos_writer}</td>
					<td>${hospital.hos_reg}</td>
					<td>${hospital.hos_readcnt}</td>
					<td>${hospital.hos_likecnt}</td>
				</tr>
				<c:set var="no1" value="${no1 - 1}" />
			</c:forEach>
		</c:if>
	</table>
	<p></p>
	
	</div>
</section>
	
	<!-- 검색 -->
<section class="py-5">
    <div class="container-body">
    
	<form action="hospitalList" align=center>
		<input type="hidden" name="page" value="1">
		<input type="hidden" name="sortValue" id="sortValue" value="${sortValue}">
		<div class="input-group">
			<select name="search" class="form-select">
				<option value="hos_name"
					<c:if test="${search=='hos_name'}">selected="selected" </c:if>>병원 이름</option>
				<option value="hos_loc"
					<c:if test="${search=='hos_loc'}">selected="selected" </c:if>>위치</option>
				<option value="hos_content"
					<c:if test="${search=='hos_content'}">selected="selected" </c:if>>내용</option>
				<option value="hos_writer"
					<c:if test="${search=='hos_writer'}">selected="selected" </c:if>>작성자</option>
			</select> 
			 	
			<input type="text" name="keyword" value="${keyword}" class="form-control">
			<input type="submit" value="확인" class="btn btn-outline-secondary">
		</div>
	</form>
	
	</div>
</section>	
	<br>
	<a href="insertForm">글쓰기</a><br>

<nav>
<ul class="pagination" style="text-align: center">
<li class="page-item">
	<!-- 검색했을 경우의 페이징 처리 -->
	<c:if test="${not empty keyword}">
	
		<!-- 1 페이지로 이동 -->
		<c:if test="${paging.startPage > 10}">
			<li><a class="page-link" 
				href="hospitalList?page=1&search=${search}&keyword=${keyword}&sortValue=${sortValue}"> << </a></li>
		</c:if>
		
		<!-- 이전 블럭으로 이동 -->
		<c:if test="${paging.startPage > paging.pagePerBlk}">
			<li><a class="page-link"
				 href="hospitalList?page=${paging.startPage - 1}&search=${search}&keyword=${keyword}&sortValue=${sortValue}"> < </a></li>
		</c:if>
		
		<!-- 페이지 번호 -->
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
							<li <c:if test="${paging.currentPage!=i}">class="active"</c:if>><a
								class="page-link"
								href="hospitalList?page=${i}&search=${search}&keyword=${keyword}&sortValue=${sortValue}">${i}</a></li>
						</c:forEach>		
		<!-- 다음 블럭으로 이동 -->
		<c:if test="${paging.endPage < paging.totalPage}">
			<li><a class="page-link" href="hospitalList?page=${paging.endPage + 1}&search=${search}&keyword=${keyword}&sortValue=${sortValue}"> > </a></li>
		</c:if>
		
		<!-- 마지막 페이지로 이동 -->
		<c:if test="${paging.endPage < paging.totalPage}">
			<li><a class="page-link" href="hospitalList?page=${paging.totalPage}&search=${search}&keyword=${keyword}&sortValue=${sortValue}"> >> </a></li>
		</c:if>
	</c:if>

	<!-- 전체 목록의 페이징 처리 -->
	<c:if test="${empty keyword}">
		
		<!-- 1 페이지로 이동 -->
		<c:if test="${paging.startPage > 10}">
			<li><a class="page-link" href="hospitalList?page=1&sortValue=${sortValue}"> << </a></li>
		</c:if>
		
		<!-- 이전 블럭으로 이동 -->
		<c:if test="${paging.startPage > paging.pagePerBlk}">
			<a href="hospitalList?page=${paging.startPage - 1}&sortValue=${sortValue}"> < </a>
		</c:if>
		
		<!-- 페이지 번호 -->
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
							<li <c:if test="${paging.currentPage!=i}">class="active"</c:if>><a
								class="page-link"
								href="hospitalList?page=${i}&sortValue=${sortValue}">${i}</a></li>
						</c:forEach>		
		<!-- 다음 블럭으로 이동 -->
		<c:if test="${paging.endPage < paging.totalPage}">
			<li><a class="page-link" href="hospitalList?page=${paging.endPage + 1}&sortValue=${sortValue}"> > </a></li>
		</c:if>
		
		<!-- 마지막 페이지로 이동 -->
		<c:if test="${paging.endPage < paging.totalPage}">
			<li><a class="page-link" href="hospitalList?page=${paging.totalPage}&sortValue=${sortValue}"> >> </a></li>
		</c:if>
	</c:if>
</li>
</ul>
</nav>

<%@ include file="../layout/footer.jsp"%>