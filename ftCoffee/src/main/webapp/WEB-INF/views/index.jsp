<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Bàn phòng</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="Css.jsp"></jsp:include>
<meta name="_csrf" content="${_csrf.token}" />
<style>
</style>
</head>

<body class="mini-navbar">


	<jsp:include page="layout-menu-quanLy.jsp"></jsp:include>

	<div class="all-content-wrapper">

		<jsp:include page="layout-header.jsp"></jsp:include>


		<!-- INDEX -->
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#home">Danh
							sách bàn</a></li>
					<li><a data-toggle="tab" href="#menu2">Thực đơn</a></li>
				</ul>

				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">
						<div class="row" id="showListIndex">

							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="data-table-area mg-tb-15">
									<div class="container-fluid">
										<div class="sparkline13-list">

											<div class="row">
												<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
													<div class="item_title">
														<span> Tình trạng</span> <select class="browser-default">
															<option selected>còn bàn</option>
															<option value="1">hết bàn</option>
														</select>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
													<div class="item_title">
														<span> Khu vực </span> <select class="browser-default"
															id="optionArea">

														</select>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>

								<div class="product-new-list-area"
									style="height: 500px; overflow: auto; background: #EAEAEA">
									<div class="container-fluid" id="trangBP">
										<div class="row">
											<div id="ListBanPhong"></div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div id="menu2" class="tab-pane fade">
						<div class="menu-title">
							<div class="main-sparkline13-hd">
								<h1>
									<span>Danh sách thực đơn</span><span style="float: right"><a
										data-toggle="tab" href="#home" id="click-back">Quay lại</a></span>
								</h1>
							</div>
						</div>

						<div class="sparkline13-list" id="modalPriceList"
							style="height: 500px; overflow: auto; background: #EAEAEA">
							<div class="sparkline13-graph">
								<div class="datatable-dashv1-list custom-datatable-overright">

									<table id="table" data-toggle="table">
										<thead>
											<tr>
												<th></th>
												<th data-field="id">ID</th>
												<th data-field="name">Tên hàng hóa</th>
												<th data-field="company">ĐVT</th>
												<th data-field="price">Đơn giá</th>
												<th data-field="price">Số lượng</th>
											</tr>
										</thead>
										<tbody id="showListProduct">

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- THÔNG TIN HÓA ĐƠN -->

			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">

				<!-- THÔNG TIN HÓA ĐƠN -->

				<div class="row">
					<br>
					<h3 style="color: #7ea896; background: #EAEAEA">
						<span>THÔNG TIN HÓA ĐƠN</span> <span>Hóa đơn:</span><span
							id="hoaDon"></span>
					</h3>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
						<div class="form-group-inner">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<label class="login2 pull-right pull-right-pro">Số bàn:</label>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<input type="text" class="form-control" disabled="disabled"
										id="nameTable">
								</div>
							</div>
						</div>
						<div class="form-group-inner">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<label class="login2 pull-right pull-right-pro">Số
										khách:</label>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<input type="number" class="form-control" value="0"
										id="numberCustomer">
								</div>
							</div>
						</div>
						<div class="form-group-inner">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<label class="login2 pull-right pull-right-pro">Bảng
										giá:</label>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<input type="text" class="form-control" disabled="disabled"
										id="nameBangGia">
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
						<div class="form-group-inner">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<label class="login2 pull-right pull-right-pro">Khách
										hàng:</label>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<select
										class="select2_demo_3 form-control select2-hidden-accessible"
										tabindex="-1" aria-hidden="true" id="idCustomer">
										<option>Select</option>

									</select>

								</div>
							</div>
						</div>
						<div class="form-group-inner">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<label class="login2 pull-right pull-right-pro">Nhân
										viên:</label>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<select
										class="select2_demo_3 form-control select2-hidden-accessible"
										tabindex="-1" aria-hidden="true" id="idStaff">
										<option>Select</option>

									</select>
								</div>
							</div>
						</div>
						<div class="form-group-inner">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<label class="login2 pull-right pull-right-pro">Giảm(%):</label>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<input type="number" class="form-control" id="giam">
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">

						<div class="form-group-inner">
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
									<label class="login2 pull-right pull-right-pro">VAT(%):</label>
								</div>
								<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
									<input type="number" class="form-control" id="vat">
								</div>
							</div>
						</div>
						<div class="form-group-inner">
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
									<label class="login2 pull-right pull-right-pro">Phí PV:</label>
								</div>
								<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
									<input type="number" class="form-control" id="phiPV">
								</div>
							</div>
						</div>
						<div class="form-group-inner">
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
									<label class="login2 pull-right pull-right-pro">Tổng:</label>
								</div>
								<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
									<input type="number" class="form-control" id="total" disabled="disabled">
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- DANH SACH THUC DON -->
				<h3 style="color: #7ea896; background: #EAEAEA">DANH SÁCH THỰC
					ĐƠN</h3>
				<div class="row">

					<div class="sparkline13-graph">
						<div class="datatable-dashv1-list custom-datatable-overright"
							style="height: 315px; overflow: auto">
							<table id="table" data-toggle="table">
								<thead>
									<tr>
										<th data-field="id">ID</th>
										<th data-field="name" data-editable="true">Tên hàng hóa,
											sản phẩm, dịch vụ</th>
										<th data-field="DVT" data-editable="true">ĐVT</th>
										<th data-field="amount" data-editable="true">Số lượng</th>
										<th data-field="price" data-editable="true">Đơn giá</th>
										<th data-field="sale" data-editable="true">Giảm giá</th>
										<th data-field="total" data-editable="true">Thành tiền</th>
										<th data-field="option"></th>
									</tr>
								</thead>

								<tbody id="listDongChungTu">

								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row" style="background: #EAEAEA">
					<button type="button"
						class="btn btn-custon-rounded-three btn-primary">Chuyển
						bàn</button>
					<button type="button"
						class="btn btn-custon-rounded-three btn-warning">ghép bàn</button>
					<button type="button"
						class="btn btn-custon-rounded-three btn-success"
						data-toggle="modal" data-target="#thanhtoan" id="thanhToan">Thanh
						toán</button>
					<button type="button"
						class="btn btn-custon-rounded-three btn-danger"
						data-toggle="modal" data-target="#huy-ban" id="huyBan">Hủy bàn</button>



					<!-- MODAL THANH TOAN -->

					<div id="thanhtoan"
						class="modal modal-adminpro-general FullColor-popup-DangerModal PrimaryModal-bgcolor fade"
						role="dialog">

						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"
							style="float: right;">

							<div class="menu-title">
								<div class="main-sparkline13-hd">
									<h1>Phiếu thanh toán</h1>
								</div>
							</div>
							<div class="sparkline13-list">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
										<div class="form-group-inner">
											<div class="row">
												<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
													<label class="login2 pull-right pull-left-pro">Hóa
														đơn:</label>
												</div>
												<!-- hidden="hidden" -->
												<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
													<input type="number" class="form-control"
														id="getIdNumberVoucher" value="1" disabled="disabled">
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
										<div class="form-group-inner">
											<div class="row">
												<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
													<label class="login2 pull-right pull-left-pro">Số
														bàn:</label>
												</div>
												<!-- hidden="hidden" -->
												<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
													<input type="number" class="form-control"
														id="getTableNumberInBill" disabled="disabled">
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
										<div class="form-group-inner">
											<div class="row">
												<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
													<label class="login2 pull-right pull-left-pro">Số
														khách:</label>
												</div>
												<!-- hidden="hidden" -->
												<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
													<input type="number" class="form-control"
														id="getNumberCustomerInBill">
												</div>
											</div>
										</div>
									</div>
								</div>
								<table id="table" data-toggle="table">
									<thead>
										<tr>
											<th data-field="id">ID</th>
											<th data-field="name" data-editable="true">Tên hàng hóa,
												sản phẩm, dịch vụ</th>
											<th data-field="DVT" data-editable="true">ĐVT</th>
											<th data-field="amount" data-editable="true">Số lượng</th>
											<th data-field="price" data-editable="true">Đơn giá</th>
											<th data-field="sale" data-editable="true">Giảm giá</th>
											<th data-field="total" data-editable="true">Thành tiền</th>
										</tr>
									</thead>

									<tbody id="listThanhToan">

									</tbody>
								</table>
								<div class="form-group-inner">
									<div class="row">
										<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
											<label class="login2 pull-right pull-right-pro">Tổng
												tiền:</label>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
											<input type="number" class="form-control" id="totalInBill" disabled="disabled">
										</div>
									</div>
								</div>

								<div style="float: center;">
									<button type="button"
										class="btn btn-custon-rounded-three btn-success" id="showBill"
										onclick="inBillTest()">In hóa đơn tạm thời</button>
									<button type="button"
										class="btn btn-custon-rounded-three btn-danger" id="inBill">Thanh
										toán</button>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="layout-footer.jsp"></jsp:include>
	</div>
	<jsp:include page="Script.jsp"></jsp:include>
	<script src="resources/JS/CRUD/index.js "></script>
	<script src="resources/JS/CRUD/ChiTietBan.js "></script>
</body>

</html>