<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap Sign in Form with Facebook and Twitter Buttons</title>
<jsp:include page="/WEB-INF/views/backend/layout/css.jsp"></jsp:include>	
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.login-form {
	width: 400px;
	margin: 30px auto;
}

.login-form form {
	margin-bottom: 15px;
	background: #f7f7f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.login-form h2 {
	margin: 0 0 15px;
}

.form-control, .login-btn {
	border-radius: 2px;
}

.input-group-prepend .fa {
	font-size: 18px;
}

.login-btn {
	font-size: 15px;
	font-weight: bold;
	min-height: 40px;
}

.social-btn .btn {
	border: none;
	margin: 10px 3px 0;
	opacity: 1;
}

.social-btn .btn:hover {
	opacity: 0.9;
}

.social-btn .btn-secondary, .social-btn .btn-secondary:active {
	background: #507cc0 !important;
}

.social-btn .btn-info, .social-btn .btn-info:active {
	background: #64ccf1 !important;
}

.social-btn .btn-danger, .social-btn .btn-danger:active {
	background: #df4930 !important;
}

.or-seperator {
	margin-top: 20px;
	text-align: center;
	border-top: 1px solid #ccc;
}

.or-seperator i {
	padding: 0 10px;
	background: #f7f7f7;
	position: relative;
	top: -11px;
	z-index: 1;
}
</style>
</head>
<body>
	<div class="login-form">
		<form action="${classpath }/login_processing_url" method="post">
			<h2 class="text-center">Login</h2>

			<c:if test="${not empty param.login_error }">
				<div class="alert alert-danger" role="alert">Login attempt was
					not successful, try again!!!</div>
			</c:if>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <span class="fa fa-user"></span>
						</span>
					</div>
					<input type="text" id="username" name="username" placeholder="User name"
						class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input type="password" id="password" name="password" placeholder="Pass Word"
						class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary login-btn btn-block">Login</button>
			</div>
			
			<div class="clearfix">
				<label class="float-left form-check-label"><input
					class="form-check-input" type="checkbox" id="remember-me"
					name="remember-me" /> Remember me
				</label> <a href="#" class="float-right">Forgot Password?</a>
			</div>
			<div class="or-seperator">
				<i>or</i>
			</div>
			<p class="text-center">Login with your social media account</p>
			<div class="text-center social-btn">
				<a href="#" class="btn btn-secondary"><i class="fa fa-facebook"></i>&nbsp;
					Facebook</a> <a href="#" class="btn btn-info"><i
					class="fa fa-twitter"></i>&nbsp; Twitter</a> <a href="#"
					class="btn btn-danger"><i class="fa fa-google"></i>&nbsp;
					Google</a>
			</div>
		</form>
		<p class="text-center text-muted small">
			Don't have an account? <a href="${classpath }/signup">Sign up here!</a>
		</p>
	</div>
</body>
</html>