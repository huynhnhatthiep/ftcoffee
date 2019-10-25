kiHieu="";
actionAdd=false;
actionUpdate=false;

$(document).ready(function() {
	
	listPriceType();
	
	$("#buttonAddPriceType").click(function() {
		$("input").val("");
		$('#kiHieuBangGia').parents("div").filter('#specical').show();
		$("#submitBangGia").text("Thêm bảng giá");
		$("#modalBangGia").show(500);
	});
	
	$("#closeModalBangGia").click(function() {
		$("#modalBangGia").hide(500);
	});
});

/// LIST

function listPriceType() {
	
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	$.ajax({
		type : "POST",	
		url : "viewListPriceType",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		success : function(data) {
			$(function() {
				$.each(data,
						function(i, item) {
					data += "<tr>" + "<td>" + item.idPrice + "</td>"
					+ "<td>" + item.priceName + "</td>"
					+ "<td>" + item.macDinh + "</td>"
					+ "<td class='edit'><a class='btn btn-success' onclick='getPryceTypebyID("+item.idPrice+")'><i class='fa fa-pencil-square'></i></a></td>"
					+ "<td class='delete'><a class='btn btn-danger' onclick='deletePryceTypebyID("+item.idPrice+")'><i class='fa fa-trash-o' aria-hidden='true'></i></a> </td>"
					+ "</tr>";
				});
				$('#listPriceType').html(data);
				$(".edit")	
				.click(
						function() {
							actionAdd = false;
							actionUpdate = true;

							$("#idCustomer").val($(this).siblings("td:nth-child(1)")
									.text())
									$('#idCustomer').parents("div").filter(
									'#specical').hide();
							$('#thuDK').val(
									$(this).siblings("td:nth-child(2)")
									.text());
							$('#traDK').val(
									$(this).siblings("td:nth-child(3)")
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
				msg : 'Không tìm thấy bảng danh mục'
			});
		},
	});
	
}