<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
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
</style>
</head>
<body>
	<div id="wrapper">
		<%@ include file="../hen/headerUser.jsp"%>
		<!-- slider -->
		<%-- <%@ include file="../hen/slider.jsp"%> --%>
		<!--   end slider -->
		<hr>
		<div class="container mb-4">
			<div class="row">
				<div class="col-md-3">
					<img src="${pageContext.request.contextPath}/images/1.PNG">
				</div>
				<div class="col-md-3">
					<img alt="not show"
						src="${pageContext.request.contextPath}/images/2.PNG">
				</div>
				<div class="col-md-3">
					<img src="${pageContext.request.contextPath}/images/3.PNG">
				</div>
				<div class="col-md-3">
					<img src="${pageContext.request.contextPath}/images/4.PNG">
				</div>
			</div>
		</div>
		<!-- end header -->
		<div id="wp-content">
			<div class="container">
				<hr>
				<h3 class="text-center mb-4">Thông tin sản phẩm</h3>
				<div class="row">
					<div class="col-md-6 border-right">
						<img
							src="${pageContext.request.contextPath}/images/${product.images_link}"
							class="img">
					</div>
					<div class="col-md-6">
						<p class="name">${product.name}</p>
						<hr style="border: 1px dotted rgba(0, 0, 0, .1); margin: 0px;">

						<div class="status p-2">
							<span class="mr-4"><i class="fas fa-cart-plus"> Tình
									trạng: </i></span>
							<c:if test="${product.in_stock > 0}">
								<span>Còn Hàng</span>
							</c:if>
							<c:if test="${product.in_stock == 0}">
								<span>Hết Hàng</span>
							</c:if>
						</div>
						<hr style="border: 1px dotted rgba(0, 0, 0, .1); margin: 0px;">
						<div class="p-2">
							<c:if test="${product.discount > 0 }">
								<span class="mr-4"><i class="fa fa-hand-holding-usd">
									Giá: </i> </span>
								<b><f:formatNumber minFractionDigits="0" value="${product.price *(100-product.discount) / 100}"
								type="number" />đ</b>
								<del style="font-style: italic;"><f:formatNumber minFractionDigits="0" value="${product.price}"
								type="number" />đ</del>
							</c:if>
							<c:if test="${product.discount == 0 }">
								<span class="mr-4"><i class="fa fa-hand-holding-usd">
										Giá: </i> </span>
								<f:formatNumber minFractionDigits="0" value="${product.price}"
									type="number" />
								đ
							</c:if>
							
						</div>
						<hr style="border: 1px dotted rgba(0, 0, 0, .1); margin: 0px;">
						<div class="p-2">
							
							<span class="mr-4"><i class="fas fa-box-open">Đã bán:</i>
									 ${product.count_buy} sản phẩm </span>
						</div>
						<hr style="border: 1px dotted rgba(0, 0, 0, .1); margin: 0px; margin-bottom: 10px">
						<form action="user/cart/addCart/${product.id}.htm" method="post" modelAttribute="cart">
							<label>Số Lượng</label>
							<input class="text-center" type="number" name="number" value="1" min="1" max="${product.in_stock}">
							<br>
							<div class="text-center mt-4">
								<c:if test="${product.in_stock > 0}">
									<button type="submit" class="btn btn-outline-danger" style="display: inline-block;">
										Thêm vào giỏ hàng</button> 
									<a href="user/cart/addCart/${product.id}.htm" type="button" 
										class="btn btn-lg btn-outline-danger" style="color: black">Mua Ngay</a> 
								</c:if>
								<c:if test="${product.in_stock == 0}">
									<P>SẢN PHẨM HIỆN TẠI ĐANG HẾT HÀNG. LIÊN HỆ VỚI CHÚNG TÔI NẾU BẠN MUỐN ĐẶT HÀNG.
										<b>0338355872</b></p>
								</c:if>
							</div>
							<p class="name d-inline-block mt-3">Đặc Điểm Nổi Bật</p>
							<p>- ${product.description}</p>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- end content -->
		<%@ include file="../hen/footerUser.jsp"%>
		<!-- end footer -->
	</div>
		<script>!function(s,u,b,i,z){var r,m;s[i]||(s._sbzaccid=z,s[i]=function(){s[i].q.push(arguments)},s[i].q=[],s[i]("setAccount",z),r=function(e){return e<=6?5:r(e-1)+r(e-3)},(m=function(e){var t,n,c;5<e||s._subiz_init_2094850928430||(t="https://",t+=0===e?"widget."+i+".xyz":1===e?"storage.googleapis.com":"sbz-"+r(10+e)+".com",t+="/sbz/app.js?accid="+z,n=u.createElement(b),c=u.getElementsByTagName(b)[0],n.async=1,n.src=t,c.parentNode.insertBefore(n,c),setTimeout(m,2e3,e+1))})(0))}(window,document,"script","subiz","acqtjnocuqultexcbgbt");</script>
</body>
</html>