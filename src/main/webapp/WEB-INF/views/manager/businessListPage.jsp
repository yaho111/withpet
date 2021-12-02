<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
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
</head>
<body>


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

		<input type="submit" value="관리자 메인 페이지"
			onclick="location.href='manager'" class="form-control">

		<!-- 검색 기능 -->
		<form action="businessListPage">
			<!-- 검색 리스트 요청 -->
			<input type="hidden" name="pageNum" value="1">
			<!-- pageNum, search, keyword 값전달 -->
			<select name="search" class="form-select">
				<option value="id"
					<c:if test="${search=='id'}">selected="selected" </c:if>>아이디</option>
				<option value="name"
					<c:if test="${search=='이름'}">selected="selected" </c:if>>이름</option>
			</select> <input type="text" name="keyword" class="form-control">
			<!-- dto -->
			<input type="submit" value="확인" class="form-control">
		</form>
		<br> <br>
		<!-- 글 검색 끝 -->


		<h2>업체 등록</h2>
		<table class="table table-hover">
			<tr>
				<th>사업자 번호</th>
				<th>사업자 이름</th>
				<th>사업자 주소</th>
				<th>사업자 전화번호</th>
				<th></th>
			</tr>

				<c:forEach var="selectedBusiness" items="${selectedBusiness}">
					<c:if test="${selectedBusiness.bus_accept == 0}">
						<tr>
							<th>${selectedBusiness.bus_no}</th>
							<th>${selectedBusiness.bus_name}</th>
							<th>${selectedBusiness.bus_addr}</th>
							<th>${selectedBusiness.bus_sort}</th>
							<th>${selectedBusiness.bus_tel}</th>
							<th>
							<c:choose>
								<c:when test="${sessionScope.role == 'master' || sessionScope.role == 'hospital'}">
									<!-- 승인 -->
									<input type="button" value="승인" onClick="accept(${selectedBusiness.bus_no})"
									id="businessHosAccept" name="businessHosAccept" class="btn btn-primary">
									<!-- 거절 -->
									<input type="button" value="거절" onClick="refuse(${selectedBusiness.bus_no})"
									id="businessHosDelete" name="businessHosDelete" class="btn btn-danger">
								</c:when>
								<c:when test="${sessionScope.role == 'master' || sessionScope.role == 'product'}">
									<!-- 승인 -->
									<input type="button" value="승인" onClick="accept(${selectedBusiness.bus_no})"
									id="businessProAccept" name="businessProAccept" class="btn btn-primary">
									<!-- 거절 -->
									<input type="button" value="거절" onClick="refuse(${selectedBusiness.bus_no})"
									id="businessProDelete" name="businessProDelete" class="btn btn-danger">
								</c:when>
							</c:choose>
							</th>
						</tr>
					</c:if>
				</c:forEach>
		</table>
		<!-- 요청 목록 끝 -->


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

		</body>
		</html>