actionAdd = false;
actionUpdate = false;

$(document).ready(function() {
	viewListHoaDon();
	
});

function viewListHoaDon() {
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	$.ajax({
		type : "POST",	
		url : "viewListHoaDon",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		success : function(data) {
			$(function() {
				$.each(data,
						function(i, item) {
					data += "<tr>" 
						+ "<td>" + item.voucherNumber + "</td>"
						+ "<td>" + item.voucherDate + "</td>"
						+ "<td>" + item.tableNumber + "</td>"
						+ "<td>" + item.moneygoods + "</td>"
						+ "<td>" + item.content + "</td>"
						+ "<td>" + item.taxVAT + "</td>"
						+ "<td>" + item.phiPV + "</td>"
						+ "<td>" + item.moneyAmount+ "</td>"
						+ "<td>" + item.prepay + "</td>"
						+ "<td>" + item.owe + "</td>"
						+ "<td>" + item.idCustomer + "</td>"
						+ "<td>" + item.numberCustomer + "</td>"
				});
				$('#listBill').html(data);
//				$(".edit")
//				.click(
//						function() {
//							actionAdd = false;
//							actionUpdate = true;
//
//							$("#staffID").val($(this).siblings("td:nth-child(1)")
//									.text())
//									$('#staffID').parents("div").filter(
//									'#specical').hide();
//							$('#idPartAddStaff').append(new Option($(this).siblings("td:nth-child(2)")
//									.text(), $(this).siblings("td:nth-child(2)")
//									.text(), true, true));
//							$('#staffCodeAddStaff').val(
//									$(this).siblings("td:nth-child(3)")
//									.text());
//							$('#firstNameAddStaff').val(
//									$(this).siblings("td:nth-child(4)")
//									.text());
//							$('#isKeToanAddStaff').val(
//									$(this).siblings("td:nth-child(5)")
//									.text());
//							$('#isThuNganAddStaff').val(
//									$(this).siblings("td:nth-child(6)")
//									.text());
//							$('#usernameAddStaff').val(
//									$(this).siblings("td:nth-child(7)")
//									.text());
//							$('#passwordAddStaff').val(
//									$(this).siblings("td:nth-child(8)")
//									.text());
//							$('#phoneAddStaff').val(
//									$(this).siblings("td:nth-child(9)")
//									.text());
//							$('#adressAddStaff').val(
//									$(this).siblings("td:nth-child(10)")
//									.text());
//							$('#nameBank').val(
//									$(this).siblings("td:nth-child(11)")
//									.text());
//							$('#numberBank').val(
//									$(this).siblings("td:nth-child(12)")
//									.text());
//							$('#taxCodeAddStaff').val(
//									$(this).siblings("td:nth-child(13)")
//									.text());
//							$('#emailAddStaff').val(
//									$(this).siblings("td:nth-child(14)")
//									.text());
//							$("#submitAddStaff").text("Chỉnh sửa");
//							$("#myModalAddStaff").show(500);
//						});
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