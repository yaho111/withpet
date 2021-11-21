<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                <pre>${product.pro_content }</pre>
                ${pro_content}
            </td>
        </tr>
        <tr>
            <td colspan=2 align=center>
                <input type="button" value="목록"
                       onClick="location.href='boardlist.do?page=${page}' ">

                <input type="button" value="수정"
                       onClick="location.href='boardupdateform.do?no=${board.no}&page=${page}' ">

                <input type="button" value="삭제"
                       onClick="location.href='boarddeleteform.do?no=${board.no}&page=${page}' ">
            </td>
        </tr>

    </table>


    </body>
</html>