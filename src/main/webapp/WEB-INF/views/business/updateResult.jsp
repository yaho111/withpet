<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-26
  Time: 오전 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script>
    <c:if test="${result == 1}">
        alert("수정되었습니다.");
        location.href="${pageContext.request.contextPath}/businessList"
    </c:if>
    <c:if test="${result != 1}">
        alert("오류가 발생했습니다.");
        history.go(-1);
    </c:if>
</script>