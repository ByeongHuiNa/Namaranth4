<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/scss" href="../../resources/dist/assets/scss/style.scss" />
<link rel="stylesheet" type="text/css" href="../../resources/dist/assets/css/style.css" />

<head>
	<title>로그인</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="description" content="" />
	<meta name="keywords" content="">
	<meta name="author" content="Phoenixcoded" />
	
	<!-- Favicon icon -->
	<link rel="icon" href="../../resources/dist/assets/images/favicon.ico" type="image/x-icon">
</head>
<body>
	<!-- [ auth-signin ] start -->
	<div class="auth-wrapper">
		<div class="auth-content text-center">
			<img src="../../resources/dist/assets/images/logow1.png" alt="" class="img-fluid">
			<div class="card borderless">
				<div class="row align-items-center ">
					<div class="col-md-12">
						<div class="card-body">
							<h4 class="mb-3 f-w-400">로그인</h4>
							<hr>
							<div class="form-group mb-3">
								<input type="text" class="form-control" id="Id" placeholder="사원번호">
							</div>
							<div class="form-group mb-4">
								<input type="password" class="form-control" id="Password" placeholder="비밀번호">
							</div>
							<div class="custom-control custom-checkbox text-left mb-4 mt-2">
								<input type="checkbox" class="custom-control-input" id="customCheck1">
								<label class="custom-control-label" for="customCheck1">아이디 저장</label>
							</div>
							<button class="btn btn-block btn-primary mb-4">로그인</button>
							<hr>
							<a href="auth-signup.html" class="mb-0 text-muted">아이디 찾기</a>
							<span href="auth-signup.html">&nbsp|&nbsp</span>
							<a href="auth-signup.html" class="mb-0 text-muted">비밀번호 찾기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- [ auth-signin ] end -->
	
	<!-- Required Js -->
	<script src="../../resources/dist/assets/js/vendor-all.min.js"></script>
	<script src="../../resources/dist/assets/js/plugins/bootstrap.min.js"></script>
	<script src="../../resources/dist/assets/js/pcoded.min.js"></script>
</body>
</html>