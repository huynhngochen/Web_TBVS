<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="${pageContext.servletContext.contextPath}/">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/fonts/fontawesome/css/all.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/global.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/css/style.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js">
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;515;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/asset/js/Jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.min.js"></script>
<title>TaTa</title>
<style>
.modal-content .row .col-md-5 {
	position: relative;
	overflow: hidden;
	padding: 0;
	background-size: cover;
	background-repeat: no-repeat;
	background-color: #e6e6e6;
	background-image: url("asset/images/images-login.PNG");
}

.modal-content .row .col-md-7 {
	background: #8581816b;
}

.modal-footer {
	justify-content: center;
	font-size: 25px;
}

.modal-footer span {
	color: #666666;
}

button.btn {
	color: #666666;
	font-weight: bold;
	display: block;
	line-height: 35px;
}

.hen {
	width: 1140px;
	margin: 0px auto;
}

.brand-item {
	width: 360px;
	height: 300px;
	text-align: center;
	margin-left: 10px;
	margin-bottom: 10px;
	padding: 25px;
	box-sizing: border-box;
}

.brand-item img {
	max-width: 100%;
	max-height: 100%;
}

.brand-item a {
	text-decoration: none;
	color: #474747;
	font-weight: bold;
}

.brand-item .post-title {
	font-size: 20px;
	display: block;
	margin-top: 10px;
}

.post-thumb img {
	transition: 0.25s;
}

.post-thumb:hover img {
	transform: scale(1.05);
}

.post-title a:hover {
	color: black;
}

.name {
	background: #474747;
	color: white;
	text-align: center;
	font-weight: bold;
	font-size: 18px;
	padding: 8px;
}

#btn-update-cart {
	font-size: 12px;
	margin-right: 0px;
	width: 65px;
	height: 30px;
	padding: 0px;
	float: right;
	text-align: center;
}

.total {
	padding: 20px;
	background: #f6f2f1;
}

.total-tmp {
	padding: 5px;
	font-size: 20px;
	font-weight: bold;
	border-bottom: 1px solid #605e56;
}

.total-price {
	padding: 5px;
	font-size: 20px;
	font-weight: bold;
}

#btn-buynow {
	background: #f94c43;
	color: white;
	margin-top: 20px;
	margin-bottom: 20px;
	margin-right: 30px;
	width: 300px;
	margin-right: 30px;
}

#btn-buynow:hover {
	background: #474747;
	color: white;
}

.errors {
	color: red;
	font-size: 16px;
	font-weight: bold;
}

.payment {
	margin-top: 20px;
}

.payment label {
	font-size: 20px;
	padding-right: 10px;
	font-weight: bold;
}

.img {
	width: 40px;
	max-width: 100%;
}
</style>
</head>
<body>
	<div id="wrapper">
		<%@ include file="../hen/headerUser.jsp"%>
		<hr>

		<!-- end header -->
		<div class="wp=content" style="margin-bottom: 30px;">
			<h3 class="text-center">
				<span><img alt="" src="${pageContext.request.contextPath}/images/smart-cart.png"></span>
				Xác nhận giỏ hàng
			</h3>
			<hr>
			<div class="container">
				<a href="user/managerAccount.htm" class="errors">${message1}</a>
				<h5 style="color: red; font-style: italic;">${message}</h5>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<c:if test="${sessionScope.cart.isEmpty() == false}">
							<table class="table ">
								<thead>
									<tr>
										<th>Sản phẩm</th>
										<th>Hình ảnh</th>
										<th>Đơn giá</th>
										<th>Giảm Giá</th>
										<th>Số lượng</th>
										<th>Thành tiền</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${sessionScope.cart}">
										<tr>
											<td>${item.value.getProduct().getName()}</td>
											<td><img class="img"
												src="${pageContext.request.contextPath}/images/${item.value.getProduct().getImages_link()}">
											</td>
											<td class="text-center"><f:formatNumber
													minFractionDigits="0"
													value="${item.value.getProduct().getPrice()}" type="number" /></td>
											<td>${item.value.getProduct().getDiscount()}%</td>
											<td class="text-center">${item.value.getQuantity()}<%-- <form
												action="user/cart/update/${item.value.getProduct().getId() }.htm">
												<input name="number" style="width: 40px" type="number"
													value="${item.value.getQuantity()}">
												<button id="btn-update-cart" type="submit"
													class="btn btn-outline-info btn-sm float-right">Cập
													Nhật</button>
											</form> --%>
											</td>
											<td><f:formatNumber minFractionDigits="0"
													value="${item.value.getQuantity() * (item.value.getProduct().getPrice()*(100- item.value.getProduct().getDiscount()) / 100)}"
													type="number" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="col-md-12">
								<div class="total clearfix">
									<div class="total-price float-right">
										Tổng tiền hàng: <span><f:formatNumber
												minFractionDigits="0" value="${sessionScope.totalprice}"
												type="number" /></span>
									</div>
								</div>
							</div>
					</div>
				</div>
					<div class="col-md-12 mt-4">
					<div class="payment clearfix">
						<form:form action="user/buynow.htm" modelAttribute="order"
							method="post">
							<input type="radio" name="payment" checked="checked" value="online" id="online">
							<label for="online">Thanh toán chuyển khoản</label> 
							<input type="radio" name="payment"  value="offline" id="offline"> 
							<label for="offline">Thanh toán khi nhận hàng</label>
							<div class="info-payment">
								<p>Chủ tài khoản: <b>Huỳnh Ngọc Hẹn</b></p>
								<p>STK: <b>123456789</b></p>
								<p>Chi nhánh ngân hàng:<b>Techcombank Quận 9</b></p>
							</div>
							<div class="form-group mt-3" style="display: inline-block;">
								<label>Ghi chú thêm</label> <input class="form-control"
									style="display: inline-block; width: 500px; height: 60px"
									type="text" name="message">
							</div>
							<button id="btn-buynow" type="submit"
								class="btn btn-lg float-right">ĐẶT HÀNG</button>

						</form:form>
					</div>
				</div>
				</c:if>
			</div>
			<!-- 			end xác nhận giỏ hàng -->
		</div>

		<%@ include file="../hen/hen.jsp"%>
		<!-- 		end content -->
		<%@ include file="../hen/footerUser.jsp"%>
	</div>

	
<script type="text/javascript">
	 $(document).ready(function(){
	     $("input#online").click(function(){
	        $(".info-payment").show();
	    }); 
	     $("input#offline").click(function(){
	         $(".info-payment").hide();
	     });  
	   
	}); 
</script>
	<script>!function(s,u,b,i,z){var r,m;s[i]||(s._sbzaccid=z,s[i]=function(){s[i].q.push(arguments)},s[i].q=[],s[i]("setAccount",z),r=function(e){return e<=6?5:r(e-1)+r(e-3)},(m=function(e){var t,n,c;5<e||s._subiz_init_2094850928430||(t="https://",t+=0===e?"widget."+i+".xyz":1===e?"storage.googleapis.com":"sbz-"+r(10+e)+".com",t+="/sbz/app.js?accid="+z,n=u.createElement(b),c=u.getElementsByTagName(b)[0],n.async=1,n.src=t,c.parentNode.insertBefore(n,c),setTimeout(m,2e3,e+1))})(0))}(window,document,"script","subiz","acqtjnocuqultexcbgbt");</script>
</body>
</html>