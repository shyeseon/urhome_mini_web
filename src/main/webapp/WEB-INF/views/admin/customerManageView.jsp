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
	href="${pageContext.request.contextPath}/resources/css/admin/productManageView.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jquery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<style>
/* 추가 정보 열을 숨김 */
.additional-info {
    display: none;
}
</style>

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
    src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script>
// "모든 정보 보기" 버튼을 클릭할 때 실행되는 함수
function toggleAllDetails() {
    // 모든 추가 정보 열 선택
    var additionalInfos = document.querySelectorAll('.additional-info');
    
    // 모든 추가 정보 열의 표시 여부를 변경
    additionalInfos.forEach(function(info) {
        if (info.style.display === 'none') {
            info.style.display = 'table-cell';
        } else {
            info.style.display = 'none';
        }
    });
}
</script>

</head>
<body id="wrap" style="overflow-x: hidden">
	<div class="row">
		<div class="col-xl-2 col-lg-3">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>
		</div>		
		<div class="col-xl-10 col-lg-9 table-responsive-lg"
			style="padding-left: 8px;">
			<!-- Dashboard 헤더 -->
			<div class="content-header mb-5 ms-0" style="height: 65px;">
					<h4 class="text-light text-uppercase mb-0">회원관리</h4>
					<a href="${pageContext.request.contextPath}/logout"><i
						class="fas fa-sign-out-alt text-danger fa-lg me-0"></i></a>
			</div>
			<div class="card" style="width:95%; margin: 0 auto;">
				<div class="card-body">
					<table class="table table-bordered table-hover"
						id="productInfoTable">
						<thead class="table-secondary">
							<tr>
								<!-- 평상시에 보여지는 정보  -->
								<th scope="col">회원 아이디</th>
                                <th scope="col">회원 비밀번호</th>
                                <th scope="col">회원 이메일</th>
                                <th scope="col">회원 이름</th>
                                <th scope="col">회원 가입 날짜</th>
                                <th scope="col"> 모든 정보 보기 및 삭제</th>                               
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${memberList}">
									<tr>
										<td>${member.mid}</td>
	                                    <td>${member.mpassword}</td>
	                                    <td>${member.memail}</td>
	                                    <td>${member.mname}</td>
	                                    <td><fmt:formatDate value="${member.mdate}" pattern="yyyy-MM-dd"/></td>	                                                                           
	                                    <td>
	                                    	<a class="btn btn-dark btn-sm" href="userInfoView?mid=${member.mid}">모든 정보 보기</a>
	                                    	<button class="btn btn-danger btn-sm" onclick="deleteMember('${member.mid}')">삭제</button>	                                    
	                                    </td>        
									</tr>
							</c:forEach>
						</tbody>												
					</table>
					<!-- 회원정보 페이지네이션 -->
					<div class="d-flex justify-content-between">
						<nav class="ms-auto me-auto" aria-label="">
							<ul class="pagination pagination-sm">
								<c:if test="${pager.groupNo>1}">
									<li class="page-item"><a class="page-link" href="customerManageView?pageNo=1"><<</a></li>
									<li class="page-item"><a class="page-link" href="customerManageView?pageNo=${pager.startPageNo-1}"><</a></li>
								</c:if>
								<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<li class="page-item"> 
									<a class="page-link ${pager.pageNo==i ?'active':''}" href="customerManageView?pageNo=${i}">${i}</a></li>
								</c:forEach>
								<c:if test="${pager.groupNo<pager.totalGroupNo}">
									<li class="page-item"><a class="page-link" href="customerManageView?pageNo=1">></a></li>
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/customerManageView?pageNo=${pager.startPageNo-1}">>></a></li>
								</c:if>
							</ul>
						</nav>					
					</div>					
				</div>
			</div>			
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script>
function deleteMember(mid) {
    if(confirm("정말로 삭제하시겠습니까?")) {
    	console.log(`${pageContext.request.contextPath}/deleteMember`);
        $.ajax({
            url: `${pageContext.request.contextPath}/member/deleteMember`,
            type: 'GET',
            data: { mid: mid},
            success: function(response) {
                // 삭제 성공 시, 해당 행을 테이블에서 제거
                $('#row-' + mid).remove();
                alert('회원이 삭제되었습니다.');
            },
            error: function(xhr, status, error) {
                // 오류 처리
                alert('삭제 중 오류가 발생했습니다.');
            }
        });
    }
}
</script>	 
</body>
</html>
