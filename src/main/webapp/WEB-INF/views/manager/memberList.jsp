<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<section class="py-5">
    <div class="container">

<input type="submit" value="관리자 메인 페이지"
			onclick="location.href='managerwithpet'" class="form-control">


<!-- 검색 기능 -->
<form action="memberList">
<div class="search">
	<select name="search" class="form-select">
		<option value="id"
			<c:if test="${search=='id'}">selected="selected" </c:if>>아이디</option>
		<option value="name"
			<c:if test="${search=='이름'}">selected="selected" </c:if>>이름</option>
	</select> <input type="text" name="keyword" class="form-control">
	<input type="submit" value="확인" class="btn btn-outline-secondary">
</div>
</form>
<br><br>
<!-- 글 검색 끝 -->



<!-- 목록 -->
	<table border="1" class="table table-hover">
		<tr>
			<!-- <th>번호</th> -->
			<th>프로필</th>
			<th>아이디</th>
			<th>이름</th>
			<th>등록일</th>
			<th></th>
		</tr>

		<c:if test="${empty memberList}">
			<tr>
				<td colspan="12">데이터가 없습니다</td>
			</tr>
		</c:if>


		<%-- <c:if test="${not empty memberList}"> --%>
		<c:if test="${not empty memberList}">
			<c:forEach var="member" items="${memberList}">
			<c:if test="${member.role == 'user'}">
				<tr>
					<td align="center">
						<c:if test="${empty member.profile}">
							<img src="./images/basic_profile.png" height="100" width="100" />
						</c:if> 
						<c:if test="${!empty member.profile}">
							<img src="${path}/upload/member/${member.profile}" height="100"
								width="100" />
						</c:if>
					</td>
					<td><a href="memberView?id=${member.id}">${member.id}</a></td>
					<td>${member.name}</td>
					<td>${member.regdate}</td>
					<td>
						<c:if test="${sessionScope.role == 'master'}">
							<input type="button" value="삭제" onClick="location.href = 'memberDelete?id=${member.id}'" class="btn btn-danger">

						</c:if>
					</td>
				</tr>
				
			</c:if>
			</c:forEach>
		</c:if>
	</table>
	<!-- 목록 끝 -->

</div>
</section>
<%@ include file="../layout/footer.jsp"%>