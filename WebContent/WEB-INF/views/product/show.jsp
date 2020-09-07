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
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/style.css">
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
    	.img {
			height: 300px;
			width: 500px;
/* 			margin-bottom: 10px;
			margin-left: 310px; */
		}
		.name {
			font-size: 18px;
		    background: #474747;
		    color: #ffffff;
		    padding: 5px;
		    margin: 10px;
		}
		.hen {
			font-size: 18px;
			font-weight: bold;
		}
   	</style>
</head>
<body>
<div id="wrapper">
        <%@ include file="../hen/header.jsp"%>
        <!-- end header -->
        <div class="wp-content mt-4">
        	<div class="container">
        		<hr>
        		<h3 class="text-center mb-4">Thông tin sản phẩm</h3>
        		<div class="row">
        			<div class="col-md-6 border-right">
        				<img src="${pageContext.request.contextPath}/images/${product.images_link}" class="img">
        			</div>
        			<div class="col-md-6">
        				<p class="name">${product.name}</p>
        				<hr>
        				<p class="hen">Giá : <span style="padding-left: 20px">
        				<f:formatNumber minFractionDigits = "0" value="${product.price}" type="number"/> đ</span></p>
        				<p class="hen">Tồn kho: ${product.in_stock }</p>
        				<p class="hen">Số lượng đã xuất: ${product.count_buy }</p>
        				<p class="hen">Loại sản phẩm: ${product.loaihang.name} </p>
        				<p class="hen">Đặc Điểm Nổi Bật</p>
        				<p>- ${product.description}</p>
        			</div>
        		</div>
        	</div>
        </div>
        <hr>
        <!-- end content -->
  <%@ include file="../hen/footer.jsp"%>
</div>
</body>
</html>