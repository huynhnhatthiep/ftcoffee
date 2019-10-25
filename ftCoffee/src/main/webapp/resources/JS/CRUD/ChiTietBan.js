
$(document).ready(function() {

	viewPriceList();

	$("#inBill").click(function() {
		addChiTietBan();
		inBill();
		addVoucherLine($('#getTableNumberInBill').val());
		setTimeout(() => {
			viewListIndex();
		}, 500);
	});
	$("#huyBan").click(function() {
		huyBan($('#nameTable').val());
		setTimeout(() => {
			viewListIndex();
		}, 500);
	});
	$("#thanhToan").click(function() {
		showVoucherNumber();
	});
});

function huyBan(id) {
	var ojbect = JSON.parse(localStorage.getItem('cart'));
	for (var i = 0; i < ojbect.length; i++) {
		if (ojbect[i].idtable == id) {
			console.log(ojbect[i]);
			ojbect.splice(i, 1);
			localStorage.setItem('cart', JSON.stringify(ojbect));
			$("#listDongChungTu").html('');
			viewPriceList();
			$("#click-back").click();
			break;
		}
	}
	setTimeout(() => {
		viewListIndex();
	}, 100);
}

$(document).on('click','#showListProduct tr td a',function(){
	var flag= true;
	var id= $(this).attr('data-id');
	var name= $(this).attr('data-name');
	var dvt= $(this).attr('data-dvt');
	var price= $(this).attr('data-price');
	var idtable = $('#nameTable').val();
	var menuitem= {
			id:id,
			name:name,
			dvt:dvt,
			qty:1,
			price:price
	}
	if(localStorage.getItem('cart')){
		var cart = JSON.parse(localStorage.getItem('cart'));
		cart.forEach(function(item,index){
			if(item.idtable == $('#nameTable').val()){
				item.listmenu.forEach(function(element,index2){
					if(element.id==id){
						flag=false;
						element.qty+=1;
					}
				});
				if(flag==true){
					item.listmenu.push(menuitem);
				}
			}
		});

		localStorage.setItem('cart',JSON.stringify(cart));
		disPlayItem(idtable);
		disPlayItemThanhToan(idtable);
	}else{

	}
});
function disPlayItem(idtable){
	var data = "";
	var cart = JSON.parse(localStorage.getItem('cart'));
	cart.forEach(function(item,index){
		if(item.idtable ==idtable){
			item.listmenu.forEach(function(element,index2){
				var idstr ='"' +element.id+'"';
				data+="<tr><td>"+element.id+"</td><td>"+element.name+"</td><td>"+element.dvt+"</td><td>"+element.qty+"</td><td>"+element.price+"</td><td></td><td>"+element.qty*element.price+"</td><td><button class='btn btn-danger' onclick='deleteIem("+idstr+")'>Xóa</botton></td></tr>";
			});
		}
	});
	$('#listDongChungTu').html(data);
}
function disPlayItemThanhToan(idtable){
	var data = "";
	var tableNumber = $("#nameTable").val();
	var numberCustomer = $("#numberCustomer").val();
	var total =0;
	var cart = JSON.parse(localStorage.getItem('cart'));
	cart.forEach(function(item,index){
		if(item.idtable ==idtable){
			item.listmenu.forEach(function(element,index2){
				total+=element.qty*element.price;
				data+="<tr><td>"+element.id+"</td><td>"+element.name+"</td><td>"+element.dvt+"</td><td>"+element.qty+"</td><td>"+element.price+"</td><td></td><td>"+element.qty*element.price+"</td></tr>";
			});
		}
	});
	$('#total').val(total);
	$('#totalInBill').val(total);
	$("#thanhToan").click(function() {
		$("#getTableNumberInBill").val(tableNumber);
		$("#getNumberCustomerInBill").val(numberCustomer);
	});
	$('#listThanhToan').html(data);
}
function deleteIem(idmenu){
	var idtable = $('#nameTable').val();
	var cart = JSON.parse(localStorage.getItem('cart'));
	cart.forEach(function(item,index){
		if(item.idtable ==idtable){
			item.listmenu.forEach(function(element,index2){
				if(element.id==idmenu){
					item.listmenu.splice(index2,1);
				}
			});
		}
	});
	localStorage.setItem('cart',JSON.stringify(cart));
	disPlayItem(idtable);
	disPlayItemThanhToan(idtable);
}
function viewPriceList() {
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	$.ajax({
		type : "POST",	
		url : "getPriceList",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		success : function(data) {
			$(function() {
				$.each(data,
						function(i, item) {
					data += "<tr>" + "<td>" + '<a class="btn btn-success" data-id="'+item.SanPham.idProduct+'" data-name="'+item.SanPham.nameProduct+'" data-dvt="'+item.SanPham.idDVT+'" data-price="'+item.price+'"><i class="fa fa-plus" aria-hidden="true"></i></a>' + "</td>"
					+ "<td>" + item.SanPham.idProduct + "</td>"
					+ "<td>" + item.SanPham.nameProduct + "</td>"
					+ "<td>" + item.SanPham.idDVT + "</td>"
					+ "<td>" + item.price + "</td>"
					+ "<td>" + '<input id="SL" type="number" class="form-control" placeholder="Số lượng" value="1" />' + "</td>"
					+ "</tr>";
				});
				$('#showListProduct').html(data);
			});
		}
	});
}

