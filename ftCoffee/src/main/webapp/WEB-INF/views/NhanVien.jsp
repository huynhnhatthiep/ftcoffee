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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<meta name="_csrf" content="${_csrf.token}" />
<style>

#staff-group ul li {
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
								class="btn btn-custon-rounded-three btn-success "id="addPart">Thêm
								bộ phận</button>
							<button type="button"
								class="btn btn-custon-rounded-three btn-primary" id="updatePart">Sửa
								bộ phận</button>
							<button type="button"
								class="btn btn-custon-rounded-three btn-danger" id="deletePart">Xóa
								bộ phận</button>
						</div>
						<div class="row">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
								<div class="sparkline9-list shadow-reset responsive-mg-b-30">
									<div class="sparkline9-hd">
										<div class="main-sparkline9-hd">
											<h1 id="getAllStaff">Bộ phận</h1>
											<input type="text" id="clickTreePart" disabled="disabled" style="width: 130px;">
										</div>
									</div>
									<div class="sparkline9-graph">
										<div class="adminpro-content res-tree-ov">
											<div id="staff-group">
											
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
								<div class="sparkline13-list">
									<div class="sparkline13-hd">
										<div class="main-sparkline13-hd">
											<h1>
												Bảng <span class="table-project-n">nhân</span> viên
											</h1>
											<div class="add-product">
												<button type="button"
													class="btn btn-custon-rounded-three btn-insert"
													id="addNewStaff">Thêm nhân viên</button>
											</div>
										</div>
									</div>
									<div class="sparkline13-graph">
										<div class="datatable-dashv1-list custom-datatable-overright">
											<table id="table" class="table table-striped table-bordered">
												<thead>
													<tr>
														<!-- <th data-field="state" data-checkbox="true"></th> -->
														<th data-field="id">Mã</th>
														<th data-field="name" data-editable="true">Họ tên</th>
														<th data-field="company" data-editable="true">Thu
															Ngân</th>
														<th data-field="email" data-editable="true">Đăng Nhập</th>
														<th data-field="price" data-editable="true">Mật Khẩu</th>
														<th data-field="task" data-editable="true"></th>
														<th data-field="task" data-editable="true"></th>
													</tr>
												</thead>
												<tbody id="listStaff">
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

	<!-- MODAL ADD STAFF -->
	<!--  -->
	<!-- The Modal -->
	<div id="myModalAddStaff" class="modal">

		<!-- Modal content -->
		<div class="modal-content" id="contentModelAddStaff">

			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1"></div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs mb-3 text-secondary pt-1"
					style="text-align: right;">
					<a id="closeModalAddStaff" class='btn btn-outline-success'><i
						class="fa fa-times"></i></a>
				</div>
			</div>
			<div class="row" id="specical">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					ID:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="staffID" type="text" class="form-control" disabled="disabled"
						placeholder="ID" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Tài khoản:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="usernameAddStaff" type="text" class="form-control"
						placeholder="Tài khoản" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Mật khẩu:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
				<input id="passwordAddStaff" type="text" class="form-control"
						placeholder="Mật khẩu" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Mã nhân viên:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="staffCodeAddStaff" type="text" class="form-control"
						placeholder="Mã nhân viên" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Bộ phận:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<select id="idPartAddStaff">

					</select>
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Tên:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="firstNameAddStaff" type="text" class="form-control"
						placeholder="Tên" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Họ:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="LastNameAddStaff" type="text" class="form-control"
						placeholder="Họ" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Địa chỉ:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="adressAddStaff" type="text" class="form-control"
						placeholder="Địa chỉ" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Số điện thoại:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="phoneAddStaff" type="number" class="form-control"
						placeholder="Số điện thoại" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Mã số thuế:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="taxCodeAddStaff" type="number" class="form-control"
						placeholder="Mã số thuế" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Email:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="emailAddStaff" type="text" class="form-control"
						placeholder="Email" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Kế toán:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="isKeToanAddStaff" type="number" class="form-control"
						placeholder="Tra DK" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Thu ngân:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="isThuNganAddStaff" type="number" class="form-control"
						placeholder="Tra DK" />
				</div>
			</div>
			<button id="submitAddStaff" class="btn btn-outline-secondary mt-5"
				type="button"></button>
		</div>
	</div>
	
	<!-- MODAL ADD PART -->
	<!-- ADD PART -->
	<!--  -->
	<!-- The Modal -->
	<div id="modalAddPart" class="modal">

		<!-- Modal content -->
		<div class="modal-content" id="contentModelAddPart">

			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1"></div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs mb-3 text-secondary pt-1"
					style="text-align: right;">
					<a id="closeModalAddPart" class='btn btn-outline-success'><i
						class="fa fa-times"></i></a>
				</div>
			</div>

			<div class="row" id="specical">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Mã bộ phận:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="idAddPart" type="text" class="form-control"
						placeholder="Mã bộ phận" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Tên bộ phận:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="nameAddPart" type="text" class="form-control"
						placeholder="Tên bộ phận" />
				</div>
			</div>
			<button id="submitAddPart"
				class="btn btn-outline-secondary mt-5" type="button"></button>

		</div>

	</div>
	
	<!-- MODAL UPDATE PART -->
	<!-- UPDATE PART -->
	<!--  -->
	<!-- The Modal -->
	<div id="modalUpdatePart" class="modal">

		<!-- Modal content -->
		<div class="modal-content" id="contentModelUpdatePart">

			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1"></div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs mb-3 text-secondary pt-1"
					style="text-align: right;">
					<a id="closeModalUpdatePart" class='btn btn-outline-success'><i
						class="fa fa-times"></i></a>
				</div>
			</div>

			<div class="row" id="specical">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Mã bộ phận:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="idUpdatePart" type="text" class="form-control"
						placeholder="Mã bộ phận" disabled="disabled" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Tên bộ phận:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="nameUpdatePart" type="text" class="form-control"
						placeholder="Tên bộ phận" />
				</div>
			</div>
			<button id="submitUpdatePart"
				class="btn btn-outline-secondary mt-5" type="button"></button>

		</div>
	
	</div>

	<jsp:include page="Script.jsp"></jsp:include>
	<script src="resources/JS/CRUD/Staff.js "></script>
	<script src="resources/JS/CRUD/Part.js "></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js
	"></script>
</body>

</html>