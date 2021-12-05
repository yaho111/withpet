<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>



<section class="py-5">
	<div class="container">

		<input type="submit" value="관리자 메인 페이지"
			onclick="location.href='manager'" class="form-control">

		<!-- 검색 기능 -->
		<form action="businessPeople">
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
		<h2>쇼핑몰 업체</h2>
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
					<c:if test="${member.role == 'product_pro'}">
						<tr>
							<!-- 프로필 -->
							<td align="center"><c:if test="${empty member.profile}">
									<img src="./images/basic_profile.png" height="100" width="100" />
								</c:if> <c:if test="${!empty member.profile}">
									<img src="${path}/upload/member/${member.profile}" height="100"
										width="100" />
								</c:if></td>
							<!-- 프로필 -->
							<td><a href="businessView?id=${member.id}">${member.id}</a></td>
							<td>${member.name}</td>
							<td>${member.regdate}</td>
							<td><c:if test="${sessionScope.role == 'master'}">
									<input type="button" value="삭제" class="btn btn-danger"
										onClick="location.href ='${path}/businessDelete?id=${member.id}'">
								</c:if></td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
		<br> <br> <br>
		<!-- 목록 끝 -->

		<h2>병원</h2>
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
					<c:if test="${member.role == 'hospital_pro'}">
						<tr>
							<!-- 프로필 -->
							<td align="center"><c:if test="${empty member.profile}">
									<img src="./images/basic_profile.png" height="100" width="100" />
								</c:if> <c:if test="${!empty member.profile}">
									<img src="${path}/upload/member/${member.profile}" height="100"
										width="100" />
								</c:if></td>
							<!-- 프로필 -->
							<td><a href='businessView?id=${member.id}'>${member.id}</a>
							</td>
							<td>${member.name}</td>
							<td>${member.regdate}</td>
							<td><c:if test="${sessionScope.role == 'master'}">
									<input type="button" value="삭제" class="btn btn-danger"
										onClick="location.href ='${path}/businessDelete?id=${member.id}'">
								</c:if></td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
		<br> <br> <br>


		<!-- 사업자 대기 목록  -->
		<table class="table table-hover">
			<tr>
				<th>회사명</th>
				<th>아이디</th>
				<th>사업자 등록번호</th>
				<th>연락처</th>
				<th>사업 분류</th>
				<th></th>
			</tr>
			<c:forEach var="business" items="${selectWaitAccept}">
				<c:if test="${business.bus_accept != 1 && business.bus_accept != 2}">
					<tr>
						<td>${business.bus_name}</td>
						<td>${business.bus_id}</td>
						<td>${business.bus_no}</td>
						<td>${business.bus_tel}</td>
						<td>${business.bus_sort}</td>
						<td>
							<div class="input-group">

								<input type="button" class="btn btn-outline-secondary"
									value="승인" onclick="location.href = 'businessAccept?bus_no=${business.bus_no}'"> 
									<input type="button" class="btn btn-outline-secondary" value="거부"
									onclick="location.href = 'businessNotAccept?bus_no=${business.bus_no}'">
							</div>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>

	</div>
</section>
<%@ include file="../layout/footer.jsp"%>