function showVoucherNumber() {
	var token = $("meta[name='_csrf']").attr("content");
	var data = "";
	$.ajax({
		type : "GET",	
		url : "length",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		success : function(data) {
//			var idNumber= Number(data) + 1
			if (data == '') {
				return data = 1;
			}else{
				$("#getIdNumberVoucher").val(data);
			}

		}
	});
}

function getIdProduct(id) {
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "GET",
		url : "getIdProduct/"+id+"",
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		dataType:"json",
		cache : false,
		success : function(data) {

			$('#nameTable').val(data.tableNumber);
			$('#nameBangGia').val(data.priceType.priceName);

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

function addChiTietBan() {
	var token = $("meta[name='_csrf']").attr("content");
	$.ajax({
		type : "POST",
		url : "addVoucher",
		async:false,
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {

			tableNumber : $("#getTableNumberInBill").val(),
			moneyAmount : $("#totalInBill").val(),
			customerAmount : $("#getNumberCustomerInBill").val()	
		},
		success : function(data) {

			console.log(data);
			if (data === "success") {
				$("#ListBanPhong").html("");
				Lobibox.notify('success', {
					showClass : 'rollIn',
					hideClass : 'rollOut',
					msg : 'Thanh toán thành công'
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
				msg: 'Không được để traống'
			});
		},
	});
}

function addVoucherLine(id) {
	var ojbect = JSON.parse(localStorage.getItem('cart'));
	for (var i = 0; i < ojbect.length; i++) {
		if (ojbect[i].idtable == id) {
			console.log(ojbect[i]);
			for (var j = 0; j < ojbect[i].listmenu.length; j++) {
				add(ojbect[i].listmenu[j].id, ojbect[i].listmenu[j].dvt, ojbect[i].listmenu[j].qty, ojbect[i].listmenu[j].price);
			}
			ojbect.splice(i, 1);
			localStorage.setItem('cart', JSON.stringify(ojbect));
			$("#listDongChungTu").html('');
			$("#click-back").click();
			return;
		}
	}
}


function add(id, dvt, qty, price){
	var token = $("meta[name='_csrf']").attr("content");	
	$.ajax({
		type : "POST",
		url : "addVoucherLine",
		async:false,
		headers: {
			'X-CSRF-TOKEN':token, 
		},
		cache : false,
		data : {

			voucherNumber : $("#getIdNumberVoucher").val(),
			idProduct : id,
			idDVT : dvt,
			amount : qty,
			price : price

		},
		success : function(data) {
			console.log(data);
			if (data === "success") {
				$("#listThanhToan").html("");
//				Lobibox.notify('success', {
//					showClass : 'rollIn',
//					hideClass : 'rollOut',
//					msg : 'Thêm thành công'
//				});
				viewPriceList();
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
				msg: 'Không được để traống'
			});
		},
	});
}

function inBillTest() {

	var mywindow = window.open('', 'PRINT', 'height=800,width=1000');

	mywindow.document.write('<html><head>');
	mywindow.document.write('</head><body >');
	mywindow.document.write('<h1 style="text-align:center">HÓA ĐƠN THANH TOÁN TẠM THỜI</h1>');
	mywindow.document.write('<h2 style="text-align:center">500 SERVER ERROR COFFEE</h2>');
	mywindow.document.write('<p style="text-align:center">Địa chỉ: FastTrack SE, P.Hòa Quý, Q.Ngũ Hành sơn, TP.Đà Nẵng</p>');
	mywindow.document.write('<table>');
		mywindow.document.write('<tr>');
			mywindow.document.write('<th>');
				mywindow.document.write('Số bàn:');
			mywindow.document.write('</th>');
			mywindow.document.write('<th>');
				mywindow.document.write(document.getElementById("getTableNumberInBill").value);
			mywindow.document.write('</th>');
			mywindow.document.write('<th style="with:100px">');
			mywindow.document.write('</th>');
			mywindow.document.write('<th>');
			mywindow.document.write('</th>');
			mywindow.document.write('<th>');
			mywindow.document.write('</th>');
			mywindow.document.write('<th>');
				mywindow.document.write('Số hóa đơn:');
			mywindow.document.write('</th>');
			mywindow.document.write('<th>');
				mywindow.document.write(document.getElementById("getIdNumberVoucher").value);
			mywindow.document.write('<th>');
		mywindow.document.write('</tr>');
		
	mywindow.document.write('</table>');
		
	mywindow.document.write('<br>');
	
	mywindow.document.write('<table border="1" style="border-collapse: collapse">');
		mywindow.document.write('<tr>');
		
			mywindow.document.write('<th>');
				mywindow.document.write('ID');
			mywindow.document.write('</th>');
			
			mywindow.document.write('<th>');
				mywindow.document.write('Tên hàng hóa, sản phẩm, dịch vụ');
			mywindow.document.write('</th>');
		
			mywindow.document.write('<th>');
				mywindow.document.write('ĐVT');
			mywindow.document.write('</th>');
	
			mywindow.document.write('<th>');
				mywindow.document.write('Số lượng');
			mywindow.document.write('</th>');

			mywindow.document.write('<th>');
				mywindow.document.write('Đơn giá');
			mywindow.document.write('</th>');
			
			mywindow.document.write('<th>');
				mywindow.document.write('Giảm giá');
			mywindow.document.write('</th>');
		
			mywindow.document.write('<th>');
				mywindow.document.write('Thành tiền');
			mywindow.document.write('</th>');

				mywindow.document.write(document.getElementById("listThanhToan").innerHTML);
		mywindow.document.write('</tr>');
	mywindow.document.write('</table>');
	
	mywindow.document.write('<br>');
	
	mywindow.document.write('<div style="display:fex;margin-left:423px">');
	mywindow.document.write('<span>');
	mywindow.document.write('<b>');
	mywindow.document.write('Tổng tiền:');
	mywindow.document.write('</b>');
	mywindow.document.write('</span>');
	
	mywindow.document.write('<span>');
	mywindow.document.write(document.getElementById("totalInBill").value);
	mywindow.document.write('</span>');
	mywindow.document.write('</div>');
	mywindow.document.write('</body></html>');

	mywindow.document.close(); 
	mywindow.focus(); 

	mywindow.print();
	mywindow.close();

}

function inBill() {
	
	var mywindow = window.open('', 'PRINT', 'height=800,width=1000');

	mywindow.document.write('<html><head>');
	mywindow.document.write('</head><body >');
	mywindow.document.write('<h1 style="text-align:center">HÓA ĐƠN THANH TOÁN</h1>');
	mywindow.document.write('<h2 style="text-align:center">500 SERVER ERROR COFFEE</h2>');
	mywindow.document.write('<p style="text-align:center">Địa chỉ: FastTrack SE, P.Hòa Quý, Q.Ngũ Hành sơn, TP.Đà Nẵng</p>');
	mywindow.document.write('<table>');
		mywindow.document.write('<tr>');
			mywindow.document.write('<th>');
				mywindow.document.write('Số bàn:');
			mywindow.document.write('</th>');
			mywindow.document.write('<th>');
				mywindow.document.write(document.getElementById("getTableNumberInBill").value);
			mywindow.document.write('</th>');
			mywindow.document.write('<th style="with:100px">');
			mywindow.document.write('</th>');
			mywindow.document.write('<th>');
			mywindow.document.write('</th>');
			mywindow.document.write('<th>');
			mywindow.document.write('</th>');
			mywindow.document.write('<th>');
				mywindow.document.write('Số hóa đơn:');
			mywindow.document.write('</th>');
			mywindow.document.write('<th>');
				mywindow.document.write(document.getElementById("getIdNumberVoucher").value);
			mywindow.document.write('<th>');
		mywindow.document.write('</tr>');
		
	mywindow.document.write('</table>');
		
	mywindow.document.write('<br>');
	
	mywindow.document.write('<table border="1" style="border-collapse: collapse">');
		mywindow.document.write('<tr>');
		
			mywindow.document.write('<th>');
				mywindow.document.write('ID');
			mywindow.document.write('</th>');
			
			mywindow.document.write('<th>');
				mywindow.document.write('Tên hàng hóa, sản phẩm, dịch vụ');
			mywindow.document.write('</th>');
		
			mywindow.document.write('<th>');
				mywindow.document.write('ĐVT');
			mywindow.document.write('</th>');
	
			mywindow.document.write('<th>');
				mywindow.document.write('Số lượng');
			mywindow.document.write('</th>');

			mywindow.document.write('<th>');
				mywindow.document.write('Đơn giá');
			mywindow.document.write('</th>');
			
			mywindow.document.write('<th>');
				mywindow.document.write('Giảm giá');
			mywindow.document.write('</th>');
		
			mywindow.document.write('<th>');
				mywindow.document.write('Thành tiền');
			mywindow.document.write('</th>');

				mywindow.document.write(document.getElementById("listThanhToan").innerHTML);
		mywindow.document.write('</tr>');
	mywindow.document.write('</table>');
	
	mywindow.document.write('<br>');
	
	mywindow.document.write('<div style="display:fex;margin-left:465px">');
	mywindow.document.write('<span>');
	mywindow.document.write('<b>');
	mywindow.document.write('Tổng tiền:');
	mywindow.document.write('</b>');
	mywindow.document.write('</span>');
	
	mywindow.document.write('<span>');
	mywindow.document.write(document.getElementById("totalInBill").value);
	mywindow.document.write('</span>');
	mywindow.document.write('</div>');
	mywindow.document.write('</body></html>');

	mywindow.document.close(); 
	mywindow.focus(); 

	mywindow.print();
	mywindow.close();
	
	

}
