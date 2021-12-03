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


<!-- 삭제 -->
<script>
function del(id) {
//	alert(id);
 	var formData ="id="+id;
// 	alert(formData);
	$.post("${path}/managerDelete",formData,function(data) {	// post함수로 컨트롤러에 요청
		$('#managerListPage').html(data);	// 결과를 돌려받음, 출력
		}); 
	}
</script>

<input type="submit" value="관리자 메인 페이지"
			onclick="location.href='manager'" class="form-control">

		<!-- 검색 기능 -->
		<form action="managerListPage">
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
		<br>
		<br>
		<!-- 글 검색 끝 -->

		<!-- 목록 -->
		<h4>최고관리자</h4>
		<table class="table table-hover">
			<tr>
				<th>프로필</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>등록일</th>
				<th></th>
			</tr>

		
			<c:if test="${empty memberList}">
				<tr>
					<td colspan="6">데이터가 없습니다</td>
				</tr>
			</c:if>


			<c:if test="${not empty memberList}">
				<c:forEach var="member" items="${memberList}">
					<c:if test="${member.role == 'master'}">
						<%@ include file="../manager/managerOutput.jsp"%>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
		<!-- 목록 끝 -->

		<h4>쇼핑몰 관리자</h4>
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
					<c:if test="${member.role == 'product'}">
						<%@ include file="../manager/managerOutput.jsp"%>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
		
		<h4>커뮤니티 관리자</h4>
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
					<c:if test="${member.role == 'community'}">
						<%@ include file="../manager/managerOutput.jsp"%>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
		
		<h4>공지사항 관리자</h4>
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
					<c:if test="${member.role == 'notice'}">
						<%@ include file="../manager/managerOutput.jsp"%>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
		
		<h4>Q/A 관리자</h4>
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
					<c:if test="${member.role == 'qna'}">
						<%@ include file="../manager/managerOutput.jsp"%>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
		
		<h4>병원 관리자</h4>
		<table class="table table-hover">
		<tr>
				<th>프로필</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>등록일</th>
				<th></th>
		</tr>
			<c:if test="${empty memberList || member.role != 'hospital'}">
				<tr>
					<td colspan="6">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty memberList}">
				<c:forEach var="member" items="${memberList}">
					<c:if test="${member.role == 'hospital'}">
						<%@ include file="../manager/managerOutput.jsp"%>
					</c:if>
				</c:forEach>
			</c:if>
		</table>