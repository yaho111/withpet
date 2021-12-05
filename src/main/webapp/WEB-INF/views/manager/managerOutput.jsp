<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<tr>
	<td align="center">
		<c:if test="${empty member.profile}">
			<img src="./images/basic_profile.png" height="100" width="100" />
		</c:if> 
		<c:if test="${!empty member.profile}">
			<img src="${path}/upload/member/${member.profile}" height="100" width="100" />
		</c:if>
	</td>
	<td><a href="managerView?id=${member.id}">${member.id}</a></td>
	<td>${member.name}</td>
	<td><fmt:formatDate value="${member.regdate}" pattern="YYYY/MM/dd HH:mm EEE요일" /></td>
	<td>
		<c:if test="${sessionScope.role == 'master'}">
		<input type="button" value="관리자 자격 박탈" onClick="location.href = '${path}/managerDown?id=${member.id}'" class="btn btn-danger">
		</c:if>
	</td>
</tr>