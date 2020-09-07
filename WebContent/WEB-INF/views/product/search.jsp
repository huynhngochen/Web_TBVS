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
		<div class="wp-content mt-4" style="min-height: 380px">
			<h3 class="text-center">Danh mục sản phẩm</h3>
			<form action="admin/product/search.htm" id="find">
				<input autocomplete="off" type="text" name="search"
					placeholder="Bạn muốn tìm gì?">
				<button type="submit">
					<i class="fas fa-search"></i>
				</button>
			</form>
			<div class="clearfix"></div>
			<div style=" margin-bottom: 20px; margin-left: 10px">
				<h2 style="color: #717670;">
					<b>Kết quả tìm kiếm sản phẩm</b>
				</h2>
			</div>
			<h4 class="text-center">${message}</h4>
			<div class="container-fluid" style="margin-bottom: 20px">
				<div class="row">
				<c:if test="${product.isEmpty() == false}">
					<table class="table table-bordered table-sm table-hover">
						<thead class="thead-dark text-center">
							<tr>
								<th>STT</th>
								<th>Tên Hàng</th>
								<th>Giá Bán</th>
								<th>Giảm Giá</th>
								<th>Số Lượng Đã Bán</th>
								<th>Tồn Kho</th>
								<th>Thao tác</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p" items="${product}">
								<tr class="text-center">
									<td>${p.id}</td>
									<td>${p.name}</td>
									<td><f:formatNumber minFractionDigits="0"
											value="${p.price}" type="number" /></td>
									<td>${p.discount}</td>
									<td>${p.count_buy}</td>
									<td>${p.in_stock}</td>
									<td><a href="admin/product/update/${p.id}.htm">Chỉnh
											sửa</a></td>
									<td><a href="admin/product/delete/${p.id}.htm">Xóa</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</c:if>
				</div>
			</div>
		</div>
		 <!--        end content -->
 
  <%@ include file="../hen/footer.jsp"%>
	</div>
</body>
</html>