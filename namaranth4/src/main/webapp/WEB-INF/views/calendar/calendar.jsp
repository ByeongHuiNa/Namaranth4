<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/scss" href="../../../resources/dist/assets/scss/style.scss" />
<link rel="stylesheet" type="text/css" href="../../../resources/dist/assets/css/style.css" />
<head>
    <title>게시판</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded" />
    <!-- Favicon icon -->
    <link rel="icon" href="../../../resources/dist/assets/images/favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- js파일~~ -->
<script defer src="../../../resources/dist/assets/js/calendar.js" type="text/javascript"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"/>
<link rel="stylesheet" type="text/css" href="../../../resources/dist/assets/css/calendar.css" />


</head>
<body class="">
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
	
<!-- [ Main Content ] start -->
<section class="pcoded-main-container">
	<div class='wrapper'>
		<div class='calendar-side'>
			<button type="button" class="btn btn-primary" id="create-sch" 
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasSchedule" aria-controls="offcanvasRight">일정등록</button>
			<div class='calendar-list-wrap'>
			<div class="title-wrap">
				<div id="calendar-list-title">내 캘린더</div>
				<div><button type="button" id="create-cal" 
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasCalendar" aria-controls="offcanvasRight"><i class="bi bi-plus fs-10"></i></button></div>
			</div>
				<table id="calendar-list-table">
					<c:forEach items="${list}" var="calendar">
							<tr class="calendar-list">
								<%-- <td><c:out value="${calendar.cal_no }" /></td> --%>
								<td><input type="hidden" class= "cal_no" value=<c:out value="${calendar.cal_no }"/>></td>
								<td>
								<div class="text-with-box">
										<span class="color-box" style="background-color:<c:out value="${calendar.cal_color }" />;"></span>
										<c:out value="${calendar.cal_name }" />
								</div>
								</td>
							</tr>
						</c:forEach>
				</table>
			</div>
		</div>
		<div class='calendar-wrap'>
			<div id='calendar'></div>
		</div>
	</div>
</section>
<!-- 캘린더 등록 -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasCalendar" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <h4 id="offcanvasRightLabel1">내 캘린더 추가</h4>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
  	<form action="/calendar/register" method="post">
	    <div class="form-group">
	    	<label class="floating-label">캘린더명</label>
	        <input type="text" class="form-control" name="cal_name">
	    </div>
	    <div class="form-group">
	    	<label class="floating-label">유저넘버</label>
	        <input type="text" class="form-control" name="users.user_no" >
	    </div>
	    <div class="form-group">
	    	<label class="floating-label">캘린더 색상</label>
	    	<div>
	    		<button type="button" class="color-box selected" style="background-color:#FA5858" value="#FA5858"></button>
		    	<button type="button" class="color-box selected" style="background-color:#FA8258" value="#FA8258"></button>
		    	<button type="button" class="color-box selected" style="background-color:#F4FA58" value="#F4FA58"></button>
		    	<button type="button" class="color-box selected" style="background-color:#58FA82" value="#58FA82"></button>
		    	<button type="button" class="color-box selected" style="background-color:#58ACFA" value="#58ACFA"></button>
		    	<button type="button" class="color-box selected" style="background-color:#AC58FA" value="#AC58FA"></button>
	    	</div>     
	    	
	        <input type="text" class="form-control color-input" name="cal_color">
	    </div>
	    <div class="form-group">
	    	<label class="floating-label">공유 멤버</label>
	    	<button type="button" class="btn  btn-primary" id="calParti-btn" data-toggle="modal" data-target=".bd-example-modal-lg">Large modal</button>
	        <input type="text" class="form-control" name="calParti_no[]">
	        <input type="text" class="form-control" name="calParti_no[]">
	        <input type="text" class="form-control" name="calParti_no[]">
	    </div>
	    <div class="form-group">
	    	<label class="floating-label">설명</label>
	        <input type="text" class="form-control" name="cal_con" >
	    </div>
	    <input type="submit" value="등록">
    </form>
  </div>
</div>

<!-- 일정 등록 -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasSchedule" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <h5 id="offcanvasRightLabel2">일정등록</h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    ...
  </div>
</div>


<!-- 공유멤버 리스트 모달 -->	

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title h4" id="myLargeModalLabel">멤버 초대</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<div class="calPartiList-wrap">
					<div class="calPartiList">
						<table class="calPartiList-table">
							<thead class="calPartiList-head">
								<tr>
									<th><input type="hidden"  value="사원번호"></th>
									<th>부서</th>
									<th>사원명</th>
									<th>직급</th>
									<th>이메일</th>
								</tr>
							</thead>
							<tbody id="calPartiList-body"></tbody>
						</table>
					</div>
					<div class="calPartiBtn">
						<button type="button" class="cal-btn" id="plusCal"><i class="bi bi-plus fs-5"></i></button>
						<button type="button" class="cal-btn" id="minusCal"><i class="bi bi-plus fs-5"></i></button>
					</div>
					<div class="calPartiList2">
						<table class="calPartiList-table">
							<thead class="calPartiList-head">
								<tr>
									<th><input type="hidden"  value="사원번호"></th>
									<th>부서</th>
									<th>사원명</th>
									<th>직급</th>
									<th>이메일</th>
								</tr>
							</thead>
							<tbody id="calPartiList-body2"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


	<!-- Required Js -->
<script src="../../../resources/dist/assets/js/vendor-all.min.js"></script>
<script src="../../../resources/dist/assets/js/plugins/bootstrap.min.js"></script>
<script src="../../../resources/dist/assets/js/pcoded.min.js"></script>
</body>

</html>