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

		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
				<div class="data-table-area mg-tb-15">
					<div class="container-fluid">
						<div class="sparkline13-list">
							<h4>Danh sách các món gọi</h4>
							<hr>
							<table style="width: 100%">
								<tr>
									<th>Tên</th>
									<th>Tình trạng</th>
								</tr>
								<tr>
									<td>chíp hấp(#1)</td>

									<td>
										<!-- Default checked -->
										<div class="custom-control custom-checkbox">

											<label class="custom-control-label" for="defaultChecked">đang
												làm </label> <input type="checkbox" class="custom-control-input"
												id="defaultChecked" checked>
										</div>
									</td>
								</tr>

							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
				<div class="data-table-area mg-tb-15">
					<div class="container-fluid">
						<div class="sparkline13-list">


							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">

									<div class="item_title">

										<span> Tình trạng</span> <select class="browser-default">
											<option selected>còn bàn</option>
											<option value="1">hết bàn</option>

										</select>
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 ">
									<div class="item_title">
										<span> Khu vực </span> <select class="browser-default ">
											<option selected>vip</option>
											<option value="1">tầng 2</option>
											<option value="2">vườn</option>
										</select>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="product-new-list-area">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
								<div class="single-new-trend mg-t-30">
									<a href="#"><img
										src='<c:url value="/resources/Images/logo/coffe.png"/>' alt=""></a>
									<div class="overlay-content">
										<a href="#">
											<h2>bàn 1</h2>
										</a> <a href="#" class="btn-small">đang sd</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
								<div class="single-new-trend mg-t-30">
									<a href="#"><img
										src='<c:url value="/resources/Images/logo/coffe.png"/>' alt=""></a>
									<div class="overlay-content">
										<a href="#">
											<h2>bàn 1</h2>
										</a> <a href="#" class="btn-small">đang sd</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
								<div class="single-new-trend mg-t-30">
									<a href="#"><img
										src='<c:url value="/resources/Images/logo/coffe.png"/>' alt=""></a>
									<div class="overlay-content">
										<a href="#">
											<h2>bàn 1</h2>
										</a> <a href="#" class="btn-small">đang sd</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
								<div class="single-new-trend mg-t-30">
									<a href="#"><img
										src='<c:url value="/resources/Images/logo/coffe.png"/>' alt=""></a>
									<div class="overlay-content">
										<a href="#">
											<h2>bàn 1</h2>
										</a> <a href="#" class="btn-small">đang sd</a>
									</div>
								</div>
							</div>

							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
								<div class="single-new-trend mg-t-30">
									<a href="#"><img
										src='<c:url value="/resources/Images/logo/coffe.png"/>' alt=""></a>
									<div class="overlay-content">
										<a href="#">
											<h2>bàn 1</h2>
										</a> <a href="#" class="btn-small">Now</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-2 col-xs-12">
								<div class="single-new-trend mg-t-30">
									<a href="#"><img
										src='<c:url value="/resources/Images/logo/coffe.png"/>' alt=""></a>
									<div class="overlay-content">
										<a href="#">
											<h2>bàn 1</h2>
										</a> <a href="#" class="btn-small">Now</a>
									</div>
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
</body>

</html>