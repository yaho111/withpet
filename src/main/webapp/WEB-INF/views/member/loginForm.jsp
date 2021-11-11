<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-11
  Time: 오전 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <script>
        function check(){
            if($.trim($("#id").val())==""){
                alert("로그인 아이디를 입력하세요!");
                $("#id").val("").focus();
                return false;
            }
            if($.trim($("#pwd").val())==""){
                alert("비밀번호를 입력하세요!");
                $("#pwd").val("").focus();
                return false;
            }
        }

        /*비번찾기 공지창*/
        function pwd_find(){
            window.open("pwd_find.nhn","비번찾기","width=450,height=500");
            //자바 스크립트에서 window객체의 open("공지창경로와 파일명","공지창이름","공지창속성")
            //메서드로 새로운 공지창을 만듬.폭이 400,높이가 400인 새로운 공지창을 만듬.단위는 픽셀
        }
    </script>

</head>
<body>
<div id="login_wrap">
    <h2 class="login_title">로그인</h2>
    <form method="post" action="login.do"
          onsubmit="return check()">
        <table id="login_t">
            <tr>
                <th>아이디</th>
                <td>
                    <input name="id" id="id" size="20" class="input_box" />
                </td>
            </tr>

            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password" name="pwd" id="pwd" size="20" class="input_box"/>
                </td>
            </tr>
        </table>
        <div id="login_menu">
            <input type="submit" value="로그인" class="input_button" />
            <input type="reset" value="취소" class="input_button"
                   onclick="$('#id').focus();" />
            <input type="button" value="회원가입" class="input_button"
                   onclick="location='member_join.nhn'" />
            <input type="button" value="비번찾기" class="input_button"
                   onclick="pwd_find()" />
        </div>
    </form>
</div>
</body>
</html>
