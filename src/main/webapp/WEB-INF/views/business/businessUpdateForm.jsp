<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-25
  Time: 오후 6:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp" %>
<section class="py-5">
    <div id="enroll_wrap" class="container-body">
        <h2 class="body-title">사업자 정보 변경</h2>
        <form name="form" method="post" action="updateBusiness" onsubmit="return check()">
            <table id="business_enroll_table" class="table">
                <tr>
                    <th>등록할 아이디</th>
                    <td>
                        <input name="bus_id" id="bus_id" class="form-control" value="${sessionScope.id}" />
                    </td>
                </tr>
                <tr>
                    <th>사업명</th>
                    <td>
                        <input name="bus_name" id="bus_name" class="form-control" value="${selectedBusiness.bus_name}"/>
                    </td>
                </tr>
                <tr>
                    <th>우편번호</th>
                    <td>
                        <div class="input-group">
                            <input name="post" id="post" size="5" class="form-control" readonly onclick="post_search()"
                            value="${post}"/>
                            <input type="button" value="우편번호검색" class="btn btn-outline-secondary"
                                   onclick="openDaumPostcode()"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <input name="addr" id="addr" size="50" class="form-control" readonly onclick="post_search()"
                        value="${address}"/>
                    </td>
                </tr>

                <tr>
                    <th>상세 주소</th>
                    <td>
                        <input name="specificAddress" id="specificAddress" size="37" class="form-control" value="${specificAddress}"/>
                    </td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td>
                        <div class="input-group">
                            <select name="frontNum" id="frontNum" class="form-select">
                                <option value="" selected>선택</option>
                                <option value="02" <c:if test="${frontNum == '02'}">selected</c:if>>02</option>
                                <option value="031" <c:if test="${frontNum == '031'}">selected</c:if>>031</option>
                                <option value="032" <c:if test="${frontNum == '032'}">selected</c:if>>032</option>
                                <option value="033" <c:if test="${frontNum == '033'}">selected</c:if>>033</option>
                                <option value="041" <c:if test="${frontNum == '041'}">selected</c:if>>041</option>
                                <option value="042" <c:if test="${frontNum == '042'}">selected</c:if>>042</option>
                                <option value="043" <c:if test="${frontNum == '043'}">selected</c:if>>043</option>
                                <option value="051" <c:if test="${frontNum == '051'}">selected</c:if>>051</option>
                                <option value="064" <c:if test="${frontNum == '064'}">selected</c:if>>064</option>
                                <option value="070" <c:if test="${frontNum == '070'}">selected</c:if>>070</option>
                            </select>
                            <span class="input-group-text">-</span>
                            <input name="middleNum" id="middleNum" size="4" maxlength="4" class="form-control" value="${middleNum}"/>
                            <span class="input-group-text">-</span>
                            <input name="backNum" id="backNum" size="4" maxlength="4" class="form-control" value="${backNum}"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>사업 분류</th>
                    <td>
                        <label class="form-check-label" for="shopping">
                            쇼핑몰 사업자
                        </label>
                        <input class="form-check-input" type="radio" name="bus_sort" id="shopping"
                        <c:if test="${selectedBusiness.bus_sort == '쇼핑몰 사업자'}"> checked </c:if> value="쇼핑몰 사업자">
                        <label class="form-check-label" for="hospital">
                            병원 사업자
                        </label>
                        <input class="form-check-input" type="radio" name="bus_sort" id="hospital"
                        <c:if test="${selectedBusiness.bus_sort == '병원 사업자'}"> checked </c:if> value="병원 사업자">
                    </td>
                </tr>
            </table>
            <div id="join_menu" class="body-menu">
                <input type="submit" value="등록" class="btn btn-primary"/>
                <input type="reset" value="이전" class="btn btn-outline-secondary" onclick="history.go(-1);"/>
            </div>
        </form>

    </div>
</section>
<script src="${path}/js/business.js"></script>
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