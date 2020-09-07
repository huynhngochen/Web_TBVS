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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/adminhome.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/asset/css/styleManagerAccount.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;515;600;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/asset/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.min.js"></script>
	<title>Info Account</title>
	<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
<div id="wrapper">
        <%@ include file="../hen/header.jsp"%>
        <hr>
        <!-- end header -->
        <div id="wp-content">
        <!-- Menu quản lí tài khoản -->
        <div class="container">
            <div class="row">
                <div class="col-md-4 border-right p-4">
                    <p>Tài Khoản: 
                    <a href="admin/info-account.htm" 
                    	style="font-size: 18px !important;margin-left: 10px;font-weight: 700; color: #FF9800; text-decoration: none">
                    	${sessionScope.user.getThongtinuser().getFullname()}</a></p>
                    <div class="menu-account text-center">
                        <ul>
                            <li><a href="admin/info-account.htm">Thông tin tài khoản</a></li>
                            <li><a href="admin/logout.htm">Đăng suất</a></li>
                        </ul>
                    </div>
                </div>
                <!-- end menu quản lí tài khoản -->
                <div class="col-md-8">
                    <div class="account p-4">
                        <%-- <p>Tên Đăng Nhập: <strong>${sessionScope.user.getUsername()}</strong></p>
                        <p>Mật Khẩu: <strong>${sessionScope.user.getPassword()}</strong></p> --%>
                        <p>Họ và Tên: <strong>${sessionScope.user.getThongtinuser().getFullname()}</strong></p>
                        <p>Email: <strong>${sessionScope.user.getThongtinuser().getEmail()} </strong></p>
                        <p>SDT: <strong>${sessionScope.user.getThongtinuser().getSdt()}</strong></p>
                        <p>Địa Chỉ: <strong>${sessionScope.user.getThongtinuser().getAddress()}</strong></p>
                     	<a id="btn-changePassword" href="admin/changePassword.htm" type="button" class="btn btn-dark text-light">Thay đổi mật khẩu</a>
                        <a id="btn-re-account" href="admin/managerAccount-update/${sessionScope.user.getThongtinuser().getId()}.htm" type="button" class="btn btn-dark text-light">Chỉnh sửa thông tin cá nhân</a>
                </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- end content -->
</div>
</body>
</html>