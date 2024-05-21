<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록 | 우리집</title>
<!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
<!-- jQuery 외부 라이브러리 설정 -->
<script
   src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
   rel="stylesheet">

<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
   integrity="sha512-..." crossorigin="anonymous" />
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- 사용자 정의 자바스크립트 -->
<script
   src="${pageContext.request.contextPath}/resources/js/product/product_list.js"
   rel="stylesheet"></script>
<script>
   
</script>
<!-- css 적용 -->
<link
   href="${pageContext.request.contextPath}/resources/css/product/product_list.css"
   rel="stylesheet">
</head>

<body>
   <%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="modal fade" tabindex="-1" id="addCartModal">
    <div class="modal-dialog modal-dialog-centered" style="width: 320px; height: 250px;">
        <div class="modal-content">
            <div class="modal-header border-0">
                <div class="modal-title d-flex" style="text-align: center; display: none;"></div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body border-0 p-0" style="text-align: center;">
                <i class="fas fa-solid fa-cart-plus text-black" style="font-size: 3rem; margin-bottom: 20px;"></i>
                <p style="text-align: center; font-size: 16px">상품이 장바구니에 추가되었습니다.</p>
            </div>
            <div class="modal-footer border-0" style="justify-content: center;">
                <button onclick="location.href='${pageContext.request.contextPath}/cart/cartView'" type="button" class="btn btn-outline-dark btn-sm">장바구니 이동</button>
                <button type="button" class="shopping btn btn-outline-dark btn-sm" data-bs-dismiss="modal">쇼핑 계속하기</button>
            </div>
        </div>
    </div>
