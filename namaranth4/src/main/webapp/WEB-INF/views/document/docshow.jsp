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


    .doc-content-table table {
        border-collapse: collapse; 
        border: 1px solid #000;    
        width: 900px;              
    }

    .doc-content-table td {
        border: 1px solid #000;    
        padding: 8px;             
        text-align: center;         
    }
    
    .tb_title{
    	width: 180px;
    }
    
    
    .card-header {
    	display: flex;
    	justify-content: space-between;
    	font-size: 3px;
	}
	
	.header-info {
	    display: flex;
	    flex-direction: column;
	    justify-content: flex-start; /* 왼쪽 정렬 */
	}
	
	.header-info table {
    	font-size: 18px; /* 원하는 글씨 크기로 조절 */
	}
	
	.header-info table td{
		padding: 15px;
	}
	
	.header-info .tb_title {
		font-size: 17px;
		font-weight: bold;
	}
	
    .table-wrapper {
    	margin-left: auto;
	}
	
	.rc_btn{
		margin-top: 15px;
		margin-left: 57%;
	}
    
    #tb{
    position:
    	width:240px;
    	border-collapse: collapse;
    	text-align: center;
    }
    
    #tb th, #tb td{
    	border: 1px solid #000000;
    	width: 110px;
    }
    
	.sec_tb{
    	border:none;
  		
    }
    
    .on_body{
    	padding: 30px;
    	background-color: #
    }
    
    #rc_modal_btn {
    	display: none;
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
		                    <div class="header-info">
		                    	<table>
		                    		<tr>
		                    			<td class="tb_title">제목</td>
		                    			<td>${get.doc_title }</td>
		                    		</tr>
		                    		<tr>
		                    			<td class="tb_title">문서 번호</td>
		                    			<td>${get.doc_no }</td>
		                    		</tr>
		                    		<tr>
		                    			<td class="tb_title">기안자</td>
		                    			<td>${get.user.user_name }</td>
		                    		</tr>                    	
		                    	</table>
		                    	<div>
		                    		<p style="margin-bottom: 2px;">참조자 목록</p>
			                    	<div style="overflow:scroll; overflow-x: hidden; width:500px; height:50px; padding:10px; background-color:#EAEAEA;">
			                    		<c:forEach items="${reflist }" var="list">
											<div class="refList"> ${list.user_name} ${list.user_email} ${list.dept.dept_name } ${list.user_position}</div>
										</c:forEach>
			                    	</div>
		                    	</div>
		                    </div>
		                        <div class="tbl_wrap">
		                    		<table id="tb">
		                    			<tr>
		                    				<th>1차 결재</th>
		                    				<td class="sec_tb" style="border-top: none; border-bottom: none; width: 20px;"></td>
		                    				<th>2차 결재</th>
		                    			</tr>
		                    			<tr>
		                    				<td id="firstApprovalimg"></td>
		                    				<td class="sec_tb" style="border-top: none; border-bottom: none; width: 20px; height: 90px;" ></td>
		                    				<td id="secondApprovalimg"></td>
		                    			</tr>
		                    			<tr>
		                    				<td id="firstApprovalUser" class="selected-boxs">${first_app.user_position }  ${first_app.user_name }</td>
		                    				<td class="sec_tb" style="border-top: none; border-bottom: none; width: 20px;"></td>
		                    				<td id="secondApprovalUser" class="selected-boxs">${second_app.user_position } ${second_app.user_name }</td>
		                    			</tr>
		                    		</table>
		                    		<div class="rc_btn">
		                    			<button type="button" id="rc_modal_btn" class="btn  btn-primary" data-toggle="modal" data-target="#rejContentModal">반려 의견</button>
		                    		</div>
		                    	</div>
		                    	
		                    </div>
		                    
		                    
		                    <!-- [Document contents] -->
		                    <div class="card-body">
		                    	<div class="on_body">
									<div class="doc-content-table">${get.doc_content}</div>
								</div>
								
								
								
								<button type="button" id="app_modal_btn" class="btn  btn-primary" data-toggle="modal" data-target="#appModal">결재</button>
		                    	<button type="button" id="rej_modal_btn" class="btn  btn-primary" data-toggle="modal" data-target="#rejModal">반려</button>
		                    	<button type="button" id="ref_modal_btn" class="btn  btn-primary" data-toggle="modal" data-target="#refModal">참초</button>
		                    	
		                    	
		                    </div>
		                    
		                </div>
		            </div>
		        </div>
		        <!-- ref list -->
				
				<!-- app modal -->
				
						<div class="modal fade" id="appModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">결재</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<form id="app_form" action="/document/docApp" method="post">
											<div class="form-group">
												<label for="recipient-name" class="col-form-label">결재하시겠습니까?</label>
											</div>
											<div class="form-group">
												<input type="hidden" name="doc_no" value="${get.doc_no }">
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn  btn-secondary" data-dismiss="modal">닫기</button>
										<button type="button" class="btn  btn-primary" id="app_submit_btn">확인</button>
									</div>
								</div>
							</div>
						</div>
				
				
				
				
				
				<!-- reject modal -->
				
						<div class="modal fade" id="rejModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">반려</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<form id="rej_form" action="/document/docRej" method="post">
											<div class="form-group">
												<label for="recipient-name" class="col-form-label">반려 의견 작성</label>
											</div>
											<div class="form-group">
												<input type="hidden" name="doc_no" value="${get.doc_no }">
												<label for="message-text" class="col-form-label">의견작성:</label>
												<textarea class="form-control" name="docrej_content" id="message-text"></textarea>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn  btn-secondary" data-dismiss="modal">닫기</button>
										<button type="button" class="btn  btn-primary" id="rej_submit_btn">확인</button>
									</div>
								</div>
							</div>
						</div>
						
						
				<!-- reference modal -->
				
						<div class="modal fade" id="refModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">참조 추가</h5>
									<form id="ref_form" action="/document/docRef" method="post">
										<input type="hidden" name="doc_no" value="${get.doc_no }">
										<input type="hidden" id="userNoList" name="refUserList" value="">
									</form>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									
										<div class="modal-body">
												<div id="SelectedRefUser">
														
												</div>
												<div class="form-group">	
													<label for="recipient-name" class="col-form-label">참조 추가</label>
													<input type="text" class="form-control" id="refInput">
												</div>
												<div class="form-group">
													<label for="message-text" class="col-form-label">리스트</label>
													<div id="refSearchResults" style="display: none;">
													    <!-- 검색 결과를 드롭다운으로 표시할 영역 -->
													</div>
												</div>
										</div>
									
									<div class="modal-footer">
										<button type="button" class="btn  btn-secondary" data-dismiss="modal">닫기</button>
										<button type="button" class="btn  btn-primary" id="ref_submit_btn">확인</button>
									</div>
								</div>
							</div>
						</div>
						
						<!-- rej content modal -->
						<div id="rejContentModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalCenterTitle">반려 의견</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<p class="mb-0">${rejContent }</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn  btn-secondary" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
				
				
				<input type="hidden" id="firstAppCheck" value="${first_app_check}">
				<input type="hidden" id="secondAppCheck" value="${second_app_check}">
				<input type="hidden" id="first_app_user_no" value="${first_app.user_no}">
				<input type="hidden" id="second_app_user_no" value="${second_app.user_no}">
				<input type="hidden" id="login_user_no" value="${login.user_no }"/>
				
		        
		        <!-- [ Main Content ] end -->
	    	</div>
	    	
	    	<input id="userinfo_name" type="hidden" value="${user.user_name}"/>
			<input id="userinfo_dept" type="hidden" value="${dept}"/>
			<input id="userinfo_position" type="hidden" value="${user.user_position}"/>
	    	
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
	    let info = '<span>' + $("#userinfo_dept").val() + "/" + $('#userinfo_position').val() + "</span>";
	    $('#username').text($('#userinfo_name').val());
	    $('#more-details').prepend(info);
	});
	
	</script>
    
    <script type="text/javascript">
    $(document).ready(function() {
    	
    	
    	var firstAppCheck = $('#firstAppCheck').val();
    	var secondAppCheck = $('#secondAppCheck').val();
    	var first_app_user = $('#first_app_user_no').val();
    	var second_app_user = $('#second_app_user_no').val();
    	var login_user = $('#login_user_no').val();
    	var userNoList = [];
    	var refInput = $('#userNoList');
    	
    	
    	console.log(firstAppCheck);
    	console.log(secondAppCheck);
    	console.log(login_user);
    	console.log(first_app_user);
    	console.log(second_app_user);
    	
        $(".doc-content-table table").addClass("doc-content-table");
        $(".doc-content-table table").removeClass("table table-bordered");
        
        
        $("#app_submit_btn").click(function() {
            $("#app_form").submit();
        });
        
        $("#rej_submit_btn").click(function() {
            $("#rej_form").submit();
        });
        
        $("#ref_submit_btn").click(function() {
            $("#ref_form").submit();
        });
        
        
        //로그인한 사용자에 따라 button의 hide 여부
        if(firstAppCheck =='rej' || secondAppCheck =='rej'){
        	$("#rc_modal_btn").show();
        }
        
        if(first_app_user != login_user && second_app_user != login_user ){
        	 $("#app_modal_btn").hide();
        	 $("#rej_modal_btn").hide();
        }
        
        if(first_app_user == login_user){
        	if(firstAppCheck=='app' || firstAppCheck=='rej'){
        		$("#app_modal_btn").hide();
           		$("#rej_modal_btn").hide();
        	}
        }
        
        if(second_app_user == login_user){
        	if(firstAppCheck=='app'){
        		$("#app_modal_btn").show();
           		$("#rej_modal_btn").show();
           		if(secondAppCheck=='app'||secondAppCheck=='rej'){
           			$("#app_modal_btn").hide();
               		$("#rej_modal_btn").hide();
           		}
        	}else if(secondAppCheck=='app'||secondAppCheck=='rej'){
        		$("#app_modal_btn").hide();
           		$("#rej_modal_btn").hide();
        	}else{
        		$("#app_modal_btn").hide();
           		$("#rej_modal_btn").hide();
        	}
        }
        
        
        
        

        if (firstAppCheck == 'app') {
			firstcreateImage("../../../resources/dist/assets/images/app/app.png", "100", "100", "Approval");
        } else if (firstAppCheck == 'rej') {
        	firstcreateImage("../../../resources/dist/assets/images/app/rej.png", "100", "100", "Rejection");
        }
        
        if (secondAppCheck == 'app') {
        	secondcreateImage("../../../resources/dist/assets/images/app/app.png", "100", "100", "Approval");
          } else if (secondAppCheck == 'rej') {
			secondcreateImage("../../../resources/dist/assets/images/app/rej.png", "100", "100", "Rejection");
        }
        
        
        
      //결재자 추가
        $("#refInput").on("focus keyup", function() {
			console.log(1);
	        var input = $(this).val();
	        var searchResults = $("#refSearchResults");
	        var refInput = $("#refInput");
	        $.ajax({
	          url: "/searchApprovalUser",
	          type: "GET",
	          data: { keyword: input },
	          dataType: "json",
	          success: function(response) {
	            // 서버로부터 받은 결재자 목록(response)을 화면에 표시하거나 자동완성 결과로 사용
	            searchResults.empty(); // 기존 결과 초기화
	            var filteredResults = response.filter(function(refData) {
	                // 입력한 글자가 포함된 결재자들만 필터링하여 반환
	                return refData.user_name.includes(input) ||
	                refData.user_email.includes(input) ||
	                refData.dept.dept_name.includes(input) ||
	                refData.user_position.includes(input);
	              });
	            
	            filteredResults.forEach(function(refData) {
	            	var resultItem = $("<div>", {
	                    text: refData.user_position + 
				  	      "\t" + refData.user_name +
			  	          "\t" + refData.user_email +
			  	          "\t" + refData.dept.dept_name,
	                    class: "result-items"
	                  });
	              resultItem.on("click", function() {
						refInput.empty();
						searchResults.hide();
						SelectRefUser(refData);
						console.log(refData);
	                	//$("#first_app_input").val(refData.user_no);
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
	            console.error("Error fetching select users:", error);
	          }
	        });
      });
        
        
        function firstcreateImage(src, width, height, alt) {
      	  var img = $('<img />', {
      	    src: src,
      	    width: width,
      	    height: height,
      	    alt: alt
      	  });

      	  $('#firstApprovalimg').append(img);
      	}
      function secondcreateImage(src, width, height, alt) {
    	  var img = $('<img />', {
    	    src: src,
    	    width: width,
    	    height: height,
    	    alt: alt
    	  });

    	  $('#secondApprovalimg').append(img);
    	}
        
        
        function SelectRefUser(selectdata) {
        	var selectedBox = $("#SelectedRefUser");
        	//중복값 안들어가게
        	if(!userNoList.includes(selectdata.user_no)){
	            // 선택한 결재자 정보를 하나의 박스로 표시
	            var selectedContent = $("<div>").text(
	            		selectdata.user_position + 
	    				" " + selectdata.user_name
	            );
	            
	            
	            
	            console.log(selectedContent);
	            selectedBox.append(selectedContent);
	            addUserList(selectdata.user_no);
	            console.log(userNoList);
	            
	            selectedContent.on("click", function() {
	                removeUserList(selectdata.user_no);
	                selectedContent.remove(); // 박스를 화면에서 제거
	             });
	            
        	}
    	}
        
        function addUserList(userNo) {
        	userNoList.push(userNo);
            updateRefInput();
    	}
        
        function removeUserList(userNo) {
            var index = userNoList.indexOf(userNo);
            if (index !== -1) {
              userNoList.splice(index, 1);
              updateRefInput();
            }
    	}
        
        function updateRefInput() {
        	refInput.val(userNoList.join(','));
    	}
        
        
        
    });
    
   
    
    
  
	
    
    
    
    
    
    
    
    

    </script>
</body>
</html>