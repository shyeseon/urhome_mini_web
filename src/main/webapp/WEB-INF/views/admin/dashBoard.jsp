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
<!-- user script-->
<script>
	
</script>
<style>
</style>
</head>
<body id="wrap" style="overflow-x: hidden">
	<div class="row">
		<div class="col-xl-2 col-lg-3">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>
		</div>
		<div class="col-xl-10 col-lg-9">
			<div class="content-header mb-5 ms-0" style="height: 65px;">
					<h4 class="text-light text-uppercase mb-0">대시보드</h4>
					<a href="${pageContext.request.contextPath}/logout"><i
						class="fas fa-sign-out-alt text-danger fa-lg me-0"></i></a>
			</div>
			<div class="row ms-auto me-auto" style="width:80%;">
				<div class="col-sm-6 p-2">
					<div class="card">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<i class="fas fa-shopping-cart fa-3x text-warning"></i>
								<div class="text-right text-secondary">
									<h5>Sales</h5>
									<h3>${sales}</h3>
								</div>
							</div>
						</div>
						<div class="card-footer text-secondary">
							<i class="fas fa-sync me-3"></i>
							<span>Updated Now</span>
						</div>
					</div>
				</div>
				
				<div class="col-sm-6 p-2">
					<div class="card">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<i class="fas fa-money-bill-alt fa-3x text-success"></i>
								<div class="text-right text-secondary">
									<h5>Expenses</h5>
									<h3>${expenses}</h3>
								</div>
							</div>
						</div>
						<div class="card-footer text-secondary">
							<i class="fas fa-sync me-3"></i>
							<span>Updated Now</span>
						</div>
					</div>
				</div>
				<div class="col-sm-6 p-2">
					<div class="card">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<i class="fas fa-users fa-3x text-info"></i>
								<div class="text-right text-secondary">
									<h5>Users</h5>
									<h3>${memberCount}</h3>
								</div>
							</div>
						</div>
						<div class="card-footer text-secondary">
							<i class="fas fa-sync me-3"></i>
							<span>Updated Now</span>
						</div>
					</div>
				</div>
				<div class="col-sm-6 p-2">
					<div class="card">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<i class="fas fa-chart-line fa-3x text-info"></i>
								<div class="text-right text-secondary">
									<h5>Visiters</h5>
									<h3>${visiters}</h3>
								</div>
							</div>
						</div>
						<div class="card-footer text-secondary">
							<i class="fas fa-sync me-3"></i>
							<span>Updated Now</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
