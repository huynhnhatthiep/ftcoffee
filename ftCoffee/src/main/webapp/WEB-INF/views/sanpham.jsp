<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Bàn phòng</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="font.jsp"></jsp:include>
<jsp:include page="Css1.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<meta name="_csrf" content="${_csrf.token}" />

<style>
#product-group ul li {
	padding: 15px;
	pointer-event: cusor;
}
</style>
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
						<div class="panel panel-default-custom">
							<button type="button"
								class="btn btn-custon-rounded-three btn-success "id="addProductGroup">Thêm
								nhóm hàng</button>
							<button type="button"
								class="btn btn-custon-rounded-three btn-primary" id="updateProductGroup">Sửa
								nhóm hàng</button>
							<button type="button"
								class="btn btn-custon-rounded-three btn-danger" id="deleteProductGroup">Xóa
								nhóm hàng</button>
						</div>
						<div class="row">
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
								<div class="sparkline9-list shadow-reset responsive-mg-b-30">
									<div class="sparkline9-hd">
										<div class="main-sparkline9-hd">
											<h1 id="loadGroup">Nhóm sản phẩm</h1>
											<input id="idClickGr" type="text" disabled="disabled" />
										</div>
									</div>
									<div class="sparkline9-graph">
										<div class="adminpro-content res-tree-ov">
											<div id="product-group"></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
								<div class="sparkline13-list">
									<div class="sparkline13-hd">
										<div class="main-sparkline13-hd">
											<h1>
												Bảng <span class="table-project-n">Sản</span> phẩm
											</h1>
											<div class="add-product">
												<button type="button"
													class="btn btn-custon-rounded-three btn-insert"
													id="addNewProduct">Thêm sản phẩm</button>
											</div>
										</div>
									</div>
									<div class="sparkline13-graph">
										<div class="datatable-dashv1-list custom-datatable-overright">
											<table id="table" class="table table-striped table-bordered">
												<thead>
													<tr>
														<th data-field="id">Mã</th>	
														<th data-field="name" data-editable="true">Mã nhóm</th>
														<th data-field="sd" data-editable="true">Tên hàng
															hóa</th>
														<th data-field="company" data-editable="true">DVT</th>
														<th>Số lượng</th>
														<th>Giá trị vốn</th>

														<th data-field="date" data-editable="true">không nhập</th>
														<th data-field="task" data-editable="true">không
															xuất</th>
														<th data-field="email" data-editable="true">thực đơn</th>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody id="listProduct">

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
		<!-- Static Table End -->
		<jsp:include page="layout-footer.jsp"></jsp:include>
	</div>

	<!-- MODAL CUSTOMER -->
	<!--  -->
	<!-- The Modal -->

	<div id="ModalSanPham" class="modal">
		<!-- Modal content -->
		<div class="modal-content" id="contentModelProduct">

			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1"></div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs mb-3 text-secondary pt-1"
					style="text-align: right;">
					<a id="closeModal" class='btn btn-outline-success'><i
						class="fa fa-times"></i></a>
				</div>
			</div>
			<div class="row" id="specical">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Id product:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="idProduct" type="text" class="form-control"
						placeholder="ID Product" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Id Group:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<select id="idGroup">

					</select>

				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					product Name:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="nameProduct" type="text" class="form-control"
						placeholder="product name" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					DVT :</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<select id="idDVT">

					</select>
				</div>
			</div>




			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					SLDK :</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="SLDK" type="number" class="form-control"
						placeholder="SLDK" />
				</div>
			</div>

			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					gTDK :</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="GTDK" type="number" class="form-control"
						placeholder="GTDK" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					notEnter :</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="notEnter" type="text" class="form-control"
						placeholder="notEnter" />
				</div>
			</div>

			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					notExport :</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="notExport" type="text" class="form-control"
						placeholder="notExport" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					isMenu :</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="IsMenu" type="text" class="form-control"
						placeholder="IsMenu" />
				</div>
			</div>



			<button id="submit" class="btn btn-outline-secondary mt-5"
				type="button"></button>

		</div>

	</div>

	<!-- MODAL CUSTOMER GROUP -->
	<!-- ADD CUSTOMER GROUP -->
	<!--  -->
	<!-- The Modal -->

	<div id="modalProductGroup" class="modal">

		<!-- Modal content -->
		<div class="modal-content" id="contentModelProductGroup">

			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1"></div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs mb-3 text-secondary pt-1"
					style="text-align: right;">
					<a id="closeModalProductGroup" class='btn btn-outline-success'><i
						class="fa fa-times"></i></a>
				</div>
			</div>

			<div class="row" id="specical">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Mã sản phẩm:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="idGroupProductGroup" type="text" class="form-control"
						placeholder="Mã sản phẩm" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Tên nhóm sản phẩm:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="groupName" type="text" class="form-control"
						placeholder="Tên nhóm" />
				</div>
			</div>
			<button id="submitProductGroup"
				class="btn btn-outline-secondary mt-5" type="button">submit</button>

		</div>

	</div>
	<!-- UPDATE Product GROUP -->
	<!--  -->
	<!-- The Modal -->
	<div id="modalProductGroupUD" class="modal">

		<!-- Modal content -->
		<div class="modal-content" id="contentModelProductGroupUD">

			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1"></div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs mb-3 text-secondary pt-1"
					style="text-align: right;">
					<a id="closeModalProductGroupUD" class='btn btn-outline-success'><i
						class="fa fa-times"></i></a>
				</div>
			</div>

			<div class="row" id="specical">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Mã sản phẩm :</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="idGroupProductGroupUD" type="text" class="form-control"
						placeholder="Mã sản phẩm" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Tên nhóm sản phẩm:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="nameGroupUD" type="text" class="form-control"
						placeholder="Tên nhóm" />
				</div>
			</div>
			<button id="submitProductGroupUD"
				class="btn btn-outline-secondary mt-5" type="button">
				submit</button>

		</div>

	</div>

	<jsp:include page="Script.jsp"></jsp:include>
	<script src="resources/JS/CRUD/product.js "></script>
	<script src="resources/JS/CRUD/productGroup.js "></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js
	"></script>
</body>

</html>