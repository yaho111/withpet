<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-23
  Time: 오후 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp"%>


<div id="del_wrap">
    <h2 class="del_title">회원탈퇴</h2>
    <form method="post" action="deleteMember"
          onsubmit="return check()">
        <table id="del_t">
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password" name="pwd" id="pwd" size="14"
                           class="input_box" />
                </td>
            </tr>
        </table>

        <div id="del_menu">
            <input type="submit" value="탈퇴" class="input_button" />
            <input type="reset" value="취소" class="input_button"
                   onclick="$('#pwd').focus();" />
        </div>
    </form>

</div>
<script>
    function check(){
        if($.trim($("#pwd").val())==""){
            alert("비밀번호를 입력하세요!");
            $("#pwd").val("").focus();
            return false;
        }
    }
</script>
<%@ include file="../layout/footer.jsp"%>