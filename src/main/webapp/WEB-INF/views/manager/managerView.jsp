<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<section class="py-5">
	<div class="container">
		<h2>Profile</h2>
						<div align="center">
						<c:if
							test="${empty member.profile}">
							<img src="./images/basic_profile.png" height="400" width="400" />
						</c:if> <c:if test="${!empty member.profile}">
							<img src="${path}/upload/member/${member.profile}" height="500"
								width="400" />
						</c:if>
						</div>
		<br>
		<br>
		<table class="table">
			<thead>
				<tr>
					<!-- <th colspan="3">프로필</th> -->
				</tr>
			</thead>
			<tbody>
			
				<tr>
					<th>아이디</th>
					<th>${member.id}</th>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>${member.pwd}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${member.name}</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>${member.gender}</td>
				</tr>
				<tr>
					<td>가입일</td>
					<td><fmt:formatDate value="${member.regdate}" pattern="YYYY/MM/dd HH:mm EEE요일"/></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${member.email}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${member.addr}</td>
				</tr>
			</tbody>
		</table>
		
		<div id="login_menu" class="body-menu">
		<input type="submit" value="관리자 목록" onclick="location.href='managerList'" class="btn btn-outline-secondary">
		</div>
		
	</div>
</section>
<%@ include file="../layout/footer.jsp"%>