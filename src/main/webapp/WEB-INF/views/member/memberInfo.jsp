<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>회원 정보 수정 | 우리집</title>
      <!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	  <!-- jQuery 외부 라이브러리 설정 -->
	  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	  
	  
	  <!-- jquery 회원정보 수정 유효성 검사-->
	  <script src="${pageContext.request.contextPath}/resources/js/member/memberInfo.js"></script>
	  <!-- kakao address api -->
	  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	 
	  <!-- 사용자 정의 자바스크립트 -->
	 
	  <script>  
		  function updateFormCheckData() {
		  		// 비밀번호 입력값과 비밀번호 재확인 입력값 가져오기
			    var password = document.getElementById("mpassword").value;
			    var passwordCheck = document.getElementById("mpasswordCheck").value;
			
			    // 비밀번호와 비밀번호 재확인이 일치하는지 확인
			    if (password !== passwordCheck) {
			        // 일치하지 않으면 경고 메시지를 표시하고 form 전송을 막음
			        alert("비밀번호가 일치하지 않습니다.");		        
			        return false;
			    } else {
			        // 일치하면 form 제출을 허용
			        return true;
			    }
			}
	  </script> 
	  
   </head>
   <!-- css 적용 -->
   	<link href="${pageContext.request.contextPath}/resources/css/member/mypage.css" rel="stylesheet">
   	<link href="${pageContext.request.contextPath}/resources/css/member/memberInfo.css" rel="stylesheet">
   <body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    
    <!-- 전체 div -->
    <div class="mypage-div d-flex">
    	<!-- mypage-tab -->
		<jsp:include page="/WEB-INF/views/member/mypageTab.jsp"></jsp:include>
		
		<div class="member-info mx-5" style="flex: 5;">
			<div class="mb-5 ms-5" id="update">		
				<h3><strong>${member.mid}님 회원정보수정</strong></h3>
			</div>
			<div id="updateFormDiv">
				<form id="updateForm" name="updateForm" method="post" action="updateMember" class="validation-form" novalidate onsubmit="memberInfoFormCheckData()">
					<div class="form-group mt-4 mb-4">
						<label class="form-label">아이디 *</label>
						<input type="text" class="form-control" id="mid" name="mid" value="${member.mid}" readonly>
						<span class="form-text" id="midSpan">아이디는 변경 불가능합니다.</span>
					</div>
					<div class="form-group mt-2 mb-4">
						<label class="form-label">새 비밀번호</label>
						<input type="password" class="form-control" onchange="isRightPassword()" id="mpassword" name="mpassword" value="Aa!12345">
						<span class="form-text" id="mpasswordSpan">알파벳 대소문자, 숫자, 특수문자를 혼용해서 8자 이상 15장 이하</span>
					</div>
					<div class="form-group mt-2">
						<label class="form-label">새 비밀번호 확인</label>
						<input type="password" class="form-control" onchange="isRightPasswordCheck()" id="mpasswordCheck" name="mpasswordCheck" value="Aa!12345">
						<span class="form-text" id="mpasswordCheckSpan">&nbsp;</span>
					</div>
					<div class="form-group mt-2">
						<label class="form-label">이름 *</label>
						<input type="text" class="form-control" onchange="isRightName()" id="mname" name="mname" value="${member.mname}">
						<span class="form-text" id="nameSpan">&nbsp;</span>
					</div>
					<div class="mt-2">
						<label class="form-label">배송지 *</label>
						<div class="d-flex">
						<span ><input type="text" class="form-control mb-2" id="mzip" name="mzip" placeholder="우편번호" readonly value="${member.mzip}"></span>
						<span><input type="button" onclick="daumPostcode()" id="addressBtn" name="addressBtn" value="우편번호" class="btn btn-outline-secondary btn-sm ms-1 mt-1"></span>
						</div>
						<div>
							<span><input type="text" class="form-control mb-2" id="maddress" name="maddress" placeholder="기본 주소" readonly value="${member.maddress}"></span>
						</div>
						<div>
							<span><input type="text" class="form-control" id="mdetailAddress" name="mdetailAddress" placeholder="나머지 주소" value="${member.mdetailAddress}"></span>
						</div>
					</div>
					<div class="mt-4">
						<label class="form-label align-middle">일반전화</label>
						<div class="d-flex">
						<div>
							<span>
								<select class="form-select" id="mtel1" name="mtel1">
									<option <c:if test="${mtel[0] == 02}">selected</c:if>>02</option>
									<option <c:if test="${mtel[0] == 031}">selected</c:if>>031</option>
								</select>
							</span>
						</div>
						<div>
							<span><input type="text" class="form-control" onchange="isRightNormalPhone()" id="mtel2" name="mtel2" value="${mtel[1] != null ? mtel[1] : ''}"></span>
						</div>
						<div>
							<span><input type="text" class="form-control" onchange="isRightNormalPhone()" id="mtel3" name="mtel3" value="${mtel[2] != null ? mtel[2] : ''}"></span>
						</div>
						</div>
						<span class="form-text" id="mtelSpan">&nbsp;</span>
					</div>
					<div class="mt-2">
						<label class="form-label align-middle">휴대전화 *</label>
						<div class="d-flex">
							<div>
								<span>
									<select class="form-select" id="mphone1" name="mphone1">
										<option <c:if test="${mphone[0] == 010}">selected</c:if>>010</option>
										<option <c:if test="${mphone[0] == 011}">selected</c:if>>011</option>
									</select>
								</span>
							</div>						
							<div>
								<span><input type="text" class="form-control" onchange="isRightCellPhone()" id="mphone2" name="mphone2" value="${mphone[1]}"></span>
							</div>
							<div>
								<span><input type="text" class="form-control" onchange="isRightCellPhone()" id="mphone3" name="mphone3" value="${mphone[2]}"></span>
							</div>
						</div>
						<span class="form-text" id="mphoneSpan">&nbsp;</span>
					</div>
					<div class="form-group mt-2 mb-4">
						<label class="form-label">이메일 *</label>
						<input type="email" class="form-control" onchange="isRightEmail()" id="memail" name="memail" value="${member.memail}">
						<span class="form-text" id="memailSpan">&nbsp;</span>
					</div>					
					<button type="submit" class="btn btn-dark btn-sm">수정하기</button>											
				</form>
			</div>
		</div> 
	
	</div> <!-- 전체 div -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>