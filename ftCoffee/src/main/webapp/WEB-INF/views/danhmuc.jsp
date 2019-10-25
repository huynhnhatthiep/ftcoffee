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
<jsp:include page="font.jsp"></jsp:include>
<jsp:include page="Css.jsp"></jsp:include>

<link rel="stylesheet"
	href='<c:url value="/resources/CSS/modelStyle.css"/>' />
</head>

<body>
	<jsp:include page="layout-menu-heThong.jsp"></jsp:include>
	<div class="all-content-wrapper">

		<jsp:include page="layout-header.jsp"></jsp:include>
		<!-- Static Table Start -->
		<div class="data-table-area mg-tb-15">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="sparkline13-list">
							<div class="sparkline13-hd">
								<div class="main-sparkline13-hd">
									<h1>
										Bảng <span class="table-project-n">danh</span> mục
									</h1>
								</div>
							</div>
							<div class="sparkline13-graph">
								<div class="datatable-dashv1-list custom-datatable-overright">

									<div class="admintab-wrap mg-t-30">
										<ul
											class="nav nav-tabs custom-menu-wrap custon-tab-menu-style1">
											<li class="active"><a data-toggle="tab"
												href="#PriceType"><span
													class="adminpro-icon adminpro-analytics tab-custon-ic"></span>Bảng
													giá bán hàng</a></li>
											<li><a data-toggle="tab" href="#Area"><span
													class="adminpro-icon adminpro-analytics-arrow tab-custon-ic"></span>Khu
													vực</a></li>
											<li><a data-toggle="tab" href="#DVT"><span
													class="adminpro-icon adminpro-analytics-bridge tab-custon-ic"></span>Đơn
													vị tính</a></li>
										</ul>
										<div class="tab-content">
											<div id="PriceType"
												class="tab-pane in active animated flipInX custon-tab-style1">
												<button type="button"
													class="btn btn-custon-rounded-three btn-insert"
													id="buttonAddPriceType">Thêm bảng giá</button>
												<table id="table1" data-toggle="table"
													data-pagination="true" data-search="true"
													data-show-columns="true" data-show-pagination-switch="true"
													data-show-refresh="true" data-key-events="true"
													data-show-toggle="true" data-resizable="true"
													data-cookie="true" data-cookie-id-table="saveId"
													data-show-export="true" data-click-to-select="true"
													data-toolbar="#toolbar">

													<thead>
														<tr>
															<!-- <th data-field="state" data-checkbox="true"></th> -->
															<th data-field="kh">Ký Hiệu</th>
															<th data-field="tenbanggia" data-editable="true">Tên
																bảng giá</th>
															<th data-field="macdinh">Mặc định</th>
															<th colspan="2" data-field=""></th>
														</tr>
													</thead>
													<tbody id="listPriceType">
													</tbody>
												</table>
											</div>
											<div id="Area"
												class="tab-pane animated flipInX custon-tab-style1">
												<table id="table2" data-toggle="table"
													data-pagination="true" data-search="true"
													data-show-columns="true" data-show-pagination-switch="true"
													data-show-refresh="true" data-key-events="true"
													data-show-toggle="true" data-resizable="true"
													data-cookie="true" data-cookie-id-table="saveId"
													data-show-export="true" data-click-to-select="true"
													data-toolbar="#toolbar">
													<thead>
														<tr>
															<!-- <th data-field="state" data-checkbox="true"></th> -->
															<th data-field="tt">Mã</th>
															<th data-field="tencuahang" data-editable="true">Tên cửa
																hàng</th>
															<th colspan="2" data-field=""></th>
														</tr>
													</thead>
													<tbody id="listArea">
													</tbody>
												</table>
											</div>
											<div id="DVT"
												class="tab-pane animated flipInX custon-tab-style1">
												<table id="table3" data-toggle="table"
													data-pagination="true" data-search="true"
													data-show-columns="true" data-show-pagination-switch="true"
													data-show-refresh="true" data-key-events="true"
													data-show-toggle="true" data-resizable="true"
													data-cookie="true" data-cookie-id-table="saveId"
													data-show-export="true" data-click-to-select="true"
													data-toolbar="#toolbar">
													<thead>
														<tr>
															<!-- <th data-field="state" data-checkbox="true"></th> -->
															<th data-field="tt">Ký Hiệu</th>
															<th data-field="name">Mặc định</th>
															<th data-field="" colspan="2"></th>
														</tr>
													</thead >
													<tbody id="listDvt">
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Static Table End -->
	</div>
	<div id="modalCRUD_ProductType" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					<span id="title"></span>
				</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs mb-3 text-secondary pt-1"
					style="text-align: right;">
					<a id="closeModalRoom" class='btn btn-outline-success'><i
						class="fa fa-times"></i></a>
				</div>
			</div>
			<div class="row" id="specical">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Ký hiệu:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="idPrice" type="text" class="form-control"
						placeholder="Ký hiệu" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Tên bảng giá:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="priceName" type="text" class="form-control"
						placeholder="Tên bảng giá" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Mặc định:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="macDinh" type="text" class="form-control"
						placeholder="Mặc định" />
				</div>
			</div>
			<button id="submitPriceType"
				class="btn btn-custon-rounded-three btn-success" type="button"></button>
		</div>

	</div>
	<div id="delete_priceType"
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
					<a data-dismiss="modal" href="#">Cancel</a>
					<button id="remove" type="button"
						class="btn btn-custon-rounded-three btn-danger"></button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="Script.jsp"></jsp:include>
	<script src='<c:url value="/resources/JS/CRUD/category.js"/>'></script>

</body>
</html>