<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>마이페이지 | 우리집</title>
      <!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	  <!-- jQuery 외부 라이브러리 설정 -->
	  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	  
	  
	  <!-- 사용자 정의 자바스크립트 -->
	  <script>
	   
	  </script>
	  
   </head>
   <!-- css 적용 -->
   	<link href="${pageContext.request.contextPath}/resources/css/member/mypage.css" rel="stylesheet">
   <body>
		<!-- 탭 메뉴 전체 -->
		<div class="tab-menu">
			<!-- 카테고리 -->
			<div class = "category">
	   			<ul class="nav flex-column">
	   			  <li class="nav-item mb-4">
				    <a class="nav-link" aria-disabled="true" style="font-size: 30px; color: black; font-weight: bold;"
				    	href="${pageContext.request.contextPath}/member/mypage">마이페이지</a>
				  <!-- 쇼핑 관련 -->
				  <li class="nav-item nav-item-category">
				    <a class="nav-link disabled" aria-disabled="true" style="font-size: 22px; color: black; margin-bottom: 7px; 
				    														font-weight: bold;">쇼핑 관련</a>
				  </li>
				  <li class="nav-item nav-item-category">
				    <a class="nav-link" href='${pageContext.request.contextPath}/member/myPageOrderList'>주문조회</a>
				  </li>
				  <li class="nav-item nav-item-category">
				    <a class="nav-link" href="#onclick" style="margin-bottom: 30px;">적립금</a>
				  </li>
				  <!-- 나의 활동 -->
	   			  <li class="nav-item nav-item-category">
				    <a class="nav-link disabled" aria-disabled="true" style="font-size: 22px; color: black; margin-bottom: 7px;
				    														font-weight: bold;">나의 활동</a>
				  </li>
				  <li class="nav-item nav-item-category">
				    <a class="nav-link" href="#onclick">관심상품</a>
				  </li>
				  <li class="nav-item nav-item-category">
				    <a class="nav-link" href="#onclick" style="margin-bottom: 30px;">게시글 관리</a>
				  </li>
				  <!-- 회원 정보 -->
				  <li class="nav-item nav-item-category">
				    <a class="nav-link disabled" aria-disabled="true" style="font-size: 22px; color: black; margin-bottom: 7px;
				    														font-weight: bold;">회원 정보</a>
				  </li>  
				  <li class="nav-item nav-item-category">
				    <a class="nav-link" href = '${pageContext.request.contextPath}/member/memberInfo'>회원정보수정</a>
				  </li>
				  <li class="nav-item nav-item-category">
				    <a class="nav-link" href="#onclick" style="margin-bottom: 30px;">배송주소록</a>
				</ul>
   			</div>	
		</div> <!-- 탭 메뉴 전체 -->

	</body>
</html>