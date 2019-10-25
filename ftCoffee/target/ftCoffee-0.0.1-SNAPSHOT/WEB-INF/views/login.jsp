<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body id="body-login">
	<div id="body-flex-login">
		<div id="container-login">
			<div id="container-login-left" class="header-login"></div>
			<div id="container-login-right">
				<div id="header-top-right" class="header-login">
					<span id="col1" class="actived">Đăng nhập</span> / <span>Đăng
						ký</span>
				</div>
				<h2 style="color: red;">${message}</h2>
				<div id="container-center-login-right">
				
					<form name="loginForm" action="<c:url value='j_spring_security_login' />" method="POST">
						<input name="username" class="material-textinput icon-email"
							placeholder="Email" type="text" /><br /> 
						<input name="password" class="material-textinput icon-password" type="password"
							placeholder="Mật khẩu" /><br /> 
						<input class="material-button"
							type="submit" value="Đăng nhập" />
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
					<span id="btnDangNhap">Dang nhap</span><span id="ketqua"></span>
				</div>

				<div id="container-social-login">Trương Phục Hưng</div>
			</div>
		</div>
	</div>

</body>
</html>