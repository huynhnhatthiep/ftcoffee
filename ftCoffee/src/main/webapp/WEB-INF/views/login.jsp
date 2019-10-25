<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Đăng nhập</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- LOGIN -->

<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href='<c:url value="/resources/JS/LOGIN/images/icons/favicon.ico"/>'>
<!--===============================================================================================-->
<link rel="stylesheet"
	href='<c:url value="/resources/JS/LOGIN/vendor/bootstrap/css/bootstrap.min.css"/>'>
<!--===============================================================================================-->
<link rel="stylesheet"
	href='<c:url value="/resources/JS/LOGIN/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>'>
<!--===============================================================================================-->
<link rel="stylesheet"
	href='<c:url value="/resources/JS/LOGIN/fonts/iconic/css/material-design-iconic-font.min.css"/>'>
<!--===============================================================================================-->
<link rel="stylesheet"
	href='<c:url value="/resources/JS/LOGIN/vendor/animate/animate.css"/>'>
<!--===============================================================================================-->
<link rel="stylesheet"
	href='<c:url value="/resources/JS/LOGIN/vendor/css-hamburgers/hamburgers.min.css"/>'>
<!--===============================================================================================-->
<link rel="stylesheet"
	href='<c:url value="/resources/JS/LOGIN/vendor/animsition/css/animsition.min.css"/>'>
<!--===============================================================================================-->
<link rel="stylesheet"
	href='<c:url value="/resources/JS/LOGIN/vendor/select2/select2.min.css"/>'>
<!--===============================================================================================-->
<link rel="stylesheet"
	href='<c:url value="/resources/JS/LOGIN/vendor/daterangepicker/daterangepicker.css"/>'>
<!--===============================================================================================-->
<link rel="stylesheet"
	href='<c:url value="/resources/JS/LOGIN/css/util.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/resources/JS/LOGIN/css/main.css"/>'>
<!--===============================================================================================-->
</head>

<body>
	
	<div class="limiter">
		<div class="container-login100" >
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form name="loginForm" action="<c:url value='j_spring_security_login' />" method="POST" class="login100-form validate-form">
					<span class="login100-form-title p-b-49">
						Login
					</span>
						<h2 style="color: red;">${message}</h2>
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" name="username" value="admin" placeholder="Type your username">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="password" value="123456" placeholder="Type your password">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					<div class="text-right p-t-8 p-b-31">
						
						<br>
						
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	<!-- LOGIN -->

<!--===============================================================================================-->
	<script src='<c:url value="/resources/JS/LOGIN/vendor/jquery/jquery-3.2.1.min.js"/>'></script>
<!--===============================================================================================-->
	<script src='<c:url value="/resources/JS/LOGIN/vendor/animsition/js/animsition.min.js"/>'></script>
<!--===============================================================================================-->
	<script src='<c:url value="/resources/JS/LOGIN/vendor/bootstrap/js/popper.js"/>'></script>
	<script src='<c:url value="/resources/JS/LOGIN/vendor/bootstrap/js/bootstrap.min.js"/>'></script>
<!--===============================================================================================-->
	<script src='<c:url value="/resources/JS/LOGIN/vendor/select2/select2.min.js"/>'></script>
<!--===============================================================================================-->
	<script src='<c:url value="/resources/JS/LOGIN/vendor/daterangepicker/moment.min.js"/>'></script>
	<script src='<c:url value="/resources/JS/LOGIN/vendor/daterangepicker/daterangepicker.js"/>'></script>
<!--===============================================================================================-->
	<script src='<c:url value="/resources/JS/LOGIN/vendor/countdowntime/countdowntime.js"/>'></script>
<!--===============================================================================================-->
	<script src='<c:url value="/resources/JS/LOGIN/js/main.js"/>'></script>
	</body>
</html>