var actionAdd = false;
var actionUpdate = false;

$(document).ready(function() {
	showAllProduct();

	$("#addNewProduct").click(function() {
		getOptionProductGroup();
		getOptionDVT();
		$("input").val("");
		$('#idProduct').parents("div").filter('#specical').show();
		$("#submit").text("Thêm");
		$("#ModalSanPham").show(500);
		actionAdd = true;
		actionUpdate = false;
	});
	$("#submit").click(function(e) {
		if (actionAdd) {
			addProduct();
		} else if (actionUpdate) {
			updateProduct();
		}
		$("#ModalSanPham").hide(500);
		showAllProduct();
	});

	$("#closeModal").click(function(e) {
		$("#ModalSanPham").hide(500);
	});
	$("#loadGroup").click(function(e) {
		showAllProduct();
	});

	$("#search").keyup(function() {
		var search = $(this).val();
		search = search.replace(/^\s|\s $/, "");
		if (search != '') {
			searchProductByName(searrch);

		} else {
			showAllProduct();
		}
	});
});

//search

function seachProductbyName(name){
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	var name = name;
	$.ajax({
		type : "POST",	
		url : "search",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		data:{
			keyword:name
		},
		cache : false,
		success : function(data) {
			if(data == null){
				$("#table tbody").html("");
				return;
			}
			$(function() {
				$.each(data,
						function(i, item) {
					data += "<tr>" + "<td>" + item.idProduct + "</td>"
					+ "<td>" + item.idGroup + "</td>"
					+ "<td>" + item.nameProduct + "</td>"
					+ "<td>" + item.idDVT + "</td>"
					+ "<td>" + item.SLDK + "</td>"
					+ "<td>" + item.GTDK + "</td>"
					+ "<td>" + item.IsMenu + "</td>"
					+ "<td>" + item.notEnter + "</td>"
					+ "<td>" + item.notExport + "</td>"
					+ "<td class='edit'><a class='btn btn-success' onclick='getProductbyID("+item.idProduct+")'><i class='fa fa-pencil-square'></i></a></td>"
					+ "<td class='delete'><a class='btn btn-danger' onclick='deleteProductbyID("+item.idProduct+")'><i class='fa fa-trash-o' aria-hidden='true'></i></a> </td>"
					+ "</tr>";
				});
				$('#listProduct').html(data);
				$(".edit")
				.click(
						function() {
							actionAdd = false;
							actionUpdate = true;

							$("#idProduct").val($(this).siblings("td:nth-child(1)")
									.text())
									$('#idProduct').parents("div").filter(
									'#specical').hide();

							$('#idGroup').append(new Option($(this).siblings("td:nth-child(2)")
									.text(), $(this).siblings("td:nth-child(2)")
									.text(), true, true));
							$('#nameProduct').val(
									$(this).siblings("td:nth-child(3)")
									.text());
							$('#idDVT').val(
									$(this).siblings("td:nth-child(4)")
									.text());
							$('#SLDK').val(
									$(this).siblings("td:nth-child(5)")
									.text());

							$('#IsMenu').val(
									$(this).siblings("td:nth-child(7)")
									.text());
							$('#notEnter').val(
									$(this).siblings("td:nth-child(8)")
									.text());
							$('#notExport').val(
									$(this).siblings("td:nth-child(8)")
									.text());
							$("#submit").text("Update");
							$("#myModal").show(500);
						});
			});
		}
	});	

}


//update
function updateProduct() {
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "updateProduct",
		timeout : 100000,
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {
			idProduct : $("#idProduct").val(),
			idGroup : $("#idGroup").val(),
			nameProduct : $("#nameProduct").val(),
			idDVT : $("#idDVT").val(),
			SLDK : $("#SLDK").val(),
			GTDK : $("#GTDK").val(),
			notEnter : $("#notEnter").val(),
			notExport : $("#notExport").val(),
			IsMenu : $("#IsMenu").val()
		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#listProduct").find("tr").remove();
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Sửa thành công'
				});
				showAllProduct();
			} 
		},
		error : function(e) {
			Lobibox.notify('error', {
				showClass: 'zoomInUp',
				hideClass: 'zoomOutDown',
				msg: 'Sửa thất bại'
			});
		},
		done : function(e) {
		}
	});
}
//list product

