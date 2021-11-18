<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-15
  Time: 오후 2:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 폼</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
        function check(){
            if($.trim($("#id").val())==""){
                alert("아이디를 입력하세요!");
                $("#id").val("").focus();
                return false;
            }
            if($.trim($("#name").val())==""){
                alert("회원이름을 입력하세요!");
                $("#name").val("").focus();
                return false;
            }
        }
    </script>
</head>
<body>
<div id="pwd_wrap">

    <c:if test="${empty pwdResult}">
        <h2 class="pwd_title">비번찾기</h2>
        <form method="post" action="findPwd"
              onsubmit="return check()">
            <table id="pwd_t">
                <tr>
                    <th>아이디</th>
                    <td><input name="id" id="id" size="14" class="input_box" /></td>
                </tr>

                <tr>
                    <th>이름</th>
                    <td><input name="name" id="name" size="14" class="input_box" /></td>
                </tr>
            </table>
            <div id="pwd_menu">
                <input type="submit" value="찾기" class="input_button" />
                <input type="reset" value="취소" class="input_button"
                       onclick="$('#id').focus();"/>
            </div>
            <div id="pwd_close">
                <input type="button" value="닫기" class="input_button"
                       onclick="self.close();" />
                <!-- close()메서드로 공지창을 닫는다. self.close()는 자바스크립트이다. -->
            </div>
        </form>
    </c:if>


    <c:if test="${!empty pwdResult}">
        <h2 class="pwd_title2">비번찾기 결과</h2>
        <table id="pwd_t2">
            <tr>
                <th>검색한 비번:</th>
                <td>${pwdResult}</td>
            </tr>
        </table>
        <div id="pwd_close2">
            <input type="button" value="닫기" class="input_button"
                   onclick="self.close();" />
            <!-- close()메서드로 공지창을 닫는다. self.close()는 자바스크립트이다. -->
        </div>
    </c:if>

</div>
</body>
</html>