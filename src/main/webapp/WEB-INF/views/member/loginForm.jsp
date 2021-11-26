<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-11
  Time: 오전 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp" %>
<section class="py-5">
    <div id="login_wrap" class="container-body">
        <h2 class="body-title">로그인</h2>
        <form method="post" action="login"
              onsubmit="return check()">
            <table id="login_table" class="table">
                <tr>
                    <th>아이디</th>
                    <td>
                        <input name="id" id="id" size="20" class="form-control"/>
                    </td>
                </tr>

                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input type="password" name="pwd" id="pwd" size="20" class="form-control"/>
                    </td>
                </tr>
            </table>
            <div id="login_menu" class="body-menu">
                <input type="submit" value="로그인" class="btn btn-outline-secondary"/>
                <input type="button" value="회원가입" class="btn btn-outline-secondary"
                       onclick="location.href = 'joinForm'"/>
                <input type="button" value="비밀번호 찾기" class="btn btn-outline-secondary"
                       onclick="pwd_find()"/>
                <input type="button" value="아이디 찾기" class="btn btn-outline-secondary"
                       onclick="id_find()"/>
            </div>
        </form>
    </div>
</section>
<script>
    function check() {
        if ($.trim($("#id").val()) == "") {
            alert("로그인 아이디를 입력하세요!");
            $("#id").val("").focus();
            return false;
        }
        if ($.trim($("#pwd").val()) == "") {
            alert("비밀번호를 입력하세요!");
            $("#pwd").val("").focus();
            return false;
        }
    }

    /*비밀번호 찾기 공지창*/
    function pwd_find() {
        window.open("pwdFindForm", "비밀번호 찾기", "width=450,height=500");
        //자바 스크립트에서 window객체의 open("공지창경로와 파일명","공지창이름","공지창속성")
        //메서드로 새로운 공지창을 만듬.폭이 400,높이가 400인 새로운 공지창을 만듬.단위는 픽셀
    }

    /*아이디 찾기 공지창*/
    function id_find() {
        window.open("idFindForm", "아이디 찾기", "width=450,height=500");
        //자바 스크립트에서 window객체의 open("공지창경로와 파일명","공지창이름","공지창속성")
        //메서드로 새로운 공지창을 만듬.폭이 400,높이가 400인 새로운 공지창을 만듬.단위는 픽셀
    }
</script>
<%@ include file="../layout/footer.jsp" %>