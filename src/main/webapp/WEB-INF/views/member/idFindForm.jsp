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
    <title>아이디 찾기 폼</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
        function check(){
            if($.trim($("#email").val())==""){
                alert("이메일을 입력하세요!");
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
<div id="id_wrap">

    <c:if test="${empty idResult}">
        <h2 class="idFindForm_title">아이디 찾기</h2>
        <form method="post" action="findId"
              onsubmit="return check()">
            <table id="idFindForm_table">
                <tr>
                    <th>이름</th>
                    <td><input name="name" id="name" size="14" class="input_box" /></td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td><input name="email" id="email" size="14" class="input_box" placeholder="ex) test@naver.com"/></td>
                </tr>


            </table>
            <div id="ifFindForm_menu">
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


    <c:if test="${!empty idResult}">
        <h2 class="idFindForm_title2">아이디 찾기 결과</h2>
        <table id="idFindForm_table2">
            <tr>
                <th>검색한 아이디:</th>
                <td>${idResult}</td>
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