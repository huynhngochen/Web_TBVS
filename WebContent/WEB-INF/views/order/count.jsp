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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
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
	left: 280px;
}
</style>
</head>
<body>
<div id="wrapper">
        <%@ include file="../hen/header.jsp"%>
        <!-- end header -->
        <div id="wp-content" class="mt-4">
        	<div class="container">
        		<div class="row text-center">
        			<div class="box">
						<form:form action="admin/order/count.htm" method="post">
							<b>Từ Ngày</b>
							<input style="width: 175px" type="date" name="date1" id="datefield" max="">
							<b>Đến Ngày</b>
							<input type="date" name="date2" max="" id="datefield1"> <br>
							<button style=" position: relative;margin-top: 20px;"
								type="submit" class="btn btn-outline-dark">Thống kê</button>
						</form:form>
					</div>
        		</div>
        	</div>
			
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3 class="text-center mt-4">Số Liệu Thống Kê Theo Biểu Đồ</h3>
						<canvas id="line-chart" width="500" height="200"></canvas>
					</div>
				</div>
			</div>
			<hr>
		</div>
		<!-- end content -->
		<!-- 		footer -->
		<%@ include file="../hen/footer.jsp"%>
    </div>
   <!--  end wrapper -->
</body>
<script>
new Chart(document.getElementById("line-chart"), {
	  type: 'line',
	  data: {
	    labels: [<c:forEach var="item" items="${report}">'${item.time}',</c:forEach>],
	    datasets: [{ 
	        data: [<c:forEach var="item" items="${report}">${item.value},</c:forEach>],
	        label: "Tổng Thu",
	        borderColor: "#3e95cd",
	        fill: false
	      }]
	  },
	  options: {
	    title: {
	      display: true,
	      text: 'Thống kê doanh thu bán hàng'
	    }
	  }
	});
	

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
</html>