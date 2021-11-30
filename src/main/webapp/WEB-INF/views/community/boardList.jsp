<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<%@ include file="../sort.jsp"%>
<!-- ckeditor 4 -->
<link rel="stylesheet" href="${path}//ckeditor/contents.css">
<%--content에 ckeditro 걸어두기--%>
<!-- <script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script> -->

<script type="text/javascript" src="${path}/ckeditor/ckeditor.js"></script>

<section class="py-5">
	<div class="container">
		<div id="boardWrite" class="body-menu">
			<c:if test="${sessionScope.id != community.com_writer}">
				<a href="boardForm"> <input type="button" value="글작성"
					class="btn btn-outline-secondary"></a>
			</c:if>
			글갯수 : ${paging.total}
		</div>
		<table border=1 align="center" width=500 class="table table-hover">
			<h3 align="center">커뮤니티 게시판 목록</h3>

			<select name="sort" id="sort" class="form-select"
				onchange="sortCom()">
				<option value="recent"
					<c:if test="${sortValue == 'recent'}">${'selected'}</c:if>>최신순</option>
				<option value="readcnt"
					<c:if test="${sortValue == 'readcnt'}">${'selected'}</c:if>>조회순</option>
				<option value="likecnt"
					<c:if test="${sortValue == 'likecnt'}">${'selected'}</c:if>>추천순</option>
			</select>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
				<th>추천수</th>
			</tr>

			<c:if test="${empty list}">
				<tr>
					<td colspan="5">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:set var="com_no1" value="${com_no}" />
				<c:forEach var="community" items="${list}">
					<tr>
						<th>${com_no1}<c:set var="com_no1" value="${com_no1-1}" />
						</th>

						<th>
							<div align="left">
								<a
									href="boardContent?com_no=${community.com_no}&page=${currentPage}">
									${community.com_title} </a>
							</div>
						</th>
						<th>${community.com_writer}</th>
						<th><fmt:formatDate value="${community.com_reg}"
								pattern="YYYY/MM/dd EEE요일" /></th>
						<th>${community.com_readcnt}</th>
						<th>${community.com_likecnt}</th>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</section>
<!-- 목록 끝 -->

<!-- 검색  -->
<form action="boardList" align="center">
	<input type="hidden" name="pageNum" value="1"> <input
		type="hidden" name="sortValue" id="sortValue" value="${sortValue}">
	<select name="search" id="keyword_list" class="form-select">
		<option value="com_title"
			<c:if test="${search=='com_title'}">selected="selected" </c:if>>제목</option>
		<option value="com_content"
			<c:if test="${search=='com_content'}">selected="selected" </c:if>>내용</option>
		<option value="com_writer"
			<c:if test="${search=='com_writer'}">selected="selected" </c:if>>작성자</option>
		<option value="subcon"
			<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
		<input type="text" name="keyword">

		<input type="submit" value="확인" class="btn btn-outline-secondary">
	</select>
</form>
<ul class="pagination" style="text-align: center">
	<li class="page-item">
		<!-- 검색 했을 경우의 페이징 처리 --> <c:if test="${not empty keyword}">
			<c:if test="${paging.currentPage!=1}">
				<li><a class="page-link"
					href="boardList?pageNum=1&search=${search}&keyword=${keyword}&sortValue=${sortValue}"><<</a></li>
			</c:if>
			<c:if test="${paging.startPage > 10 }">
				<li><a class="page-link"
					href="boardList?pageNum=${startPage - 1}&search=${search}&keyword=${keyword}&sortValue=${sortValue}">
						< </a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li <c:if test="${currentPage==i}">class="active" </c:if>><a
					class="page-link"
					href="boardList?pageNum=${i}&search=${search}&keyword=${keyword}&sortValue=${sortValue}">${i}</a></li>
			</c:forEach>
			<c:if test="${endPage < totalPage}">
				<li><a class="page-link"
					href="boardList?pageNum=${endPage + 1}&search=${search}&keyword=${keyword}&sortValue=${sortValue}">
						> </a></li>
			</c:if>
			<!-- 마지막 페이지 이동 -->
			<c:if test="${paging.currentPage!=totalPage}">
				<li><a class="page-link"
					href="boardList?pageNum=${paging.totalPage}&search=${search}&keyword=${keyword}&sortValue=${sortValue}">
						<< </a></li>
			</c:if>
		</c:if> <!-- 전체 목록의 페이징 처리 --> <c:if test="${empty keyword}">

			<!-- 1페이지로 이동 -->

			<c:if test="${paging.currentPage!=1}">
				<li><a class="page-link"
					href="boardList?pageNum=1&sortValue=${sortValue}"> << </a></li>
			</c:if>
			<c:if test="${startPage > 10 }">
				<li><a class="page-link"
					href="boardList?pageNum=${startPage - 1}&sortValue=${sortValue}">
						< </a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li <c:if test="${currentPage==i}">class="active"</c:if>><a
					class="page-link"
					href="boardList?pageNum=${i}&sortValue=${sortValue}">${i}</a></li>
			</c:forEach>
			<c:if test="${endPage < totalPage}">
				<li><a class="page-link"
					href="boardList?pageNum=${endPage + 1}&sortValue=${sortValue}">
						> </a></li>
			</c:if>
			<!-- 마지막 페이지 이동 -->
			<c:if test="${paging.currentPage!=paging.totalPage}">
				<li><a class="page-link"
					href="boardList?pageNum=${paging.totalPage}&sortValue=${sortValue}">
						>> </a></li>
			</c:if>
		</c:if>
	</li>
</ul>
</div>



<%@ include file="../layout/footer.jsp"%>
