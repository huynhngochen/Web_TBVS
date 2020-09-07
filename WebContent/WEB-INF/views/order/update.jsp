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
        <div class="wp-content mt-4">
        	<div class="container">
        		<h3 class=" text-center">Chỉnh sửa đơn hàng</h3>
				<hr>
				<p class="errors">${message}</p>
				<form:form action="admin/order/update.htm" method="post" modelAttribute="order" enctype="multipart/form-data">
					
					<div class="form-group">
						<label>ID Đơn hàng</label>
						<br>
						<form:input readonly="true" path="id" type="text" class="form-control" style="width: 500px;"/>
					</div>
					<c:if test="${order.status_delivery == 1}">
						<div class="form-group">
						<label>Trạng thái đơn hàng</label>
							<select name="status" class="form-control">
								<option value="1">Đặt thành công</option>
								<option value="2">Đang xử lý</option>
								<option value="3">Đang giao hàng</option>
								<option value="4">Giao thành công</option>
								<option value="5">Đã hủy</option>
							</select>
						</div>
					</c:if>
					<c:if test="${order.status_delivery == 2}">
						<div class="form-group">
						<label>Trạng thái đơn hàng</label>
							<select name="status" class="form-control">
								<option disabled="disabled" value="1">Đặt thành công</option>
								<option value="2">Đang xử lý</option>
								<option value="3">Đang giao hàng</option>
								<option value="4">Giao thành công</option>
								<option value="5">Đã hủy</option>
							</select>
						</div>
					</c:if>
					<c:if test="${order.status_delivery == 3}">
						<div class="form-group">
						<label>Trạng thái đơn hàng</label>
							<select name="status" class="form-control">
								<option disabled="disabled" value="1">Đặt thành công</option>
								<option disabled="disabled" value="2">Đang xử lý</option>
								<option value="3">Đang giao hàng</option>
								<option value="4">Giao thành công</option>
								<option value="5">Đã hủy</option>
							</select>
						</div>
					</c:if>
					<c:if test="${order.status_delivery == 4}">
						<div class="form-group">
						<label>Trạng thái đơn hàng</label>
							<select name="status" class="form-control">
								<option disabled="disabled" value="1">Đặt thành công</option>
								<option disabled="disabled" value="2">Đang xử lý</option>
								<option disabled="disabled" value="3">Đang giao hàng</option>
								<option value="4">Giao thành công</option>
								<option disabled="disabled" value="5">Đã hủy</option>
							</select>
						</div>
					</c:if>
					<c:if test="${order.status_delivery == 5}">
						<div class="form-group">
						<label>Trạng thái đơn hàng</label>
							<select name="status" class="form-control">
								<option disabled="disabled"  value="1">Đặt thành công</option>
								<option disabled="disabled" value="2">Đang xử lý</option>
								<option disabled="disabled" value="3">Đang giao hàng</option>
								<option disabled="disabled" value="4">Giao thành công</option>
								<option value="5">Đã hủy</option>
							</select>
						</div>
					</c:if>
					<c:choose>
						<c:when test="${order.payment == 1}">
						</c:when>
						<c:otherwise>
							<c:if test="${order.status_payment == false}">
								<div class="form-group">
									<label>Trạng thái thanh toán</label> <select
										name="status_payment" class="form-control">
										<option value="false">Chưa thanh toán</option>
										<option value="true">Đã thanh toán</option>
									</select>
								</div>
							</c:if>
							<c:if test="${order.status_payment == true}">
								<div class="form-group">
									<label>Trạng thái thanh toán</label> <select
										name="status_payment" class="form-control">
										<option disabled="disabled" value="false">Chưa thanh
											toán</option>
										<option value="true">Đã thanh toán</option>
									</select>
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>
					<%-- <c:if test="${order.payment == 1}">
					</c:if>
					<c:if test="${order.payment == 2}">
					<c:if test="${order.status_payment == false}">
						<div class="form-group">
						<label>Trạng thái thanh toán</label>
							<select name="status_payment" class="form-control">
								<option value="false">Chưa thanh toán</option>
								<option value="true">Đã thanh toán</option>
							</select>
						</div>
					</c:if>
					<c:if test="${order.status_payment == true}">
						<div class="form-group">
						<label>Trạng thái thanh toán</label>
							<select name="status_payment" class="form-control">
								<option disabled="disabled" value="false">Chưa thanh toán</option>
								<option value="true">Đã thanh toán</option>
							</select>
						</div>
					</c:if>
					</c:if> --%>
					<div class="form-group">
						<label>Hình thức thanh toán</label>
						<c:if test="${order.payment == 1}">
							<input value="Thanh toan khi nhận hàng" type="text" class="form-control">
							<form:input path="payment" type="text" class="form-control d-none" />
						</c:if>
						<c:if test="${order.payment == 2}">
							<input value="Chuyển khoản" type="text" class="form-control">
							<form:input path="payment" type="text" class="form-control d-none" />
						</c:if>
					</div>
					<div class="form-group">
						<label>Tổng tiền (vnd)</label>
						<form:input path="amount" type="number" min="0" class="form-control"/>
						<form:errors class="errors" path="amount"/>
					</div>
					<div class="form-group d-none">s
						<label>Id Khách hàng</label>
						<form:input path="userid.username" type="text" class="form-control" />
						<form:errors class="errors" path="userid.username"/>
					</div>
					<div class="form-group d-none">
						<label>Ngày đặt hàng</label>
						<form:input path="created"  class="form-control"/>
						<form:errors class="errors" path="created"/>
					</div>
					<%-- <div class="form-group">
						<label>Nhân viên xử lý</label>
						<form:input path="userid1.username" type="text" class="form-control"/>
						<form:errors class="errors" path="userid1.username"/>
					</div> --%>
					<div class="form-group">
						<label>Ghi chú thêm</label>
						<form:input path="message" type="text" class="form-control"/>
						<form:errors class="errors" path="message"/>
					</div>
					<button class="btn btn-outline-success">Cập nhật</button>
					<a href="admin/order/index.htm" class="btn btn-outline-success">Hủy</a>
					
			</form:form>
			<hr>
        	</div>
        </div>
</div>
</body>
</html>