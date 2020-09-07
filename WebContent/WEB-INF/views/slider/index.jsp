<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
    <title>Quản lý slider</title>
    <style type="text/css">
    	.img {
    	    max-width: 100%;
    	}
    </style>
</head>
<body>
<div id="wrapper">
        <%@ include file="../hen/header.jsp"%>
        <!-- end header -->
        <div class="wp-content mt-4">
        	<div class="container text-center">
        		<h3>Quản lí danh mục slider</h3>
        		<a class="btn btn-outline-success float-right mb-4" href="admin/slider/insert.htm">Thêm mới</a>
        		<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Mã quảng cáo</th>
							<th>Hình ảnh</th>
							<th>Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="s" items="${slider}">
							<tr>
								<td width="150px">${s.id}</td>
								<td><img src="${pageContext.request.contextPath}/images/${s.image}" class="img"></td>
								<td width="92px"><a href="admin/slider/delete/${s.id}.htm"
									onclick="return confirm('Bạn có chắc muốn xóa Slider?');">Xóa</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
        	</div>
        </div>
</div>
   <script type="text/javascript">
	   $(document).ready(function (){
		   if('${message}'){
			  alert('${message}');
			  window.history.back();
		  } 
	   });
   </script>
</body>
</html>