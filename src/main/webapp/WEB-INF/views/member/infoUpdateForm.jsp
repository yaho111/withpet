<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-19
  Time: 오전 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="../layout/header.jsp" %>

<div id="join_wrap">
    <h2 class="join_title">회원 정보 수정폼</h2>
    <form name="f" method="post" action="updateInfo"
          onsubmit="return edit_check()" enctype="multipart/form-data">
        <!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
        <table id="edit_table">
            <tr>
                <th>아이디</th>
                <td>
                    ${member.id}
                </td>
            </tr>

            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password" name="pwd" id="pwd" size="14"
                           class="input_box"/>
                </td>
            </tr>

            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="password" name="pwd_check" id="pwd_check" size="14"
                           class="input_box"/>
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>
                    <input name="name" id="name" size="14" class="input_box" value="${member.name}"/>
                </td>
            </tr>
            <tr>
                <th>프로필 사진</th>
                <td>
                    <input type="file" name="profilePic" />
                </td>
            </tr>
            <tr>
                <th>우편번호</th>
                <td>
                    <input name="post" id="post" size="5" class="input_box"
                           readonly onclick="post_search()" value="${post}"/>
                    <!-- -<input name="join_zip2" id="join_zip2" size="3" class="input_box" readonly
                            onclick="post_search()"/> -->
                    <input type="button" value="우편번호검색" class="input_button"
                           onclick="openDaumPostcode()"/>
                </td>
            </tr>

            <tr>
                <th>주소</th>
                <td>
                    <input name="addr" id="addr" size="50" class="input_box" value="${address}"
                           readonly onclick="post_search()"/>
                </td>
            </tr>

            <tr>
                <th>상세 주소</th>
                <td>
                    <input name="specificAddress" id="specificAddress" size="37" class="input_box"
                           value="${specificAddress}"/>
                </td>
            </tr>

            <tr>
                <th>휴대전화번호</th>
                <td>
                    <%@ include file="../layout/phone_number.jsp" %>
                    <select name="frontNum">
                        <c:forEach var="front" items="${phone}" begin="0" end="5">
                            <c:choose>
                                <c:when test="${front == frontNum}">
                                    <option value="${front}" selected>${front}</option>
                                </c:when>
                                <c:when test="${front != frontNum}">
                                    <option value="${front}">${front}</option>
                                </c:when>
                            </c:choose>

                        </c:forEach>
                    </select>
                    -<input name="middleNum" id="middleNum" size="4" maxlength="4" class="input_box"
                            value="${middleNum}"/>
                    - <input name="backNum" id="backNum" size="4" maxlength="4" class="input_box" value="${backNum}"/>
                </td>
            </tr>

            <tr>
                <th>이메일</th>
                <td>
                    <input name="mailId" id="mailId" size="10"
                           class="input_box" value="${mailId}"/> @ <input name="domain"
                                                                          id="domain" size="20" class="input_box"
                                                                          readonly value="${domain}"/>
                    <!--readonly는 단지 쓰기,수정이 불가능하고 읽기만 가능하다 //-->
                    <select name="mail_list" id="mail_list" onchange="domain_list()">
                        <option value="">=이메일선택=</option>
                        <option value="daum.net">daum.net</option>
                        <option value="nate.com">nate.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="0">직접입력</option>
                    </select>
                </td>
            </tr>

        </table>

        <div id="join_menu">
            <input type="submit" value="정보 수정" class="input_button"/>
            <input type="reset" value="취소" class="input_button"
                   onclick="$('#id').focus();"/>
        </div>
    </form>
</div>

<script src="<%=request.getContextPath()%>/js/member.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //우편번호, 주소 Daum API
    function openDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
                document.getElementById('post').value = data.zonecode;
                document.getElementById('addr').value = data.address;
            }
        }).open();
    }
</script>
<%@ include file="../layout/footer.jsp" %>