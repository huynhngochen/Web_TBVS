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

form#find input {
	margin-right: 0px;
}

.product-item {
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	margin: 15px 0px;
}

.product-item .product-name {
	margin-bottom: 10px;
	color: #f94c43;
	padding: 0px;
	max-height: 50px;
	box-sizing: border-box;
	overflow: hidden;
	text-overflow: ellipsis;
}

.product-item .price {
	margin-bottom: 10px;
	font-weight: bold;
}

a.buy-now {
	text-decoration: none;
	padding: 2px;
	font-size: 18px;
	color: white;
	text-align: center;
	background: #f94c43;
	position: absolute;
	right: 0px;
	bottom: 2px;
}

.buy-now:hover {
	background-color: #474747;
	/* 	transition: all 0.5s;
	position: absolute;
	 bottom: 0px;  */
}

.product-item:hover {
	box-shadow: 2px 2px 2px 2px rgb(170, 140, 140);
}
</style>
</head>
<body>
	<div id="wrapper">
		<%@ include file="../hen/headerUser.jsp"%>
		<%@ include file="../hen/slider.jsp"%>
		<hr>
		<%@ include file="../hen/hen.jsp"%>

		<!-- end header -->
		<div id="wp-content">
			<div>
				<h3 class="text-center mt-4 font-weight-bold">SẢN PHẨM NỔI BẬT</h3>
				<hr style="border-top: 2px solid rgba(0, 0, 0, .1)">
				<div class="container">
					<div class="row">
						<c:forEach var="p" items="${product}">
							<c:if test="${p.product_hot == true}">
								<div class="col-md-3 col-sm-6 product-item">
									<a href="user/detail-product/${p.id}.htm"><img
										style="max-width: 100%"
										src="${pageContext.request.contextPath}/images/${p.images_link}"></a>
									<div class="product-name">${p.name }</div>
									<div class="price">
										<c:if test="${p.discount > 0 }">
											<f:formatNumber minFractionDigits="0"
												value="${p.price *(100-p.discount) / 100}" type="number" /> đ
											<p style="margin-bottom: 0px;">
												<del>
													<f:formatNumber minFractionDigits="0" value="${p.price}"
														type="number" />đ
												</del>
											</p>
										</c:if>
										<c:if test="${p.discount == 0 }">
											<f:formatNumber minFractionDigits="0" value="${p.price}"
												type="number" /> đ
										</c:if>
									</div>
									<c:if test="${p.in_stock == 0}">
										<a href="user/cart/addCart/${p.id}.htm" class="buy-now"
											style="pointer-events: none; cursor: default; text-decoration: none; color: black;">Mua
											ngay</a>
									</c:if>
									<c:if test="${p.in_stock > 0}">
										<a href="user/cart/addCart/${p.id}.htm" class="buy-now">Mua
											ngay</a>
									</c:if>

								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="hen">
				<h3 class="text-center mt-4 font-weight-bold">DANH MỤC HÀNG HÓA</h3>
				<hr style="border-top: 2px solid rgba(0, 0, 0, .1)">
				<div class="container"
					style="display: flex; flex-wrap: wrap; justify-content: center">
					<div class="row">
						<c:forEach var="b" items="${brand}">
								<div class="brand-item">
									<a href="user/show/${b.id}.htm" class="post-thumb"><img
										src="${pageContext.request.contextPath}/images/${b.images}">
									</a> <a href="user/show/${b.id}.htm" class="post-title">${b.name}</a>
								</div>
						</c:forEach>
					</div>
				</div>
			</div>

		</div>
		<!-- end content -->
		<%@ include file="../hen/footerUser.jsp"%>
		<%@ include file="../hen/footer.jsp"%>
		<!-- end footer -->
	</div>
	<script>
		!function(s,u,b,i,z){
		var r,m;s[i]||(s._sbzaccid=z,s[i]=function(){s[i].q.push(arguments)},s[i].q=[],s[i]("setAccount",z),
		r=function(e){return e<=6?5:r(e-1)+r(e-3)},
		(m=function(e){var t,n,c;5<e||s._subiz_init_2094850928430||(t="https://",
		t+=0===e?"widget."+i+".xyz":1===e?"storage.googleapis.com":"sbz-"+r(10+e)+".com",
		t+="/sbz/app.js?accid="+z,n=u.createElement(b),c=u.getElementsByTagName(b)[0],
		n.async=1,n.src=t,c.parentNode.insertBefore(n,c),setTimeout(m,2e3,e+1))})(0))}(window,document,"script","subiz","acqtjnocuqultexcbgbt");
	</script>
</body>
</html>