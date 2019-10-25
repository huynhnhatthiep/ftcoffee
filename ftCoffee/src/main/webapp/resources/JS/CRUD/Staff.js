actionAdd = false;
actionUpdate = false;

$(document).ready(function() {
	viewListStaff();
	
	$("#addNewStaff").click(function() {
		optionIdPart();
		$("input").val("");
		$("#submitAddStaff").text("Thêm nhân viên");
		$("#myModalAddStaff").show(500);
		actionAdd = true;
		actionUpdate = false;
	});
	
	$("#submitAddStaff").click(function() {
		if (actionAdd) {
			addStaff();
		} else if (actionUpdate){
			updateStaff();
		}
		
		$("#myModalAddStaff").hide(500);
	})
	
	$("#closeModalAddStaff").click(function() {
		$("#myModalAddStaff").hide(500);
	});
	
	$("#getAllStaff").click(function() {
		viewListStaff();
		$("#clickTreePart").val("");
	});
	
	$("#searchNameStaff").keyup(function() {
		var search = $(this).val();
		search = search.replace(/^\s|\s $/, "");
		if(search !=  ''){
			seachNameStaff(search);
		}else{
			viewListStaff();
		}
	});
	
});

function viewListStaff() {
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	$.ajax({
		type : "POST",	
		url : "viewListStaff",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		success : function(data) {
			$(function() {
				$.each(data,
						function(i, item) {
					data += "<tr>" + "<td>" + item.staffId + "</td>"
					+ "<td>" + item.fullName + "</td>"
					+ "<td>" + item.isThuNgan + "</td>"
					+ "<td>" + item.username + "</td>"
					+ "<td>" + item.password + "</td>"
					+ "<td class='edit'><a class='btn btn-success' onclick='getStaffbyID("+item.staffId+")'><i class='fa fa-pencil-square'></i></a></td>"
					+ "<td class='delete'><a class='btn btn-danger' onclick='deleteStaffbyID("+item.staffId+")'><i class='fa fa-trash-o' aria-hidden='true'></i></a> </td>"
					+ "</tr>";
				});
				$('#listStaff').html(data);
				$("#table").DataTable();
				$(".edit")
				.click(
						function() {
							actionAdd = false;
							actionUpdate = true;

							$("#staffID").val($(this).siblings("td:nth-child(1)")
									.text())
									$('#staffID').parents("div").filter(
									'#specical').hide();
							$('#usernameAddStaff').val(
									$(this).siblings("td:nth-child(2)")
									.text());
							$('#passwordAddStaff').val(
									$(this).siblings("td:nth-child(3)")
									.text());
							$('#staffCodeAddStaff').val(
									$(this).siblings("td:nth-child(4)")
									.text());
							$('#idPartAddStaff').append(new Option($(this).siblings("td:nth-child(5)")
									.text(), $(this).siblings("td:nth-child(5)")
									.text(), true, true));
							$('#firstNameAddStaff').val(
									$(this).siblings("td:nth-child(6)")
									.text());
							$('#LastNameAddStaff').val(
									$(this).siblings("td:nth-child(7)")
									.text());
							$('#adressAddStaff').val(
									$(this).siblings("td:nth-child(8)")
									.text());
							$('#phoneAddStaff').val(
									$(this).siblings("td:nth-child(9)")
									.text());
							$('#taxCodeAddStaff').val(
									$(this).siblings("td:nth-child(10)")
									.text());
							$('#emailAddStaff').val(
									$(this).siblings("td:nth-child(11)")
									.text());
							$('#isKeToanAddStaff').val(
									$(this).siblings("td:nth-child(12)")
									.text());
							$('#isThuNganAddStaff').val(
									$(this).siblings("td:nth-child(13)")
									.text());
							$("#submitAddStaff").text("Chỉnh sửa");
							$("#myModalAddStaff").show(500);
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

function addStaff() {
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "addStaff",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {
			staffId : $("#staffID").val(),
			username : $("#usernameAddStaff").val(),
			password : $("#passwordAddStaff").val(),
			staffCode : $("#staffCodeAddStaff").val(),
			idPart : $("#idPartAddStaff").val(),
			firstName : $("#firstNameAddStaff").val(),
			lastName : $("#LastNameAddStaff").val(),
			address : $("#adressAddStaff").val(),
			phone : $("#phoneAddStaff").val(),
			taxCode : $("#taxCodeAddStaff").val(),
			email : $("#emailAddStaff").val(),
			isKeToan : $("#isKeToanAddStaff").val(),
			isThuNgan : $("#isThuNganAddStaff").val()
		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#listStaff").html("");
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Thêm thành công'
				});
				viewListStaff();
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

function optionIdPart() {
	$('#idPartAddStaff').html('');
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "optionIdPart",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		dataType:"json",
		cache : false,
		success : function(data) {

			for (var i = 0; i < data.length; i++) {
				$('#idPartAddStaff').append(new Option(data[i].partName, data[i].idPart))
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

function getStaffbyID(id) {
	optionIdPart();
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "getIdStaff/"+id+"",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		dataType:"json",
		cache : false,
		success : function(data) {
			$("#staffID").val( data.staffId);
			$("#LastNameAddStaff").val(data.fullName);
			$("#isThuNganAddStaff").val(data.isThuNgan);
			$("#usernameAddStaff").val( data.username);
			$("#passwordAddStaff").val(data.password);
			$("#idPartAddStaff").val(data.idPart);
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

function updateStaff() {
	
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "updateStaff",
		timeout : 100000,
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {
			staffId : $("#staffID").val(),
			username : $("#usernameAddStaff").val(),
			password : $("#passwordAddStaff").val(),
			staffCode : $("#staffCodeAddStaff").val(),
			idPart : $("#idPartAddStaff").val(),
			firstName : $("#firstNameAddStaff").val(),
			lastName : $("#LastNameAddStaff").val(),
			address : $("#adressAddStaff").val(),
			phone : $("#phoneAddStaff").val(),
			taxCode : $("#taxCodeAddStaff").val(),
			email : $("#emailAddStaff").val(),
			isKeToan : $("#isKeToanAddStaff").val(),
			isThuNgan : $("#isThuNganAddStaff").val()
		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#listStaff").find("tr").remove();
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Sửa thành công'
				});
				viewListStaff();
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

function deleteStaffbyID(id) {
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "deleteStaff/"+id+"",
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
			viewListStaff();
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

function seachNameStaff(name){
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	var name = name;
	$.ajax({
		type : "POST",	
		url : "searchNameStaff",
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
					data += "<tr>" + "<td>" + item.staffId + "</td>"
					+ "<td>" + item.username + "</td>"
					+ "<td>" + item.password + "</td>"
					+ "<td>" + item.staffCode + "</td>"
					+ "<td>" + item.idPart + "</td>"
					+ "<td>" + item.firstName + "</td>"
					+ "<td>" + item.lastName + "</td>"
					+ "<td>" + item.address + "</td>"
					+ "<td>" + item.phone + "</td>"
					+ "<td>" + item.taxCode + "</td>"
					+ "<td>" + item.email + "</td>"
					+ "<td>" + item.isKeToan + "</td>"
					+ "<td>" + item.isThuNgan + "</td>"
					+ "<td class='edit'><a class='btn btn-success' onclick='getStaffbyID("+item.staffId+")'><i class='fa fa-pencil-square'></i></a></td>"
					+ "<td class='delete'><a class='btn btn-danger' onclick='deleteStaffbyID("+item.staffId+")'><i class='fa fa-trash-o' aria-hidden='true'></i></a> </td>"
					+ "</tr>";
				});
				$('#listStaff').html(data);
				$(".edit")
				.click(
						function() {
							actionAdd = false;
							actionUpdate = true;

							$("#staffID").val($(this).siblings("td:nth-child(1)")
									.text())
									$('#staffID').parents("div").filter(
									'#specical').hide();
							$('#usernameAddStaff').val(
									$(this).siblings("td:nth-child(2)")
									.text());
							$('#passwordAddStaff').val(
									$(this).siblings("td:nth-child(3)")
									.text());
							$('#staffCodeAddStaff').val(
									$(this).siblings("td:nth-child(4)")
									.text());
							$('#idPartAddStaff').append(new Option($(this).siblings("td:nth-child(5)")
									.text(), $(this).siblings("td:nth-child(5)")
									.text(), true, true));
							$('#firstNameAddStaff').val(
									$(this).siblings("td:nth-child(6)")
									.text());
							$('#LastNameAddStaff').val(
									$(this).siblings("td:nth-child(7)")
									.text());
							$('#adressAddStaff').val(
									$(this).siblings("td:nth-child(8)")
									.text());
							$('#phoneAddStaff').val(
									$(this).siblings("td:nth-child(9)")
									.text());
							$('#taxCodeAddStaff').val(
									$(this).siblings("td:nth-child(10)")
									.text());
							$('#emailAddStaff').val(
									$(this).siblings("td:nth-child(11)")
									.text());
							$('#isKeToanAddStaff').val(
									$(this).siblings("td:nth-child(12)")
									.text());
							$('#isThuNganAddStaff').val(
									$(this).siblings("td:nth-child(13)")
									.text());
							$("#submitAddStaff").text("Chỉnh sửa");
							$("#myModalAddStaff").show(500);
						});
			});
		}
	});	

}
