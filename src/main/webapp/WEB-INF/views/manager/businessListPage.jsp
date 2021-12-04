<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Withpet_Manager</title>
    <!-- jQuery-->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${path}/assets/favicon.ico"/>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${path}/css/styles.css" rel="stylesheet"/>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${path}/js/scripts.js"></script>
<!-- <style>
body {
	background-color: white;
	background-image: url('./images/dog.jpg');/* , url('./images/cat.png'); */
	background-size: 50%;
	background-repeat: no-repeat;
	background-attachment: fixed;
}
</style> -->

<script>
// 
function del(id) {
//	alert(id);
 	var formData ="id="+id;
// 	alert(formData);
	$.post("${path}/businessDelete",formData,function(data) {	// post함수로 컨트롤러에 요청
		$('#businessListPage').html(data);	// 결과를 돌려받음, 출력
		}); 
	}
</script>

		<!-- 목록 -->
		<h2>쇼핑몰 업체</h2>
		<table class="table table-hover">
			<tr>
				<th>프로필</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>등록일</th>
				<th></th>
			</tr>

			<c:if test="${not empty memberList}">
				<c:forEach var="member" items="${memberList}">
					<c:if test="${member.role == 'product_bus'}">
						<tr>
							<th align="center"><c:if test="${empty member.profile}">
									<img src="./images/basic_profile.png" height="100" width="100" />
								</c:if> <c:if test="${!empty member.profile}">
									<img src="${path}/upload/member/${member.profile}" height="100"
										width="100" />
								</c:if></th>
							<th><a href="businessView?id=${member.id}">${member.id}</a></th>
							<th>${member.nick}</th>
							<th>${member.name}</th>
							<th>${member.regdate}</th>
							<th><c:if test="${sessionScope.role == 'master'}">
									<input type="button" value="삭제" onClick="del(${member.id})"
										id="businessDelete" name="businessDelete" class="btn btn-danger">
								</c:if></th>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
		<!-- 목록 끝 -->

		<h2>병원</h2>
		<table class="table table-hover">
			<tr>
				<th>프로필</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>등록일</th>
				<th></th>
			</tr>

			<c:if test="${not empty memberList}">
				<c:forEach var="member" items="${memberList}">
					<c:if test="${member.role == 'hospital_bus'}">
						<tr>
							<th align="center"><c:if test="${empty member.profile}">
									<img src="./images/basic_profile.png" height="100" width="100" />
								</c:if> <c:if test="${!empty member.profile}">
									<img src="${path}/upload/member/${member.profile}" height="100"
										width="100" />
								</c:if></th>
							<th><input type="submit" value="${member.id}"
								onclick="location.href='businessView?id=${member.id}'"
								class="btn btn-outline-secondary"></th>
							<th>${member.nick}</th>
							<th>${member.name}</th>
							<th>${member.regdate}</th>
							<th><c:if test="${sessionScope.role == 'master'}">
									<input type="button" value="삭제" onClick="del(${member.id})"
										id="businessDelete" name="businessDelete" class="btn btn-danger">
								</c:if></th>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
		</table>