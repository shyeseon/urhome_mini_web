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
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    
    <!-- 전체 div -->
	<div class="mypage-div">
		<!-- 탭 메뉴 전체 -->
		<div class="tab-menu">
			<!-- 카테고리 -->
			<div class = "category">
	   			<ul class="nav flex-column">
	   			  <li class="nav-item mb-4">
				    <a class="nav-link" aria-disabled="true" style="font-size: 30px; color: black; font-weight: bold;"
				    	href="${pageContext.request.contextPath}/member/mypage">마이페이지</a>
				  <!-- 쇼핑 관련 -->
				  <li class="nav-item">
				    <a class="nav-link disabled" aria-disabled="true" style="font-size: 22px; color: black; margin-bottom: 7px; 
				    														font-weight: bold;">쇼핑 관련</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href='${pageContext.request.contextPath}/member/myPageOrderList'>주문조회</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#onclick" style="margin-bottom: 30px;">적립금</a>
				  </li>
				  <!-- 나의 활동 -->
	   			  <li class="nav-item">
				    <a class="nav-link disabled" aria-disabled="true" style="font-size: 22px; color: black; margin-bottom: 7px;
				    														font-weight: bold;">나의 활동</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#onclick">관심상품</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#onclick" style="margin-bottom: 30px;">게시글 관리</a>
				  </li>
				  <!-- 회원 정보 -->
				  <li class="nav-item">
				    <a class="nav-link disabled" aria-disabled="true" style="font-size: 22px; color: black; margin-bottom: 7px;
				    														font-weight: bold;">회원 정보</a>
				  </li>  
				  <li class="nav-item">
				    <a class="nav-link" href = '${pageContext.request.contextPath}/member/memberInfo'>회원정보수정</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#onclick" style="margin-bottom: 30px;">배송주소록</a>
				</ul>
   			</div>	
		</div> <!-- 탭 메뉴 전체 -->
		
	<!-- mypage main -->
	<div class="info">                               
		<!-- 멤버 정보 -->
		<div class="info-div d-flex">
			<div id="member-info" style="display: flex; margin-left: 20px;">
				<div id="member-name" style="font-weight: bolder; font-size: 30px; margin-right: 10px;">${member.mname}</div>
				<div id="member-id" style="color: gray; font-size: 18px; margin-top: 15px;">${member.mid}</div>
			</div>
		</div>	<!-- 멤버 정보 -->
		
		<div class="cart-receipt d-flex">
			<div id="cart" style="flex: 1; margin-top: 35px;">
				<div id="cart-title">장바구니</div>
				<div id="cart-content" style="font-size: 24px; margin-top: 7px;">0</div>
			</div>
			<div class="vl" style="height: 130px;"></div>
			<div id="receipt" style="flex: 1; margin-top: 35px;">
				<div id="cart-title">구매내역</div>
				<div id="cart-content" style="font-size: 24px; margin-top: 7px;">0</div>
			</div>
		</div>
		
		<!-- myshopping 정보 -->
		<div class="myshopping">
			<div style="margin-left: 20px;"><h3><strong>나의 쇼핑</strong></h3></div>
			<!-- 내역 조회 -->
			<div class="info-check d-flex">
				<!-- 주문 배송 조회 -->
				<div class="select-order">
					<div id="order-title" style="margin-top: 35px;"><strong>주문/배송조회</strong></div>
					<!-- 주문 배송 상태 -->
					<div class="order-status">
						<div class="status">입금전
							<div class="status-content">0</div>
						</div>
						<div class="status">배송준비중
							<div class="status-content">0</div>						
						</div>
						<div class="status">배송중
							<div class="status-content">0</div>
						</div>
						<div class="status">배송완료
							<div class="status-content">0</div>
						</div>
					</div>
				</div> <!-- 주문 배송 조회 -->
				
				<div class="vl" style="height: 200px;"></div>
				<!-- 취소 교환 반품 내역 -->
				<div class="cancle-order">
					<div id="order-title" style="margin-top: 35px;"><strong>취소/교환/반품 내역</strong></div>
					<!-- 내역 -->
					<div class="order-receipt">
						<div class="status">취소
							<div class="status-content">0</div>
						</div>
						<div class="status">교환
							<div class="status-content">0</div>						
						</div>
						<div class="status">반품
							<div class="status-content">0</div>
						</div>
					</div>
					
				</div> <!-- 취소 교환 반품 내역 -->
			</div> <!-- 내역 조회 -->
			
			
			<!-- 최근 주문내역 -->
			<div class="recent-order">
				<div id="recent-order-title"><h4><strong>최근 주문내역</strong></h4></div>
				<hr style="border: solid black;">
				<div id="recent-order-content" style="text-align: center; margin: 50px;">
					<p>주문 내역이 없습니다.</p>
				</div>
				<hr style="border: solid 0.5px #b5b5b5;">
			</div> <!-- 최근 주문내역 -->
			
		
		<div class="zzim-review">
			<nav class="nav flex-column" style="font-size: 18px;">
			  <hr style="border: solid 0.5px #b5b5b5;">
			  <a class="nav-link" href="#" style="color: black;">찜한 상품
			  	<i class="bi bi-chevron-right"></i>
			  </a>
			  <hr style="border: solid 0.5px #b5b5b5;">
			  <a class="nav-link" href="#" style="color: black;">나의 후기
			  	<i class="bi bi-chevron-right"></i>
			  </a>
			  <hr style="border: solid 0.5px #b5b5b5;">
			</nav>
		</div> <!-- accordion -->
		
	  </div> <!-- myshopping info -->
	</div> <!-- info -->
</div> <!-- 전체 div -->
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>