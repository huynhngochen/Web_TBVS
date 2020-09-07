<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/adminhome.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;515;600;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/asset/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.min.js"></script>
    <title>Quản lý danh mục hàng hóa</title>
    <style type="text/css">
    	.img {
    	    max-width: 100%;
    	}
    	.errors {
    		color: red;
    	}
    </style>
</head>
<body>
<div id="wrapper">
        <%@ include file="../hen/header.jsp"%>
        <!-- end header -->
        <div class="wp-content mt-4">
        	<div class="container">
        		<h3 class=" text-center">Thêm danh mục mới</h3>
        		<hr>
				<p class="errors">${message}</p>
				<a href="admin/brand/index.htm" class="btn btn-outline-success" >Quay lại</a>
				<form:form action="admin/brand/insert.htm" method="post" modelAttribute="loaihang" enctype="multipart/form-data">
					<div class="form-group">
						<label>Tên danh mục</label>
						<form:input path="name" type="text" class="form-control" />
						<form:errors class="errors" path="name"/>
					</div>
					<div class="form-group">
						<label>Hình ảnh</label>
						<br>
						<input type="file" name="photo">
						<p class="errors">${message_image}</p>
					</div>
					<button class="btn btn-outline-success" >Thêm mới</button>
				</form:form>
        	</div>
        </div>
        <!-- end content -->
</div>
</body>
</html>