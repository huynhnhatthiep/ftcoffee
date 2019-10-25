
$(document).ready(function() {
	viewListIndex();
	viewPriceList();

	$(document).on('click','#ListProduct tr td a',function(){
		var flag = true;
		var i = 1;
		var id= i++;
		var idProduct= $(this).attr('data-id');
		var name= $(this).attr('data-name');
		var DVT= $(this).attr('data-DVT');
		var price= $(this).attr('data-price');
		var SL= 1;

			$("#DanhSachThucDon").html("<tr>"+"<td>"+id+"</td>"+"<td>"+name+"</td>"+"<td>"+DVT+"</td>"+"<td>"+price+"</td>"+"<td>"+SL+"</td>"+"</tr>");
		
		
	});
	
	$("#submitAddVoucher").click(function() {
		addVoucher();
		$("#modalAddVoucher").hide(500);
	});
	
});

/// SHOW LIST SO DO

function viewListIndex() {
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	$.ajax({
		type : "POST",	
		url : "getListSoDo",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		async:false,
		cache : false,
		success : function(result) {
			result.forEach(function(item,index){
				data += "<div class='col-lg-3 col-md-3 col-sm-3 col-xs-3 showListIdChiTietBan' onclick='getTableNumber("+item.tableNumber+")'>" +
				"<div class='single-new-trend mg-t-30'>" +
				"<img src='resources/img/logo/coffe.png' alt=''>" +
				"<div class='overlay-content'>" +
				"<h2><span>Bàn: </span>" + '<span id="getTableName">' +item.tableNumber+ '</span>' +"</h2>" +
				"<a href='' class='btn-small'>" + 
				"Khu vực: " + item.area.areaName + 
				"</a></div></div></div>";
			});
			$('#ListBanPhong').html(data);	

			$(".showListIdChiTietBan").click(function() {
				$("#modalChiTietBan").show(500);
//				$("#modalAddVoucher").show(500);
			});

			$("#closeModalChiTietBan").click(function() {
				$("#modalChiTietBan").hide(500);
			});
			
			$("#closeModalAddVoucher").click(function() {
				$("#modalAddVoucher").hide(500);
			});

		},
		error : function(e) {
			Lobibox.notify('error', {
				showClass : 'zoomInUp',
				hideClass : 'zoomOutDown',
				msg : 'Không tìm thấy bàn phòng'
			});
		}
	});
}

/// show list san pham

function viewPriceList() {
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	$.ajax({
		type : "POST",	
		url : "getListBangGiaSanPham",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		success : function(data) {
			$(function() {
				$.each(data,
						function(i, item) {
					data += "<tr>" + "<td>" + '<a class="btn btn-success" data-id="'+item.id+'" data-name="'+item.SanPham.nameProduct+'" data-DVT="'+item.SanPham.idDVT+'" data-price="'+item.price+'" ><i class="fa fa-plus" aria-hidden="true"></i></a>' + "</td>"
					+ "<td>" + item.id + "</td>"
					+ "<td>" + item.SanPham.nameProduct + "</td>"
					+ "<td>" + item.SanPham.idDVT + "</td>"
					+ "<td>" + item.price + "</td>"
					+ "<td>" + '<input id="SL" type="number" class="form-control" placeholder="Số lượng" value="1" />' + "</td>"
					+ "</tr>";
				});
				$('#ListProduct').html(data);
			});
		}
	});
}

/// get tableNumber
function getTableNumber(id) {
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "getTableNumberDiagram/"+id+"",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		async:false,
		dataType:"json",
		cache : false,
		success : function(data) {
			
			$('#nameTableAddVoucher').val(data.tableNumber);
			$('#nameBangGiaAddVoucher').val(data.priceType.priceName);
		},
		error : function(e) {

			Lobibox.notify('error', {
				showClass: 'zoomInUp',
				hideClass: 'zoomOutDown',
				msg: 'Không tìm thấy'
			});
		}
	});
}

/// add voucher

function addVoucher() {
var token = $("meta[name='_csrf']").attr("content");
$.ajax({
	type : "POST",
	url : "addVoucherDemo",
	headers: {
		'X-CSRF-TOKEN':token, 
	},
	cache : false,
	data : {
		
		tableNumber : $("#nameTableAddVoucher").val()
	},
	success : function(data) {

		console.log(data);
		if (data === "success") {
			$("#ListBanPhong").html("");
			Lobibox.notify('success', {
				showClass : 'rollIn',
				hideClass : 'rollOut',
				msg : 'Thêm thành công'
			});
			viewListIndex();
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

