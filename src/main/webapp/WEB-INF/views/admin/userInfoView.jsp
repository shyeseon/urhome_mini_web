<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/admin/userInfoView.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jquery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>



</head>
<body id="wrap" style="overflow-x: hidden">
	<div class="row">
		<div class="col-xl-2 col-lg-3">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>
		</div>	
		<div class="col-xl-10 col-lg-9 table-responsive-lg" style="padding-left: 8px; text-align:center;">
			<div class="content-header mb-5 ms-0" style="height: 65px;">
					<h4 class="text-light text-uppercase mb-0">회원 관리</h4>
					<a href="${pageContext.request.contextPath}/logout">
						<i class="fas fa-sign-out-alt text-danger fa-lg me-0"></i>
					</a>
			</div>
			<div style="text-algin:center;">		
				<table class="table" style="width: 75%;">
					<tr>
				        <th>항목</th>
				        <th>내용</th>
				    </tr>
				    <tr>
				        <td>회원 아이디</td>
				        <td><input class="form-text input-width" type="text" id="mid" name="mid" value="${member.mid}" readonly></td>
				    </tr>
				    <tr>
				        <td>회원 이름</td>
				        <td><input class="form-text input-width" type="text" id="mname" name="mname" value="${member.mname}" readonly></td>
				    </tr>
				    <tr>
				        <td>회원 비밀번호</td>
				        <td><input class="form-text input-width" type="text" id="mpassword" name="mpassword" value="${member.mpassword}" readonly></td>
				    </tr>
				    <tr>
				        <td>회원 이메일</td>
				        <td><input class="form-text input-width" type="text" id="memail" name="memail" value="${member.memail}" readonly></td>
				    </tr>
				    <tr>
				        <td>회원 가입 날짜</td>
				        <td><input class="form-text input-width" type="text" id="mdate" name="mdate" value="<fmt:formatDate value="${member.mdate}" pattern="yyyy-MM-dd"/>" readonly></td>
				    </tr>
				    <tr>
				        <td>회원 전화번호</td>
				        <td><input class="form-text input-width" type="text" id="mtel" name="mtel" value="${member.mtel}" readonly></td>
				    </tr>
				    <tr>
				        <td>회원 핸드폰번호</td>
				        <td><input class="form-text input-width" type="text" id="mphone" name="mphone" value="${member.mphone}" readonly></td>
				    </tr>
				    <tr>
				        <td>회원 상세주소</td>
				        <td><input class="form-text input-width" type="text" id="mdetailAddress" name="mdetailAddress" value="${member.mdetailAddress}" readonly></td>
				    </tr>
				    <tr>
				        <td>회원 우편번호</td>
				        <td><input class="form-text input-width" type="number" id="mzip" name="mzip" value="${member.mzip}" readonly></td>
				    </tr>
				    <tr>
				        <td>회원 주소</td>
				        <td><input class="form-text input-width" type="text" id="maddress" name="maddress" value="${member.maddress}" readonly></td>
				    </tr>
				    <tr>
				        <td>권한</td>
				        <td><input class="form-text input-width" type="text" id="mrole" name="mrole" value="${member.mrole}" readonly></td>
				    </tr>
				    <tr>
				        <td>동의 사항1</td>
				        <td><input class="form-check-input" type="checkbox" id="agree1" name="agree1" ${member.agree1 ? 'checked' : ''}></td>
				    </tr>
				    <tr>
				        <td>동의 사항2</td>
				        <td><input class="form-check-input" type="checkbox" id="agree2" name="agree2" ${member.agree2 ? 'checked' : ''}></td>
				    </tr>
				    <tr>
				        <td>동의 사항3</td>
				        <td><input class="form-check-input" type="checkbox" id="agree3" name="agree3" ${member.agree3 ? 'checked' : ''}></td>
				    </tr>
				</table>
			</div>
			<div style="margin-right: 0px; text-align:center;">				
				<a href="customerManageView" class="btn btn-primary me-2">취소</a>
			</div>				
		</div>		
	</div>
</body>
</html>
