var actioAdd = false;
var actioEdit = false;
var actioDelete = false;
var id = "";

$(document).ready(function() {
	listPriceType();
	listArea();
	listDVT();
	$("#buttonAddPriceType").click(function() {
		$("input").val("");
		$('#idPrice').parents("div").filter('#specical').show();
		$("#submitPriceType").text("Thêm");
		$("#modalCRUD_ProductType").show(500);
		actioAdd = true;
		actioEdit = false;
	});
	$("#submitPriceType").click(function(e) {
		if (actioAdd) {
			addPriceType();
		} else if (actioEdit) {
			updatePriceType();
		}
		$("#" + "" + "").hide(500);
	});
//	$("#remove").click(function(e) {
//		if (actioDelete) {
//			deletePriceType();
//		} 
//	});
	$("#closeModalRoom").click(function(e) {
		$("#modalCRUD_ProductType").hide(500);
	});
});
function listPriceType() {
	var data = "";
	$.ajax({
		type : "POST",
		url : "listPrice",
		cache : false,
		success : function(data) {
			$(function() {
				$.each(data,function(i, item) {
				data += "<tr>"
						+ "<td>"
						+ item.idPrice
						+ "</td>"
						+ "<td>"
						+ item.priceName
						+ "</td>"
						+ "<td>"
						+ '<input type="checkbox" value="item.macDinh">'
						+ "</td>"
						+ "<td class='edit'><a class='btn btn-success'><i class='fa fa-pencil-square'></i></a></td>"
						+ "<td class='delete'><a class='btn btn-danger'><i class='fa fa-trash-o' aria-hidden='true'></i></a> </td>"
						+ "</tr>";
										});
						$('#listPriceType').html(data);
						$(".edit").click(
								function() {
									if ($(this).siblings("td").hasClass(
											"active")) {
									} else {
										$(this).prevUntil().addClass('active');
										$(this).parents("tr").siblings("tr")
												.find("td").removeClass(
														'active');
										actioAdd = false;
										actioEdit = true;
									}
									id = $(this).siblings("td:nth-child(1)")
											.text();
									$('#idPrice').parents("div").filter(
											'#specical').hide();
									$('#priceName').val(
											$(this).siblings("td:nth-child(2)")
													.text());
									$("#submitPriceType").text("Update");
									$("#modalCRUD_ProductType").show(500);
								});
						$(".delete").click(
								function() {
									if ($(this).siblings("td").hasClass(
											"active")) {
									} else {
										$(this).prevUntil().addClass('active');
										$(this).parents("tr").siblings("tr")
												.find("td").removeClass(
														'active');
									}
									id = $(this).siblings("td:nth-child(1)")
											.text();
//									$("#remove").text("Xóa");
//									$("#delete_priceType").show(500);
									deletePriceType();
								});
					});
				},
				error : function(e) {
					Lobibox.notify('error', {
		                showClass: 'zoomInUp',
		                hideClass: 'zoomOutDown',
		                msg: 'Không tìm thấy bảng giá'
		            });

				},
				done : function(e) {
				}
			});
}
function addPriceType() {
	$.ajax({
		type : "POST",
		url : "saveOrUpdatePrice",
		cache : false,
		data : {
			idPrice : $("#idPrice").val(),
			priceName : $("#priceName").val(),
			macDinh : $("#macDinh").val()
		},
		success : function(data) {
			console.log(data);
			if (data == "success") {
				$("#listPriceType").html("");
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Thêm thành công'
				});
				listPriceType();
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

		done : function(e) {
		}
	});
}

