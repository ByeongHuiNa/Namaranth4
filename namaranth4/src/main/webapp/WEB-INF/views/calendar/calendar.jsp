<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet">
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
<style type="text/css">
	.bootstrap-datetimepicker-widget{
		width:50px;
	}
</style>

</head>
<body class="">
<input id="userinfo_name" type="hidden" value="${user.user_name}"/>
<input id="userinfo_dept" type="hidden" value="${dept}"/>
<input id="userinfo_position" type="hidden" value="${user.user_position}"/>
<input id="userinfo_profile" type="hidden" value="${user.user_profile}" />
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
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasCalendar" aria-controls="offcanvasRight"><i class="bi bi-plus fs-10" id="whitePlus"></i></button></div>
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
								<td id="cal-share"><!-- 공유캘린더 -->
									<c:if test="${calendar.sharedCalendar}"><i class="bi bi-people-fill"></i></c:if>
								</td>	
								<td id="cal-const"><!-- 생성자 수정 -->
									<c:if test="${user.user_no eq calendar.users.user_no}"><button type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCalUpdate" aria-controls="offcanvasRight" id="cal-const-update-btn" data-calno="${calendar.cal_no}"><i class="bi bi-gear"></i></button></c:if>
								</td>							
								<td><!-- 생성자 삭제-->
            						<c:if test="${user.user_no eq calendar.users.user_no}"><button type="button" id="cal-const-delete-btn" data-bs-toggle="modal" data-bs-target="#deleteModal" data-calno="${calendar.cal_no}"><i class="bi bi-trash3"></i></button></c:if>
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
    <h4 class="offcanvasRightLabel">내 캘린더 추가</h4>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
  	<form action="/calendar/register" method="post" id="createCal-form">
	    <div class="form-group">
	    	<label class="floating-label">캘린더명</label>
	        <input type="text" class="form-control" name="cal_name">
	    </div>
	    <div class="form-group">
	    	<input type="hidden" name="users.user_no" value="${user.user_no }"/>
	    </div>
	    <div class="form-group">
	    	<label class="floating-label">캘린더 색상</label>
	    	<div>
	    		<button type="button" class="color-box selected" style="background-color:#8B0000" value="#8B0000"></button>
		    	<button type="button" class="color-box selected" style="background-color:#FF8C00" value="#FF8C00"></button>
		    	<button type="button" class="color-box selected" style="background-color:#FFD700" value="#FFD700"></button>
		    	<button type="button" class="color-box selected" style="background-color:#006400" value="#006400"></button>
		    	<button type="button" class="color-box selected" style="background-color:#00008B" value="#00008B"></button>
		    	<button type="button" class="color-box selected" style="background-color:#4B0082" value="#800080"></button>
	    	</div>     
	    	
	        <input type="hidden" class="form-control color-input" name="cal_color">
	    </div>
	    <div class="form-group">
	    	<label class="floating-label">공유 멤버</label>
	    	<button type="button" class="btn btn-primary" id="calParti-btn" data-toggle="modal" data-target="#shareModal"><i class="bi bi-plus fs-10" id="blackPlus"></i></button>
	    	<div class="calParti-fin">
	    		<table id="calParti-fin-table"></table>
	    	</div>
	        <!-- <input type="text" class="form-control" name="calParti_no[]">
	        <input type="text" class="form-control" name="calParti_no[]">
	        <input type="text" class="form-control" name="calParti_no[]"> -->
	    </div>
	    <div class="form-group">
	    	<label class="floating-label">설명</label>
	        <input type="text" class="form-control" name="cal_con" >
	    </div>
	    <div class="buttonCenter">
	    	<button type="button" class="submitCancel" data-bs-dismiss="offcanvas">취소</button>
	    	<button type="submit" class="submitBtn">등록</button>
	    </div>
	    
    </form>
  </div>
</div>

<!-- calendar 수정 -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasCalUpdate" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <h4 id="offcanvasRightLabel1">내 캘린더 수정</h4>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
  	<form action="/calendar/update" method="post" id="updateCal-form">
	    <div class="form-group">
	    	<label class="floating-label">캘린더명</label>
	        <input type="text" class="form-control" name="cal_name">
	    </div>
	    <div class="form-group">
	    	<input type="hidden" name="users.user_no" value="${user.user_no }"/>
	    	<input type="hidden" name="cal_no"/>
	    </div>
	    <div class="form-group">
	    	<label class="floating-label">캘린더 색상</label>
	    	<div>
	    		<button type="button" class="color-box selected" style="background-color:#8B0000" value="#8B0000"></button>
		    	<button type="button" class="color-box selected" style="background-color:#FF8C00" value="#FF8C00"></button>
		    	<button type="button" class="color-box selected" style="background-color:#FFD700" value="#FFD700"></button>
		    	<button type="button" class="color-box selected" style="background-color:#006400" value="#006400"></button>
		    	<button type="button" class="color-box selected" style="background-color:#00008B" value="#00008B"></button>
		    	<button type="button" class="color-box selected" style="background-color:#4B0082" value="#800080"></button>
	    	</div>     
	    	
	        <input type="hidden" class="form-control color-input" name="cal_color">
	    </div>
	    <div class="form-group">
	    	<label class="floating-label">공유 멤버</label>
	    	<button type="button" class="btn btn-primary" id="calParti-btn2" data-toggle="modal" data-target="#shareUpdateModal"><i class="bi bi-plus fs-10" id="blackPlus"></i></button>
	    	<div class="calParti-fin">
	    	<table id="calParti-fin-table2">
	    	</table>
	    	</div>
	        <!-- <input type="text" class="form-control" name="calParti_no[]">
	        <input type="text" class="form-control" name="calParti_no[]">
	        <input type="text" class="form-control" name="calParti_no[]"> -->
	    </div>
	    <div class="form-group">
	    	<label class="floating-label">설명</label>
	        <input type="text" class="form-control" name="cal_con" >
	    </div>
	    <div class="buttonCenter">
	    	<button type="button" class="submitCancel" data-bs-dismiss="offcanvas">취소</button>
	    	<button type="submit" class="submitBtn">수정</button>
	    </div>
	    
    </form>
  </div>
