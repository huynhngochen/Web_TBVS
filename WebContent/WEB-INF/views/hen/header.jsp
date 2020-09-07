 <%@ page pageEncoding="utf-8"%>
 <div id="header">
            <div class="container-fluid clearfix">
                <div class="row mb-2">
                    <div class="col-md-8">
                        <div class="logo">
                            <a href="admin/admin-home.htm">
                                <img src="${pageContext.request.contextPath}/asset/images/logo.png" height="100px" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4">
                    <%-- <c:if test="${isLogin == true}"> --%>
                        <div class="info-user">
                            <div class="info-user-icon">
                                <i class="fas fa-user-cog"></i>
                            </div>
                            <div class="info-account">
                                <span>XinChao: <a href="admin/info-account.htm" style="font-size: 18px !important;font-weight: 700; color: #666666; text-decoration: none">
                                				${sessionScope.user.getUsername()}</a>
                                </span>

                            </div>
                            <div class="info-user-more">
                                <a href="admin/managerAccount.htm">Tài Khoản</a>
                                <span style="padding: 0,5px;">|</span>
                                <a href="admin/logout.htm" onclick="return confirm('Bạn có chắc muốn đăng xuất?');">Đăng Xuất</a>
                            </div>
                        </div>
                       <%-- </c:if> --%>
                    </div>
                </div>
                <div class="row">
			<div class="col-md-12">
				<div class="header-menu">
					<a href="admin/admin-home.htm" class="btn btn-outline-dark"><span><img
							src="asset/images/icon-qly-don-hang.png" width="60px"
							height="50px" alt=""></span>Quản lý đơn hàng</a> <a
						href="admin/product/index.htm" class="btn btn-outline-dark"><span><img
							src="asset/images/icon-qly-hang-hoa.png" width="60px"
							height="50px" alt=""></span>Quản lý sản phẩm</a> <a
						href="admin/admin-user.htm" class="btn btn-outline-dark"> <span><img
							src="asset/images/kh.png" width="60px" height="50px" alt="">
					</span>Quản lý khách hàng
					</a> <a href="admin/system.htm" class="btn btn-outline-dark">
						<span><img src="asset/images/icon-he-thong.png"
							width="60px" height="50px" alt=""></span>Quản lý hệ thống
					</a> <a href="admin/order/indexCount.htm"
						class="btn btn-outline-dark"><span><img
							src="asset/images/icon-thong-ke.jpg" width="60px" height="50px"
							alt=""></span>Thống kê Doanh Thu</a>
				</div>
			</div>
		</div>
            </div>
        </div>