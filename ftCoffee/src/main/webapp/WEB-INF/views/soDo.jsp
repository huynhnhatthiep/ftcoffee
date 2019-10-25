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

<body>


	<jsp:include page="layout-menu-heThong.jsp"></jsp:include>

	<div class="all-content-wrapper">

		<jsp:include page="layout-header.jsp"></jsp:include>
		<!-- Static Table Start -->
		<div class="data-table-area mg-tb-15">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="sparkline13-list">
									<div class="sparkline13-hd">
										<div class="main-sparkline13-hd">
											<h1>
												<span class="table-project-n">Sơ đồ bàn</span>
											</h1>
										</div>
									</div>
									
									<div>
										<button class="btn btn-outline-success ml-5 mt-3"
													id="addSoDo">Thêm bàn</button>
									</div>
									
									<div class="sparkline13-graph">
										<div class="datatable-dashv1-list custom-datatable-overright">
											<table id="table" data-toggle="table" >
												<thead>
													<tr>
														<th data-field="id">Số bàn / phòng</th>
														<th data-field="name" data-editable="true">Khu vực</th>
														<th data-field="company" data-editable="true">Bảng giá</th>
														<th data-field="price" data-editable="true" colspan="2"></th>
													</tr>
												</thead>
												<tbody id="listSoDo">
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

		
	<!-- MODAL SƠ ĐỒ -->
	<!--  -->
	<!-- The Modal -->
	<div id="modalSoDo" class="modal">

		<!-- Modal content -->
		<div class="modal-content" id="contentModelSoDo">

			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1"></div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs mb-3 text-secondary pt-1"
					style="text-align: right;">
					<a id="closeModalSoDo" class='btn btn-outline-success'><i
						class="fa fa-times"></i></a>
				</div>
			</div>

			<div class="row" id="specical">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Số bàn / Phòng:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<input id="tableNumber" type="text" class="form-control"
						placeholder="Số bàn / Phòng" />
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Khu vực:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<select id="idArea">

					</select>
				</div>
			</div>
			<div class="row">
				<div
					class="col-md-6 text-xs font-weight-bold text-secondary mb-1 pt-1">
					Bảng giá:</div>
				<div class="col-md-3"></div>
				<div class="col-md-3 text-xs text-secondary pt-1">
					<select id="idPriceType">

					</select>
				</div>
			</div>
			<button id="submitSoDo"
				class="btn btn-outline-secondary mt-5" type="button"></button>

		</div>

	</div>
	
	<jsp:include page="Script.jsp"></jsp:include>
	<script src="resources/JS/CRUD/tableDiagram.js"></script>
</body>

</html>