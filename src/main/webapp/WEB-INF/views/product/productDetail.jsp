<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head></head>


    <table border=1 width=400 align="center">
        <tr>
            <td>상품명</td>
            <td>${product.pro_name }</td>
        </tr>
        <tr>
            <td>상품사</td>
            <td>${product.bus_id }</td>
        </tr>
        <tr>
            <td> 상품 이미지 </td>
            <td><img src = "${path}/upload/${product.pro_img}" width="600px" /></td>
        </tr>
        <tr>
            <td>상품 가격</td>
            <td><fmt:formatNumber pattern="###,###,###" value = "${product.price }"/> </td>
        </tr>
        <tr>
            <td> 구매 수량</td>


            <td>
                <form name="form1" method="post" action="${path}/basketInsert">
                    <input type="hidden" name="pro_no" value="${product.pro_no}">
                    <select name="ea">
                        <c:forEach begin="1" end="10" var="i">
                            <option value="${i}">${i}</option>
                        </c:forEach>
                    </select>&nbsp;개
                    <input type="submit" value="장바구니에 담기">
                </form>
<%--            <td colspan="2" align="center">--%>
<%--                <input type="number" value="basket.ea">--%>
<%--                <input type="button" value="장바구니로 이동"--%>
<%--                       onclick="location.href='${path}/basket/basketList'">--%>
            </td>
        </tr>

        <tr>
            <td>상품 소개 </td>
            <td>
                <li size="600px">${pro_content}</li>
            </td>
        </tr>
        <tr>
            <td colspan=2 align=center>
                <input type="button" value="목록"
                       onClick="javascript:history.back(-1)">

                <input type="button" value="수정"
                       onClick="location.href='${path}/productWrite/?no=${product.pro_no}&page=${page}' ">
                <input type="button" value="삭제"
                       onClick="location.href='${path}/productDelete/?no=${product.pro_no}&page=${page}' ">
            </td>
        </tr>

    </table>


    </body>
</html>