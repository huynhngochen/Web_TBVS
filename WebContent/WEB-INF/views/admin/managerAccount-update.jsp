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
        <div id="wp-content" class="mb-3">
        	<div class="container clearfix">
        		<h4 style="text-align: center;">Chỉnh sửa thông tin cá nhân</h4>
					<hr>
					<p style="color: red">${message}</p>
					<form:form action="admin/managerAccount-update.htm" modelAttribute="infouser" method="post" enctype="multipart/form-data">
		            		<div class="form-group">
		            			<label>Tên đăng nhập</label>
		            			<form:input readonly="true" path="id" class="form-control"  autocomplete="off" style="width: 100%;"/>
		            			<form:errors path="id" element="div" style="color: red"/>
		            		</div>
		            		<div class="form-group">
		            			<label>Họ và Tên</label>
		            			<form:input path="fullname" class="form-control"  autocomplete="off" style="width: 100%;"/>
		            			<form:errors path="fullname" element="div" style="color: red"/>
		            		</div>
		            		<div class="form-group">
		            			<label>Email</label>
		            			<form:input path="email" class="form-control"  autocomplete="off" style="width: 100%;"/>
		            			<form:errors path="email" element="div" style="color: red"/>
		            		</div>
		            		<div class="form-group">
		            			<label>SDT</label>
		            			<form:input path="sdt" class="form-control" autocomplete="off" style="width: 100%;"/>
		            			<form:errors path="sdt" element="div" style="color: red"/>
		            		</div>
		            		<div class="form-group">
		            			<label>Địa chỉ</label>
		            			<!-- <input name="sdt" type="number" class="form-control"/> -->
		            			<form:input path="address" class="form-control" autocomplete="off" style="width: 100%;"/>
		            			<form:errors path="address" element="div" style="color: red"/>
		            		</div>
		            	<a href="admin/managerAccount.htm" class="btn btn-outline-success float-right ml-4">Hủy</a>
		            	<button id="btnchangeAccount" type="submit" class="btn btn-outline-success float-right">Lưu</button>
		            	
		    		</form:form>
        	</div>
        </div>
<!--         end content -->
         <%@ include file="../hen/footer.jsp"%>
</div>
</body>
</html>