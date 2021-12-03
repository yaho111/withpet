<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<section class="py-5">
    <div class="container">
        <h2 class="body-title">Q&A 게시판 목록</h2>
        <div style="text-align: right; padding-bottom: 20px;">
            <c:if test="${sessionScope.id != null}">
                <input type="button" class="btn btn-outline-secondary" value="글 작성"
                       onclick="location.href='qnaInsertForm'"/>
            </c:if>
        </div>
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
                    <td colspan="5"> 데이터가 없습니다</td>
                </tr>
            </c:if>
            <c:if test="${not empty list}">
                <!-- 화면 출력 번호 변수 정의 -->
                <c:set var="no" value="${no}"></c:set>
                <!-- 반복문 시작 -->
                <c:forEach var="qna" items="${list}">
                    <!-- 비밀글 처리 -->
                    <%-- <c:if test="${qna.qna_secret2 == (sessionScope.id == qna.qna_writer)? 'YY':'NN'}"> --%>
                    <tr>
                        <td>${no}</td>
                        <!-- 비공개 -->
                        <c:if test="${qna.qna_secret == 'N'}">
                            <td>
                                <!-- 일반 회원 -->
                                <c:if test="${sessionScope.id == null || qna.qna_writer != sessionScope.id && sessionScope.role == 'user'}">
                                    <img width="16px" height="16px" src="./images/locked.png">비밀글입니다.
                                </c:if>

                                <!-- 작성자, 관리자 -->
                                <c:if test="${qna.qna_writer == sessionScope.id || sessionScope.role == 'notice' || sessionScope.role == 'master'}">
                                    <!-- 답글처리 -->
                                    <div align="left">
                                        <c:if test="${qna.qna_lev != 0}">
                                            <c:forEach var="k" begin="1" end="${qna.qna_lev}">
                                                &nbsp;&nbsp;
                                            </c:forEach>
                                            <img src="./images/AnswerLine.gif">
                                        </c:if>
                                        <!-- 답글처리 끝 -->

                                        <a href="qnaView?qna_no=${qna.qna_no}&pageNum=${paging.currentPage}">
                                            <img width="16px" height="16px" src="./images/locked.png">${qna.qna_title}
                                        </a>
                                    </div>
                                </c:if>

                            </td>
                            <td>익명</td>
                            <td><fmt:formatDate value="${qna.qna_reg}"
                                                pattern="YYYY/MM/dd EEE요일"/></td>
                            <td>미공개</td>

                        </c:if>

                        <c:if test="${qna.qna_secret == 'Y'}">
                            <td>
                                <div align="left">
                                    <c:if test="${qna.qna_lev != 0}">
                                        <c:forEach var="k" begin="1" end="${qna.qna_lev}">
                                            &nbsp;&nbsp;
                                        </c:forEach>
                                        <img src="./images/AnswerLine.gif">
                                    </c:if>

                                    <a href="qnaView?qna_no=${qna.qna_no}&pageNum=${paging.currentPage}">
                                            ${qna.qna_title} </a>
                                </div>
                            </td>
                            <td>${qna.qna_writer}</td>
                            <td><fmt:formatDate value="${qna.qna_reg}"
                                                pattern="YYYY/MM/dd EEE요일"/></td>
                            <td>${qna.qna_readcnt}</td>
                        </c:if>

                            <%-- 					<c:if test="${sessionScope.id == qna.qna_writer && qna.qna_secret == 'N'}">
                            <td>
                                <div align="left">
                                    <c:if test="${qna.qna_lev != 0}">
                                        <c:forEach var="k" begin="1" end="${qna.qna_lev}">
                                            &nbsp;&nbsp;
                                        </c:forEach>
                                        <img src="./images/AnswerLine.gif">
                                    </c:if>

                                    <a href="qnaView?qna_no=${qna.qna_no}&pageNum=${paging.currentPage}">
                                        ${qna.qna_title} </a>
                                </div>
                            </td>
                            <td>${qna.qna_writer}</td>
                            <td><fmt:formatDate value="${qna.qna_reg}" pattern="YYYY/MM/dd EEE요일"/></td>
                            <td>${qna.qna_readcnt}</td>
                            </c:if> --%>
                    </tr>
                    <c:set var="no" value="${no-1}"/>
                    <%-- </c:if> --%>
                </c:forEach>
            </c:if>
        </table>
        <!-- 목록 끝 -->
    </div>
    <!-- 검색 기능 -->
    <div class="container-body">
        <form action="qnaList">
            <!-- 검색 리스트 요청 -->
            <input type="hidden" name="pageNum" value="1">
            <!-- pageNum, search, keyword 값전달 -->
            <div class="search">
                <select name="search" class="form-select">
                    <option value="qna_title"
                            <c:if test="${search=='qna_title'}">selected="selected" </c:if>>제목
                    </option>
                    <option value="qna_content"
                            <c:if test="${search=='qna_content'}">selected="selected" </c:if>>내용
                    </option>
                    <!-- DTO와 변수이르밍 같아야함 -->
                    <option value="subcon"
                            <c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용
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
                <li><a class="page-link" href="qnaList?pageNum=1&search=${search}&keyword=${keyword}"> << </a></li>
                </c:if>

                <!-- 이전 블록이동 -->
                <c:if test="${paging.startPage > paging.pagePerBlk }">
                    <li><a class="page-link"
                           href="qnaList?pageNum=${paging.startPage - 1}&search=${search}&keyword=${keyword}">
                        <
                    </a></li>
                </c:if>

                <!-- 번호 -->
                <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
                    <li <c:if test="${paging.currentPage==i}">${i}</c:if>>
                        <a class="page-link" href="qnaList?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a>
                    </li>
                </c:forEach>

                <!-- 다음 블럭으로 이동 -->
                <c:if test="${paging.endPage < paging.totalPage}">
                    <li><a class="page-link"
                           href="qnaList?pageNum=${paging.endPage + 1}&search=${search}&keyword=${keyword}">
                        >
                    </a></li>
                </c:if>

                <!-- 마지막 페이지 이동 -->
                <c:if test="${paging.currentPage!=paging.totalPage}">
                    <li><a class="page-link"
                           href="qnaList?pageNum=${paging.totalPage}&search=${search}&keyword=${keyword}">
                        >>
                    </a></li>
                </c:if>
                </c:if>

                <!-- 전체 목록의 페이징 처리 -->
                <c:if test="${empty keyword}">
                    <!-- 1페이지로 이동 -->

                    <c:if test="${paging.currentPage!=1}">
                        <li><a class="page-link" href="qnaList?pageNum=1"> << </a></li>
                    </c:if>

                    <!-- 이전 블록이동 -->
                    <c:if test="${paging.startPage > paging.pagePerBlk}">
                        <li><a class="page-link" href="qnaList?pageNum=${paging.startPage - 1}"> < </a></li>
                    </c:if>


                    <!-- 번호 -->
                    <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
                        <li <c:if test="${paging.currentPage==i}">${paging.currentPage}</c:if>>
                            <a class="page-link" href="qnaList?pageNum=${i}">${i}</a></li>
                    </c:forEach>


                    <!-- 다음 블록으로 이동 -->
                    <c:if test="${paging.endPage < paging.totalPage}">
                        <li><a class="page-link" href="qnaList?pageNum=${paging.endPage + 1}"> > </a></li>
                    </c:if>

                    <!-- 마지막 페이지 이동 -->
                    <c:if test="${paging.currentPage!=paging.totalPage}">
                        <li><a class="page-link" href="qnaList?pageNum=${paging.totalPage}"> >> </a></li>
                    </c:if>
                </c:if>
                </li>
            </ul>
        </nav>
    </div>
</section>


<%@ include file="../layout/footer.jsp" %>