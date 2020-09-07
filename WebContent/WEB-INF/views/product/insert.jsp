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
        <div class="wp-content">
        	<div class="container">
        		<h3 class="text-center mt-4">Thêm sản phẩm mới</h3>
				<hr>
				<p class="errors">${message}</p>

			<form:form action="admin/product/insert.htm" method="post" modelAttribute="product" enctype="multipart/form-data">
				<div class="form-group">
					<label>Tên hãng</label>
					<br>
					<form:select class="form-control" style="width: 500px;" path="loaihang.id"
							items="${brand}" itemValue="id" itemLabel="name"/>
				</div>
				<div class="form-group">
					<label>Tên sản phẩm</label>
					<form:input path="name" type="text" class="form-control" />
					<form:errors class="errors" path="name"/>
				</div>
				<div class="form-group">
					<label>Giá tiền (vnd)</label>
					<form:input path="price" type="number" min="0" class="form-control"/>
					<form:errors class="errors" path="price"/>
				</div>
				<div class="container">
						<div class="row">
							<div class="col-md-6" style=" padding-left: 0px;">
								<div class="form-group">
									<label>Tồn Kho</label>
									<form:input path="in_stock" type="number" min="0" style="width: 500px;" class="form-control"/>
									<form:errors class="errors" path="in_stock"/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Giảm giá</label>
									<form:input path="discount" type="number" min="0" step="0" style="width: 500px;" class="form-control"/>
									<form:errors class="errors" path="discount"/>
								</div>
							</div>
						</div>
				</div>
				<div class="form-group">
					<label>Sản phẩm nổi bật</label>
					<form:checkbox path="product_hot" />
				</div>
				<div class="form-group">
					<label>Hình ảnh</label>
					<br>
					<input type="file" name="photo">
					<p class="errors">${message_image}</p>
				</div>
				<div class="form-group">
						<label>Mô tả</label>
						<form:input path="description" type="text" class="form-control"/>
						<form:errors class="errors" path="description"/>
					</div>
				<button class="btn btn-outline-success">Thêm mới</button>
			</form:form>
			<hr>
        	</div>
        </div>
         <!--        end content -->
 
  <%@ include file="../hen/footer.jsp"%>
</div>
</body>
</html>