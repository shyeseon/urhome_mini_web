<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<!--Bootstrap Css-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--Font-aweome-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">

<!-- css적용되도록 login.css 파일을 연결시킵니다. -->
<link
	href="${pageContext.request.contextPath}/resources/css/member/myPageOrderList.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/member/mypageTab.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>

<!-- 달력을 사용하기 위해 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
</script>

<title>마이페이지-주문 목록</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>


	<div class="container-fluid" style="margin-top: 130px;">
		<!-- 전체 화면의 너비에 맞게 콘텐츠를 확장하는 역할 -->
		<!-- 부트스트랩에서 그리드 시스템을 사용할때 사용 -->
		<div class="row">
			<!-- 그리드 시스템의 열을 추가하여 그리드를 형성합니다 -->
			<!-- 왼쪽부분 -->
			<!-- mypage-tab -->
			<jsp:include page="/WEB-INF/views/member/mypageTab.jsp"></jsp:include>

			<!-- 오른쪽 부분 -->
			<div class="col-md-10 mx-auto page">
				<div
					style="font-size: 30px; font-weight: bold; margin-top: 0px; margin-bottom: 10px; text-align: center;">
					주문 상세 내역</div>
				<!-- 테이블을 감싸는 div -->
				<div class="table-container" style="margin-top: 30px; width:80%; margin:0 auto;">
					<!-- 주문내역 테이블 부분 -->
					<table class="table" style="text-align: center; margin: 0">
						<!-- 테이블 안에 들어 -->
						<!-- 테이블 헤더 주문번호,이미지,상품명,가격,수량,주문날짜,주문상태,배송상태-->
						<thead>
							<tr>
								<th>주문번호</th>
								<th>상품 이미지</th>
								<th>상품명</th>
								<th>가격</th>
								<th>총 가격</th>
								<th>주문날짜</th>
								<th>주문상태</th>
							</tr>
						</thead>
						<!-- 테이블 내용 -->
						<tbody>
						<c:forEach var="orderHistory" items="${myPageOrderList}">	
								<tr>
									<td style="vertical-align: middle;"> ${orderHistory.onumber}</td>		
									<td><img
										src="../product/productImageDownload?pid=${orderHistory.pid}&index=1&pthumbBodyType=thumb"
										alt="아이템 이미지"></td>
									<td style="vertical-align: middle;">${orderHistory.pname}</td>
									<td style="vertical-align: middle;">${orderHistory.ptotalPrice}</td>
									<td style="vertical-align: middle;">${orderHistory.ototalPrice}</td>
									<td style="vertical-align: middle;"><fmt:formatDate value="${orderHistory.oitemDate}" pattern="yyyy-MM-dd"/></td>
									<td style="vertical-align: middle;">${orderHistory.ostatus}<br>
										<button class="cancel-btn">주문 취소</button>
									</td>
								</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>



</html>