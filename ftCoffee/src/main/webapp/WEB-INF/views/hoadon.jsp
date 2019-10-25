<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Hóa đơn</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}" />
<jsp:include page="Css1.jsp"></jsp:include>

</head>

<body>

	<jsp:include page="layout-menu-thuNgan.jsp"></jsp:include>

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
									<h1>Hóa đơn</h1>
									
								</div>
							</div>
							<div class="sparkline13-graph">
								<div class="datatable-dashv1-list custom-datatable-overright">

									<table id="table" data-toggle="table" >
										<thead>

											<tr>
												<th colspan="3">Chứng từ</th>
												<th colspan="5">Hóa đơn</th>
												<th colspan="2">Thanh toán</th>
												<th rowspan="2">Khách hàng</th>
												<th rowspan="2">Số khách</th>
												<th rowspan="2">Thu ngân</th>
											</tr>

											<tr>
												<th>Số</th>
												<th>Ngày</th>
												<th>Số bàn</th>
												<th>Tiền hàng</th>
												<th>Giảm</th>
												<th>Thuế</th>
												<th>Phí PV</th>
												<th>Thanh toán</th>
												<th>Trả trước</th>
												<th>Nợ</th>
											</tr>
										</thead>
										<tbody id="listBill">

										</tbody>
									</table>
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
	<script src="resources/JS/CRUD/bill.js "></script>
</body>

</html>