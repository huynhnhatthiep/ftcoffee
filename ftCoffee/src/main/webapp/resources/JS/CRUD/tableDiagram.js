var actionAdd = false;
var actionUpdate = false;

$(document).ready(function() {
	viewListSoDo();

	$("#addSoDo").click(function() {
		optionArea();
		optionPriceType();
		$("input").val("");
		$('#tableNumber').parents("div").filter('#specical').show();
		$("#submitSoDo").text("Thêm Bàn");
		$("#modalSoDo").show(500);
		actionAdd = true;
		actionUpdate = false;
	});

	$("#submitSoDo").click(function() {
		if (actionAdd) {
			addSoDo();
		} else if(actionUpdate){
			updateSoDo();
		}
		$("#modalSoDo").hide(500);
	});

	$("#closeModalSoDo").click(function() {
		$("#modalSoDo").hide(500);
	});

});

function viewListSoDo() {

	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	$.ajax({
		type : "POST",	
		url : "viewlistSoDo",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		success : function(data) {
			$(function() {
				$.each(data,
						function(i, item) {
					data += "<tr>" +"<td>" + item.tableNumber + "</td>"
					+ "<td>" + item.area.areaName + "</td>"
					+ "<td>" + item.priceType.priceName + "</td>"
					+ "<td class='edit'><a class='btn btn-success' onclick='getSoDoByID("+item.tableNumber+")'><i class='fa fa-pencil-square'></i></a></td>"
					+ "<td class='delete'><a class='btn btn-danger' onclick='deleteSoDoByID("+item.tableNumber+")'><i class='fa fa-trash-o' aria-hidden='true'></i></a> </td>"
					+ "</tr>";
				});
				$('#listSoDo').html(data);
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

function addSoDo() {
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "addSoDo",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {
			tableNumber : $("#tableNumber").val(),
			idArea : $("#idArea").val(),
			idPrice : $("#idPriceType").val()
		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#listSoDo").html("");
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Thêm thành công'
				});
				viewListSoDo();
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

function optionArea() {
	$('#idArea').html('')
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "optionIdArea",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		dataType:"json",
		cache : false,
		success : function(data) {

			for (var i = 0; i < data.length; i++) {
				$('#idArea').append(new Option(data[i].areaName, data[i].idArea))
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

function optionPriceType() {
	$('#idPriceType').html('')
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "optionIdPriceType",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		dataType:"json",
		cache : false,
		success : function(data) {

			for (var i = 0; i < data.length; i++) {
				$('#idPriceType').append(new Option(data[i].priceName, data[i].idPrice))
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

function getSoDoByID(id) {
	actionAdd = false;
	actionUpdate = true;
	optionArea();
	optionPriceType();
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "getTableNumber/"+id+"",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		dataType:"json",
		cache : false,
		success : function(data) {

			$('#tableNumber').val(data.tableNumber);
			$('#idArea').append(new Option(data.idArea, data.idArea, true, true));
			$('#idPriceType').append(new Option(data.idPrice, data.idPrice, true, true));
			
			$("#submitSoDo").text("Update");
			$("#modalSoDo").show(500);
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

function updateSoDo() {
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "updateSoDoBanPhong",
		timeout : 100000,
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {
			tableNumber : $("#tableNumber").val(),
			idArea : $("#idArea").val(),
			idPrice : $("#idPriceType").val()
		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#listSoDo").find("tr").remove();
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Sửa thành công'
				});
				viewListSoDo();
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

function deleteSoDoByID(id){
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "deleteSoDo/"+id+"",
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
			viewListSoDo();
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