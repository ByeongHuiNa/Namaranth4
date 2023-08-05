<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	    	<div class="col-md-2 appside">
	    	
	    		<!-- [ Side Content ] start-->
				<div class="page-header-title m-t-10">
						<h4 class="m-t-10 m-b-20">전자결재</h4>
				</div>
				<div>
					<button type="button" class="btn btn-primary regi_btn" id="doc_regi_btn">기안작성</button>
				</div>
					
			</div>
	    	
	    	<div class="col-md-10">
	    		<!-- [ breadcrumb ] start -->
		        <div class="page-header">
		            <div class="page-block">
		                <div class="row align-items-center">
		                    <div class="col-md-12">
		                        <div class="page-header-title m-t-20">
		                            <h5 class="m-b-10">결재완료문서함</h5>
		                        </div>
		                        <ul class="breadcrumb">
		                            <li class="breadcrumb-item"><a href="index.html"><i class="feather icon-home"></i></a></li>
		                            <li class="breadcrumb-item"><a href="#!">결재완료문서함</a></li>
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
		                        <h5>Basic Component</h5>
		                    </div>
		                    
		                    <!-- [table] -->
		                    <div class="card-body table-border-style">
		                        <div class="table-responsive">
		                            <table class="table table-hover">
		                                <thead>
		                                    <tr>
		                                        <th>문서번호</th>
		                                        <th>제목</th>
		                                        <th>기안자</th>
		                                        <th>결재상태</th>
		                                        <th>기안일자</th>
		                                    </tr>
		                                </thead>
		                                <tbody id="doc_list">
		                                    <c:forEach items="${list }" var="list">
		                                    	<tr class="list_btn">
		                                    		<td class="doc_no">${list.doc_no}</td>
		                                    		<td>${list.doc_title}</td>
		                                    		<td>${list.user.user_name }</td>
		                                    		<td>${list.doc_status}</td>
		                                    		<td><fmt:formatDate value="${list.doc_regdate}" pattern="yy년 MM월 dd일 HH:mm"/></td>
		                                    		<%-- <td>${list.doc_regdate}</td> --%>
		                                    				                                    		
		                                    	</tr>
		                                    </c:forEach>
		                                </tbody>
		                            </table>
		                        </div>
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
    
    <!-- button custom -->
    <script type="text/javascript">
	    $(document).ready(function() {
	    	
	    	//문서리스트 중 하나를 클릭 했을 경우 문서를 조회하는 버튼
	        $("#doc_list").on("click", ".list_btn", function() {
	            // 클릭한 행의 doc_no 값을 가져오기
	           	var docNo = $(this).find(".doc_no").text();    
	            // 클릭한 행의 doc_no 값을 이용하여 이동할 URL 생성
	            var url = "/document/docshow?doc_no=" + docNo;
	            // URL로 페이지 이동
	            window.location.href = url;
	        });
	    	
	    	//문서작성 버튼을 클릭할 경우 문서작성으로 이동하는 코드
	        $("#doc_regi_btn").on("click", function() {    
	            var url = "/document/docregi";
	            window.location.href = url;
	        });
	        
	        
	    });
    </script>
</body>
</html>