function showAllProduct() {
	getOptionProductGroup();
	getOptionDVT();
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	$
	.ajax({
		type : "GET",
		url : "showListProduct",
		headers : {
			'X-CSRF-TOKEN' : token,
		},
		cache : false,
		success : function(data) {
			$(function() {
				$
				.each(
						data,
						function(i, item) {
							data += "<tr>" + "<td>"
							+ item.idProduct
							+ "</td>"
							+ "<td>"
							+ item.idGroup
							+ "</td>"
							+ "<td>"
							+ item.nameProduct
							+ "</td>"
							+ "<td>"
							+ item.idDVT
							+ "</td>"

							+ "<td>"
							+ item.SLDK
							+ "</td>"
							+ "<td>"
							+ item.GTDK
							+ "</td>"

							+ "<td>"
							+ item.notEnter
							+ "</td>"
							+ "<td>"
							+ item.notExport
							+ "</td>"
							+ "<td>"
							+ item.IsMenu
							+ "</td>"

							+ "<td class='edit'><a class='btn btn-success' onclick='getProductByID("
							+ item.idProduct
							+ ")'><i class='fa fa-pencil-square'></i></a></td>"
							+ "<td class='delete'><a class='btn btn-danger' onclick='deleteProductByID("
							+ item.idProduct
							+ ")'><i class='fa fa-trash-o' aria-hidden='true'></i></a> </td>"
							+ "</tr>";
						});
				$("#listProduct").html(data);
				$("#table").DataTable();
				$(".edit")
				.click(
						function() {
							actionAdd = false;
							actionUpdate = true;

							$("#idProduct").val(
									$(this).siblings(
									"td:nth-child(1)")
									.text())
									$('#idProduct').parents("div")
									.filter('#specical').hide();

							$('#idGroup')
							.append(
									new Option(
											$(this)
											.siblings(
											"td:nth-child(2)")
											.text(),
											$(this)
											.siblings(
											"td:nth-child(2)")
											.text(),
											true, true));
							$('#nameProduct').val(
									$(this).siblings(
									"td:nth-child(3)")
									.text());
							$('#idDVT').append(
									new Option(
											$(this)
											.siblings(
											"td:nth-child(4)")
											.text(),
											$(this)
											.siblings(
											"td:nth-child(4)")
											.text(),
											true, true));
							$('#SLDK').val(
									$(this).siblings(
									"td:nth-child(5)")
									.text());
							$('#GTDK').val(
									$(this).siblings(
									"td:nth-child(6)")
									.text());

							$('#notEnter').val(
									$(this).siblings(
									"td:nth-child(7)")
									.text());
							$('#notExport').val(
									$(this).siblings(
									"td:nth-child(8)")
									.text());
							$('#IsMenu').val(
									$(this).siblings(
									"td:nth-child(9)")
									.text());
							$("#submit").text("Chỉnh sửa")
							$("#ModalSanPham").show(500);
						});
			});
		},
		error : function(e) {
			Lobibox.notify('error', {
				showClass : 'zoomInUp',
				hideClass : 'zoomOutDown',
				msg : 'Không tìm thấy bảng sản phẩm'
			});
		},
	});
}

//add product
function addProduct() {
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "addproduct",
		headers : {
			'X-CSRF-TOKEN' : token,
		},
		cache : false,
		data : {
			idProduct : $("#idProduct").val(),
			idGroup : $("#idGroup").val(),
			nameProduct : $("#nameProduct").val(),
			idDVT : $("#idDVT").val(),
			SLDK : $("#SLDK").val(),
			GTDK : $("#GTDK").val(),
			notEnter : $("#notEnter").val(),
			notExport : $("#notExport").val(),
			IsMenu : $("#IsMenu").val()
		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#listProduct").html("");
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Thêm thành công'
				});
				showAllProduct();
			} else {
				Lobibox.notify('error', {
					showClass : 'zoomInUp',
					hideClass : 'zoomOutDown',
					msg : 'Thêm thất bại'
				});
			}
		},
		error : function(e) {

			Lobibox.notify('error', {
				showClass : 'zoomInUp',
				hideClass : 'zoomOutDown',
				msg : 'Không được để trống'
			});
		},
	});
}

//get update product

function getProductbyID(id) {
	getOptionProductGroup();
	getOptionDVT();
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "SanPham/"+id,
		headers : {
			'X-CSRF-TOKEN' : token,
		},
		dataType : "json",
		cache : false,
		success : function(data) {

			$('#idGroup').val(data.idGroup);
			$('#nameProduct').val(data.nameProduct);
			$('#idDVT').val(data.idDVT);
			$('#SLDK').val(data.SLDK);
			$('#GTDK').val(data.GTDK);
			$('#notEnter').val(data.notEnter);
			$('#notExport').val(data.notExport);
			$('#IsMenu').val(data.IsMenu);
		},
		error : function(e) {

			Lobibox.notify('error', {
				showClass : 'zoomInUp',
				hideClass : 'zoomOutDown',
				msg : 'Không được để trống'
			});
		}
	});
}

//delete

function deleteProductbyID(id) {
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "delete111/"+id+"",
		headers : {
			'X-CSRF-TOKEN' : token,
		},
		dataType : "text",
		cache : false,
		success : function(data) {
			Lobibox.notify('success', {
				showClass : 'zoomInUp',
				hideClass : 'zoomOutDown',
				msg : 'Xóa thành công'
			});
			showAllProduct();
		},
		error : function(e) {

			Lobibox.notify('error', {
				showClass : 'zoomInUp',
				hideClass : 'zoomOutDown',
				msg : 'Cần xem lại trước khi xóa'
			});
		}
	});
}

/// OPTION 

function getOptionProductGroup() {
	$('#idGroup').html('')
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "optionIdGroupProductGroup",
		headers : {
			'X-CSRF-TOKEN' : token,
		},
		dataType : "json",
		cache : false,
		success : function(data) {

			for (var i = 0; i < data.length; i++) {
				$('#idGroup').append(
						new Option(data[i].groupName, data[i].idGroup))
			}
		},
		error : function(e) {

			Lobibox.notify('error', {
				showClass : 'zoomInUp',
				hideClass : 'zoomOutDown',
				msg : 'Không được rồi'
			});
		}
	});
}

function getOptionDVT() {
	$('#idDVT').html('')
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "optionIdGroupDVT",
		headers : {
			'X-CSRF-TOKEN' : token,
		},
		dataType : "json",
		cache : false,
		success : function(data) {

			for (var i = 0; i < data.length; i++) {
				$('#idDVT').append(
						new Option(data[i].idDVT, data[i].idDVT))
			}
		},
		error : function(e) {

			Lobibox.notify('error', {
				showClass : 'zoomInUp',
				hideClass : 'zoomOutDown',
				msg : 'Không được rồi'
			});
		}
	});
}
