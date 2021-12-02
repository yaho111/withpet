<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<tr>
	<th align="center"><c:if test="${empty member.profile}">
			<img src="./images/basic_profile.png" height="100" width="100" />
		</c:if> <c:if test="${!empty member.profile}">
			<img src="${path}/upload/member/${member.profile}" height="100"
				width="100" />
		</c:if></th>
	<th><a href="managerView?id=${member.id}">${member.id}</a></th>
	<th>${member.nick}</th>
	<th>${member.name}</th>
	<th><fmt:formatDate value="${member.regdate}"
			pattern="YYYY/MM/dd HH:mm EEE요일" /></th>
	<th><c:if test="${sessionScope.role == 'great_manager'}">
			<input type="button" value="삭제" onClick="del(${member.id})"
				id="managerDelete" name="managerDelete" class="btn btn-danger">
		</c:if></th>
</tr>