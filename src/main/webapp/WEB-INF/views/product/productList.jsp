<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../layout/header.jsp"%>
<%@ include file="../sort.jsp"%>

<section id="section_product_List" class="py-5">
<div class="container">
    <h2 class="body-title">반려동물 용품</h2>
<table class="table table-hover">
        <div class="table-menu">
            <select name="sort" id="sort" class="form-select" onchange="sortPro()">
                <option value="recent" <c:if test="${sortValue == 'recent'}">${'selected'}</c:if> >최신순</option>
                <option value="readcnt"<c:if test="${sortValue == 'readcnt'}">${'selected'}</c:if> >조회순</option>
                <option value="likecnt"<c:if test="${sortValue == 'likecnt'}">${'selected'}</c:if> >추천순</option>
            </select>
            <c:if test="${sessionScope.role == 'product_pro' || sessionScope.role == 'product'|| sessionScope.role == 'master'}">
            <input type="button" class="btn btn-outline-secondary" value="상품 등록" onclick="location.href='${path}/productWrite'"/>
            </c:if>
        </div>
    <tr>
        <th>상품번호</th>
        <th>이미지</th>
        <th>상품명</th>
        <th>판매사</th>
        <th>조회수</th>
        <th>추천수</th>
    </tr>

    <!-- 화면 출력 번호  -->
    <c:set var="no" value="${no}"></c:set>

    <c:forEach var="pl" items="${list}">
        <c:choose>
            <c:when test="${pl.pro_del eq 'n' and pl.stock ne '0'}">
                <%--재고가 있고 삭제여부가 아닐경우--%>
                <tr>
                    <td align="center">
                        ${pl.pro_no}
                    </td>
                    <td>
                        <c:if test="${pl.pro_img != null}">
                            <a href="${path}/productDetail?no=${pl.pro_no}&page=${page}">
                                <img src="${path}/upload/${pl.pro_img}" width="120px" height="110px"></a>
                        </c:if>
                        <c:if test="${pl.pro_img == null}">
                            <a href="${path}/productDetail?no=${pl.pro_no}&page=${page}">
                                <img src="${path}/images/basic_product.jpg" width="120px" height="110px"></a>
                        </c:if>
                    </td>
                    <td>
                        <a href="${path}/productDetail?no=${pl.pro_no}&page=${page}">
                                ${pl.pro_name}
                        </a>
                    </td>
                    <td>${pl.bus_id}</td>
                    <td>${pl.pro_readcnt }</td>
                    <td>${pl.pro_likecnt}</td>
                </tr>
            </c:when>
            <c:otherwise>
                <tr>
                    <td align="center">
                        ${pl.pro_no}
                    </td>
                    <td colspan="4" align="center" style="color: red">
                        재고가 없거나, 삭제된 상품입니다.
                    </td>
                </tr>
            </c:otherwise>
        </c:choose>
    </c:forEach>

</table>
</div>

<!-- 검색 기능 -->
<div class="container-body">
    <form action="productList">


        <!-- 검색 리스트 요청 -->
        <input type="hidden" name="pageNum" value="1">
        <%-- 조회순 --%>
        <input type="hidden" name="sortValue" id="sortValue" value="${sortValue}">
        <!-- pageNum, search, keyword 값전달 -->
        <div class="search">
            <select name="search" class="form-select">
                <option value="pro_name"
                        <c:if test="${search=='pro_name'}">selected="selected" </c:if>>상품명
                </option>
                <option value="pro_content"
                        <c:if test="${search=='pro_content'}">selected="selected" </c:if>>내용
                </option>
                <!-- DTO와 변수이르밍 같아야함 -->
                <option value="subcon"
                        <c:if test="${search=='subcon'}">selected="selected" </c:if>>상품명+내용
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


<!-- 페이지 처리 -->
<section class="py-5">
    <div class="container-body">
        <nav>
            <ul class="pagination">
                <li class="page-item">
<!-- 검색 했을 경우의 페이징 처리 -->
<c:if test="${not empty keyword}">

    <!-- 1페이지로 이동 -->
    <c:if test="${paging.currentPage!=1}">
        <li><a class="page-link" href="productList?pageNum=1&search=${search}&keyword=${keyword}&sortValue=${sortValue}"> << </a></li>
    </c:if>

    <!-- 이전 블록이동 -->
    <c:if test="${paging.startPage > paging.pagePerBlk }">
        <li><a class="page-link"
               href="productList?pageNum=${paging.startPage - 1}&search=${search}&keyword=${keyword}&sortValue=${sortValue}">
            <
        </a></li>
    </c:if>

    <!-- 번호 -->
    <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
        <li <c:if test="${paging.currentPage==i}">${i}</c:if>>
            <a class="page-link" href="productList?pageNum=${i}&search=${search}&keyword=${keyword}&sortValue=${sortValue}">${i}</a>
        </li>
    </c:forEach>

    <!-- 다음 블럭으로 이동 -->
    <c:if test="${paging.endPage < paging.totalPage}">
        <li><a class="page-link"
               href="productList?pageNum=${paging.endPage + 1}&search=${search}&keyword=${keyword}&sortValue=${sortValue}">
            >
        </a></li>
    </c:if>

    <!-- 마지막 페이지 이동 -->
    <c:if test="${paging.currentPage!=paging.totalPage}">
        <li><a class="page-link"
               href="productList?pageNum=${paging.totalPage}&search=${search}&keyword=${keyword}&sortValue=${sortValue}">
            >>
        </a></li>
    </c:if>
</c:if>

<!-- 전체 목록의 페이징 처리 -->
<c:if test="${empty keyword}">
<c:if test="${paging.currentPage!=1}">
    <li><a class="page-link" href="productList?pageNum=1&sortValue=${sortValue}"> << </a></li>
</c:if>

<!-- 이전 블록이동 -->
<c:if test="${paging.startPage > paging.pagePerBlk}">
    <li><a class="page-link" href="productList?pageNum=${paging.startPage - 1}&sortValue=${sortValue}"> < </a></li>
</c:if>


<!-- 번호 -->
<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
    <li <c:if test="${paging.currentPage==i}">${paging.currentPage}</c:if>>
        <a class="page-link" href="productList?pageNum=${i}&sortValue=${sortValue}">${i}</a></li>
</c:forEach>


<!-- 다음 블록으로 이동 -->
<c:if test="${paging.endPage < paging.totalPage}">
    <li><a class="page-link" href="productList?pageNum=${paging.endPage + 1}&sortValue=${sortValue}"> > </a></li>
</c:if>

<!-- 마지막 페이지 이동 -->
<c:if test="${paging.currentPage!=paging.totalPage}">
    <li><a class="page-link" href="productList?pageNum=${paging.totalPage}&sortValue=${sortValue}"> >> </a></li>
</c:if>
</c:if>
                </li>
            </ul>
        </nav>
    </div>
</section>

</body>
</html>

<%@ include file="../layout/footer.jsp"%>
