<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/scss" href="../../../resources/dist/assets/scss/style.scss" />
<link rel="stylesheet" type="text/css" href="../../../resources/dist/assets/css/style.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/dist/assets/css/docstyle.css" />
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
<section class="pcoded-main-container">

    <div class="col-md-12">
    	<div class="row">
	    	
	    	
	    	<div class="col-md-12">
	    	
	    		<!-- [ breadcrumb ] start -->
		        <div class="page-header">
		            <div class="page-block">
		                <div class="row align-items-center">
		                    <div class="col-md-12">
		                        <div class="page-header-title m-t-20">
		                            <h5 class="m-b-10">문서</h5>
		                        </div>
		                        <ul class="breadcrumb">
		                            <li class="breadcrumb-item"><a href="index.html"><i class="feather icon-home"></i></a></li>
		                            <li class="breadcrumb-item"><a href="#!">기안문서</a></li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <!-- [ breadcrumb ] end -->
	    	
	    		<!-- [ Main Content ] start -->
		        <div class="row">
		            <div class="col-sm-12">
		                <div class="card borderless">
		                    <div class="card-header">
		                        <h5>문서</h5>
		                    </div>
		                    
		                    <!-- [Document contents] -->
		                    <div class="card-body">
		                    	<form>
		                    		문서번호 : <input name="doc_title" value="${get.doc_no }" readonly="readonly"/>
		                    		제목 : <input name="doc_title" value="${get.doc_title }" readonly="readonly"/>
		                    		기안자: <input name="user_name" value="${get.user.user_name }" readonly="readonly"/>
									<div class="doc-content-table">${get.doc_content}</div>
									</form>
		                    </div>
		                    
		                    
		                </div>
		            </div>
		        </div>
		        <!-- [ Main Content ] end -->
	    	</div>
    	</div>
    </div>
    
        
        
        

</section>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../../resources/dist/assets/js/vendor-all.min.js"></script>
    <script src="../../../resources/dist/assets/js/plugins/bootstrap.min.js"></script>
    <script src="../../../resources/dist/assets/js/pcoded.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        $(".doc-content-table table").addClass("doc-content-table");
        $(".doc-content-table table").removeClass("table table-bordered");
    });
    </script>
</body>
</html>