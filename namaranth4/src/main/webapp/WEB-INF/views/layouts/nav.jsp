<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/scss" href="../../resources/dist/assets/scss/style.scss" />
<link rel="stylesheet" type="text/css" href="../../resources/dist/assets/css/style.css" />
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<nav class="pcoded-navbar  ">
	<div class="navbar-wrapper  ">
		<div class="navbar-content scroll-div " >
			
			<div class="">
				<div class="main-menu-header">
					<img class="img-radius" src="../../resources/dist/assets/images/user/avatar-2.jpg" alt="User-Profile-Image">
					<div class="user-details">
						<span id="username"></span>
						<div id="more-details"><i class="fa fa-chevron-down m-l-5"></i></div>
					</div>
				</div>
				<div class="collapse" id="nav-user-link">
					<ul class="list-unstyled">
						<li class="list-group-item"><a href="user-profile.html"><i class="feather icon-user m-r-5"></i>마이페이지</a></li>
						<li class="list-group-item"><a href="#!"><i class="feather icon-settings m-r-5"></i>회원정보수정</a></li>
						<li class="list-group-item">
							<form action="/logout" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<button id="logoutBtn"><i class="feather icon-log-out m-r-5"></i>로그아웃</button>
							</form>
						</li>
					</ul>
				</div>
			</div>
			
			<ul class="nav pcoded-inner-navbar ">
				<li class="nav-item pcoded-menu-caption">
					<label>Main</label>
				</li>
				<li class="nav-item">
				    <a href="index.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-home"></i></span><span class="pcoded-mtext">메인페이지</span></a>
				</li>
				<li class="nav-item">
				    <a href="form_elements.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-file-text"></i></span><span class="pcoded-mtext">공지사항</span></a>
				</li>
				<!-- 
					* 필요하면 사용하기
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-layout"></i></span><span class="pcoded-mtext">공지사항</span></a>
						<ul class="pcoded-submenu">
							<li><a href="layout-vertical.html" target="_blank">공지사항</a></li>
							<li><a href="layout-horizontal.html" target="_blank">공지사항 등록</a></li>
						</ul>
					</li>
				-->
				<li class="nav-item pcoded-menu-caption">
					<label>E-mail</label>
				</li>
				<li class="nav-item">
				    <a href="index.html" class="nav-link "><span class="pcoded-micon"><i class="bi bi-pencil-square" style="color:white;"></i></span><span class="pcoded-mtext">메일작성</span></a>
				</li>
				<li class="nav-item pcoded-hasmenu">
					<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="bi bi-envelope" style="color:white;"></i></span><span class="pcoded-mtext">메일함</span></a>
					<ul class="pcoded-submenu">
						<li><a href="bc_alert.html">전체메일함</a></li>
						<li><a href="bc_button.html">수신메일함</a></li>
						<li><a href="bc_badges.html">발신메일함</a></li>
						<li><a href="bc_breadcrumb-pagination.html">임시보관함</a></li>
					</ul>
				</li>
				<li class="nav-item">
				    <a href="index.html" class="nav-link "><span class="pcoded-micon"><i class="bi bi-trash2" style="color:white;"></i></span><span class="pcoded-mtext">휴지통</span></a>
				</li>
				<li class="nav-item pcoded-menu-caption">
				    <label>Schedule</label>
				</li>
				<li class="nav-item">
				    <a href="form_elements.html" class="nav-link "><span class="pcoded-micon"><i class="bi bi-calendar3" style="color:white;"></i></span><span class="pcoded-mtext">캘린더</span></a>
				</li>
				<li class="nav-item">
				    <a href="tbl_bootstrap.html" class="nav-link "><span class="pcoded-micon"><i class="bi bi-gear-fill" style="color:white;"></i></span><span class="pcoded-mtext">환경설정</span></a>
				</li>
				<li class="nav-item">
				    <a href="tbl_bootstrap.html" class="nav-link "><span class="pcoded-micon"><i class="bi bi-trash2" style="color:white;"></i></span><span class="pcoded-mtext">휴지통</span></a>
				</li>				
				<li class="nav-item pcoded-menu-caption">
					<label>Approval</label>
				</li>
				<li class="nav-item">
				    <a href="chart-apex.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-pie-chart"></i></span><span class="pcoded-mtext">Chart</span></a>
				</li>
				<li class="nav-item">
				    <a href="map-google.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-map"></i></span><span class="pcoded-mtext">Maps</span></a>
				</li>
				<li class="nav-item pcoded-hasmenu">
				    <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-lock"></i></span><span class="pcoded-mtext">Authentication</span></a>
				    <ul class="pcoded-submenu">
				        <li><a href="auth-signup.html" target="_blank">Sign up</a></li>
				        <li><a href="auth-signin.html" target="_blank">Sign in</a></li>
				    </ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
</body>
</html>