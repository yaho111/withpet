<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-25
  Time: 오후 7:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp" %>
<section class="py-5">
  <div class="container-body">
    <h2 class="body-title">사업자 등록 요청</h2>
    <table class="table table-hover">
      <tr>
        <th>회사명</th>
        <th>연락처</th>
        <th>사업 분류</th>
        <th>승인 상태</th>
        <th>관리</th>
      </tr>
      <c:forEach var="business" items="${businessList}">
        <tr>
          <td>${business.bus_name}</td>
          <td>${business.bus_tel}</td>
          <td>${business.bus_sort}</td>
          <c:if test="${business.bus_accept == 0}">
            <td>심사중입니다.</td>
          </c:if>
          <c:if test="${business.bus_accept == 1}">
            <td>승인 완료되었습니다.</td>
          </c:if>
          <td>
            <div class="input-group">
              <input type="button" class="btn btn-outline-secondary" value="수정" onclick="location.href=''">
              <input type="button" class="btn btn-outline-secondary" value="삭제" onclick="location.href=''">
            </div>
          </td>
        </tr>
      </c:forEach>

    </table>
  </div>
</section>

<%@ include file="../layout/footer.jsp" %>
