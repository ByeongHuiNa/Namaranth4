<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page session="false" %>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/scss" href="../../../resources/dist/assets/scss/style.scss" />
<link rel="stylesheet" type="text/css" href="../../../resources/dist/assets/css/style.css" />
<link rel="stylesheet" href="../../../resources/dist/assets/css/summernote-lite.css">

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
	
	<input id="userinfo_name" type="hidden" value="${user.user_name}"/>
	<input id="userinfo_dept" type="hidden" value="${dept}"/>
	<input id="userinfo_position" type="hidden" value="${user.user_position}"/>
	<section class="pcoded-main-container">
    <div class="pcoded-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">메일작성</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#!">E-Mail</a></li>
                            <li class="breadcrumb-item"><a href="#!">메일작성</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->
        <input id="userinfo_name" type="hidden" value="${user.user_name}"/><input id="userinfo_dept" type="hidden" value="${dept}"/><input id="userinfo_position" type="hidden" value="${user.user_position}"/>
        
        <div class="row">
            
            <!-- [ form-element ] start -->
            <form role="form" action="/email/register" method="post">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
	                    
	                    <button type="submit" class="btn  btn-primary" id="registerButton">전송</button>
	                   
	                    <button type="submit" formaction="/email/tsregister" class="btn  btn-primary" id="tsButton">임시저장</button>
                    </div>
                    
                    <div class="card-body">
                         <input id="userinfo_no "type="hidden" name="user_no" value="${user.user_no}"/>
                         
                         <h5>제목<input type="text" name="mail_title" style="margin-left: 35px"/> </h5>
                         <h5>받는사람 <input type="text" id ="firstSearchInput" name="receiver_no"/> </h5>
                        <div id="fisrtSearchResults" style="display: none;">
												    <!-- 검색 결과를 드롭다운으로 표시할 영역 -->
						</div>
						
                        
                        
                        <hr>
                        <div class="row">
                          
                            <div class="col-md-12">
                                <form>
                              
                             		
                                    <div class="form-group">
                                       
                                        <textarea class="form-control" id="summernote" name="mail_content" rows="3" readonly="readonly"></textarea>
                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                        
                        
                            
                        </div>
                    </div>
                </div>
                	
                </form>
                
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
	
	<script src="../../../resources/dist/assets/js/summernote-lite.js"></script>
	<script src="../../../resources/dist/assets/js/lang/summernote-ko-KR.js"></script>
<!-- Apex Chart -->
<script src="../../../resources/dist/assets/js/plugins/apexcharts.min.js"></script>

<!-- custom-chart js -->
<script src="../../../resources/dist/assets/js/pages/dashboard-main.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    let info = '<span>' + $("#userinfo_dept").val() + "/" + $('#userinfo_position').val() + "</span>";
    $('#username').text($('#userinfo_name').val());
    $('#more-details').prepend(info);
    
    
    
    $("#tsButton").on("click", function() {
        // 버튼이 클릭되면 아래의 코드 블록이 실행됩니다.
        alert("메일을 임시저장 하였습니다.");
    });
    
    $("#registerButton").on("click", function (e) {
        e.preventDefault(); // 기본 동작(폼 제출)을 막습니다.

        // 받는 사람(input 요소)의 value를 가져옵니다.
        const receiverNo = $("#firstSearchInput").val();

        // 받는 사람이 비어있을 경우에는 alert 창을 띄웁니다.
        if (receiverNo === "") {
            alert("받는 사람을 입력해주세요!");
        } else {
        	alert("메일전송을 하였습니다.");
            // 받는 사람이 입력되었을 경우에는 폼을 제출합니다.
            // 폼의 ID를 가지고 있는 부모 요소를 찾고, 해당 폼을 submit합니다.
            $(this).closest("form").submit();
        }
    });
    
});

</script>

<script type="text/javascript">
$(document).ready(function() {
	
	
	//써머노트
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
          
	});

	
	//결재자 추가
	$("#firstSearchInput").on("focus keyup", function() {
			
	        var input = $(this).val();
	        var searchResults = $("#fisrtSearchResults");
	        var firstSearchInput = $("#firstSearchInput");
	        $.ajax({
	          url: "/searchApprovalUser",
	          type: "GET",
	          data: { keyword: input },
	          dataType: "json",
	          success: function(response) {
	            // 서버로부터 받은 결재자 목록(response)을 화면에 표시하거나 자동완성 결과로 사용
	            searchResults.empty(); // 기존 결과 초기화
	            var filteredResults = response.filter(function(approverData) {
	                // 입력한 글자가 포함된 결재자들만 필터링하여 반환
	                return approverData.user_name.includes(input) ||
	                       approverData.user_email.includes(input) ||
	                       approverData.dept.dept_name.includes(input) ||
	                       approverData.user_position.includes(input);
	              });
	            
	            filteredResults.forEach(function(approverData) {
	            	var resultItem = $("<div>", {
	                    text: approverData.user_position + 
				  	      "\t" + approverData.user_name +
			  	          "\t" + approverData.user_email +
			  	          "\t" + approverData.dept.dept_name,
	                    class: "result-items"
	                  });
	              resultItem.on("click", function() {
	            	firstSearchInput.empty();
	                searchResults.hide();
	                firstSelectApprovalUser(approverData);
	                $("#firstSearchInput").val(approverData.user_no);
	                $(".modal-footer").find('[data-dismiss="modal"]').trigger("click");
	              });
	              searchResults.append(resultItem);
	            });

	            // 검색 결과가 있을 경우 드롭다운 표시, 없을 경우 숨김 처리
	            if (response.length > 0) {
	              searchResults.show();
	            } else {
	              searchResults.hide();
	            }
	          },
	          error: function(error) {
	            console.error("Error fetching approval users:", error);
	          }
	        });
      });
	
	

      // 사용자가 드롭다운 항목을 선택했을 때 실행되는 함수
      function firstSelectApprovalUser(approverData) {
        var firstSearchInput = $("#firstSearchInput");
        firstSearchInput.empty(); // 기존 박스 초기화

        // 선택한 결재자 정보를 하나의 박스로 표시
        var selectedContent = $("<div>").text(
        				approverData.user_position + 
		  	      " " + approverData.user_name
        );
        firstSearchInput.append(selectedContent);
      }
      
  

      
      /* // 검색 결과를 화면에 표시하는 함수
      function displaySearchResults(response) {
	        var searchResults = $("#searchResults");
	        searchResults.empty(); // 기존 결과 초기화
	        response.forEach(function(approverData) {
	        	var resultItem = $("<div>", {
	                text: "이름: " + approverData.user_name +
	                      ", 이메일: " + approverData.user_email +
	                      ", 부서: " + approverData.dept.dept_name,
	                class: "result-items"
	              });
	          resultItem.on("click", function(event) {
				event.stopPropagation();
	            $("#searchInput").val(approverData.user_name);
	            searchResults.hide();
	            selectApprovalUser(approverData); // 선택한 결재자 정보를 박스로 표시
	            $(".modal-footer").find('[data-dismiss="modal"]').trigger("click");
	          });
	          searchResults.append(resultItem);
	        });

        // 검색 결과가 있을 경우 드롭다운 표시, 없을 경우 숨김 처리
        if (response.length > 0) {
          searchResults.show();
        } else {
          searchResults.hide();
        }
      } */


});



</script>

</body>


</html>
