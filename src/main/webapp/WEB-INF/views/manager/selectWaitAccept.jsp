<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <!-- jQuery-->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${path}/assets/favicon.ico"/>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${path}/css/styles.css" rel="stylesheet"/>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${path}/js/scripts.js"></script>    

<h2 class="body-title">사업자 등록 요청</h2>
<!--     <div class="body-menu">
      <input class="btn btn-outline-secondary" type="button" value="사업자 등록"
             onclick="location.href='businessEnrollForm'">
    </div> -->
    <table class="table table-hover">
      <tr>
        <th>회사명</th>
        <th>아이디</th>
        <th>사업자 등록번호</th>
        <th>연락처</th>
        <th>사업 분류</th>
        <th></th>
      </tr>
      <c:forEach var="business" items="${selectWaitAccept}">
      <c:if test="${business.bus_accept != 1 && business.bus_accept != 2}">
        <tr>
          <td>${business.bus_name}</td>
          <td>${business.bus_id}</td>
          <td>${business.bus_no}</td>
          <td>${business.bus_tel}</td>
          <td>${business.bus_sort}</td>
          <td>
            <div class="input-group">
              
              <input type="button" class="btn btn-outline-secondary" value="승인"
                     onclick="location.href='businessAccept?bus_no=${business.bus_no}'">
              <input type="button" class="btn btn-outline-secondary" value="거부"
                     onclick="deleteCheck()">
              <script>
                function deleteCheck(){
                  if(confirm("정말로 거부하시겠습니까?") == true){	// 확인
                    location.href="deleteBusiness?bus_no=${business.bus_no}"
                  }else{										// 취소
                    alert("거절되었습니다.");
                    return false;
                  }
                }
              </script>
            </div>
          </td>
        </tr>
        </c:if>
      </c:forEach>
     </table>