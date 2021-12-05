<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<!-- ckeditor 4 -->
<link rel="stylesheet" href="${path}//ckeditor/contents.css">
<script type="text/javascript" src="${path}/ckeditor/ckeditor.js"></script>

<section class="py-5">
    <div class="container-body">
        <h2 class="body-title">커뮤니티 게시글 수정</h2>
        <form method=post action="boardUpdate" enctype="multipart/form-data">
            <table id="boardForm_table" class="table">
                <input type="hidden" name="com_no" value="${community.com_no}">
                <input type="hidden" name="page" value="${page}">
                <tr>
                    <th>아이디</th>
                    <td><input type=text name="com_writer" value="${community.com_writer}" class="form-control" readonly></td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type=text name="com_title"
                               value="${community.com_title }" class="form-control"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea cols=40 rows=5 name="com_content" id="com_content"
                                  class="form-control">${community.com_content}</textarea>
                        <script
                                type="text/javascript">
                            CKEDITOR
                                .replace(
                                    'com_content',
                                    {
                                        filebrowserUploadUrl: '${pageContext.request.contextPath }/adm/fileUpload'
                                    }); // 에디터로 생성
                        </script>
                    </td>
                </tr>
                <tr>
                    <th>대표 이미지</th>
                    <td><input type="file" name="com_file1" class="form-control"></td>
                </tr>
            </table>
            <div id="boardUpdateForm_menu" class="body-menu">

                <input type="submit" value="글수정" class="btn btn-primary"/>
                <input type="button" value="취소" class="btn btn-danger" onclick="history.back(-1)"></td>

            </div>
        </form>
    </div>
</section>
<%@ include file="../layout/footer.jsp" %>

