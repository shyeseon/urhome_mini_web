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
	<link href="${pageContext.request.contextPath}/resources/css/member/passwordFind.css" rel="stylesheet">
	
		
		<title>비밀번호 찾기 페이지</title>

</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

		

	<div class="passwordfind-wrapper">
		<h2>비밀번호 찾기</h2>
		
		<input type="radio" id="email" name="contactMethod" value="email" checked>
		<label for="email">이메일로 찾기</label>
		<input type="radio" id="phone" name="contactMethod" value="phone">
		<label for="phone">전화번호로 찾기</label><br>
		
		
		
		
		
		<form method="post" action="#" id="passwordfind-form">
			<input type="text" name="userId" placeholder="아이디" required>
			<input type="text" name="userName" placeholder="이름" required>
			<div id="emailField" >
		        <input type="email" id="emailInput" name="email" placeholder="이메일">
		    </div>
		    <div id="phoneField" style="display: none;">
		        <input type="text" id="phoneInput" name="phone" placeholder="전화번호">
		    </div>			
			
						
			<button class="passwordfindbutton" type="submit">확인</button>
		</form>
		<div class="passwordfind-function m-3" >
			<a href="${pageContext.request.contextPath}/member/idFind">아이디 찾기</a>|
			<a href="${pageContext.request.contextPath}/member/login">로그인 화면이동</a>|
			<a href="${pageContext.request.contextPath}/member/joinForm">회원 가입</a>
		</div>		
		
	</div>
		
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
<script>
    const emailField = document.getElementById('emailField');
    const phoneField = document.getElementById('phoneField');

    document.querySelectorAll('input[name="contactMethod"]').forEach((radio) => {
        radio.addEventListener('change', function() {
            if (this.value === 'email') {
                emailField.style.display = 'block';
                phoneField.style.display = 'none';
            } else if (this.value === 'phone') {
                emailField.style.display = 'none';
                phoneField.style.display = 'block';
            }
        });
    });
</script>




</body>



</html>