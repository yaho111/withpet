<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jquery -->
<script type="text/javascript" src="jquery-3.4.1.min.js" ></script>
<!-- ckeditor 4 -->
<link rel="stylesheet" href="${path}/js/ckeditor/contents.css">
<!-- <script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script> -->
<script type="text/javascript" src="${path}/js/ckeditor/ckeditor.js" ></script>

<script >
    CKEDITOR.replace('ckeditor'); // 에디터로 생성
</script >

<c:set var="path" value="${pageContext.request.contextPath}"/>
<head></head>
<body onload="ckeditor();">


<form method=post action="${path}/productInsert">
    <table border=1 width=400 align=center>
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
            <td><input type=text name="stock"></td>
        </tr>

        <tr>
            <th>가격</th>
            <td><input type = text name="price"</td>
        </tr>

        <tr>
            <th>썸네일</th>
            <td><input type = file name="pro_img"</td>
        </tr>

        <tr>
            <th>내용</th>
            <td>
                <div class ="col_c">
                <div class="input-group">
                <textarea class="form-control" id="p_content" cols=40 rows=5 name="pro_content"></textarea>
            <script type = "text/javascript">
                CKEDITOR.replace('ckeditor');
            </script>
                </div>
            </div>
            </td>
        </tr>

        <tr>
            <td colspan=2 align=center>
            <input type=submit value="글작성">
            <input type=reset value="취소">
        </td>
        </tr>

    </table>
</form>



</body>
</html>

<%--<!DOCTYPE html>--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8"%>--%>
<%--<head> <meta charset="utf-8"/>--%>
<%--    <title>CKEditor 4 설치하기</title>--%>
<%--    <script type="text/javascript" src="${path}/js/ckeditor/ckeditor.js"></script>--%>
<%--    <script type="text/javascript">--%>
<%--        //<![CDATA[ function LoadPage() { CKEDITOR.replace('contents'); } function FormSubmit(f) { CKEDITOR.instances.contents.updateElement(); if(f.contents.value == "") { alert("내용을 입력해 주세요."); return false; } alert(f.contents.value); // 전송은 하지 않습니다. return false; } //]]>--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body onload="LoadPage();"--%>
<%--<form id="EditorForm" name="EditorForm" onsubmit="return FormSubmit(this);">--%>
<%--    <div> <label for="title">제목</label> <input type="text" id="title" name="title" size="40" /> </div>--%>
<%--    <div> <label for="contents">내용</label> <textarea id="contents" name="contents"></textarea> </div>--%>
<%--    <div><input type="submit" value="전송"></div>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>

