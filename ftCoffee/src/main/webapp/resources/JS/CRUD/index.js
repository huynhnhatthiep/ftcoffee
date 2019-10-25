var cart = [];
$(document).ready(function() {
	viewListIndex();
	optionAera();

	$("#optionArea").change(function() {
		var option = $(this).val();
		if(option !=  ''){
			showListOption(option);
		}else{
			viewListIndex();
		}
	});

});


function showListOption(name){
	$('#ListBanPhong').html('');
	var cart = JSON.parse(localStorage.getItem('cart'));
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	var name = name;
	$.ajax({
		type : "POST",	
		url : "loadViewIdArea1",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		data:{
			keyword:name
		},
		cache : false,
		async:false,
		success : function(result) {
			if(result == null){
				$("#trangBP").html("");
				return;
			}
			result.forEach(function(item,index){
				var abc = "<img src='resources/img/logo/coffe.png' alt=''>";
				if(cart != null){
					for (var i = 0; i < cart.length; i++) {
						if(item.tableNumber == cart[i].idtable){
							abc = "<img src='https://cdn.iconscout.com/icon/premium/png-256-thumb/restaurant-table-550001.png' alt=''>";
							break;
						}
					}
				}
				data += "<div class='col-lg-4 col-md-4 col-sm-4 col-xs-12 showListIdChiTietBan' onclick='getTableNumberChiTietBan("+item.tableNumber+")'>" +
				"<a data-toggle='tab' href='#menu2'>" +
				"<div class='single-new-trend mg-t-30'>" +
				abc +
				"<div class='overlay-content'>" +
				"<h2><span>Bàn: </span>" + '<span id="getTableName">' +item.tableNumber+ '</span>' +"</h2>" +
				"Khu vực: " + item.area.areaName + 
				"</div></div></a></div>";
			});
			$('#ListBanPhong').html(data);	

			$(".showListIdChiTietBan").click(function() {
				$("#home").removeClass('active');
				$("#menu2").addClass('active');
				$("#menu2").css('opacity','1');
			});
		}
	});	
}

function viewListIndex() {
	$('#ListBanPhong').html('');	
	var cart = JSON.parse(localStorage.getItem('cart'));
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	$.ajax({
		type : "POST",	
		url : "viewlistIndex",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		async:false,
		cache : false,
		success : function(result) {
			result.forEach(function(item,index){
				var abc = "<img src='resources/img/logo/coffe.png' alt=''>";
				if(cart != null){
					for (var i = 0; i < cart.length; i++) {
						if(item.tableNumber == cart[i].idtable){
							abc = "<img src='https://cdn.iconscout.com/icon/premium/png-256-thumb/restaurant-table-550001.png' alt=''>";
							break;
						}
					}
				}
				data += "<div class='col-lg-4 col-md-4 col-sm-4 col-xs-12 showListIdChiTietBan' onclick='getTableNumberChiTietBan("+item.tableNumber+")'>" +
				"<a data-toggle='tab' href='#menu2'>" +
				"<div class='single-new-trend mg-t-30'>" +
				abc +
				"<div class='overlay-content'>" +
				"<h2><span>Bàn: </span>" + '<span id="getTableName">' +item.tableNumber+ '</span>' +"</h2>" +
				"Khu vực: " + item.area.areaName + 
				"</div></div></a></div>";
			});
			$('#ListBanPhong').html(data);	

			$(".showListIdChiTietBan").click(function() {
				$("#home").removeClass('active');
				$("#menu2").addClass('active');
				$("#menu2").css('opacity','1');
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


function optionAera() {
	$('#optionArea').html('');
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "optionArea",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		dataType:"json",
		cache : false,
		async:false,
		success : function(data) {
			$('#optionArea').append(new Option('Tất cả'));
			for (var i = 0; i < data.length; i++) {
				$('#optionArea').append(new Option(data[i].areaName, data[i].idArea));
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


function getTableNumberChiTietBan(id) {
	var flag =true;
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "getTableNumberAddVoucher/"+id+"",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		async:false,
		dataType:"json",
		cache : false,
		success : function(data) {
			$('#nameTable').val(data.tableNumber);
			$('#nameBangGia').val(data.priceType.priceName);
			setTimeout(() => {
				viewListIndex();
			}, 500);
		},
		error : function(e) {

			Lobibox.notify('error', {
				showClass: 'zoomInUp',
				hideClass: 'zoomOutDown',
				msg: 'Không tìm thấy'
			});
		}
	});
	var idtable = id;
	var tableinfo = {
			idtable:idtable,
			sokhach:10,
			khachhang:'Nguyen Van A',
			listmenu:[]
	};
	if(localStorage.getItem('cart')){
		var ojbect = JSON.parse(localStorage.getItem('cart'));
		ojbect.forEach(function(item,index){
			if(item.idtable==idtable){
				flag =false;
			}
		});
		if(flag){
			cart = JSON.parse(localStorage.getItem('cart'));
			cart.push(tableinfo);
			localStorage.setItem('cart',JSON.stringify(cart));
		}
	}else{
		cart.push(tableinfo);
		localStorage.setItem('cart',JSON.stringify(cart));
	}
	disPlayItem(idtable);
	disPlayItemThanhToan(idtable);
}
function disPlayItem(idtable){
	var data = "";
	var cart = JSON.parse(localStorage.getItem('cart'));
	cart.forEach(function(item,index){
		if(item.idtable ==idtable){
			item.listmenu.forEach(function(element,index2){
				data+="<tr class='addBill'><td>"+element.id+"</td><td>"+element.name+"</td><td>"+element.dvt+"</td><td>"+element.qty+"</td><td>"+element.price+"</td><td></td><td></td><td><button class='btn btn-danger' onclick='deleteIem("+element.id+")'>Xóa</botton></td></tr>";
			});
		}
	});
	$('#listDongChungTu').html(data);
}
function disPlayItemThanhToan(idtable){
	var data = "";
	var cart = JSON.parse(localStorage.getItem('cart'));
	cart.forEach(function(item,index){
		if(item.idtable ==idtable){
			item.listmenu.forEach(function(element,index2){
				data+="<tr><td>"+element.id+"</td><td>"+element.name+"</td><td>"+element.dvt+"</td><td>"+element.qty+"</td><td>"+element.price+"</td><td></td><td>"+element.qty*element.price+"</td></tr>";
			});
		}
	});
	$('#listThanhToan').html(data);
}
