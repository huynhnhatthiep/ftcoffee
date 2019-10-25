<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Khách hàng</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="font.jsp"></jsp:include>
<jsp:include page="Css1.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<meta name="_csrf" content="${_csrf.token}" />
<style>
#customer-group ul li {
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
								class="btn btn-custon-rounded-three btn-success " id="addCustomerGroup">Thêm
								nhóm</button>
							<button type="button"
								class="btn btn-custon-rounded-three btn-primary" id="updateCustomerGroup">Sửa
								nhóm</button>
							<button type="button"
								class="btn btn-custon-rounded-three btn-danger" id="deleteCustomerGroup">Xóa
								nhóm</button>
						</div>
						<div class="row">
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
								<div class="sparkline9-list shadow-reset responsive-mg-b-30">
									<div class="sparkline9-hd">
										<div class="main-sparkline9-hd">
											<h3 id="ShowAllList">Nhóm khách hàng</h3>
											<input class="fortmart" id="idClickGr" type="text"
												disabled="disabled" placeholder="Mã nhóm " style="width: 130px;" />
										</div>
									</div>
									<div class="sparkline9-graph">
										<div class="adminpro-content res-tree-ov">

											<div id="customer-group"></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
								<div class="sparkline13-list">
									<div class="sparkline13-hd">
										<div class="main-sparkline13-hd">
											<h1>
												Bảng <span class="table-project-n">khách</span> hàng
											</h1>
											<div class="add-product">
												<button type="button"
													class="btn btn-custon-rounded-three btn-insert"
													id="addNewCustomer">Thêm Khách hàng</button>
											</div>
										</div>
									</div>
									<div class="sparkline13-graph">
										<div class="datatable-dashv1-list custom-datatable-overright">
											<table id="table" class="table table-striped table-bordered">
												<thead>
													<tr>
														<th data-field="tt" >TT</th>
														<th data-field="id">Mã</th>
														<th data-field="name" data-editable="true" >Đơn
															vị/Họ tên</th>
														<th data-field="company" data-editable="true">Số
															thẻ</th>
														<th data-field="price" data-editable="true" >Điện
															Thoại</th>
														<th data-field="date" data-editable="true">Địa
															chỉ</th>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody id="listCustomer">

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
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content" id="contentModelCustomer">

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
					Id Customer:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="idCustomer" type="text" class="form-control"
						placeholder="ID Customer" />
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
					Customer Name:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="customerName" type="text" class="form-control"
						placeholder="Customer name" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Adress:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="adress" type="text" class="form-control"
						placeholder="Adress" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Phone:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="phone" type="number" class="form-control"
						placeholder="Phone" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					tax Code:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="taxCode" type="text" class="form-control"
						placeholder="Tax Code" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Thu DK:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="thuDK" type="number" class="form-control"
						placeholder="Thu DK" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Trả DK:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="traDK" type="number" class="form-control"
						placeholder="Tra DK" />
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
	<div id="modalCustomerGroup" class="modal">

		<!-- Modal content -->
		<div class="modal-content" id="contentModelCustomerGroup">

			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1"></div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs mb-3 text-secondary pt-1"
					style="text-align: right;">
					<a id="closeModalCustomerGroup" class='btn btn-outline-success'><i
						class="fa fa-times"></i></a>
				</div>
			</div>

			<div class="row" id="specical">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Mã khách hàng:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="idGroupCustomerGroup" type="text" class="form-control"
						placeholder="Mã khách hàng" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Tên nhóm khách hàng:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="nameGroup" type="text" class="form-control"
						placeholder="Tên nhóm" />
				</div>
			</div>
			<button id="submitCustomerGroup"
				class="btn btn-outline-secondary mt-5" type="button"></button>

		</div>

	</div>


	<!-- UPDATE CUSTOMER GROUP -->
	<!--  -->
	<!-- The Modal -->
	<div id="modalCustomerGroupUD" class="modal">

		<!-- Modal content -->
		<div class="modal-content" id="contentModelCustomerGroupUD">

			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1"></div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs mb-3 text-secondary pt-1"
					style="text-align: right;">
					<a id="closeModalCustomerGroupUD" class='btn btn-outline-success'><i
						class="fa fa-times"></i></a>
				</div>
			</div>

			<div class="row" id="specical">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Mã khách hàng:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="idGroupCustomerGroupUD" type="text" disabled="disabled"
						class="form-control" placeholder="Mã khách hàng" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Tên nhóm khách hàng:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="nameGroupUD" type="text" class="form-control"
						placeholder="Tên nhóm" />
				</div>
			</div>
			<button id="submitCustomerGroupUD"
				class="btn btn-outline-secondary mt-5" type="button"></button>
		</div>
	</div>

	<jsp:include page="Script.jsp"></jsp:include>
	<script src="resources/JS/CRUD/customer.js "></script>
	<script src="resources/JS/CRUD/customerGroup.js "></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js
	"></script>
</body>

</html>