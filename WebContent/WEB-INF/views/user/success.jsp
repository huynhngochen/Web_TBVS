<%@ page pageEncoding="utf-8"%>
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
.post-thumb img{
    transition: 0.25s;
}
.post-thumb:hover img{
    transform: scale(1.05);
}
.post-title a:hover {
	color: black;
}
form#find input {
	margin-right: 0px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<%@ include file="../hen/headerUser.jsp"%>
		<hr>
		<%@ include file="../hen/hen.jsp"%>
		<!-- end header -->
		<hr>
		<div id="wp-content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					<a href="user/index.htm" class="btn btn-outline-success">Tiếp tục mua hàng</a>
					<a href="user/mycart.htm" class="btn btn-outline-success">Xem các đơn hàng của bạn</a>
						<p class="mt-3"><b>Chúc mừng bạn đã đặt hàng thành công!</b> </p>
						<p>Showromm chúng tôi sẽ liên hệ sớm với bạn để xác nhận đơn hàng</p>
						<p>Vui lòng kiểm tra thông tin chi tiết đơn hàng trong phần
						<span><a href="user/mycart.htm">quản lý đơn hàng</a></span> của bạn</p>
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