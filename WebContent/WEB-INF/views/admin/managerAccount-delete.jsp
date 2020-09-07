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
        <div id="wp-content" class="mb-4">
        	<div class="container clearfix">
        		<h3>Bạn có chắc muốn xóa? Vui lòng kiểm tra trước khi xóa!</h3>
        		<hr>
        		<p style="color: red">${message}</p>
        		<h5>Họ Tên: ${infouser.fullname}</h5>
        		<h5>SDT: ${infouser.sdt}</h5>
        		<h5>Email: ${infouser.email}</h5>
        		<h5>Địa chỉ: ${infouser.address}</h5>
        		<form:form action="admin/managerAccount-delete.htm" modelAttribute="infouser">
		            		<div class="form-group d-none">
		            			<label>InfoUser ID</label>
		            			<form:input readonly="true" path="id" class="form-control"  autocomplete="off" style="width: 100%;"/>
		            			<form:errors path="id" element="div" style="color: red"/>
		            		</div>
		            		<div class="form-group d-none">
		            			<label>Fullname</label>
		            			<form:input path="fullname" class="form-control"  autocomplete="off" style="width: 100%;"/>
		            			<form:errors path="fullname" element="div" style="color: red"/>
		            		</div>
		            		<div class="form-group d-none">
		            			<label>Email</label>
		            			<form:input path="email" class="form-control"  autocomplete="off" style="width: 100%;"/>
		            			<form:errors path="email" element="div" style="color: red"/>
		            		</div>
		            		<div class="form-group d-none">
		            			<label>SDT</label>
		            			<form:input path="sdt" class="form-control" autocomplete="off" style="width: 100%;"/>
		            			<form:errors path="sdt" element="div" style="color: red"/>
		            		</div>
		            		<div class="form-group d-none">
		            			<label>Address</label>
		            			<form:input path="address" class="form-control" autocomplete="off" style="width: 100%;"/>
		            			<form:errors path="address" element="div" style="color: red"/>
		            		</div>
		            	<button id="btnchangeAccount" type="submit" class="btn btn-outline-success float-left mr-3">Xóa Tài Khoản</button>
		            	<a href="admin/managerAccount.htm" class="btn btn-outline-success float-left">Hủy</a>
		            	
		            	
		    		</form:form>
        	</div>
        
        </div>
        
      <!--   end Content -->
        <%@ include file="../hen/footer.jsp"%>
</div>
</body>
</html>