<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="layout/header.jsp" %>
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <h2 class="text-primary" style="padding-bottom: 40px">커뮤니티 인기글</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var = "community" items="${communityList}">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <c:if test="${community.com_file == null}">
                            <img class="card-img-top" src="${path}/images/basic_community.png"/>
                        </c:if>
                        <c:if test="${community.com_file != null}">
                            <img class="card-img-top" src="${path}/upload/community/${community.com_file}"/>
                        </c:if>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">${community.com_title}</h5>
                                <!-- Product price-->
                                작성자 : ${community.com_writer}<br>
                                조회수 : ${community.com_readcnt}
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-outline-dark mt-auto" href="boardContent?com_no=${community.com_no}&page=1">상세 페이지</a></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <h2 class="text-primary" style="padding-bottom: 40px">근처 동물병원</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var = "hospital" items="${hospitalList}">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <c:if test="${empty hospital.hos_file}">
                            <img class="card-img-top" src="${path}/images/basic_hospital.jpg"/>
                        </c:if>
                        <c:if test="${not empty hospital.hos_file}">
                            <img class="card-img-top" src="${path}/upload/hospital/${hospital.hos_file}"/>
                        </c:if>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">${hospital.hos_name}</h5>
                                <!-- Product price-->
                                위치 : ${hospital.hos_loc}<br>
                                연락처 : ${hospital.hos_tel}
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-outline-dark mt-auto" href="hospitalView?hos_no=${hospital.hos_no}&page=1">상세 페이지</a></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <h2 class="text-primary" style="padding-bottom: 40px">반려동물 용품</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var = "product" items="${productList}">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <c:if test="${empty product.pro_img}">
                            <img class="card-img-top" src="${path}/images/basic_product.jpg"/>
                        </c:if>
                        <c:if test="${not empty product.pro_img}">
                            <img class="card-img-top" src="${path}/upload/product/${product.pro_img}"/>
                        </c:if>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">${product.pro_name}</h5>
                                <!-- Product price-->
                                가격 : ${product.price}
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-outline-dark mt-auto" href="productDetail?no=${product.pro_no}&page=1">상세 페이지</a></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<%@ include file="layout/footer.jsp" %>