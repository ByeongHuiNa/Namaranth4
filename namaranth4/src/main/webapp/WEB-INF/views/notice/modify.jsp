<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page session="false"%>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/scss" href="../../resources/dist/assets/scss/style.scss" />
<link rel="stylesheet" type="text/css" href="../../resources/dist/assets/css/style.css" />
<link rel="stylesheet" href="../../resources/dist/assets/css/noticeRegister.css">
<head>
<title>회원정보 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />

<!-- Favicon icon -->
<link rel="icon" href="../../resources/dist/assets/images/favicon.ico" type="image/x-icon">

<!-- vendor css -->
<link rel="stylesheet" href="../../resources/dist/assets/css/style.css">
</head>
<body>
	<!-- [ Pre-loader ] start -->
	<div class="loader-bg">
		<div class="loader-track">
			<div class="loader-fill"></div>
		</div>
	</div>

	<!-- [ Pre-loader ] End -->

	<!-- [ navigation menu ] start -->
	<%@include file="../layouts/nav.jsp"%>
	<!-- [ navigation menu ] end -->

	<!-- [ Header ] start -->
	<%@include file="../layouts/header.jsp"%>
	<!-- [ Header ] end -->
	
<section class="pcoded-main-container" >
	<input id="userinfo_no" type="hidden" value="${user.user_no}" />
	<input id="userinfo_name" type="hidden" value="${user.user_name}" />
	<input id="userinfo_dept" type="hidden" value="${dept}" />
	<input id="userinfo_position" type="hidden" value="${user.user_position}" />
	<input id="userinfo_profile" type="hidden" value="${user.user_profile}" />
	    
	    <div class="pcoded-content" id="registerBox">
	        <!-- [ breadcrumb ] start -->
	        <div class="page-header" id="header">
	            <div class="page-block">
	                <div class="row align-items-center">
	                    <div class="col-md-12">
	                        <div class="page-header-title">
	                            <h5 class="m-b-10"></h5>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- [ breadcrumb ] end -->
	        <!-- [ Main Content ] start -->
	        <div class="row">
	            <!-- [ sample-page ] start -->
	            <div class="col-sm-12">
	                <div class="card">
	                    <div class="card-header">
							<h5 class="m-b-10">공지사항 등록</h5>
	                        <div class="card-header-right">
	                            <div class="btn-group card-option">
	                                <button type="button" class="btn dropdown-toggle btn-icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                    <i class="feather icon-more-horizontal"></i>
	                                </button>
	                                <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right">
	                                    <li class="dropdown-item full-card"><a href="#!"><span><i class="feather icon-maximize"></i> maximize</span><span style="display:none"><i class="feather icon-minimize"></i> Restore</span></a></li>
	                                    <li class="dropdown-item minimize-card"><a href="#!"><span><i class="feather icon-minus"></i> collapse</span><span style="display:none"><i class="feather icon-plus"></i> expand</span></a></li>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
	                  <div class="card-body">
			           <form action="/notice/modify" method="POST" id="modifyForm">
	                       <div class="form-group noticeInput">
                               <label for="exampleInputEmail1">제목</label>
                               <input type="text" name="noti_title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="제목" value="${notice.noti_title}" required>
                               <small id="emailHelp" class="form-text text-muted"> 공지사항 제목은 필수입니다.</small>
                           </div>
	                       <div class="form-group noticeInput">
                               <label for="exampleInputEmail1">작성자</label>
                               <input class="form-control" type="text" value="${user.user_name}" readonly>
                               <input type="hidden" name="user.user_no" value="${user.user_no}"/>
                               <input type="hidden" name="noti_no" value="${notice.noti_no}"/>
                           </div>                           
                           <div class="form-group" id="noticeContent">
                               <label for="exampleInputEmail1">내용</label>
                               <textarea class="form-control" name="noti_content" id="exampleFormControlTextarea1" rows="30">${notice.noti_content}</textarea>
                           </div>
	                       <div class="d-flex justify-content-end" id="updateBtn" style="margin-right: 46px;">
			                   <button type="submit" class="btn btn-primary" id="modifyBtn">수정</button>
	                       </div>
	                    </form>
	                    </div>
	                </div>
	            </div>
	            <!-- [ sample-page ] end -->
	        </div>
	        <!-- [ Main Content ] end -->
	    </div>
	<!-- [ Main Content ] end -->
</section>
   	<!-- Required Js -->
	<script src="../../resources/dist/assets/js/vendor-all.min.js"></script>
	<script src="../../resources/dist/assets/js/plugins/bootstrap.min.js"></script>
	<script src="../../resources/dist/assets/js/pcoded.min.js"></script>
	
	<!-- Apex Chart -->
	<script src="../../resources/dist/assets/js/plugins/apexcharts.min.js"></script>

	<!-- custom-chart js -->
	<script src="../../resources/dist/assets/js/pages/dashboard-main.js"></script>
	
<script>
$(document).ready(function(){
	// 네비바에 로그인 사용자의 정보 나타내기
	let info = '<span>' + $("#userinfo_dept").val() + "/" + $('#userinfo_position').val() + "</span>";
	$('#username').text($('#userinfo_name').val());
	$('#userprofile').attr("src", $('#userinfo_profile').val());
	$('#more-details').prepend(info);
	
	$("#modifyBtn").on("click", function(e){
		$("#modifyForm").submit();
	})
})
</script>
</body>
</html>