</div>
   <div class="container">
      <!-- 헤더 -->
      <div class="header">
         <!-- 베스트 상품 제목 -->
         <div class="best-product-title">
            <h2>
               <strong>B &nbsp;E &nbsp;S &nbsp;T</strong>
            </h2>
         </div>
         <!-- 베스트 상품 -->
         <div class="best-product">
            <div id="carouselExampleAutoplaying" class="carousel slide"
               data-bs-ride="carousel">
               <div class="carousel-inner">
                  <div class="carousel-item active">
                     <div class="bestproduct-img">
                        <div id="bestproduct-no1">
                           <img alt=""
                              src="https://ssueim.com/web/product/big/202404/7e887ef07fda6770589a9bef7a3a8979.jpg"
                              style="width: 300px; border-radius: 0px 10px 10px 10px;">
                           <!-- 장바구니 버튼 -->
                           <div class="btn" id="cart"
                              style="transform: translate(-135%, 640%);">
                              <i class="bi bi-handbag-fill" style="color: white;"></i>
                           </div>
                           <div id="best-name">하트 시그널 커피잔 1인조 세트 (3color)</div>
                           <div id="best-price">22,400원</div>
                           <!-- best 표시 -->
                           <div class="best-box">
                              <div id="box-font">BEST1</div>
                           </div>
                        </div>
                        <div id="bestproduct-no2">
                           <img alt=""
                              src="https://ssueim.com/web/product/big/202305/ef6f440539f442e394d16c1430605301.jpg"
                              style="width: 300px; border-radius: 0px 10px 10px 10px;">
                           <!-- 장바구니 버튼 -->
                           <div class="btn" id="cart"
                              style="transform: translate(-135%, 640%);">

                              <i class="bi bi-handbag-fill" style="color: white;"></i>
                           </div>
                           <div id="best-name">굿바이브 머그 (2color)</div>
                           <div id="best-price">21% 15,900원</div>
                           <!-- best 표시 -->
                           <div class="best-box">
                              <div id="box-font">BEST2</div>
                           </div>
                        </div>
                        <div id="bestproduct-no3">
                           <img alt=""
                              src="https://ssueim.com/web/product/big/202304/a4937b0be95e583315ba3191f486a098.jpg"
                              style="width: 300px; border-radius: 0px 10px 10px 10px;">
                           <!-- 장바구니 버튼 -->
                           <div class="btn" id="cart"
                              style="transform: translate(-135%, 640%);">
                              <i class="bi bi-handbag-fill" style="color: white;"></i>
                           </div>
                           <div id="best-name">마리벨 1인 홈세트 5P (3color)</div>
                           <div id="best-price">30,900원</div>
                           <div class="best-box">
                              <div id="box-font">BEST3</div>
                           </div>
                        </div>
                        <div id="bestproduct-no4">
                           <img alt=""
                              src="https://ssueim.com/web/product/big/202305/86f930e4109f171de034b8d68fd7d201.jpg"
                              style="width: 300px; border-radius: 0px 10px 10px 10px;">
                           <!-- 장바구니 버튼 -->
                           <div class="btn" id="cart"
                              style="transform: translate(-135%, 640%);">
                              <i class="bi bi-handbag-fill" style="color: white;"></i>
                           </div>
                           <div id="best-name">블랑 플리츠 면기</div>
                           <div id="best-price">23% 13,900원</div>
                           <div class="best-box">
                              <div id="box-font">BEST4</div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="carousel-item">
                     <div class="bestproduct-img">
                        <div id="bestproduct-no5">
                           <img alt=""
                              src="https://ssueim.com/web/product/big/202202/632af7d9af609449dc6dd2eb02386175.jpg"
                              style="width: 300px; border-radius: 0px 10px 10px 10px;">
                           <!-- 장바구니 버튼 -->
                           <div class="btn" id="cart"
                              style="transform: translate(-135%, 640%);">
                              <i class="bi bi-handbag-fill" style="color: white;"></i>
                           </div>
                           <div id="best-name">라움 접시(대)</div>
                           <div id="best-price">22,400원</div>
                           <!-- best 표시 -->
                           <div class="best-box">
                              <div id="box-font">BEST5</div>
                           </div>
                        </div>
                        <div id="bestproduct-no6">
                           <img alt=""
                              src="https://ssueim.com/web/product/big/202212/e963467f54c978e3d526c7f5b883f032.jpg"
                              style="width: 300px; border-radius: 0px 10px 10px 10px;">
                           <!-- 장바구니 버튼 -->
                           <div class="btn" id="cart"
                              style="transform: translate(-135%, 640%);">
                              <i class="bi bi-handbag-fill" style="color: white;"></i>
                           </div>
                           <div id="best-name">클래식 원형접시(대)</div>
                           <div id="best-price">15,900원</div>
                           <!-- best 표시 -->
                           <div class="best-box">
                              <div id="box-font">BEST6</div>
                           </div>
                        </div>
                        <div id="bestproduct-no7">
                           <img alt=""
                              src="https://ssueim.com/web/product/big/202212/61a7e3a53ad030aa993e9d1241bc19a0.jpg"
                              style="width: 300px; border-radius: 0px 10px 10px 10px;">
                           <!-- 장바구니 버튼 -->
                           <div class="btn" id="cart"
                              style="transform: translate(-135%, 640%);">
                              <i class="bi bi-handbag-fill" style="color: white;"></i>
                           </div>
                           <div id="best-name">이지앤굿 2절 나눔찬기</div>
                           <div id="best-price">10,900원</div>
                           <div class="best-box">
                              <div id="box-font">BEST7</div>
                           </div>
                        </div>
                        <div id="bestproduct-no8">
                           <img alt=""
                              src="https://ssueim.com/web/product/big/202009/cc285bad271ced887d4cdd4dbed63854.jpg"
                              style="width: 300px; border-radius: 0px 10px 10px 10px;">
                           <!-- 장바구니 버튼 -->
                           <div class="btn" id="cart"
                              style="transform: translate(-135%, 640%);">
                              <i class="bi bi-handbag-fill" style="color: white;"></i>
                           </div>
                           <div id="best-name">키엘로 직사각접시 (2color)</div>
                           <div id="best-price">6,900원</div>
                           <div class="best-box">
                              <div id="box-font">BEST8</div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="carousel-item">
                     <div class="bestproduct-img">
                        <div id="bestproduct-no9">
                           <img alt=""
                              src="https://ssueim.com/web/product/big/202111/dd1923493c7072d4f845717401b272f9.jpg"
                              style="width: 300px; border-radius: 0px 10px 10px 10px;">
                           <!-- 장바구니 버튼 -->
                           <div class="btn" id="cart"
                              style="transform: translate(-135%, 640%);">
                              <i class="bi bi-handbag-fill" style="color: white;"></i>
                           </div>
                           <div id="best-name">마일드 매트 찬기 소 (4color)</div>
                           <div id="best-price">5,500원</div>
                           <!-- best 표시 -->
                           <div class="best-box">
                              <div id="box-font">BEST9</div>
                           </div>
                        </div>
                        <div id="bestproduct-no10">
                           <img alt=""
                              src="https://ssueim.com/web/product/big/202112/26f989f733791cc303055f136d26855b.jpg"
                              style="width: 300px; border-radius: 0px 10px 10px 10px;">
                           <!-- 장바구니 버튼 -->
                           <div class="btn" id="cart"
                              style="transform: translate(-135%, 640%);">
                              <i class="bi bi-handbag-fill" style="color: white;"></i>
                           </div>
                           <div id="best-name">스테이블 대접 (2color)</div>
                           <div id="best-price">5,900원</div>
                           <!-- best 표시 -->
                           <div class="best-box">
                              <div id="box-font">BEST10</div>
                           </div>
                        </div>
                        <div id="bestproduct-no11">
                           <img alt=""
                              src="https://ssueim.com/web/product/big/202111/08298585682d8cac2af863a8d42b373d.jpg"
                              style="width: 300px; border-radius: 0px 10px 10px 10px;">
                           <!-- 장바구니 버튼 -->
                           <div class="btn" id="cart"
                              style="transform: translate(-135%, 640%);">
                              <i class="bi bi-handbag-fill" style="color: white;"></i>
                           </div>
                           <div id="best-name">마일드 매트 원형접시 (4color)</div>
                           <div id="best-price">9,500원</div>
                           <div class="best-box">
                              <div id="box-font">BEST11</div>
                           </div>
                        </div>
                        <div id="bestproduct-no12">
                           <img alt=""
                              src="https://ssueim.com/web/product/big/202111/0065ebf0d55da61684525a7c9fb6aad2.jpg"
                              style="width: 300px; border-radius: 0px 10px 10px 10px;">
                           <!-- 장바구니 버튼 -->
                           <div class="btn" id="cart"
                              style="transform: translate(-135%, 640%);">
                              <i class="bi bi-handbag-fill" style="color: white;"></i>
                           </div>
                           <div id="best-name">마일드 매트 대접 (4color)</div>
                           <div id="best-price">6,900원</div>
                           <div class="best-box">
                              <div id="box-font">BEST12</div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

               <!-- 방향 버튼 -->
               <button class="carousel-control-prev" type="button"
                  data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                  <i class="bi bi-chevron-left"></i> <span
                     class="carousel-control-prev-icon" aria-hidden="true"> </span> <span
                     class="visually-hidden">Previous</span>
               </button>
               <button class="carousel-control-next" type="button"
                  data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                  <i class="bi bi-chevron-right"></i> <span
                     class="carousel-control-next-icon" aria-hidden="true"></span> <span
                     class="visually-hidden">Next</span>
               </button>
            </div>
         </div>
         <!-- best-product -->

      </div>
      <!-- 헤더 -->

      <!-- 바디 -->
      <div class="body">
         <!-- 고정 탭 -->
         <div class="fixed-tab">
            <!-- 검색창 -->
            <div id="sticky">
               <div class="search-box">
                  <nav class="navbar">
                     <div class="container-fluid">
                        <form class="d-flex" role="search">
                           <input class="form-control me-2" type="search"
                              placeholder="Search" aria-label="Search">
                           <button class="btn btn-outline-dark" type="submit">Search</button>
                        </form>
                     </div>
                  </nav>
               </div>
				
               <!-- 카테고리 -->
               <div id="category">
                  <ul class="nav flex-column" style="margin-top: 20px;">
                     <li class="nav-item nav-item-category"><a class="nav-link disabled"
                        aria-disabled="true"
                        style="font-size: 22px; color: black; margin-bottom: 10px;"><strong>카테고리</strong></a>
                     </li>
                     <li class="nav-item nav-item-category"><a class="nav-link ${pcategoryName==''? 'nav-active': '' }"
                        aria-current="page" href="javascript:void(0);"
                        onclick="categoryAllFunction(); return false;"><strong>전체</strong></a></li>
                     <li class="nav-item nav-item-category"><a class="nav-link ${pcategoryName=='수저세트'? 'nav-active': '' }"
                        href="javascript:void(0);"
                        onclick="categoryFunction('수저세트'); return false;"><strong>수저세트</strong></a></li>
                     <li class="nav-item nav-item-category"><a class="nav-link ${pcategoryName=='컵'? 'nav-active': '' }"
                        href="javascript:void(0);"
                        onclick="categoryFunction('컵'); return false;"><strong>컵</strong></a>
                     </li>
                     <li class="nav-item nav-item-category"><a class="nav-link ${pcategoryName=='그릇'? 'nav-active': '' }"
                        href="javascript:void(0);"
                        onclick="categoryFunction('그릇'); return false;"><strong>그릇</strong></a>
                     </li>
                     <li class="nav-item nav-item-category"><a class="nav-link ${pcategoryName=='접시'? 'nav-active': '' }"
                        href="javascript:void(0);"
                        onclick="categoryFunction('접시'); return false;"><strong>접시</strong></a>
                     </li>
                  </ul>
               </div>
            </div>
         </div>

         <!-- body -->
         <div class="productList">
            <div class="productList-header">
               <!-- 옵션 -->
               <div class="orderType d-flex mb-4"
                  style="justify-content: flex-start;">
                  <!-- 새로고침 아이콘 -->
                  <button class="btn" id="return-btn"
                     onclick="window.location.reload()" style="margin-right: 8px;">
                     <i class="bi bi-arrow-counterclockwise"></i>
                  </button>
                  <button type="button" class="btn" id="cate-btn"
                     style="margin-right: 8px;">추천순</button>
                  <button type="button" class="btn" id="cate-btn"
                     style="margin-right: 8px;">높은가격순</button>
                  <button type="button" class="btn" id="cate-btn"
                     style="margin-right: 8px;">낮은가격순</button>
                  <button type="button" class="btn" id="cate-btn"
                     style="margin-right: 8px;">리뷰많은순</button>
                  <button type="button" class="btn" id="cate-btn">할인순</button>
               </div>

               <!-- 상품 목록 -->
               <div class="product-list">
                  <div id="productItem">
                     <c:forEach var="product" items="${productList}">
                        <div id="product_no">
                           <input id="pid" name="pid" type="hidden" value="${product.pid}">
                           <a
                              href="${pageContext.request.contextPath}/product/product_detail?pid=${product.pid}">
                              <img alt=""
                              src="productImageDownload?pid=${product.pid}&index=1&pthumbBodyType=thumb"
                              style="width: 290px; border-radius: 10px;">
                           </a>
                           <!-- 장바구니 버튼 -->

                           <button type="button" class="addcartBtn" id="cart"
                              style="background-color: black; border-radius: 50%;">
                              <i class="bi bi-handbag-fill" style="color: white;"></i>
                           </button>

                           <div id="pname">${product.pname}</div>
                           <div class="d-flex">
                              <div id="pprice" style="font-size: 13px">${product.pprice}</div>
                              <div style="font-size: 13px">원</div>
                           </div>
                        </div>
                     </c:forEach>
                  </div>

                  <!-- pagination -->
                  <div class="pagenation">
                     <nav aria-label="Page navigation example">
                        <ul class="pagination" style="justify-content: center;">
                           <li class="page-item"><a class="page-link" href="#"
                              aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                           </a></li>
                           <li class="page-item"><a class="page-link" href="#">1</a></li>
                           <li class="page-item"><a class="page-link"
                              href="#product_no4">2</a></li>
                           <li class="page-item"><a class="page-link"
                              href="#product_no7">3</a></li>
                           <li class="page-item"><a class="page-link"
                              href="#product_no10">4</a></li>
                           <li class="page-item"><a class="page-link"
                              href="#product_no12">5</a></li>
                           <li class="page-item"><a class="page-link" href="#"
                              aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                           </a></li>
                        </ul>
                     </nav>
                  </div>
                  <!-- pagination -->

               </div>
               <!-- 상품 목록 -->
            </div>
         </div>

      </div>
      <!-- container -->
   </div>
   <%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>