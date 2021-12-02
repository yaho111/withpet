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
		
		
		<div class="body-menu">
		<c:if test="${sessionScope.role == 'master'}">
		<input type="button" value="관리자 등록" class="manager btn btn-primary" id="manager_insert" name="manager_insert" ><!-- 아작스 적용 -->
		</c:if>
		<input type="submit" value="회원 목록" onclick="location.href='memberList'" class="btn btn-outline-secondary">
		</div>
		<!-- mg : manager -->
		<div id="mg" class="body-menu"></div>
		
	</div>
</section>
<script>
$(function() {
	$('.manager').click(function() {
		var id  = $(this).attr('id');
		$('#mg').html(
			 "<br>"
			+"<input type='button' value='병원 관리자' class='btn btn-outline-secondary' onclick=\"location.href='managerInsert?id=${member.id}&role=hospital '\" >"
			+"<input type='button' value='커뮤니티 관리자' class='btn btn-outline-secondary' onclick=\"location.href='managerInsert?id=${member.id}&role=community '\">"
			+"<input type='button' value='쇼핑몰 관리자' class='btn btn-outline-secondary' onclick=\"location.href='managerInsert?id=${member.id}&role=product'\">"
			+"<input type='button' value='공지사항 관리자' class='btn btn-outline-secondary' onclick=\"location.href='managerInsert?id=${member.id}&role=notice'\">"
			+"<input type='button' value='Q/A 관리자' class='btn btn-outline-secondary' onclick=\"location.href='managerInsert?id=${member.id}&role=qna'\">"
		);
	})
	/* onclick='up("+id+")' */
})
</script>


<%@ include file="../layout/footer.jsp"%>