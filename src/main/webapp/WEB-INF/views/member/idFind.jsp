<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  
 
  <!--Bootstrap Css-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <!--Font-aweome-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
  <!--Custom Css-->  
   <link type="text/css" rel="stylesheet" href="css/style.css"/> 


	<!-- css적용되도록 login.css 파일을 연결시킵니다. -->
	<link href="${pageContext.request.contextPath}/resources/css/member/idFind.css" rel="stylesheet">	
		
		<title>아이디 찾기 페이지</title>

</head>

<body>
<!--모달창을 불러오기위한 부분 -->
<%-- <%@ include file="./IdFindModal.jsp" %> --%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>



	<div class="idfind-wrapper">
		<h2>아이디 찾기</h2>						
		<input type="radio" id="email" name="contactMethod" value="email" checked>
		<label for="email">이메일로 찾기</label>
		<input type="radio" id="phone" name="contactMethod" value="phone">
		<label for="phone">전화번호로 찾기</label><br>	
			
			
		<form method="post" action="#" id="idfind-form">			
			<input type="text" name="userName" placeholder="이름" required>			
			<div id="emailField" >
		        <input type="email" id="emailInput" name="email" placeholder="이메일">
		    </div>
		    <div id="phoneField" style="display: none;">
		        <input type="text" id="phoneInput" name="phone" placeholder="전화번호">
		    </div>			
			<!-- <button class="idfindbutton" type="submit">확인</button>
			<button type="button" id='find_id' onclick="findId_click()" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>		
			<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button> -->
		</form>
		<div class="idfind-function" >
			<a href="${pageContext.request.contextPath}/member/passwordFind">비밀번호 찾기</a>|
			<a href="${pageContext.request.contextPath}/member/login">로그인 화면이동</a>|
			<a href="${pageContext.request.contextPath}/member/joinForm">회원 가입</a>
		</div>		
		
	</div>
	
<!-- 모달 트리거 버튼 -->
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  모달창 띄우기
</button> -->
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	


</body>
</html>