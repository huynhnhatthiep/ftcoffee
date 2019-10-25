var actionAdd = false;
var actionUpdate = false;


$(document).ready(function() {
	listCustomer();
	$("#addNewCustomer").click(function() {
		getOptionCustomerGroup();
		$("input").val("");
		$('#idCustomer').parents("div").filter('#specical').show();
		$("#submit").text("Thêm Customer");
		$("#myModal").show(500);
		actionAdd = true;
		actionUpdate = false;
	});

	$("#submit").click(function(e) {
		if (actionAdd) {
			addCustomer();
		} else if (actionUpdate) {
			updateCustomer();
		}
		$("#myModal").hide(500);
	});

	$("#closeModal").click(function(e) {
		$("#myModal").hide(500);
	});
	
	$("#ShowAllList").click(function(e) {
		$("#idClickGr").val("");
		listCustomer();
	});

	$("#search").keyup(function() {
		var search = $(this).val();
		search = search.replace(/^\s|\s $/, "");
		if(search !=  ''){
			seachCustomerbyName(search);
		}else{
			listCustomer();
		}
	});
});

/// SEARCH

function seachCustomerbyName(name){
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
					data += "<tr>" + "<td>" + item.idCustomer + "</td>"
					+ "<td>" + item.idGroup + "</td>"
					+ "<td>" + item.CustomerName + "</td>"
					+ "<td>" + item.adress + "</td>"
					+ "<td>" + item.phone + "</td>"
					+ "<td>" + item.taxCode + "</td>"
					+ "<td class='edit'><a class='btn btn-success' onclick='getCustomerbyID("+item.idCustomer+")'><i class='fa fa-pencil-square'></i></a></td>"
					+ "<td class='delete'><a class='btn btn-danger' onclick='deleteCustomerbyID("+item.idCustomer+")'><i class='fa fa-trash-o' aria-hidden='true'></i></a> </td>"
					+ "</tr>";
				});
				$('#listCustomer').html(data);
				
				$(".edit")
				.click(
						function() {
							actionAdd = false;
							actionUpdate = true;

							$("#idCustomer").val($(this).siblings("td:nth-child(1)")
									.text())
									$('#idCustomer').parents("div").filter(
									'#specical').hide();

							$('#idGroup').append(new Option($(this).siblings("td:nth-child(2)")
									.text(), $(this).siblings("td:nth-child(2)")
									.text(), true, true));
							$('#customerName').val(
									$(this).siblings("td:nth-child(3)")
									.text());
							$('#adress').val(
									$(this).siblings("td:nth-child(4)")
									.text());
							$('#phone').val(
									$(this).siblings("td:nth-child(5)")
									.text());
							$('#taxCode').val(
									$(this).siblings("td:nth-child(6)")
									.text());
							$('#thuDK').val(
									$(this).siblings("td:nth-child(7)")
									.text());
							$('#traDK').val(
									$(this).siblings("td:nth-child(8)")
									.text());
							$("#submit").text("Update");
							$("#myModal").show(500);
						});
			});
		}
	});	

}

//LIST CUSTOMER

