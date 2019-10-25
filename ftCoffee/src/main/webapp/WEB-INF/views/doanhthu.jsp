<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Doanh thu</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="Css1.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
</head>

<body>

	<jsp:include page="layout-menu-thuNgan.jsp"></jsp:include>

	<div class="all-content-wrapper">

		<jsp:include page="layout-header.jsp"></jsp:include>

		<!-- Static Table Start -->
		<div class="data-table-area mg-tb-15">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<section class="panel">
							<div class="panel-body row">
								<div class="col-md-4 form-group">
									<label>Từ</label> <input type="date" class="form-control"
										style="line-height: 21px;" id="timeS">
								</div>
								<div class="col-md-4 form-group">
									<label>Đến</label> <input type="date" class="form-control"
										style="line-height: 21px;" id="timeE">
								</div>
								<div class="col-md-4 form-group">
									<label>Thu ngân</label> <select id="staffId"
										class="c-select form-control">
										<option value="ALL">Tất cả</option>
									</select>
								</div>
							</div>
						</section>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="sparkline13-list">
							<div class="sparkline13-hd">
								<div class="main-sparkline13-hd">
									<h1>Doanh thu</h1>
									<button type="button" onclick="taiLai()"
										class="btn btn-shadow btn-success">
										<i class="fa fa-rotate-right"></i> Tải lại
									</button>
									<button type="button" class="btn btn-shadow btn-info">
										<i class="fa fa-file-o"></i> Thực đơn
									</button>
									<button type="button" class="btn btn-shadow btn-danger">
										<i class="fa fa-file-o"></i> Hóa đơn
									</button>
								</div>
							</div>
							<div class="sparkline13-graph">
								<div class="datatable-dashv1-list custom-datatable-overright">
									<section class="panel">
										<header class="panel-heading">
											Doanh thu thực đơn (Tổng doanh số: <span id="sumDoanhThu"></span>)
										</header>
										<div class="adv-table" id="table-doanh-thu"></div>
									</section>
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
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js
	"></script>
	<script>
	function taiLai(){
		var timeS = $("#timeS").val();
		var timeE = $("#timeE").val();
		doanhThu.getThucDon(getTime.timeS(new Date(timeS)), getTime.timeE(new Date(timeE)), $("#staffId").val());
		//doanhThu.getThucDon(getTime.timeS, getTime.timeE, "ALL");
	}
	window.doanhThu = {
		getThucDon: function (ts, te, nv){
			$("#table-doanh-thu").html('\
					<table class="table table-striped table-bordered" id="doanh-thu-thuc-don">\
	                    <thead>\
	                        <tr>\
	                            <th>#</th>\
	                            <th>Tên</th>\
	                            <th>Đơn vị tính</th>\
	                            <th>Tổng số lượng</th>\
	                            <th>Tổng đơn giá</th>\
	                            <th>Doanh số</th>\
	                            <th>Giá trị trung bình</th>\
	                        </tr>\
	                    </thead>\
	                    <tbody>\
	                    </tbody>\
	                </table>');
			$.ajax({
				url : "doanhthu/getThucDon",
				type : "GET",
				data : {
					startTime: ts,
					endTime: te,
					staffId: nv
				},
			}).done(function(data) {
				var sum = 0;
				for (var i = 0; i < data.length; i++) {
					data[i].sales = data[i].price  * data[i].amount;
					data[i].averagePrice = (data[i].price - data[i].amount) / data[i].amount;
					$("#doanh-thu-thuc-don tbody").append("\
					<tr>\
						<td>"+(i+1)+"</td>\
						<td>"+data[i].product.nameProduct+"</td>\
						<td>"+data[i].dvt.idDVT+"</td>\
						<td>"+data[i].amount+"</td>\
						<td>"+data[i].price.toLocaleString('it-IT', {style : 'currency', currency : 'VND'})+"</td>\
						<td>"+data[i].sales.toLocaleString('it-IT', {style : 'currency', currency : 'VND'})+"</td>\
						<td>"+data[i].averagePrice.toLocaleString('it-IT', {style : 'currency', currency : 'VND'})+"</td>\
					</tr>");
					sum = sum + data[i].sales;
				}
				$("#sumDoanhThu").html(sum.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}));
				$("#doanh-thu-thuc-don").DataTable();
			})
			
		}
	}
	 window.nhanVien = {
		get: function(){
			$.ajax({
				url : 'viewListStaff',
				type : 'GET'
			}).done(function(data) {
				for (var i = 0; i < data.length; i++) {
					$("#staffId").append(new Option(data[i].fullName, data[i].staffId))
				}
			});
		}
	}
	window.getTime = {
		timeS: function(e){
			e.setHours(0,0,0,0);
			return e.getTime();
		},
		timeE: function(e){
			e.setHours(23,59,59,999);
			return e.getTime();
		}
	}
	window.onload = function() {
		nhanVien.get();
		document.getElementById("timeS").valueAsDate = new Date();
		document.getElementById("timeE").valueAsDate = new Date();
		doanhThu.getThucDon(getTime.timeS(new Date()), getTime.timeE(new Date), "ALL");
	};
</script>
</body>

</html>