function updatePriceType() {
	$.ajax({
		type : "POST",
		url : "saveOrUpdatePrice",
		cache : false,
		data : {
			idPrice : id,
			priceName : $("#priceName").val(),
			macDinh : $("#macDinh").val()
		},
		beforeSend : function() {

		},
		complete : function() {
		},
		success : function(data) {
			console.log(data);
			if (data === "success") {
				$("#listPriceType").find("tr").remove();
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Sửa thành công'
				});
				listPriceType();
			} else {
				Lobibox.notify('error', {
	                showClass: 'zoomInUp',
	                hideClass: 'zoomOutDown',
	                msg: 'Sửa thất bại'
	            });
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
function deletePriceType() {
	console.log("id: " + id);
	if (id !== null) {
		$.ajax({
			type : "POST",
			url : "deletePrice",
			timeout : 100000,
			cache : false,
			async : false,
			data : {
				idPrice : id
			},
			success : function(data) {
				console.log(data);
				if (data === "success") {
					$("#listPriceType").find("tr").remove();
					Lobibox.notify('success', {
						showClass : 'rollIn',
						hideClass : 'rollOut',
						msg : 'Xóa thành công'
					});
					listPriceType();
				} else {
					Lobibox.notify('error', {
		                showClass: 'zoomInUp',
		                hideClass: 'zoomOutDown',
		                msg: 'Xóa thất bại'
		            });
				}

			},
			error : function(e) {
				Lobibox.notify('error', {
	                showClass: 'zoomInUp',
	                hideClass: 'zoomOutDown',
	                msg: 'Xóa thất bại'
	            });
			}
		});
	}

}
function listArea() {
	var data = "";
	$.ajax({
		type : "POST",
		url : "listArea",
		cache : false,
		success : function(data) {
			$(function() {
				$.each(data,function(i, item) {
				data += "<tr>"
						+ "<td>"
						+ item.idArea
						+ "</td>"
						+ "<td>"
						+ item.areaName
						+ "</td>"
						+ "<td class='edit'><a class='btn btn-success'><i class='fa fa-pencil-square'></i></a></td>"
						+ "<td class='delete'><a class='btn btn-danger'><i class='fa fa-trash-o' aria-hidden='true'></i></a> </td>"
						+ "</tr>";
										});
						$('#listArea').html(data);
						$(".edit").click(
								function() {
									if ($(this).siblings("td").hasClass(
											"active")) {
									} else {
										$(this).prevUntil().addClass('active');
										$(this).parents("tr").siblings("tr")
												.find("td").removeClass(
														'active');
										actioAdd = false;
										actioEdit = true;
									}
									id = $(this).siblings("td:nth-child(1)")
											.text();
									$('#idPrice').parents("div").filter(
											'#specical').hide();
									$('#priceName').val(
											$(this).siblings("td:nth-child(2)")
													.text());
									$("#submitPriceType").text("Update");
									$("#modalCRUD_ProductType").show(500);
								});
						$(".delete").click(
								function() {
									if ($(this).siblings("td").hasClass(
											"active")) {
									} else {
										$(this).prevUntil().addClass('active');
										$(this).parents("tr").siblings("tr")
												.find("td").removeClass(
														'active');
									}
									id = $(this).siblings("td:nth-child(1)")
											.text();
//									$("#remove").text("Xóa");
//									$("#delete_priceType").show(500);
									deletePriceType();
								});
					});
				},
				error : function(e) {
					Lobibox.notify('error', {
		                showClass: 'zoomInUp',
		                hideClass: 'zoomOutDown',
		                msg: 'Không tìm thấy bảng khu vực'
		            });
				},
				done : function(e) {
				}
			});
}
function listDVT() {
	var data = "";
	$.ajax({
		type : "POST",
		url : "listDVT",
		cache : false,
		success : function(data) {
			$(function() {
				$.each(data,function(i, item) {
				data += "<tr>"
						+ "<td>"
						+ item.idDVT
						+ "</td>"
						+ "<td>"
						+ '<input type="checkbox" value="item.macDinh">'
						+ "</td>"
						+ "<td class='edit'><a class='btn btn-success'><i class='fa fa-pencil-square'></i></a></td>"
						+ "<td class='delete'><a class='btn btn-danger'><i class='fa fa-trash-o' aria-hidden='true'></i></a> </td>"
						+ "</tr>";
										});
						$('#listDvt').html(data);
						$(".edit").click(
								function() {
									if ($(this).siblings("td").hasClass(
											"active")) {
									} else {
										$(this).prevUntil().addClass('active');
										$(this).parents("tr").siblings("tr")
												.find("td").removeClass(
														'active');
										actioAdd = false;
										actioEdit = true;
									}
									id = $(this).siblings("td:nth-child(1)")
											.text();
									$('#idPrice').parents("div").filter(
											'#specical').hide();
									$('#priceName').val(
											$(this).siblings("td:nth-child(2)")
													.text());
									$("#submitPriceType").text("Update");
									$("#modalCRUD_ProductType").show(500);
								});
						$(".delete").click(
								function() {
									if ($(this).siblings("td").hasClass(
											"active")) {
									} else {
										$(this).prevUntil().addClass('active');
										$(this).parents("tr").siblings("tr")
												.find("td").removeClass(
														'active');
									}
									id = $(this).siblings("td:nth-child(1)")
											.text();
//									$("#remove").text("Xóa");
//									$("#delete_priceType").show(500);
									deletePriceType();
								});
					});
				},
				error : function(e) {
					Lobibox.notify('error', {
		                showClass: 'zoomInUp',
		                hideClass: 'zoomOutDown',
		                msg: 'Không tìm thấy bảng đơn vị tính'
		            });

				},
				done : function(e) {
				}
			});
}
