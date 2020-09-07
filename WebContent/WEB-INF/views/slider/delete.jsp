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
    <title>Quản lý slider</title>
</head>
<body>
<div id="wrapper">
        <%@ include file="../hen/header.jsp"%>
        <!-- end header -->
        <div class="wp-content mt-4">
        	<div class="container">
        		<h3 class=" text-center">Bạn chắc chắn muốn xóa ?</h3>
				<hr>
				${message}
				<form:form action="admin/slider/delete.htm" modelAttribute="slider">
					<div class="form-group">
						<label><strong>Mã slider</strong></label>
						<br>
						<form:input readonly="true" path="id" type="text" class="form-control"/>
					</div>
					<div class="form-group">
						<label><strong>Hình ảnh</strong></label>
						<br>
						<form:input readonly="true" path="image" type="text" class="form-control"/>
					</div>
					<button class="btn btn-outline-danger float-right">Xóa</button>
					<a href="admin/slider/index.htm" class="btn btn-outline-info float-right mr-4">Hủy</a>
				</form:form>
				<br>
				
        	</div>
        </div>
        <!-- end content -->
</div>
</body>
</html>