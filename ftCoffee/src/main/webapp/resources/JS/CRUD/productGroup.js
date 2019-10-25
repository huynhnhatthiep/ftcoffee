var idGroup="";

$(document).ready(function(){
	listProductGroup();
	/// add
	$("#addProductGroup").click(function() {
		$("input").val("");
		$('#idGroupProductGroup').parents("div").filter('#specical').show();
		$("#submitProductGroup").text("Thêm nhóm");
		$("#modalProductGroup").show(500);
	});

	$("#submitProductGroup").click(function(e) {
		addProductGroup();
		$("#modalProductGroup").hide(500);
	});

	$("#closeModalProductGroup").click(function(e) {
		$("#modalProductGroup").hide(500);
	});
	
	/// update
	
	$("#updateProductGroup").click(function() {
		var idGroup = $("#idClickGr").val();
		if(idGroup == null || idGroup == ""){
			alert("Bạn chưa chọn nhóm!!!")
			return;
		}
		$('#idGroupProductGroupUD').parents("div").filter('#specical').show();
		
		$.ajax({
			type : "GET",
			url : "idGroupProductGroup/"+idGroup+"",
			dataType:"json",
			cache : false,
			success : function(data) {

				$('#idGroupProductGroupUD').val(data.idGroup);
				$('#nameGroupUD').val(data.nameProduct);
				
			},
			error : function(e) {

				Lobibox.notify('error', {
					showClass: 'zoomInUp',
					hideClass: 'zoomOutDown',
					msg: 'Không được để trống'
				});
			}
		});
		
		$("#updateProductGroup").text("Update");
		$("#modalProductGroupUD").show(500);
		
	});

	$("#submitProductGroupUD").click(function(e) {
	updateProductGroup();
		$("#modalProductGroupUD").hide(500);
	});

	$("#closeModalProductGroupUD").click(function(e) {
		$("#modalProductGroupUD").hide(500);
	});
	
	///DELETE product GROUP
	
	$("#deleteProductGroup").click(function() {
		
		var deleteIdGroup = $("#idClickGr").val();
		if(deleteIdGroup == null || deleteIdGroup == ""){
			alert("Bạn chưa chọn nhóm!!!")
			return;
		} 
		
		$.ajax({	
			type : "GET",
			url : "deleteProductGroup/"+deleteIdGroup+"",
			dataType:"text",
			cache : false,
			success : function(data) {
				$("#idClickGr").val("");
				Lobibox.notify('success', {
					showClass: 'zoomInUp',
					hideClass: 'zoomOutDown',
					msg: 'Xóa thành công'
				});
				listProductGroup();
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

$(document).on("click","#product-group ul li", function(){
	var idgroup = $(this).attr('data');
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	$.ajax({
		type : "GET",	
		url : "loadGroup/"+idgroup+"",
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
					data += "<tr>" + "<td>" + item.idProduct + "</td>"
					+ "<td>" + item.idGroup + "</td>"
					+ "<td>" + item.nameProduct + "</td>"
					+ "<td>" + item.idDVT + "</td>"
					+ "<td>" + item.SLDK + "</td>"
					
					+ "<td>" + item.GTDK + "</td>"
					+ "<td>" + item.IsMenu + "</td>"
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
							$('#GTDK').val(
									$(this).siblings("td:nth-child(6)")
									.text());
							$('#IsMenu').val(
									$(this).siblings("td:nth-child(7)")
									.text());
							
							$("#submit").text("Update");
							$("#myModal").show(500);
						});
			});
		},
	});
});


/// LIST Product GROUP

function listProductGroup(){

	var token = $("meta[name='_csrf']").attr("content");
	var data = "<ul>";

	$.ajax({

		type: "POST",
		url: "loadViewProductGroup",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		dataType:"json",
		cache : false,

		success : function(result) {
			$.each(result, function(i, item) {

				data += '<li onclick="getMaNhom(\'' + item.idGroup + '\')" data="'+item.idGroup+'">' + item.groupName + '</li>';

			});
			data+="</ul>";
			$("#product-group").html(data);
		},
	});
}

function getMaNhom(id){
	var idGr = $("#idClickGr").val(id);
	var token = $("meta[name='_csrf']").attr("content");
}

///	ADD Product GROUP

function addProductGroup() {

	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "addProductGroup",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {
			idGroup : $("#idGroupProductGroup").val(),
			groupName : $("#groupName").val(),
		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#product-group").html("");
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Thêm thành công'
				});
				listProductGroup();
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

/// UPDATE Product GROUP

function updateProductGroup(){
	
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "updateProductGroup",
		timeout : 100000,
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {
			idGroup : $("#idGroupProductGroupUD").val(),
			groupName : $("#nameGroupUD").val(),
			
		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#product-group").find("tr").remove();
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Sửa thành công'
				});
				listProductGroup();
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

