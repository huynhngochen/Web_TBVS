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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/fonts/fontawesome/css/all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/global.css">
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/adminhome.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;515;600;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/asset/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.min.js"></script>
    <title>Quản lý sản phẩm</title>
    <style type="text/css">
    	.errors {
    		color: red;
    	}
    </style>
</head>
<body>
<div id="wrapper">
        <%@ include file="../hen/header.jsp"%>
        <!-- end header -->
        <div class="wp-content clearfix mb-4">
        	<div class="container">
        		<hr>
        		<h3 style="color: red">Bạn chắc chắn muốn xóa ? Vui lòng kiểm tra lại trước khi xóa !</h3>
        		<p class="errors">${message}</p>
        		<h5>Loại hàng: <b>${product.loaihang.name}</b></h5>
        		<h5>Mã sản phẩm: <b>${product.id}</b></h5>
        		<h5>Tên sản phẩm: <b>${product.name }</b></h5>
        		<h5>Giá: <b>${product.price}</b></h5>
        		<h5>Tồn kho: <b>${product.in_stock }</b></h5>
				<form:form action="admin/product/delete.htm" method="post" modelAttribute="product" enctype="multipart/form-data">
					<div class="form-group d-none">
						<label>Tên hãng</label>
						<br>
						<form:select class="form-control" style="width: 500px;" path="loaihang.id"
								items="${brand}" itemValue="id" itemLabel="name"/>
					</div>
					<div class="form-group d-none">
						<label>Mã sản phẩm</label>
						<br>
						<form:input readonly="true" path="id" type="text" class="form-control"/>
					</div>
					<div class="form-group d-none">
						<label>Tên sản phẩm</label>
						<form:input readonly="true" path="name" type="text" class="form-control" />
					</div>
					<div class="form-group d-none">
						<label>Giá tiền (vnd)</label>
						<form:input readonly="true" path="price" type="number" min="0" class="form-control"/>
					</div>
					<div class="form-group d-none">
						<label>Giảm giá</label>
						<form:input readonly="true" path="discount" type="number" min="0" step="0" class="form-control" />
					</div>
					<div class="form-group d-none">
						<label>Tồn Kho</label>
						<form:input readonly="true" path="in_stock" type="number" min="0" class="form-control"/>
					</div>
					<div class="form-group d-none">
						<label>Hình ảnh</label>
						<form:input readonly="true" path="images_link" type="text" class="form-control"/>
					</div>
					<a href="admin/admin-home.htm" class="btn btn-outline-success float-right btn-lg ml-4">Hủy</a>
					<button class="btn btn-outline-success float-right btn-lg">Xóa</button>
					
			</form:form>
        	</div>
        </div>
       <!--  end content -->
       
  <%@ include file="../hen/footer.jsp"%>
</div>
</body>
</html>