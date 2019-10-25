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
</head>

<body class="mini-navbar">


	<jsp:include page="layout-menu-quanLy.jsp"></jsp:include>

	<div class="all-content-wrapper">

		<jsp:include page="layout-header.jsp"></jsp:include>
		<!-- Static Table Content -->
		<div class="data-table-area mg-tb-15">
			<div class="container-fluid">
				<div class="panel panel-default">
					<div class="panel-heading accordion-head"
						style="margin-bottom: 10px; background-color: #f0ff07">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion2"
								href="#collapse6" class="" aria-expanded="true"> Hóa đơn: 1
								/ Phòng Vip</a>
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
											<input type="text" class="form-control">
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
											<input type="text" class="form-control">
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
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<label class="login2 pull-right pull-right-pro">Giảm(%):</label>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<input type="text" class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group-inner">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<label class="login2 pull-right pull-right-pro">VAT(%):</label>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<input type="text" class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group-inner">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<label class="login2 pull-right pull-right-pro">Phí
												PV:</label>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
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
									<h1>Thông tin hóa đơn</h1>
								</div>
							</div>
							<div class="sparkline13-graph">
								<div class="datatable-dashv1-list custom-datatable-overright">
									<div id="toolbar">
										<select class="form-control">
											<option value="">Export Basic</option>
											<option value="all">Export All</option>
											<option value="selected">Export Selected</option>
										</select>
									</div>
									<table id="table" data-toggle="table" data-pagination="true"
										data-search="true" data-show-columns="true"
										data-show-pagination-switch="true" data-show-refresh="true"
										data-key-events="true" data-show-toggle="true"
										data-resizable="true" data-cookie="true"
										data-cookie-id-table="saveId" data-show-export="true"
										data-click-to-select="true" data-toolbar="#toolbar">
										<thead>
											<tr>
												<th data-field="id">ID</th>
												<th data-field="name" data-editable="true">Tên hàng
													hóa, sản phẩm, dịch vụ</th>
												<th data-field="DVT" data-editable="true">ĐVT</th>
												<th data-field="amount" data-editable="true">Số lượng</th>
												<th data-field="price" data-editable="true">Đơn giá</th>
												<th data-field="sale" data-editable="true">Giảm giá</th>
												<th data-field="total" data-editable="true">Thành tiền</th>
												<th data-field="status">Tình trạng</th>
												<th data-field="option"></th>
											</tr>

										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>Product Title</td>
												<td>Out Of Stock</td>
												<td>$54</td>
												<td>$54</td>
												<td>$54</td>
												<td>$54</td>
												<td>
													<button class="ds-setting">Đang làm</button>
												</td>

												<td><a href="" class="btn btn-danger"><i
														class="fa fa-trash" aria-hidden="true"></i></a> <a href=""
													class="btn btn-success"><i class="fa fa-pencil-square"
														aria-hidden="true"></i></a></td>
											</tr>
											<tr>
												<td>2</td>
												<td>Product Title</td>
												<td>Out Of Stock</td>
												<td>$54</td>
												<td>$54</td>
												<td>$54</td>
												<td>$54</td>
												<td>
													<button class="fn-setting">Làm xong</button>
												</td>

												<td><a href="" class="btn btn-danger"><i
														class="fa fa-trash" aria-hidden="true"></i></a> <a href=""
													class="btn btn-success"><i class="fa fa-pencil-square"
														aria-hidden="true"></i></a></td>

											</tr>
											<tr>
												<td>3</td>
												<td>Product Title</td>
												<td>Out Of Stock</td>
												<td>$54</td>
												<td>$54</td>
												<td>$54</td>
												<td>$54</td>
												<td>
													<button class="ds-setting">Đang làm</button>
												</td>

												<td><a href="" class="btn btn-danger"><i
														class="fa fa-trash" aria-hidden="true"></i></a> <a href=""
													class="btn btn-success"><i class="fa fa-pencil-square"
														aria-hidden="true"></i></a></td>
											</tr>
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
										<div class="datatable-dashv1-list custom-datatable-overright">
											<table id="table" data-toggle="table" data-pagination="true"
												data-search="true" data-show-columns="true"
												data-show-pagination-switch="true" data-show-refresh="true"
												data-key-events="true" data-show-toggle="true"
												data-resizable="true" data-cookie="true"
												data-cookie-id-table="saveId" data-show-export="true"
												data-click-to-select="true" data-toolbar="#toolbar">
												<thead>
													<tr>
														<th data-field="state" data-checkbox="true"></th>
														<th data-field="id">ID</th>
														<th data-field="name">Tên hàng hóa</th>
														<th data-field="company">ĐVT</th>
														<th data-field="price">Đơn giá</th>
														<th data-field="price">Số lượng</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td></td>
														<td>1</td>
														<td>Cafe đen</td>
														<td>Ly</td>
														<td>10000</td>
														<td>1</td>
													</tr>
													<tr>
														<td></td>
														<td>2</td>
														<td>Cafe sữa</td>
														<td>Ly</td>
														<td>10000</td>
														<td>1</td>

													</tr>
													<tr>
														<td></td>
														<td>3</td>
														<td>Bạc xĩu</td>
														<td>Ly</td>
														<td>15000</td>
														<td>1</td>
													</tr>
													<tr>
														<td></td>
														<td>4</td>
														<td>Product Title</td>
														<td>In Of Stock</td>
														<td>$5</td>
														<td>$54</td>
													</tr>
													<tr>
														<td></td>
														<td>5</td>
														<td>Product Title</td>
														<td>In Of Stock</td>
														<td>$5</td>
														<td>$54</td>
													</tr>
													<tr>
														<td></td>
														<td>6</td>
														<td>Product Title</td>
														<td>In Of Stock</td>
														<td>$5</td>
														<td>$54</td>
													</tr>
													<tr>
														<td></td>
														<td>7</td>
														<td>Product Title</td>
														<td>In Of Stock</td>
														<td>$5</td>
														<td>$54</td>
													</tr>
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
						x
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
											<input type="text" disabled="" class="form-control"
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


	<!-- Static Table End -->
	<jsp:include page="layout-footer.jsp"></jsp:include>


	</div>


	<jsp:include page="Script.jsp"></jsp:include>
</body>

</html>