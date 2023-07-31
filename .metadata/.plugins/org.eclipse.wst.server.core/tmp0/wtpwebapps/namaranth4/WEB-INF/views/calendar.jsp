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
    <title>게시판</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded" />
    <!-- Favicon icon -->
    <link rel="icon" href="../../resources/dist/assets/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
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
<%@include file="layouts/nav.jsp"%>
<!-- [ navigation menu ] end -->

<!-- [ Header ] start -->
<%@include file="layouts/header.jsp"%>
<!-- [ Header ] end -->
	
<!-- [ Main Content ] start -->
<section class="pcoded-main-container">
	<div id='calendar'></div>
</section>

	<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			headerToolbar : { // 헤더에 표시할 툴 바
				start : 'prev next today',
				center : 'title',
				end : 'dayGridMonth,dayGridWeek,dayGridDay'
			},
			titleFormat : function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			},
			//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			selectable : true, // 달력 일자 드래그 설정가능
			droppable : true,
			editable : true,
			nowIndicator: true, // 현재 시간 마크
			locale: 'ko' // 한국어 설정
		});
		calendar.render();
	});
	</script>

    <!-- Required Js -->
    <script src="../../resources/dist/assets/js/vendor-all.min.js"></script>
    <script src="../../resources/dist/assets/js/plugins/bootstrap.min.js"></script>
    <script src="../../resources/dist/assets/js/pcoded.min.js"></script>
</body>
</html>