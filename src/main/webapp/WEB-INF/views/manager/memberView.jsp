<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<section class="py-5">
	<div class="container">
		<h2>Profile</h2>
		<div align="center">
			<c:if test="${empty member.profile}">
				<img src="./images/basic_profile.png" height="400" width="400" />
			</c:if>
			<c:if test="${!empty member.profile}">
				<img src="${path}/upload/member/${member.profile}" height="500"
					width="400" />
			</c:if>
		</div>
		<br> <br>
		<table class="table">
				<tr>
					<th>아이디</th>
					<td>${member.id}</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${member.pwd}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${member.name}</td>
				</tr>
				<tr>
					<th>생일</th>
					<td>${member.birth}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${member.gender}</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><fmt:formatDate value="${member.regdate}" pattern="YYYY/MM/dd HH:mm EEE요일" /></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${member.email}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${member.addr}</td>
				</tr>
		</table>


		<div class="body-menu">
			<c:if test="${sessionScope.role == 'master'}">
				<input type="button" value="관리자 등록" class="manager btn btn-primary"
					id="manager_insert" name="manager_insert">
				<!-- 아작스 적용 -->
			</c:if>
			<input type="submit" value="회원 목록"
				onclick="location.href='memberList'"
				class="btn btn-outline-secondary">
		</div>
		
		<!-- mg : manager -->
		<!-- 버튼 불러오기 -->
		<div id="mg" class="body-menu"></div>

	</div>
</section>
<script>
	$(function() {
		$('.manager').click(function() {
			var id = $(this).attr('id');
				$('#mg').html(
		"<br>"
		+ "<input type='button' value='병원 관리자' class='btn btn-outline-secondary' onclick=\"location.href='managerInsert?id=${member.id}&role=hospital '\" >"
		+ "<input type='button' value='커뮤니티 관리자' class='btn btn-outline-secondary' onclick=\"location.href='managerInsert?id=${member.id}&role=community '\">"
		+ "<input type='button' value='쇼핑몰 관리자' class='btn btn-outline-secondary' onclick=\"location.href='managerInsert?id=${member.id}&role=product'\">"
		+ "<input type='button' value='공지사항 관리자' class='btn btn-outline-secondary' onclick=\"location.href='managerInsert?id=${member.id}&role=notice'\">"
		+ "<input type='button' value='Q/A 관리자' class='btn btn-outline-secondary' onclick=\"location.href='managerInsert?id=${member.id}&role=qna'\">");
		})
	})
</script>


<%@ include file="../layout/footer.jsp"%>