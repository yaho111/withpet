<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- jquery -->﻿
<script type="text/javascript" src="jquery-3.4.1.min.js" ></script>
<!-- ckeditor 4 -->
<link rel="stylesheet" href="${path}//ckeditor/contents.css">
<!-- <script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script> -->
<script type="text/javascript" src="${path}/ckeditor/ckeditor.js" ></script>
<script >
    CKEDITOR.replace('pro_content'); // 에디터로 생성
</script >

<head></head>
<body>


<form method=post action="${path}/productInsert">
    <table border="1" width="800px" align="center">
        <caption>글작성</caption>

        <tr>
            <th>작성자</th>
            <td><input type=text name="bus_id"></td>
        </tr>

        <tr>
            <th>제목</th>
            <td><input type=text name="pro_name" class="form-control"></td>
        </tr>

        <tr>
            <th>재고</th>
            <td><input type=number name="stock"></td>
        </tr>

        <tr>
            <th>가격</th>
            <td><input type =number name="price"/></td>
        </tr>

        <tr>
            <th>썸네일</th>
            <td><input type = file name="pro_img"/></td>
        </tr>

        <tr>
            <th><label class="col-sm-2 col-form-label"><strong>내용</strong></label> <div class="col-sm-10"/></th>
            <td>
                <textarea class="pro_content" id="pro_content" cols=40 rows=5 width="600px" name="pro_content"></textarea>
                </script>
            </td>
        </tr>

<%--        <tr>--%>
<%--            <div class="row mt-3"> <div class="col-auto mr-auto"></div> <div class="col-auto"> <button id="btnSave" class="btn btn-primary">저장</button> <button id="btnCancel" class="btn btn-light">취소</button> </div> </div>--%>
<%--        </tr>--%>

        <tr>
            <td colspan=2 align=center>
            <input type=submit value="글작성">
            <input type=reset value="취소">
        </td>
        </tr>

    </table>

</form>

<%--<script src="/js/jquery-3.6.0.min.js"></script>--%>
<%--<script src="/js/bootstrap.min.js"></script>--%>
<%--<script src="/js/ckeditor/ckeditor.js"></script>--%>
<%--<script type="text/javascript" th:inline="javascript">--%>
<%--/*<![CDATA[*/--%>
<%--$(function() {--%>
<%--    function saveGallery() {--%>
<%--        if (!confirm("저장하시겠습니까?")) {--%>
<%--            return;--%>
<%--        }--%>

<%--        var formData = new FormData($("form")[0]);--%>
<%--        formData.append("deleteFiles", deleteFileList);--%>
<%--        formData.set("contents", CKEDITOR.instances.contents.getData());--%>
<%--        for (var i = 0; i < inputFileList.length; i++) {--%>
<%--            if (!inputFileList[i].is_delete) {--%>
<%--                formData.append("files", inputFileList[i]);--%>
<%--            }--%>
<%--        }--%>
<%--        for (var pair of formData.entries()) {--%>
<%--            console.log(pair[0] + ', ' + pair[1]);--%>
<%--        }--%>
<%--        $.ajax({--%>
<%--            type: "POST",--%>
<%--            enctype: "multipart/form-data",--%>
<%--            url: "/gallery", data: formData,--%>
<%--            dataType: "json", processData: false,--%>
<%--            contentType: false,--%>
<%--            success: function (result) {--%>
<%--                if (result.response == "OK") {--%>
<%--                    if ($("#id").val() == undefined) {--%>
<%--                        alert("저장되었습니다.");--%>
<%--                    } else {--%>
<%--                        alert("수정되었습니다.");--%>
<%--                    }--%>
<%--                    location.href = "/gallery/" + result.galleryId;--%>
<%--                } else {--%>
<%--                    alert(result.errorMsg);--%>
<%--                }--%>
<%--            },--%>
<%--        }--%>
<%--        );--%>
<%--    }--%>
<%--    /*]]>*/})--%>
<%--</script>--%>


</body>
</html>