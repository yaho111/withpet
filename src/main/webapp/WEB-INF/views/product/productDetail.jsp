<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>

    <table border=1 width=400 align="center">
        <caption>상세 페이지</caption>

        <tr>
            <td>작성자</td>
            <td>${product.bus_id }</td>
        </tr>

        <tr>
            <td> 상품 이미지</td>
            <td><img src = "${path}/upload/${product.pro_img}" /></td>
        </tr>
        <tr>
            <td>조회수</td>
            <td>${product.pro_readcnt }</td>
        </tr>
        <tr>
            <td>제목</td>
            <td>${product.pro_name }</td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                ${pro_content}
            </td>
        </tr>
        <tr>
            <td colspan=2 align=center>
                <input type="button" value="목록"
                       onClick="javascript:history.back(-1)">

                <input type="button" value="수정"
                       onClick="location.href='${path}/productWrite/?no=${product.pro_no}&page=${page}' ">

                <input type="button" value="삭제"
                       onClick="location.href='boarddeleteform/?no=${product.pro_no}&page=${page}' ">
            </td>
        </tr>

    </table>


    </body>
</html>