</div>

<!-- 일정 등록 -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasSchedule" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <h4 class="offcanvasRightLabel">일정등록</h4>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <form action="/calendar/regiSch" method="post" id="createSch-form">
    
		<div class="form-group">
	    	<label class="floating-label" for="dropdown">캘린더명</label>
	    	<select id="dropdown" class="form-control" name="calendar.cal_no">
	    		<option>캘린더를 선택하세요</option>
	    		<c:forEach items="${list}" var="calendar">	    			
	    			<option value="${calendar.cal_no }">${calendar.cal_name }</option>
	    		</c:forEach>
			</select>
	    </div>
	    <div class="form-group">
	    	<label class="floating-label">일정명</label>
	        <input type="text" class="form-control" name="sch_name">
	    </div>
	    <div class="form-group">
	    	<input type="hidden" name="users.user_no" value="${user.user_no }"/>
	    </div>
	    	    	    
	    
	   	<div class="form-group">
	    	<label class="floating-label">시작</label>
	    	<input type="datetime-local" class="form-control day-time" id="datetimepicker1">
	    	<input type="hidden" id="datetimeStart" name="start">
	    </div>
	    	    	   	    
	    
	    <div class="form-group">	
	    	<label class="floating-label">종료</label>
	    	<input type="datetime-local" class="form-control day-time" id="datetimepicker2">
	    	<input type="hidden" id="datetimeEnd" name="end">
	    </div>
	    
	    <!-- <div class="form-group">
	    	<label class="floating-label">종일</label>
	    	<input type="checkbox" class="alldayCheck" name="sch_allday" value="0">
	    </div> -->
	    
	    <div class="form-group">
	    	<label class="floating-label">종일</label>
	    	<input type="checkbox" class="alldayCheck">
	    	<input type="hidden" id="alldayInput" name="sch_allday">
	    </div>
	    
	    
	    
	    <div class="form-group">
          <label class="floating-label">장소</label>
           <input type="text" class="form-control" name="sch_place" >
       	</div>
	    
	    
	    <div class="form-group">
	    	<label class="floating-label">설명</label>
	        <input type="text" class="form-control" name="sch_con" >
	    </div>
	    <div class="buttonCenter">
	    	<button type="button" class="submitCancel" data-bs-dismiss="offcanvas">취소</button>
	    	<button type="submit" class="submitBtn">등록</button>
	    </div>
	    
    </form>
  </div>
</div>


<!-- 공유멤버 리스트 모달 -->	

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" id="shareModal" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
						<button type="button" class="cal-btn" id="minusCal"><i class="bi bi-dash"></i></button>
					</div>
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
							<tbody id="calPartiList-body2"></tbody>
						</table>
					
					</div>
				</div>					
			</div>
			<div class="modal-footer">
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        		<button type="button" class="btn btn-primary" id="cPartiOk" data-dismiss="modal">선택</button>
      		</div>
		</div>
	</div>
</div>


<!-- 수정 공유멤버 모달 -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" id="shareUpdateModal" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
							<tbody id="calPartiList-body3"></tbody>
						</table>
					</div>
					<div class="calPartiBtn">
						<button type="button" class="cal-btn" id="plusCal2"><i class="bi bi-plus fs-5"></i></button>
						<button type="button" class="cal-btn" id="minusCal2"><i class="bi bi-dash"></i></i></button>
					</div>
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
							<tbody id="calPartiList-body4"></tbody>
						</table>
					
					</div>
				</div>					
			</div>
			<div class="modal-footer">
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        		<button type="button" class="btn btn-primary" id="cPartiOk2" data-dismiss="modal">선택</button>
      		</div>
		</div>
	</div>
</div>


<!-- 캘린더 삭제 모달 -->

<div id="deleteModal" class="modal fade" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">캘린더 삭제</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p class="mb-0">캘린더의 일정도 모두 삭제됩니다.</p>
				<p class="mb-0">정말로 삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn  btn-secondary" id="cancelDeleteBtn"
					data-dismiss="modal">취소</button>
				<button type="button" class="btn  btn-primary" id="confirmDeleteBtn" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>



<!-- 일정 조회 모달 ... 다음에 꼭 하자..-->
<!-- <div id="readModal" class="modal fade" tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">캘린더 삭제</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p class="mb-0">정말로 삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn  btn-secondary" id="cancelDeleteBtn"
					data-dismiss="modal">취소</button>
				<button type="button" class="btn  btn-primary" id="confirmDeleteBtn">확인</button>
			</div>
		</div>
	</div>
</div> -->

<script type="text/javascript">
$(document).ready(function() {
    let info = '<span>' + $("#userinfo_dept").val() + "/" + $('#userinfo_position').val() + "</span>";
    $('#username').text($('#userinfo_name').val());
    $('#more-details').prepend(info);
    $('#userprofile').attr("src", $('#userinfo_profile').val());
});

</script>

	<!-- Required Js -->
<script src="../../../resources/dist/assets/js/vendor-all.min.js"></script>
<script src="../../../resources/dist/assets/js/plugins/bootstrap.min.js"></script>
<script src="../../../resources/dist/assets/js/pcoded.min.js"></script>
</body>

</html>