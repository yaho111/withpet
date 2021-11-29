<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-23
  Time: 오후 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp" %>

<section class="py-5">
    <div id="del_wrap" class="container-body">
        <h2 class="body-title">회원 탈퇴</h2>
        <form method="post" action="deleteMember"
              onsubmit="return check()">
            <table id="del_t" class="table">
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input type="password" name="pwd" id="pwd" size="14"
                               class="form-control"/>
                    </td>
                </tr>
            </table>

            <div id="del_menu" class="body-menu">
                <input type="submit" value="탈퇴" class="btn btn-danger"/>
                <input type="reset" value="이전" class="btn btn-outline-secondary" onclick="history.go(-1);"/>
            </div>
        </form>

    </div>
</section>
<script>
    function check() {
        if ($.trim($("#pwd").val()) == "") {
            alert("비밀번호를 입력하세요!");
            $("#pwd").val("").focus();
            return false;
        }
    }
</script>
<%@ include file="../layout/footer.jsp" %>