<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<script>
function del(id) {
	alert(id);
 	var formData ="id="+id;
	alert(formData);
	$.post("${path}/managerDown",formData,function(data) {	// post함수로 컨트롤러에 요청
		$('#managerListPage').html(data);	// 결과를 돌려받음, 출력
		}); 
	}
</script>

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
	<th><c:if test="${sessionScope.role == 'master'}">
			<input type="button" value="직위 해제" onClick="del('${member.id}')"
				id="managerDown" name="managerDown" class="btn btn-danger">
		</c:if></th>
</tr>