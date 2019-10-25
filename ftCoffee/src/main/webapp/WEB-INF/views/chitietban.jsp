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
<jsp:include page="Css1.jsp"></jsp:include>
<meta name="_csrf" content="${_csrf.token}" />
</head>

<body class="mini-navbar">


	<jsp:include page="layout-menu-quanLy.jsp"></jsp:include>

	<div class="all-content-wrapper">

		<jsp:include page="layout-header.jsp"></jsp:include>
		<!-- Static Table Content -->


		<div class="row">

			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="data-table-area mg-tb-15">
					<div class="container-fluid">
						<div class="sparkline13-list">


							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">

									<div class="item_title">

										<span> Tình trạng</span> <select class="browser-default"
											id="tinhTrang">
											<option selected>còn bàn</option>
											<option value="1">hết bàn</option>

										</select>
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 ">
									<div class="item_title">
										<span> Khu vực </span> <select class="browser-default "
											id="optionArea">

										</select>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="product-new-list-area">
					<div class="container-fluid">
						<div id="ListBanPhong"></div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal -->

	<!-- MODAL CHI TIET BAN -->
	<!--  -->
	<!-- The Modal -->
	<div id="modalChiTietBan" class="modal">

		<!-- Modal content -->
		<div class="modal-content" id="contentModelChiTietBan">

			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1"></div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs mb-3 text-secondary pt-1"
					style="text-align: right;">
					<a id="closeModalChiTietBan" class='btn btn-outline-success'><i
						class="fa fa-times"></i></a>
				</div>
			</div>

			<div class="data-table-area mg-tb-15">
				<div class="container-fluid">
					<div class="panel panel-default">
						<div class="panel-heading accordion-head"
							style="margin-bottom: 10px; background-color: #f0ff07">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion2"
									href="#collapse6" class="" aria-expanded="true"><span>Hoá
										đơn: </span><span id="nameHoaDon">1</span></a>
							</h4>
						</div>
						<div id="collapse6" class="panel-collapse panel-ic collapse in"
							aria-expanded="true" style="">
							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Số
													bàn phòng:</label>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<input type="text" class="form-control" id="nameTable">
											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Số
													lượng khách:</label>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<input type="text" class="form-control">
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
												<input type="text" class="form-control" id="nameBangGia">
											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Trả
													trước:</label>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<input type="text" class="form-control">
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Số
													phiếu:</label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
												<input type="text" class="form-control">
											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Giờ
													vào:</label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
												<div class="input-group date">
													<span class="input-group-addon"><i
														class="fa fa-calendar"></i></span> <input type="text"
														class="form-control" value="10/04/2017">
												</div>
											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Giờ
													vào:</label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
												<div class="input-group date">
													<span class="input-group-addon"><i
														class="fa fa-calendar"></i></span> <input type="text"
														class="form-control" value="10/04/2017">
												</div>
											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Còn
													nợ:</label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
												<input type="text" class="form-control">
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Khách
													hàng:</label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
												<select
													class="select2_demo_3 form-control select2-hidden-accessible"
													tabindex="-1" aria-hidden="true">
													<option>Select</option>
													<option value="Bahamas">Bahamas</option>
												</select>

											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Nhân
													viên:</label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
												<select
													class="select2_demo_3 form-control select2-hidden-accessible"
													tabindex="-1" aria-hidden="true">
													<option>Select</option>
													<option value="Bahamas">Bahamas</option>
												</select>

											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Thu
													ngân:</label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
												<select
													class="select2_demo_3 form-control select2-hidden-accessible"
													tabindex="-1" aria-hidden="true">
													<option>Select</option>
													<option value="Bahamas">Bahamas</option>
												</select>

											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Ghi
													chú:</label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
												<input type="text" class="form-control">
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Giảm(%):</label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
												<input type="text" class="form-control">
											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
												<label class="login2 pull-right pull-right-pro">VAT(%):</label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
												<input type="text" class="form-control">
											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Phí
													PV:</label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
												<input type="text" class="form-control">
											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Tổng:</label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
												<input type="text" class="form-control">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="data-table-area mg-tb-15">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="sparkline13-list">
								<div class="sparkline13-hd">
									<div class="main-sparkline13-hd">
										<h1 style="color: #7ea896; background: #EAEAEA">Thông tin
											hóa đơn</h1>
									</div>
								</div>
								<div class="sparkline13-graph">
									<div class="datatable-dashv1-list custom-datatable-overright"
										style="height: 250px; overflow: auto">

										<table id="table" data-toggle="table">
											<thead>
												<tr>
													<th data-field="id">ID</th>
													<th data-field="name" data-editable="true">Tên hàng
														hóa, sản phẩm, dịch vụ</th>
													<th data-field="DVT" data-editable="true">ĐVT</th>
													<th data-field="price" data-editable="true">Đơn giá</th>
													<th data-field="amount" data-editable="true">Số lượng</th>
													<th data-field="total" data-editable="true">Thành tiền</th>
													<th data-field="status" data-editable="true">Tình
														trạng</th>
													<th data-field="option"></th>
												</tr>

											</thead>
											<tbody id="DanhSachThucDon">

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="data-table-area mg-tb-15">
				<div class="container-fluid">
					<div class="panel panel-default-custom">
						<div class="button-style-three">
							<button type="button"
								class="btn btn-custon-rounded-three btn-insert"
								data-toggle="modal" data-target="#insert">Thêm món</button>
							<button type="button"
								class="btn btn-custon-rounded-three btn-primary">Chuyển
								bàn</button>
							<button type="button"
								class="btn btn-custon-rounded-three btn-warning">ghép
								bàn</button>
							<button type="button"
								class="btn btn-custon-rounded-three btn-success"
								data-toggle="modal" data-target="#thanhtoan">Thanh toán</button>
							<button type="button"
								class="btn btn-custon-rounded-three btn-danger"
								data-toggle="modal" data-target="#huy-ban">Hủy bàn</button>
						</div>
						<div id="insert"
							class="modal modal-adminpro-general FullColor-popup-DangerModal PrimaryModal-bgcolor fade"
							role="dialog">
							<div class="data-table-area mg-tb-15">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"
									style="float: right;">
									<div class="menu-title">
										<div class="main-sparkline13-hd">
											<h1>Danh sách thực đơn</h1>
										</div>
									</div>
									<div class="sparkline13-list">
										<div class="sparkline13-graph">
											<div class="datatable-dashv1-list custom-datatable-overright"
												style="background: #EAEAEA">
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
													<tbody id="ListProduct">

													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
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

									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Tổng
													tiền:</label>
											</div>
											<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
												<input type="text" disabled="" class="form-control"
													placeholder="10000">
											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Giảm
													giá (%):</label>
											</div>
											<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" placeholder="0">
											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Khách
													cần trả:</label>
											</div>
											<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
												<input type="text" disabled="" class="form-control"
													placeholder="10000">
											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Khách
													thanh toán:</label>
											</div>
											<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
												<input type="password" class="form-control"
													placeholder="20000">
											</div>
										</div>
									</div>
									<div class="form-group-inner">
										<div class="row">
											<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
												<label class="login2 pull-right pull-right-pro">Tiền
													thừa trả khách:</label>
											</div>
											<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
												<input type="text"  class="form-control"
													placeholder="10000">
											</div>
										</div>
									</div>
									<div class="button-style-three-calculate">
										<button type="button"
											class="btn btn-custon-rounded-three btn-primary">In
											hóa đơn</button>
										<button id="btn-thanhtoan" type="button"
											class="btn btn-custon-rounded-three btn-success">
											Thanh toán</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="huy-ban"
						class="modal modal-adminpro-general FullColor-popup-DangerModal PrimaryModal-bgcolor fade"
						role="dialog" style="display: none;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-close-area modal-close-df">
									<a class="close" data-dismiss="modal" href="#"><i
										class="fa fa-close"></i></a>
								</div>
								<div class="modal-body">
									<span
										class="adminpro-icon adminpro-danger-error modal-check-pro information-icon-pro"></span>
									<h2>Bạn có chắc chắn muốn hủy bàn</h2>

								</div>
								<div class="modal-footer footer-modal-admin">
									<a data-dismiss="modal" href="#">Cancel</a> <a href="#">Process</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- MODAL ADD VOUCHER -->
	<!--  -->
	<!-- The Modal -->
	<div id="modalAddVoucher" class="modal">

		<!-- Modal content -->
		<div class="modal-content" id="contentModelAddVoucher">
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1"></div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs mb-3 text-secondary pt-1"
					style="text-align: right;">
					<a id="closeModalAddVoucher" class='btn btn-outline-success'><i
						class="fa fa-times"></i></a>
				</div>
			</div>
			<div id="collapse6" class="panel-collapse panel-ic collapse in"
				aria-expanded="true" style="">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
						<div class="form-group-inner">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<label class="login2 pull-right pull-right-pro">Số bàn
										phòng:</label>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<input type="text" class="form-control" id="nameTableAddVoucher">
								</div>
							</div>
						</div>
						<div class="form-group-inner">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<label class="login2 pull-right pull-right-pro">Số
										lượng khách:</label>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<input type="text" class="form-control" id="numberCustomerAddVoucher">
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
									<input type="text" class="form-control" id="nameBangGiaAddVoucher">
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
						<div class="form-group-inner">
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
									<label class="login2 pull-right pull-right-pro">Khách
										hàng:</label>
								</div>
								<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
									<select
										class="select2_demo_3 form-control select2-hidden-accessible"
										tabindex="-1" aria-hidden="true" id="customerAddVoucher">
										<option>Select</option>
										
									</select>
								</div>
							</div>
						</div>
						<div class="form-group-inner">
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
									<label class="login2 pull-right pull-right-pro">Nhân
										viên:</label>
								</div>
								<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
									<select
										class="select2_demo_3 form-control select2-hidden-accessible"
										tabindex="-1" aria-hidden="true" id="staffAddVoucher">
										<option>Select</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button id="submitAddVoucher">Thêm</button>
		</div>
	</div>

	<!-- Static Table End -->
	<jsp:include page="layout-footer.jsp"></jsp:include>
	<jsp:include page="Script.jsp"></jsp:include>
	<!-- <script src="resources/JS/CRUD/index.js "></script> -->
	<script src="resources/JS/CRUD/Demo.js "></script>
</body>

</html>