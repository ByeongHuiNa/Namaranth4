<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page session="false" %>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/scss" href="../../../resources/dist/assets/scss/style.scss" />
<link rel="stylesheet" type="text/css" href="../../../resources/dist/assets/css/style.css" />

<head>
    <title>Flat Able - Premium Admin Template by Phoenixcoded</title>
    <!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 11]>
    	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    	<![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded" />
    <!-- Favicon icon -->
    <link rel="icon" href="../../../resources/dist/assets/images/favicon.ico" type="image/x-icon">

    <!-- vendor css -->
    <link rel="stylesheet" href="../../../resources/dist/assets/css/style.css">
    
<style>
    /* 동적으로 생성되는 테이블에 스타일을 적용하는 클래스 스타일 */
    .doc-content-table table {
        border-collapse: collapse; /* 테이블 셀 병합 */
        border: 1px solid #000;    /* 테이블 테두리 스타일 */
        width: 900px;              /* 테이블 가로 폭 */
    }

    .doc-content-table td {
        border: 1px solid #000;    /* 셀 테두리 스타일 */
        padding: 8px;              /* 셀 안의 여백 */
        text-align: center;         /* 셀 내용 가운데 정렬 */
    }
</style>

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
	<input id="userinfo_name" type="hidden" value="${user.user_name}"/><input id="userinfo_dept" type="hidden" value="${dept}"/><input id="userinfo_position" type="hidden" value="${user.user_position}"/>
	<section class="pcoded-main-container">
    <div class="pcoded-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">메일조회</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="/email/allmail">전체메일함</a></li>
                            <li class="breadcrumb-item"><a href="#!">메일조회</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->
        <div class="row">
            
            <!-- [ form-element ] start -->
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
	                    <button type="button" class="btn  btn-primary">삭제</button>
	                    <button type="button" class="btn  btn-primary">답장</button>
	                    <button type="button" class="btn  btn-primary">전달</button>
                    </div>
                    <div class="card-body">
                        <h5>보낸사람 : <c:out value="${getmail.user_name}" /> <c:out value="${getmail.user_email}" /></h5>
                        <h5>받는사람 : <c:forEach items="${getreceiver}" var="receiver"><c:out value="${receiver.user_name} "/><c:out value="${receiver.user_email} "/>, </c:forEach></h5>
                        <h5><fmt:formatDate pattern="yyyy년 MM월 dd일 a hh시 mm분"
									value="${getmail.mail_regdate}" />
                       </h5>
                        <hr>
                        <div class="row">
                          
                            <div class="col-md-12">
                                <form>
                              
                             		
                                    <div class="form-group">
		                                       
										<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly="readonly">${getmail.mail_content}"</textarea>
										<div class="doc-content-table">${getmail.mail_content}</div>
                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                        
                        
                            
                        </div>
                    </div>
                </div>
                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ form-element ] end -->
        </div>
        <!-- [ Main Content ] end -->

    </div>
</section>
<!-- [ Main Content ] end -->
	<!-- [ Main Content ] end -->
	
    <!-- Warning Section start -->
    <!-- Older IE warning message -->
    <!--[if lt IE 11]>
        <div class="ie-warning">
            <h1>Warning!!</h1>
            <p>You are using an outdated version of Internet Explorer, please upgrade
               <br/>to any of the following web browsers to access this website.
            </p>
            <div class="iew-container">
                <ul class="iew-download">
                    <li>
                        <a href="http://www.google.com/chrome/">
                            <img src="assets/images/browser/chrome.png" alt="Chrome">
                            <div>Chrome</div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.mozilla.org/en-US/firefox/new/">
                            <img src="assets/images/browser/firefox.png" alt="Firefox">
                            <div>Firefox</div>
                        </a>
                    </li>
                    <li>
                        <a href="http://www.opera.com">
                            <img src="assets/images/browser/opera.png" alt="Opera">
                            <div>Opera</div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.apple.com/safari/">
                            <img src="assets/images/browser/safari.png" alt="Safari">
                            <div>Safari</div>
                        </a>
                    </li>
                    <li>
                        <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                            <img src="assets/images/browser/ie.png" alt="">
                            <div>IE (11 & above)</div>
                        </a>
                    </li>
                </ul>
            </div>
            <p>Sorry for the inconvenience!</p>
        </div>
    <![endif]-->
    <!-- Warning Section Ends -->

    <!-- Required Js -->
    <script src="../../../resources/dist/assets/js/vendor-all.min.js"></script>
    <script src="../../../resources/dist/assets/js/plugins/bootstrap.min.js"></script>
	<script src="../../../resources/dist/assets/js/pcoded.min.js"></script>
<!-- Apex Chart -->
<script src="../../../resources/dist/assets/js/plugins/apexcharts.min.js"></script>

<!-- custom-chart js -->
<script src="../../../resources/dist/assets/js/pages/dashboard-main.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    let info = '<span>' + $("#userinfo_dept").val() + "/" + $('#userinfo_position').val() + "</span>";
    $('#username').text($('#userinfo_name').val());
    $('#more-details').prepend(info);
});



</script>

<script type="text/javascript">
    $(document).ready(function() {
        $(".doc-content-table table").addClass("doc-content-table");
        $(".doc-content-table table").removeClass("table table-bordered");
    });
    </script>
</body>

</html>
