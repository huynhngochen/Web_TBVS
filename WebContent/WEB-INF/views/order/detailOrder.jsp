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
    <title>Quản Trị Admin</title>
    <style type="text/css">
    	.hen1:HOVER {
    		color: white;
			background-color: #212529;
		}
		
		.hen2:HOVER {
			color: white;
			background-color: green;
		}
		.img {
			max-width: 100%;
		}
		.box-customer, .box-product {
			border: 1px solid #474747;
			padding: 15px;
		}
    </style>
</head>
<body>
<div id="wrapper">
        <%@ include file="../hen/header.jsp"%>
        <!-- end header -->
        <div id="wp-content" class="mt-4">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<h3 class="text-center">Thông tin khách hàng</h3>
						<div class="box-customer container">
								<p>Họ Tên KH: <b>${detail_order[0].dathangs.userid.thongtinuser.fullname}</b></p>
								<p>SDT:  <b>${detail_order[0].dathangs.userid.thongtinuser.sdt} </b></p>
								<p>Email:  <b>${detail_order[0].dathangs.userid.thongtinuser.email} </b></p>
								<p>Địa Chỉ:  <b>${detail_order[0].dathangs.userid.thongtinuser.address} </b></p>
						</div>
						<h3 class="text-center mt-3">Thông tin đơn hàng</h3>
						<div class="box-product container">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>Tên sản phẩm</th>
										<th>Số lượng</th>
										<th>Thành tiền</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="d" items="${detail_order}">
										<tr>
											<td>${d.hanghoas.name}</td>
											<td>${d.qty}</td>
											<td><f:formatNumber value="${d.qty * d.hanghoas.price}" type="number" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end content -->
<!-- 		footer -->
		<%@ include file="../hen/footer.jsp"%>
<!-- 		end	footer -->
    </div>
   <!--  end wrapper -->
</body>
</html>