<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-11
  Time: 오전 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${result == 1}">
    <script>
        alert("등록되지 않는 회원 입니다.");
        history.go(-1);
    </script>
</c:if>

<c:if test="${result == 2}">
    <script>
    alert("비밀번호가 일치하지 않습니다. 비밀번호를 확인하세요.");
    history.go(-1);
    </script>

</c:if>