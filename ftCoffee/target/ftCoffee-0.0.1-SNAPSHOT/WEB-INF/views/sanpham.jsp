<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Sản phẩm</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="Css.jsp"></jsp:include>
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
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
								<div class="sparkline9-list shadow-reset responsive-mg-b-30">
									<div class="sparkline9-hd">
										<div class="main-sparkline9-hd">
											<h1>Tree Viewer Style 1</h1>
										</div>
									</div>
									<div class="sparkline9-graph">
										<div class="adminpro-content res-tree-ov">
											<div id="jstree1">
												<ul>
													<li class="jstree-open">Admin Template
														<ul>
															<li>css
																<ul>
																	<li data-jstree='"type":"css"}'>bootstrap.min.css</li>
																	<li data-jstree='"type":"css"}'>font-awesome.min.css</li>
																	<li data-jstree='"type":"css"}'>responsive.css</li>
																	<li data-jstree='"type":"css"}'>tree-viewer.css</li>
																</ul>
															</li>
															<li>sounds
																<ul>
																	<li data-jstree='"type":"ogg"}'>sound1.ogg</li>
																	<li data-jstree='"type":"ogg"}'>sound2.ogg</li>
																	<li data-jstree='"type":"ogg"}'>sound3.ogg</li>
																	<li data-jstree='"type":"ogg"}'>sound4.ogg</li>
																	<li data-jstree='"type":"ogg"}'>sound5.ogg</li>
																	<li data-jstree='"type":"ogg"}'>sound6.ogg</li>
																</ul>
															</li>
															<li>fonts
																<ul>
																	<li data-jstree='"type":"ttf"}'>adminpro-icon.ttf</li>
																	<li data-jstree='"type":"woff"}'>adminpro-icon.woff</li>
																	<li data-jstree='"type":"otf"}'>FontAwesome.otf</li>
																	<li data-jstree='"type":"ttf"}'>fontawesome-webfont.ttf</li>
																	<li data-jstree='"type":"woff"}'>fontawesome-webfont.woff</li>
																	<li data-jstree='"type":"woff"}'>glyphicons-halflings-regular.woff</li>
																</ul>
															</li>
															<li class="jstree-open">img
																<ul>
																	<li data-jstree='"type":"png"}'>logo.png</li>
																	<li data-jstree='"type":"ico"}'>favicon.ico</li>
																	<li class="text-navy" data-jstree='"type":"img"}'>notification.png</li>
																	<li class="text-navy" data-jstree='"type":"img"}'>message.png</li>
																</ul>
															</li>
															<li class="jstree-open">js
																<ul>
																	<li data-jstree='"type":"js"}'>bootstrap.min.js</li>
																	<li data-jstree='"type":"js"}'>jquery-ui.min.js</li>
																	<li data-jstree='"type":"js"}'>jquery.meanmenu.js</li>
																	<li data-jstree='"type":"js"}'>jquery-1.11.3.min.js</li>
																	<li data-jstree='"type":"js"}'>modernizr-2.8.3.min.js</li>
																	<li class="text-navy" data-jstree='"type":"js"}'>jquery.mCustomScrollbar.concat.min.js</li>
																</ul>
															</li>
															<li data-jstree='"type":"html"}'>dashboard.html</li>
															<li data-jstree='"type":"html"}'>dashboard-2.html</li>
															<li data-jstree='"type":"html"}'>analytics.html</li>
															<li data-jstree='"type":"html"}'>widgets.html</li>
															<li data-jstree='"type":"html"}'>tree-view.html</li>
															<li data-jstree='"type":"html"}'>tinymc.html</li>
															<li class="text-navy" data-jstree='"type":"html"}'>
																sparkline.html</li>
														</ul>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
								<div class="sparkline13-list">
									<div class="sparkline13-hd">
										<div class="main-sparkline13-hd">
											<h1>
												Products <span class="table-project-n">Data</span> Table
											</h1>
										</div>
									</div>
									<div class="sparkline13-graph">
										<div class="datatable-dashv1-list custom-datatable-overright">
											<div id="toolbar">
												<a href="#">Đồng Bộ</a>| <a href="#">Thêm Nhóm</a>| <a
													href="#">Sửa Nhóm</a>| <a href="#">Xóa Nhóm</a>| <a
													href="#">Cập Nhập</a>| <a href="#">ĐVT Khác</a>| <a
													href="#">Lưu SP</a>| <a href="#">chuyển SP</a>| <a href="#">Xóa
													SP</a>| <a href="#">Thành Phần</a>
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
														<th data-field="id">Mã</th>
														<th data-field="name" data-editable="true">Tên hàng
															hóa</th>
														<th data-field="DVT" data-editable="true">ĐVT</th>
														<th data-field="amount" data-editable="true">Số lượng</th>
														<th data-field="price" data-editable="true">Giá trị
															vốn</th>
														<th data-field="sale" data-editable="true">Giá bán
															thủ công</th>
														<th data-field="total" data-editable="true">Giá bán</th>
														<th data-field="status">Giảm(%)</th>
														<th data-field="kn">Không nhập</th>
														<th data-field="kx">Không xuất</th>
														<th data-field="menu">Thực đơn</th>
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


	<jsp:include page="Script.jsp"></jsp:include>
	<script src='<c:url value="/resources/JS/CRUD/product.js"/>'></script>
</body>

</html>