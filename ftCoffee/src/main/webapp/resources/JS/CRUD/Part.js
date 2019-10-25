$(document).ready(function() {
	getListTreeView();

	/// add part
	$("#addPart").click(function() {
		$("input").val("");
		$("#submitAddPart").text("Thêm bộ phận");
		$("#modalAddPart").show(500);
	});

	$("#submitAddPart").click(function() {
		addPart();
		$("#modalAddPart").hide(500);
	});

	$("#closeModalAddPart").click(function() {
		$("#modalAddPart").hide(500);
	});

	/// update part

	$("#updatePart").click(function() {
		var idPart = $("#clickTreePart").val();
		if(idPart == null || idPart == ""){
			alert("Bạn chưa chọn nhóm!!!")
			return;
		}

		$.ajax({
			type : "GET",
			url : "getIdPart/"+idPart+"",
			dataType:"json",
			cache : false,
			success : function(data) {

				$('#idUpdatePart').val(data.idPart);
				$('#nameUpdatePart').val(data.partName);

			},
			error : function(e) {

				Lobibox.notify('error', {
					showClass: 'zoomInUp',
					hideClass: 'zoomOutDown',
					msg: 'Không được để trống'
				});
			}
		});
		$("#submitUpdatePart").text("Sửa bộ phận");
		$("#modalUpdatePart").show(500);
	});

	$("#submitUpdatePart").click(function() {
		updatePart();
		$("#modalUpdatePart").hide(500);
	});

	$("#closeModalUpdatePart").click(function() {
		$("#modalUpdatePart").hide(500);
	});

	/// delete part

	$("#deletePart").click(function() {

		var deleteIdPart = $("#clickTreePart").val();
		if(deleteIdPart == null || deleteIdPart == ""){
			alert("Bạn chưa chọn nhóm!!!")
			return;
		} 

		$.ajax({
			type : "GET",
			url : "deletePart/"+deleteIdPart+"",
			dataType:"text",
			cache : false,
			success : function(data) {
				$("#clickTreePart").val("");
				Lobibox.notify('success', {
					showClass: 'zoomInUp',
					hideClass: 'zoomOutDown',
					msg: 'Xóa thành công'
				});
				getListTreeView();
			},
			error : function(e) {

				Lobibox.notify('error', {
					showClass: 'zoomInUp',
					hideClass: 'zoomOutDown',
					msg: 'Cần xem lại trước khi xóa'
				});
			}
		});

	});

});

$(document).on("click","#staff-group ul li", function(){
	var idPart = $(this).attr('data');
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	$.ajax({
		type : "GET",	
		url : "loadViewIdPart/"+idPart+"",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		dataType:"json",
		success : function(result) {
			if(result == null){
				$("#table tbody").html("");
				return;
			}
			$(function() {
				$.each(result,
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
		},
	});
});

function getListTreeView() {

	var token = $("meta[name='_csrf']").attr("content");
	var data = "<ul>";

	$.ajax({

		type: "POST",
		url: "getListTreeView",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		dataType:"json",
		cache : false,

		success : function(result) {
			$.each(result, function(i, item) {

				data += '<li onclick="getMaNhom(\'' + item.idPart + '\')" data="'+item.idPart+'">' + item.partName + '</li>';

			});
			data+="</ul>";
			$("#staff-group").html(data);
		},
	});
}

function getMaNhom(id) {
	var idGr = $("#clickTreePart").val(id);
	var token = $("meta[name='_csrf']").attr("content");
}

function addPart() {

	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "addPart",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {
			idPart : $("#idAddPart").val(),
			partName : $("#nameAddPart").val()
		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#staff-group").html("");
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Thêm thành công'
				});
				getListTreeView();
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

function updatePart() {
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "updatePartStaff",
		timeout : 100000,
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {
			idPart : $("#idUpdatePart").val(),
			partName : $("#nameUpdatePart").val()

		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#staff-group").find("tr").remove();
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Sửa thành công'
				});
				getListTreeView();
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



