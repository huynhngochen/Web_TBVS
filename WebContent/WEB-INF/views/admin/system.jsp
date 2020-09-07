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
    <title>Quản lý hệ thống</title>
    <style type="text/css">
    	.img {
    	    max-width: 100%;
    	}
    </style>
</head>
<body>
<div id="wrapper">
       <%@ include file="../hen/header.jsp"%>
            <hr class="mb-4">
        <!-- end header -->
        <div id="wp-content">
        	<div class="container text-center mt-4">
        		<a href="admin/slider/index.htm" class="btn btn-outline-info p-3">
        		<span><img src="${pageContext.request.contextPath}/asset/images/content.png" width="60px" height="50px" alt=""></span>
        		Quản lý danh mục slider</a>
        		<a href="admin/brand/index.htm" class="btn btn-outline-info p-3">
        		<span><img src="${pageContext.request.contextPath}/asset/images/folder.png" width="60px" height="50px" alt=""></span>
        		Quản lý danh mục loại hàng</a>
        	</div>
        </div>
<!--         end content -->
        <%@ include file="../hen/footer.jsp"%>
</div>
</body>
</html>