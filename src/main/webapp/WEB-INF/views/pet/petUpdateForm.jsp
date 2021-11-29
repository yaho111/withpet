<%--
  Created by IntelliJ IDEA.
  User: byeon
  Date: 2021-11-26
  Time: 오후 3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp" %>
<section class="py-5">
  <div class="container-body">
    <form name="form" method="post" action="updatePet?pet_no=${selectedPet.pet_no}" onsubmit="return check()"
          enctype="multipart/form-data">
      <table class="table">
        <tr>
          <th>이름</th>
          <td>
            <input name="pet_name" id="pet_name" size="14" class="form-control" value="${selectedPet.pet_name}"/>
          </td>
        </tr>
        <tr>
          <th>종류</th>
          <td>
            <label class="form-check-label" for="cat">
              고양이
            </label>
            <input class="form-check-input" type="radio" name="pet_sort" id="cat" value="고양이"
                   <c:if test="${selectedPet.pet_sort == '고양이'}"> checked </c:if>>
            <label class="form-check-label" for="dog">
              강아지
            </label>
            <input class="form-check-input" type="radio" name="pet_sort" id="dog" value="강아지"
            <c:if test="${selectedPet.pet_sort == '강아지'}"> checked </c:if>>
          </td>
        </tr>
        <tr>
          <th>품종</th>
          <td>
            <input name="pet_kind" id="pet_kind" class="form-control" value="${selectedPet.pet_kind}"/>
          </td>
        </tr>
        <tr>
          <th>성별</th>
          <td>
            <label class="form-check-label" for="male">
              남성
            </label>
            <input class="form-check-input" type="radio" name="pet_gender" id="male" value="남성"
            <c:if test="${selectedPet.pet_gender == '남성'}"> checked </c:if>>
            <label class="form-check-label" for="female">
              여성
            </label>
            <input class="form-check-input" type="radio" name="pet_gender" id="female" value="여성"
            <c:if test="${selectedPet.pet_gender == '여성'}"> checked </c:if>>
          </td>
        </tr>
        <tr>
          <th>생년월일</th>
          <td>
            <input name="pet_birth" id="pet_birth" class="form-control" type="date" value="${selectedPet.pet_birth}"/>
          </td>
        </tr>
        <tr>
          <th>프로필 사진</th>
          <td>
            <input type="file" name="petProfile" class="form-control" />
          </td>
        </tr>
        <tr>
          <th>특이사항</th>
          <td>
            <textarea name="pet_info" id="pet_info" class="form-control">${selectedPet.pet_info}</textarea>
          </td>
        </tr>

      </table>
      <input name="pet_parent" id="pet_parent" value="${sessionScope.id}" type="hidden"/>
      <div id="body_menu" class="body-menu">
        <input type="submit" value="등록" class="btn btn-primary"/>
        <input type="reset" value="취소" class="btn btn-danger"/>
      </div>
    </form>
  </div>
</section>
<script src="${path}/js/pet.js"></script>
<%@ include file="../layout/footer.jsp" %>