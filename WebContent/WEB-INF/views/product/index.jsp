<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
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

<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;515;600;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/asset/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.min.js"></script>
    <title>Quản Trị Admin</title>
    <style type="text/css">
    	.hen1:HOVER {
    		color: white;
			background-color: #212529;
		}
		
		.hen2:HOVER {
			color: white;
			background-color: green;
		}
		.img {
			max-width: 100%;
			width: 100px;
		}
		.errors {
			color: red; 
			font-weight: bold;
		}
    </style>
</head>
<body>
<div id="wrapper">
        <%@ include file="../hen/header.jsp"%>
        <!-- end header -->
 <div id="wp-content" class="mt-4">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<h3 class="text-center">Danh mục sản phẩm</h3>
						<hr>
						<div class="dropdown dropright text-center">
						<button type="button" class="btn btn-outline-warning dropdown-toggle" 
						data-toggle="dropdown" style="position: absolute;left: 550px;">
						SẢN PHẨM</button>
							<div class="dropdown-menu">
								<c:forEach var="b" items="${brand}">
									<a class="dropdown-item hen2"
										href="admin/product/finding/${b.id}.htm"> <b>${b.name}</b>
									</a>
									<hr>
								</c:forEach>
							</div>
						</div>
						<form action="admin/product/search.htm" id="find">
							<input autocomplete="off" type="text" name="search" placeholder="Bạn muốn tìm gì?">
							<button type="submit">
								<i class="fas fa-search"></i>
							</button>
						</form>
						<div class="clearfix"></div>
						<a class="btn btn-outline-success float-right mb-4 mt-2" href="admin/product/insert.htm">Thêm mới</a>
						<%-- <p class="errors">${message}</p> --%>
						<table class="table table-bordered table-sm table-hover">
							<thead class="thead-dark text-center">
								<tr>
									<th>STT</th>
									<th>Tên Hàng</th>
									<th>Giá Bán</th>
									<th>Giảm Giá</th>
									<th>Số Lượng Đã Bán</th>
									<th>Tồn Kho</th>
									<th>Sản phẩm nổi bật</th>
									<th>Loại sản phẩm</th>
									<th>Mô tả</th>
									<th>Hình ảnh</th>
									<th>Thao tác</th>
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
										<c:if test="${p.product_hot == true}">
											<td><input readonly="readonly" type="checkbox" checked="checked"></td>
										</c:if>
										<c:if test="${p.product_hot == false}">
											<td><input readonly="readonly" type="checkbox"></td>
										</c:if>
										<td>${p.loaihang.name}</td>
										<td>${p.description}</td>
										<td><img
											src="${pageContext.request.contextPath}/images/${p.images_link}"
											class="img"></td>
										<td><a href="admin/product/update/${p.id}.htm">Chỉnh
												sửa</a></td>
										<td><a href="admin/product/delete/${p.id}.htm"
											onclick="return confirm('Bạn có chắc muốn xóa sản phẩm?');">Xóa</a>

										</td>
										<td><a href="admin/product/show/${p.id}.htm">Xem
												trước</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="btn-group">
							<a class="btn btn-default"><i class="fa fa-angle-left"></i></a>
							<c:forEach var="i" begin="0" end="${totalitem}">
							<a class="btn btn-default"
								href="${pageContext.request.contextPath}/admin/product/index/${i+1}.htm"><c:out
									value="${i+1}" /></a>
						</c:forEach>
							<a class="btn btn-default"><i class="fa fa-angle-right"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- end content -->
		
		 <%@ include file="../hen/footer.jsp"%>
    </div>
   <!--  end wrapper -->
   <script type="text/javascript">
   $(document).ready(function (){
	   if('${message}'){
		  alert('${message}');
		  window.history.back();
	  } 
   });
   </script>
</body>
</html>