<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<section class="py-5">
    <div class="container">
        <h2 class="body-title">공지사항 게시판 목록</h2>
        <!-- 글작성 버튼 -->
        <div style="text-align: right; padding-bottom: 20px;">
            <c:if test="${sessionScope.role == 'master' || sessionScope.role == 'notice'}">
                <input type="button" value="글작성" onclick="location.href='noticeInsertForm'"
                       class="btn btn-outline-secondary">
            </c:if>
        </div>
        <!-- 목록 -->
        <table class="table table-hover">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>

            <c:if test="${empty list}">
                <tr>
                    <td colspan="5">데이터가 없습니다</td>
                </tr>
            </c:if>


            <c:if test="${not empty list}">

                <!-- 화면 출력 번호 변수 정의 -->
                <c:set var="no" value="${no}"/>

                <!-- 반복문 시작 -->
                <c:forEach var="notice" items="${list}">
                    <tr>
                        <td>${no}</td>
                        <td>
                            <a href="noticeView?not_no=${notice.not_no}&pageNum=${paging.currentPage}">
                                    ${notice.not_title}
                            </a>
                        </td>
                        <td>${notice.not_writer}</td>
                        <td><fmt:formatDate value="${notice.not_reg}" pattern="yyyy/MM/dd HH:mm:ss EEE요일"/></td>
                        <td>${notice.not_readcnt}</td>
                    </tr>
                    <c:set var="no" value="${no-1}"/>
                </c:forEach>

            </c:if>
        </table>
        <!-- 목록 끝 -->
    </div>
    <div class="container-body">

        <!-- 검색 기능 -->
        <form action="notList">
            <!-- 검색 리스트 요청 -->
            <input type="hidden" name="pageNum" value="1">
            <!-- pageNum, search, keyword 값전달 -->
            <div class="search">
                <select name="search" class="form-select">
                    <option value="not_title"
                            <c:if test="${search=='not_title'}">selected="selected"</c:if>>제목
                    </option>
                    <option value="not_content"
                            <c:if test="${search=='not_content'}">selected="selected"</c:if>>내용
                    </option>
                    <!-- DTO와 변수이르밍 같아야함 -->
                    <option value="subcon"
                            <c:if test="${search=='subcon'}">selected="selected"</c:if>>제목+내용
                    </option>
                </select>
                <input type="text" name="keyword" class="form-control">
                <!-- dto -->
                <input type="submit" value="확인" class="btn btn-outline-secondary">
            </div>
        </form>
        <!-- 글 검색 끝 -->
    </div>
</section>


<section class="py-5">
    <div class="container-body">
        <nav>
            <ul class="pagination">
                <li class="page-item">
                    <!-- 검색 했을 경우의 페이징 처리 -->
                    <c:if test="${not empty keyword}">

                    <!-- 1페이지로 이동 -->
                    <c:if test="${paging.currentPage!=1}">
                <li><a class="page-link" href="notList?pageNum=1&search=${search}&keyword=${keyword}">
                    <<
                </a></li>
                </c:if>

                <!-- 이전 블록이동 -->
                <c:if test="${paging.startPage > paging.rowPerPage }">
                    <li><a class="page-link"
                           href="notList?pageNum=${paging.startPage - 1}&search=${search}&keyword=${keyword}">
                        <
                    </a></li>
                </c:if>

                <!-- 번호 -->
                <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
                    <li<c:if test="${paging.currentPage==i}"> ${i} </c:if>>
                        <a class="page-link" href="notList?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a></li>
                </c:forEach>

                <!-- 다음 블록으로 이동 -->
                <c:if test="${paging.endPage < paging.totalPage}">
                    <li><a class="page-link"
                           href="notList?pageNum=${paging.endPage + 1}&search=${search}&keyword=${keyword}">
                        >
                    </a></li>
                </c:if>

                <!-- 마지막 페이지 이동 -->
                <c:if test="${paging.currentPage!=paging.totalPage}">
                    <li><a class="page-link" href="notList?pageNum=${paging.totalPage}&search=${search}&keyword=${keyword}">
                        >>
                    </a></li>
                </c:if>
                </c:if>

                    <!-- 전체 목록의 페이징 처리 -->
                    <c:if test="${empty keyword}">
                    <!-- 1페이지로 이동 -->
                    <c:if test="${paging.currentPage!=1}">
                <li><a class="page-link" href="notList?pageNum=1"> << </a></li>
                </c:if>

                <!-- 이전 블록이동 -->
                <c:if test="${paging.startPage > paging.rowPerPage}">
                    <li><a class="page-link" href="notList?pageNum=${paging.startPage - 1}"> < </a></li>
                </c:if>

                <!-- 번호 -->
                <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
                    <li <c:if test="${paging.currentPage==i}">${paging.currentPage}</c:if>>
                        <a class="page-link" href="notList?pageNum=${i}">${i}</a></li>
                </c:forEach>

                <!-- 다음 블록으로 이동 -->
                <c:if test="${paging.endPage < paging.totalPage}">
                    <li><a class="page-link" href="notList?pageNum=${paging.endPage + 1}"> > </a></li>
                </c:if>

                <!-- 마지막 페이지 이동 -->
                <c:if test="${paging.currentPage!=paging.totalPage}">
                    <li><a class="page-link" href="notList?pageNum=${paging.totalPage}"> >> </a></li>
                </c:if>

                </c:if>
                </li>
            </ul>
        </nav>
    </div>
</section>

<%@ include file="../layout/footer.jsp" %>