function listCustomer() {
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	$.ajax({
		type : "POST",	
		url : "loadViewCustomer",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		success : function(data) {
			$(function() {
				$.each(data,
						function(i, item) {
					data += "<tr>" + "<td>" + item.idCustomer + "</td>"
					+ "<td>" + item.idGroup + "</td>"
					+ "<td>" + item.CustomerName + "</td>"
					+ "<td>" + item.adress + "</td>"
					+ "<td>" + item.phone + "</td>"
					+ "<td>" + item.taxCode + "</td>"
					+ "<td class='edit'><a class='btn btn-success' onclick='getCustomerbyID("+item.idCustomer+")'><i class='fa fa-pencil-square'></i></a></td>"
					+ "<td class='delete'><a class='btn btn-danger' onclick='deleteCustomerbyID("+item.idCustomer+")'><i class='fa fa-trash-o' aria-hidden='true'></i></a> </td>"
					+ "</tr>";
				});
				$('#listCustomer').html(data);
				$("#table").DataTable();
				$(".edit")
				.click(
						function() {
							actionAdd = false;
							actionUpdate = true;

							$("#idCustomer").val($(this).siblings("td:nth-child(1)")
									.text())
									$('#idCustomer').parents("div").filter(
									'#specical').hide();

							$('#idGroup').append(new Option($(this).siblings("td:nth-child(2)")
									.text(), $(this).siblings("td:nth-child(2)")
									.text(), true, true));
							$('#customerName').val(
									$(this).siblings("td:nth-child(3)")
									.text());
							$('#adress').val(
									$(this).siblings("td:nth-child(4)")
									.text());
							$('#phone').val(
									$(this).siblings("td:nth-child(5)")
									.text());
							$('#taxCode').val(
									$(this).siblings("td:nth-child(6)")
									.text());
							$('#thuDK').val(
									$(this).siblings("td:nth-child(7)")
									.text());
							$('#traDK').val(
									$(this).siblings("td:nth-child(8)")
									.text());
							$("#submit").text("Update");
							$("#myModal").show(500);
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
//ADD CUSTOMER

function addCustomer() {
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "addCustomer",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {
			idCustomer : $("#idCustomer").val(),
			idGroup : $("#idGroup").val(),
			customerName : $("#customerName").val(),
			adress : $("#adress").val(),
			phone : $("#phone").val(),
			taxCode : $("#taxCode").val(),
			thuDK : $("#thuDK").val(),
			traDK : $("#traDK").val()
		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#listCustomer").html("");
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Thêm thành công'
				});
				listCustomer();
			} else {
				Lobibox.notify('error', {
					showClass: 'zoomInUp',
					hideClass: 'zoomOutDown',
					msg: 'Thêm thất bại'
				});
			}
		},
		error : function(e) {

			Lobibox.notify('error', {
				showClass: 'zoomInUp',
				hideClass: 'zoomOutDown',
				msg: 'Không được để trống'
			});
		},
	});
}

/// GET UPDATE CUSTOMER

function getCustomerbyID(id){
	getOptionCustomerGroup();
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "KhachHang/"+id+"",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		dataType:"json",
		cache : false,
		success : function(data) {

			$('#idGroup').val(data.idGroup);
			$('#customerName').val(data.CustomerName);
			$('#adress').val(data.adress);
			$('#phone').val(data.phone);
			$('#taxCode').val(data.taxCode);
			$('#thuDK').val(data.thuDK);
			$('#traDK').val(data.traDK);
		},
		error : function(e) {

			Lobibox.notify('error', {
				showClass: 'zoomInUp',
				hideClass: 'zoomOutDown',
				msg: 'Không được để trống'
			});
		}
	});
}

//UPDATE CUSTOMER

function updateCustomer() {
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "updateCustomer",
		timeout : 100000,
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {
			idCustomer : $("#idCustomer").val(),
			idGroup : $("#idGroup").val(),
			customerName : $("#customerName").val(),
			adress : $("#adress").val(),
			phone : $("#phone").val(),
			taxCode : $("#taxCode").val(),
			thuDK : $("#thuDK").val(),
			traDK : $("#traDK").val()
		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#listCustomer").find("tr").remove();
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Sửa thành công'
				});
				listCustomer();
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

/// DELETE GET ID 

function deleteCustomerbyID(id){
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "deleteCustomer/"+id+"",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		dataType:"text",
		cache : false,
		success : function(data) {
			Lobibox.notify('success', {
				showClass: 'zoomInUp',
				hideClass: 'zoomOutDown',
				msg: 'Xóa thành công'
			});
			listCustomer();
		},
		error : function(e) {

			Lobibox.notify('error', {
				showClass: 'zoomInUp',
				hideClass: 'zoomOutDown',
				msg: 'Cần xem lại trước khi xóa'
			});
		}
	});
}

/// OPTION 

function getOptionCustomerGroup(){
	$('#idGroup').html('')
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "optionIdGroup",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		dataType:"json",
		cache : false,
		success : function(data) {

			for (var i = 0; i < data.length; i++) {
				$('#idGroup').append(new Option(data[i].nameGroup, data[i].idGroup))
			}
		},
		error : function(e) {

			Lobibox.notify('error', {
				showClass: 'zoomInUp',
				hideClass: 'zoomOutDown',
				msg: 'Không được rồi'
			});
		}
	});
}
