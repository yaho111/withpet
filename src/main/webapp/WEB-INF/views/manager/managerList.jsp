<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<section class="py-5">
	<div class="container">

		<!-- 관리자 메인페이지 -->
		<input type="submit" value="관리자 메인 페이지"
			onclick="location.href='manager'" class="form-control">

		<!-- 검색 리스트 요청 -->
		<form action="managerList">
			<div class="search">
				<select name="search" class="form-select">
					<option value="id"
						<c:if test="${search=='id'}">selected="selected" </c:if>>아이디</option>
					<option value="name"
						<c:if test="${search=='이름'}">selected="selected" </c:if>>이름</option>
				</select> <input type="text" name="keyword" class="form-control"> <input
					type="submit" value="확인" class="btn btn-outline-secondary">
			</div>
		</form>
		<br> <br>
		<!-- 글 검색 끝 -->

		<!-- 목록 -->
		<h4>최고관리자</h4>
		<table class="table table-hover">
			<tr>
				<th>프로필</th>
				<th>아이디</th>
				<th>이름</th>
				<th>등록일</th>
				<th></th>
			</tr>

			<c:if test="${not empty memberList}">
				<c:forEach var="member" items="${memberList}">
					<c:if test="${member.role == 'master'}">
						<tr>
							<td align="center">
								<c:if test="${empty member.profile}">
									<img src="./images/basic_profile.png" height="100" width="100" />
								</c:if> <c:if test="${!empty member.profile}">
									<img src="${path}/upload/member/${member.profile}" height="100" width="100" />
								</c:if></td>
							<td><a href="managerView?id=${member.id}">${member.id}</a></td>
							<td>${member.name}</td>
							<td><fmt:formatDate value="${member.regdate}"
									pattern="YYYY/MM/dd HH:mm EEE요일" /></td>
							<td></td>
						</tr>

					</c:if>
				</c:forEach>
			</c:if>
		</table>
		<!-- 목록 끝 -->

<br> <br> <br>

		<h4>쇼핑몰 관리자</h4>
		<table class="table table-hover">
			<tr>
				<th>프로필</th>
				<th>아이디</th>
				<th>이름</th>
				<th>등록일</th>
				<th></th>
			</tr>
			<c:if test="${not empty memberList}">
				<c:forEach var="member" items="${memberList}">
					<c:if test="${member.role == 'product'}">
						<%@ include file="../manager/managerOutput.jsp"%>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
		
		
		<br> <br> <br>


		<h4>커뮤니티 관리자</h4>
		<table class="table table-hover">
			<tr>
				<th>프로필</th>
				<th>아이디</th>				
				<th>이름</th>
				<th>등록일</th>
				<th></th>
			</tr>
			<c:if test="${not empty memberList}">
				<c:forEach var="member" items="${memberList}">
					<c:if test="${member.role == 'community'}">
						<%@ include file="../manager/managerOutput.jsp"%>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
		
		
		<br> <br> <br>


		<h4>공지사항 관리자</h4>
		<table class="table table-hover">
			<tr>
				<th>프로필</th>
				<th>아이디</th>				
				<th>이름</th>
				<th>등록일</th>
				<th></th>
			</tr>
			<c:if test="${not empty memberList}">
				<c:forEach var="member" items="${memberList}">
					<c:if test="${member.role == 'notice'}">
						<%@ include file="../manager/managerOutput.jsp"%>
					</c:if>
				</c:forEach>
			</c:if>
		</table>


<br> <br> <br>


		<h4>Q/A 관리자</h4>
		<table class="table table-hover">
			<tr>
				<th>프로필</th>
				<th>아이디</th>				
				<th>이름</th>
				<th>등록일</th>
				<th></th>
			</tr>
			<c:if test="${not empty memberList}">
				<c:forEach var="member" items="${memberList}">
					<c:if test="${member.role == 'qna'}">
						<%@ include file="../manager/managerOutput.jsp"%>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
		
		
		<br> <br> <br>
		

		<h4>병원 관리자</h4>
		<table class="table table-hover">
			<tr>
				<th>프로필</th>
				<th>아이디</th>				
				<th>이름</th>
				<th>등록일</th>
				<th></th>
			</tr>
			<c:if test="${not empty memberList}">
				<c:forEach var="member" items="${memberList}">
					<c:if test="${member.role == 'hospital'}">
						<%@ include file="../manager/managerOutput.jsp"%>
					</c:if>
				</c:forEach>
			</c:if>
		</table>


	</div>
</section>
<%@ include file="../layout/footer.jsp"%>