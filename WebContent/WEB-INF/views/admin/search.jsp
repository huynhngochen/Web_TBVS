<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/fonts/fontawesome/css/all.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/global.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/adminhome.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js">
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;515;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.min.js"></script>
<title>Quản Trị Admin</title>
</head>
<body>
	<div id="wrapper">
		<%@ include file="../hen/header.jsp"%>
		<!-- end header -->
		<div class="wp-content mt-4">
			<h3 class="text-center">Quản lý người dùng</h3>
			<form id="find">
				<input type="search" name="find" placeholder="Bạn muốn tìm gì?">
				<button>
					<i class="fas fa-search"></i>
				</button>
			</form>
			<div class="clearfix"></div>
			<div style=" margin-bottom: 20px; margin-left: 10px">
				<h2 style="color: #717670;">
					<b>Kết quả tìm kiếm  ${message}</b>
				</h2>
			</div>
			
			<div class="container-fluid" style="margin-bottom: 20px">
				<div class="row">
					<table class="table table-bordered table-sm table-hover">
						<thead class="thead-dark text-center">
							<tr>
								<th>Tên đăng nhập</th>
								<th>Mật khẩu</th>
								<th>Họ tên</th>
								<th>Email</th>
								<th>SDT</th>
								<th>Địa chỉ</th>
								<th>Quyền truy cập</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${users}">
								<tr class="text-center">
									<td>${u.username}</td>
									<td>${u.password}</td>
									<td>${u.thongtinuser.fullname}</td>
									<td>${u.thongtinuser.email}</td>
									<td>${u.thongtinuser.sdt}</td>
									<td>${u.thongtinuser.address}</td>
									<td>${u.role.name}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
<!-- 		end content -->

	</div>
</body>
</html>