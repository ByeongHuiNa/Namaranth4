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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
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
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">일정등록</button>
			<div class='calendar-list-wrap'>
			<div id="calendar-list-title">내 캘린더</div>
				<table class="calendar-list">
					<c:forEach items="${list}" var="calendar">
							<tr>
								<td><div class="text-with-box">
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

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <h5 id="offcanvasRightLabel">Offcanvas right</h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    ...
  </div>
</div>	

<script>


	 document.addEventListener('DOMContentLoaded', function() {
		 $.ajax({
		        url: "/calendar/getList", // 서버 측 API 엔드포인트 URL
		        type: 'GET',
		        dataType: 'json',
		        success: function(data) {
		          var events = [];

		          // 서버에서 받아온 데이터를 FullCalendar 이벤트 형식으로 변환합니다.
		          data.forEach(function(item) {  
		          	if(item.sch_allday == 1){
		          		events.push({
				              title: item.sch_name,
				              start: moment(item.sch_start).format("YYYY-MM-DDTHH:mm:ss"),
				              allday: true
				        });
		          	}else {
		          		events.push({
				              title: item.sch_name,
				              start: moment(item.sch_start).format("YYYY-MM-DDTHH:mm:ss"),
				              end: moment(item.sch_end).format("YYYY-MM-DDTHH:mm:ss"),
				              allday: false
				        });
		         	}
		    	});  //forEach 
		    	
		        var calendarEl = document.getElementById('calendar');
		  		var calendar = new FullCalendar.Calendar(calendarEl, {
		  			initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		  			headerToolbar : { // 헤더에 표시할 툴 바
		  				start : 'today,listWeek',
		  				center : 'prev title next',
		  				end : 'dayGridMonth,dayGridWeek,dayGridDay'
		  			},
		  			titleFormat : function(date) {
		  				return date.date.year + '년 '
		  						+ (parseInt(date.date.month) + 1) + '월';
		  			},
		  			dayCellContent: function(e){
		  				e.dayNumberText = e.dayNumberText.replace('일','');
		  			},
		  			//initialDate:  // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
		  			selectable : true, // 달력 일자 드래그 설정가능
		  			droppable : true,
		  			editable : true,
		  			nowIndicator : true, // 현재 시간 마크
		  			locale : 'ko', // 한국어 설정
		  			height : 830,
		  			events : events
		  			
		  		}); //fullcalendar
		  		calendar.render();	
		    	
		     } //success	  
		 });//ajax
		

	});//document
	 
	
</script>

<!-- Required Js -->
<script src="../../../resources/dist/assets/js/vendor-all.min.js"></script>
<script src="../../../resources/dist/assets/js/plugins/bootstrap.min.js"></script>
<script src="../../../resources/dist/assets/js/pcoded.min.js"></script>
</body>
</html>