<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/fonts/fontawesome/css/all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/adminhome.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/css/styleManagerAccount.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;515;600;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/asset/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.min.js"></script>
	<title>Admin Manager Account</title>
	<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
<div id="wrapper">
       <%@ include file="../hen/header.jsp"%>
        <hr>
        <!-- end header -->
        <div id="wp-content">
        <!-- Menu quản lí tài khoản -->
	        <div class="container">
	            <h3 class="text-center">Danh Sách Admin</h3>
				<form action="admin/searchAdmin.htm" id="find">
					<input autocomplete="off" type="text" name="search"
						placeholder="Bạn muốn tìm gì?">
					<button type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
				<div class="clearfix"></div>
				<hr>
	            <a class="btn btn-outline-success float-right mb-4" href="admin/managerAccount-insert.htm">Thêm mới</a>
	            <table class="table table-bordered table-striped">
							<thead class="thead-dark text-center">
								<tr>
									<th>Tên đăng nhập</th>
									<th>Họ tên</th>
									<th>Email</th>
									<th>SDT</th>
									<th>Địa chỉ</th>
									<th>Quyền truy cập</th>
									<th>Thao tác</th>
									<th>Thao tác</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${users}">
									<c:if test="${u.role.id == 2}">
										<tr class="text-center">
											<td>${u.username}</td>
											<td>${u.thongtinuser.fullname}</td>
											<td>${u.thongtinuser.email}</td>
											<td>${u.thongtinuser.sdt}</td>
											<td>${u.thongtinuser.address}</td>
											<td>${u.role.name}</td>
											<td><a href="admin/managerAccount-update/${u.thongtinuser.id}.htm">Chỉnh sửa thông tin cá nhân</a></td>
											<td><a href="admin/managerAccount-delete/${u.thongtinuser.id}.htm" 
												onclick="return confirm('Bạn có chắc muốn xóa tài khoản?');">Xóa</a></td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
	    	</div>
    	</div>
    <!-- end content -->
     <%@ include file="../hen/footer.jsp"%>
 </div>
 <script type="text/javascript">
		$(document).ready(function() {
			if ('${message}') {
				alert('${message}');
				window.location.replace("admin/managerAccount.htm");
			}
		});
	</script>
</body>
</html>