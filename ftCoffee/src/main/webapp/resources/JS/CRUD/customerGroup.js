var idGroup="";

$(document).ready(function(){
	listCustomerGroup();
	/// add
	$("#addCustomerGroup").click(function() {
		$("input").val("");
		$('#idGroupCustomerGroup').parents("div").filter('#specical').show();
		$("#submitCustomerGroup").text("Thêm nhóm");
		$("#modalCustomerGroup").show(500);
	});

	$("#submitCustomerGroup").click(function(e) {
		addCustomerGroup();
		$("#modalCustomerGroup").hide(500);
	});

	$("#closeModalCustomerGroup").click(function(e) {
		$("#modalCustomerGroup").hide(500);
	});
	
	/// update
	
	$("#updateCustomerGroup").click(function() {
		var idGroup = $("#idClickGr").val();
		if(idGroup == null || idGroup == ""){
			alert("Bạn chưa chọn nhóm!!!")
			return;
		}
		
		$.ajax({
			type : "GET",
			url : "idGroupCustomerGroup/"+idGroup+"",
			dataType:"json",
			cache : false,
			success : function(data) {

				$('#idGroupCustomerGroupUD').val(data.idGroup);
				$('#nameGroupUD').val(data.nameCustomer);
				
			},
			error : function(e) {

				Lobibox.notify('error', {
					showClass: 'zoomInUp',
					hideClass: 'zoomOutDown',
					msg: 'Không được để trống'
				});
			}
		});
		
		$("#submitCustomerGroupUD").text("Update");
		$("#modalCustomerGroupUD").show(500);
		
	});

	$("#submitCustomerGroupUD").click(function(e) {
		updateCustomerGroup();
		$("#modalCustomerGroupUD").hide(500);
	});

	$("#closeModalCustomerGroupUD").click(function(e) {
		$("#modalCustomerGroupUD").hide(500);
	});
	
	///DELETE CUSTOMER GROUP
	
	$("#deleteCustomerGroup").click(function() {
		
		var deleteIdGroup = $("#idClickGr").val();
		if(deleteIdGroup == null || deleteIdGroup == ""){
			alert("Bạn chưa chọn nhóm!!!")
			return;
		} 
		
		$.ajax({
			type : "GET",
			url : "deleteCustomerGroup/"+deleteIdGroup+"",
			dataType:"text",
			cache : false,
			success : function(data) {
				$("#idClickGr").val("");
				Lobibox.notify('success', {
					showClass: 'zoomInUp',
					hideClass: 'zoomOutDown',
					msg: 'Xóa thành công'
				});
				listCustomerGroup();
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

$(document).on("click","#customer-group ul li", function(){
	var idgroup = $(this).attr('data');
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	$.ajax({
		type : "GET",	
		url : "loadViewGroup/"+idgroup+"",
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
					data += "<tr>" + "<td>" + item.idCustomer + "</td>"
					+ "<td>" + item.idGroup + "</td>"
					+ "<td>" + item.CustomerName + "</td>"
					+ "<td>" + item.adress + "</td>"
					+ "<td>" + item.phone + "</td>"
					+ "<td>" + item.taxCode + "</td>"
					+ "<td>" + item.thuDK + "</td>"
					+ "<td>" + item.traDK + "</td>"
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
		},
	});
});


/// LIST CUSTOMER GROUP

function listCustomerGroup(){

	var token = $("meta[name='_csrf']").attr("content");
	var data = "<ul>";

	$.ajax({

		type: "POST",
		url: "loadViewCustomerGroup",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		dataType:"json",
		cache : false,

		success : function(result) {
			$.each(result, function(i, item) {

				data += '<li onclick="getMaNhom(\'' + item.idGroup + '\')" data="'+item.idGroup+'">' + item.nameGroup + '</li>';

			});
			data+="</ul>";
			$("#customer-group").html(data);
		},
	});
}

function getMaNhom(id){
	var idGr = $("#idClickGr").val(id);
	var token = $("meta[name='_csrf']").attr("content");
}

///	ADD CUSTOMER GROUP

function addCustomerGroup() {

	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "addCustomerGroup",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {
			idGroup : $("#idGroupCustomerGroup").val(),
			nameGroup : $("#nameGroup").val(),
		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#customer-group").html("");
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Thêm thành công'
				});
				listCustomerGroup();
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

/// UPDATE CUSTOMER GROUP

function updateCustomerGroup(){
	
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "updateCustomerGroup",
		timeout : 100000,
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {
			idGroup : $("#idGroupCustomerGroupUD").val(),
			nameGroup : $("#nameGroupUD").val(),
			
		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#customer-group").find("tr").remove();
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Sửa thành công'
				});
				listCustomerGroup();
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

