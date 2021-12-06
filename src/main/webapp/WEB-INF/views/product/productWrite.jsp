<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="../layout/header.jsp"%>
<!-- jquery -->
<script type="text/javascript" src="jquery-3.4.1.min.js" ></script>
<!-- ckeditor 4 -->
<link rel="stylesheet" href="${path}//ckeditor/contents.css"> <%--content에 ckeditro 걸어두기--%>
<!-- <script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script> -->

<script type="text/javascript" src="${path}/ckeditor/ckeditor.js" ></script>

<script type="text/javascript">

    function productcheck() {
        if ($("#pro_name").val() == "") {
            alert("상품 이름을 입력하세요!");
            $("#pro_name").focus();
            return false;
        }

        if ($("#stock").val() == "") {
            alert("상품 수량을 넣어주세요!");
            $("#stock").focus();
            return false;
        }

        if  ($("#price").val() == "") {
            alert("가격을 정해주세요!");
            $("#price").focus();
            return false;
        }

        if(CKEDITOR.instances.pro_content.getData() ==''
            || CKEDITOR.instances.pro_content.getData().length ==0) {
            alert("상품 내용을 입력하세요!");
            $("#pro_content").focus();
            return false;
        }


        return true;

    }


</script>

<section class="py-5">
    <div class="container">
<form method="post" enctype="multipart/form-data" onsubmit="return productcheck()" action="${path}/productResult">
    <h2 class="body-title">상품 등록</h2>
    <table class="table">
        <c:if test="${product ne null and product.pro_no ne null and product.pro_no ne ''}">
            <input type = "hidden" name="pro_no" value="${product.pro_no }"/>
            <input type = "hidden" name="pro_img" value="${product.pro_img }"/>
        </c:if>
        <tr>
            <th>작성자</th>
            <td><input type="text" name="bus_id" readonly class="form-control" value="${sessionScope.id}"></td>
        </tr>

        <tr>
            <th>제목</th>
            <td><input id="pro_name" type="text" name="pro_name" class="form-control" value="${product.pro_name}"></td>
        </tr>

        <tr>
            <th>재고</th>
            <td><input id="stock" type="text" name="stock" class="form-control"  value = "${product.stock }" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
        </tr>

        <tr>
            <th>가격</th>
            <td><input id="price" type ="text" name="price" class="form-control"  value = "${product.price }" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" /></td>
        </tr>

        <tr>
            <th>썸네일</th>
            <td><input type = "file" name="pro_photo" class="form-control"/>
<%--            <c:if test = "${product.pro_img ne null and product.pro_img ne ''}">--%>
<%--                <img src = "${path}/upload/${product.pro_img}" width="400px" />--%>
<%--            </c:if>--%>
            </td>
        </tr>

        <tr>
            <th><label class="col-sm-2 col-form-label"><strong>내용</strong></label> <div class="col-sm-10"/></th>
            <td>
                <textarea class="pro_content" size="400px" id="pro_content" cols=40 rows=5 name="pro_content" style="list-style: none">${product.pro_content}</textarea>
                <script type="text/javascript">
                    CKEDITOR.replace('pro_content',{
                        filebrowserUploadUrl: '${pageContext.request.contextPath }/adm/fileUpload'
                    }); // 에디터로 생성
                </script >
            </td>
        </tr>
    </table>
    <div class="body-menu" align="right">
        <input type=submit value="상품 등록" class="btn btn-primary">
        <input type=reset value="취소" class="btn btn-danger">
    </div>
</form>
    </div>
</section>

<%@ include file="../layout/footer.jsp"%>