		<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/fonts/fontawesome/css/all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/adminhome.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/css/styleManagerAccount.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;515;600;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/asset/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.min.js"></script>
	<title>Insert Account Admin</title>
	<base href="${pageContext.servletContext.contextPath}/">
	<style type="text/css">
		.errors {
			color: red;
		}
	</style>
</head>
<body>
<div id="wrapper">
       <%@ include file="../hen/header.jsp"%>
        <hr>
        <!-- end header -->
        <div class="wp-content">
        	<div class="container">
        		<h3>Thêm tài khoản mới</h3>
        		<hr>
        		<p class="errors">${message}</p>
			<form:form action="admin/managerAccount-insert.htm" method="post" modelAttribute="user" enctype="multipart/form-data">
				<div class="form-group">
					<label>Tên đăng nhập</label>
					<form:input path="username" class="form-control" autocomplete="off"/>
					<%-- <form:input path="username" type="text" class="form-control"  autocomplete="off"/> --%>
					<form:errors class="errors" path="username"/>
				</div>
				<div class="form-group">
					<label>Mật khẩu</label>
					<form:input path="password" type="password" class="form-control"/>
					<form:errors class="errors" path="password"/>
				</div>
				<div class="form-group">
					<label>Quyền truy cập</label>
					<form:select class="form-control" path="role.id"
							items="${role}" itemValue="id" itemLabel="name"/>
				</div>
				<button type="submit" class="btn btn-outline-success float-right">Thêm mới</button>
			</form:form>
        	</div>
        </div>
</div>
</body>
</html>