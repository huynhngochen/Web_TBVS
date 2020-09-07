<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8">
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
	href="${pageContext.request.contextPath}/asset/css/adminhome.css">

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

.box {
	position: relative;
	border: 1px dotted #474747;
	padding: 15px;
}

.box-info {
	display: inline-block;
	position: absolute;
	top: 10px;
	left: 120px;
	font-size: 20px;
	font-weight: bold;
}

.box-info .total {
	margin-top: 5px;
	margin-bottom: 0px;
	color: #ff9700;
}
.errors {
	color: red;
	font-weight: bold;
	font-style: italic;
}
</style>
</head>
<body>
	<div id="wrapper">
		<%@ include file="../hen/header.jsp"%>
		<!-- end header -->
		<div id="wp-content" class="mt-4" style="min-height: 380px">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="box" style="min-height: 115px;">
							<div class="box-img">
								<img alt=""
									src="${pageContext.request.contextPath}/images/coin.png">
							</div>
							<div class="box-info">
								<c:if test="${count == null}">
									<p class="total">0</p>
								</c:if>
								<p class="total">
									<f:formatNumber minFractionDigits="0" value="${count}"
										type="number" />
								</p>
								<p>
									Doanh số hôm nay: <span>${date}</span>
								</p>
							</div>

						</div>
					</div>
					<div class="col-md-6">
					
						<div class="box">
							<form:form action="admin/order/count.htm" method="post">
								<b>Từ Ngày</b>
								<input style="width: 175px" type="date" name="date1" id="datefield" max="">
								<b>Đến Ngày</b>
								<input type="date" name="date2" id="datefield1" max="">
								<button
									style="margin-top: 15px; position: relative; left: 205px;"
									type="submit" class="btn btn-outline-dark">Thống kê</button>
							</form:form>
							<p class="errors"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end content -->
	</div>
	<%@ include file="../hen/footer.jsp"%>
	<!--  end wrapper -->
<script type="text/javascript">
	if ('${message}') {
		alert('${message}');
	}
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 
	
	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("datefield").setAttribute("max", today);
	document.getElementById("datefield1").setAttribute("max", today);

</script>

</body>
</html>