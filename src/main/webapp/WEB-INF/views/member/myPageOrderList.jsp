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
	$(function() {
		//input을 datepicker로 선언
		$("#datepicker1,#datepicker2")
				.datepicker(
						{
							dateFormat : 'yy-mm-dd' //달력 날짜 형태
							,
							showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
							,
							showMonthAfterYear : true // 월- 년 순서가아닌 년도 - 월 순서
							,
							changeYear : true //option값 년 선택 가능
							,
							changeMonth : true //option값  월 선택 가능                
							,
							showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
							,
							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
							,
							buttonImageOnly : true //버튼 이미지만 깔끔하게 보이게함
							,
							buttonText : "선택" //버튼 호버 텍스트              
							,
							yearSuffix : "년" //달력의 년도 부분 뒤 텍스트
							,
							monthNamesShort : [ '1월', '2월', '3월', '4월', '5월',
									'6월', '7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 텍스트
							,
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip
							,
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 텍스트
							,
							dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
									'금요일', '토요일' ] //달력의 요일 Tooltip
							,
							minDate : "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
							,
							maxDate : "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
						});

		//초기값을 오늘 날짜로 설정해줘야 합니다.
		$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	});
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
				<!--수평방향으로 자동마진 설정, 열을 가운데 정렬할수 있다. -->
				<!-- justify-content-center:자식 요소들을 수평으로 가운데 정렬, align-items:center:자식요소를 수직으로 가운데 정렬-->
				<div class="d-flex justify-content-center mt-2 mb-2"
					style="align-items: center;">
					<!-- flex-fill은 부트스트랩에서 제공하는 flexbox속성, 해당요소가 부모 컨테이너의 남은 공간을 모두 차지하도록 설정 -->



					<div class="flex"
						style="width: 80%; height: 350px; text-align: center;">
						<div
							style="font-size: 30px; font-weight: bold; margin-bottom: 30px;">주문내역
							검색</div>
						<div class="user-info-box flex-fill"
							style="justify-content: left; background-color: #F1F3F5; height: 150px;">
							<div class="d-flex"
								style="justify-content: space-between; padding-top: 30px;">
								<div class="select-time d-flex">
									<div style="font-weight: bold;">조회기간:</div>
									<div>
										<p>
											<input style="margin-left: 20px; margin-right: 10px;"
												type="text" id="datepicker1">
										</p>
									</div>
									<div style="margin-left: 30px">

										<div>~</div>

									</div>
									<div>
										<p>
											<input style="margin-left: 30px; margin-right: 10px;"
												type="text" id="datepicker2">
										</p>
									</div>
								</div>
								<div class="date-button">
									<button
										style="border-width: 1px; background-color: white; margin-left: 30px;">오늘</button>
									<button
										style="border-width: 1px; border-left: none; background-color: white;">1주일</button>
									<button
										style="border-width: 1px; border-left: none; background-color: white;">1개월</button>
									<button
										style="border-width: 1px; border-left: none; background-color: white;">6개월</button>

								</div>
							</div>

							<div class="d-flex justify-content-left">
								<div style="font-weight: bold;">주문상태:</div>
								<!-- 혜택보기  셀렉트박스-->
								<select style="margin-left: 20px; margin-right: 100px">
									<option value="total">전체</option>
									<option value="paymentpre">결제전</option>
									<option value="paymentfinish">결제완료</option>
								</select>
								<div style="font-weight: bold;">
									상품명:<input style="margin-left: 20px;">
								</div>
							</div>
						</div>
						<div id="btn_box" style="text-align: center; margin-top: 30px;">
							<button id="splashbutton">초기화</button>
							<button id="searchbutton">검색</button>
						</div>
					</div>
				</div>

				<div
					style="font-size: 30px; font-weight: bold; margin-top: 0px; text-align: center;">
					주문내역</div>
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
								<th>주문날짜</th>
								<th>주문상태</th>
								<th>배송상태</th>
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
									<td style="vertical-align: middle;"><a href="orderHistoryDetail?onumber=${orderHistory.onumber}" style="color:black;text-decoration:none;">${orderHistory.pname} <c:if test="${orderHistory.ocount > 1}" >외 ${orderHistory.ocount-1}</c:if></a></td>
									<td style="vertical-align: middle;">${orderHistory.ototalPrice}</td>
									<td style="vertical-align: middle;"><fmt:formatDate value="${orderHistory.oitemDate}" pattern="yyyy-MM-dd"/></td>
									<td style="vertical-align: middle;">${orderHistory.ostatus}<br>
										<button class="cancel-btn">주문 취소</button>
									</td>
									<td style="vertical-align: middle;">배송 준비중</td>
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