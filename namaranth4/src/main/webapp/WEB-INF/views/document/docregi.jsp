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
<link rel="stylesheet" type="text/css" href="../../../resources/dist/assets/css/summernote-lite.css" />
<style>
    /* 테이블 테두리(border)의 색상을 변경하는 스타일 */
    #summernote table {
        border: 1px solid #000; /* 테두리 색상 변경 */
    }
    
    .result-items {
      cursor: pointer;
      padding: 5px;
    }
    
    #tb{
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


</style>
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
		                    	<form id="regi_form" action="/document/docregi" method="post">
		                    		제목 : <input name="doc_title"/>
		                    		기안자: <input value="${login.user_name }" readonly="readonly"/>
		                    		
		                    		<input type="hidden" name="user.user_no" value="${login.user_no }" readonly="readonly"/>
		                    		
		                    		<button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#firstappmodal">1차 결재자</button>
		                    		<button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#secondappmodal">2차 결재자</button>
		                    		
		                    		<br>
		                    		
		                    		<table id="tb">
		                    			<tr>
		                    				<th>1차 결재</th>
		                    				<td class="sec_tb" style="border-top: none; border-bottom: none; width: 20px;"></td>
		                    				<th>2차 결재</th>
		                    			</tr>
		                    			<tr>
		                    				<td></td>
		                    				<td class="sec_tb" style="border-top: none; border-bottom: none; width: 20px; height: 90px;" ></td>
		                    				<td></td>
		                    			</tr>
		                    			<tr>
		                    				<td id="firstSelectedApprovalUser" class="selected-boxs"></td>
		                    				<td class="sec_tb" style="border-top: none; border-bottom: none; width: 20px;"></td>
		                    				<td id="secondSelectedApprovalUser" class="selected-boxs"></td>
		                    			</tr>
		                    		</table>

		                    		
		                    		
		                    		
									  <br>
		                    		<select id="templateDropdown">
										<option value="" disabled selected>양식선택</option>
										<option value="expense_report">지출결의서</option>
										<option value="vacation_app">휴가신청서</option>
										<option value="round_robin">품의서</option>
									</select>
		                    		<br>
		                    		<textarea id="summernote" name="doc_content"></textarea>
		                    		<button id="submit_btn">작성</button>
		                    		<button id="ts_btn">임시저장</button>
		                    		
		                    		<input type="hidden" name="first_app"  id="first_app_input"/>
		                    		<input type="hidden" name="second_app" id="second_app_input"/>
		                    	</form>
		                    </div>
		                    
		                    
		                </div>
		            </div>
		            
		            	<!-- first app -->
						<div class="modal fade" id="firstappmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">New message</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<form>
											<div class="form-group">
												<label for="recipient-name"  id="col-form-label">1차 결재자</label>
												<input type="text" class="form-control" id="firstSearchInput">
											</div>
											<div class="form-group">
												<label for="message-text" class="col-form-label">목록</label>
												<div id="fisrtSearchResults" style="display: none;">
												    <!-- 검색 결과를 드롭다운으로 표시할 영역 -->
												</div>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn  btn-secondary" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						
						<!-- second app -->
						<div class="modal fade" id="secondappmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">New message</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									</div>
									<div class="modal-body">
										<form>
											<div class="form-group">
												<label for="recipient-name"  id="col-form-label">Recipient:</label>
												<input type="text" class="form-control" id="secondSearchInput">
											</div>
											<div class="form-group">
												<label for="message-text" class="col-form-label">목록</label>
												<div id="secondSearchResults" style="display: none;">
												    <!-- 검색 결과를 드롭다운으로 표시할 영역 -->
												</div>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn  btn-secondary" data-dismiss="modal">Close</button>
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
    <script src="../../../resources/dist/assets/js/lang/summernote-ko-KR.js"></script>
    <script src="../../../resources/dist/assets/js/summernote-lite.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
    	
    	//결재자 추가
    	$("#firstSearchInput").on("focus keyup", function() {
    			console.log(1);
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
    	                $("#first_app_input").val(approverData.user_no);
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
    	
    	
    	$("#secondSearchInput").on("focus keyup", function() {
			console.log(1);
	        var input = $(this).val();
	        var searchResults = $("#secondSearchResults");
	        var secondSearchInput = $("#secondSearchInput");
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
				  	      " " + approverData.user_name +
			  	          " " + approverData.user_email +
			  	          " " + approverData.dept.dept_name,
	                    class: "result-items"
	                  });
	              resultItem.on("click", function() {
					secondSearchInput.empty();
	                searchResults.hide();
	                secondSelectApprovalUser(approverData);
	                $("#second_app_input").val(approverData.user_no);
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
	        var selectedBox = $("#firstSelectedApprovalUser");
	        selectedBox.empty(); // 기존 박스 초기화
	
	        // 선택한 결재자 정보를 하나의 박스로 표시
	        var selectedContent = $("<div>").text(
	        				approverData.user_position + 
			  	      " " + approverData.user_name
	        );
	        selectedBox.append(selectedContent);
	      }
	      
	      function secondSelectApprovalUser(approverData) {
		        var selectedBox = $("#secondSelectedApprovalUser");
		        selectedBox.empty(); // 기존 박스 초기화
		
		        // 선택한 결재자 정보를 하나의 박스로 표시
		        var selectedContent = $("<div>").text(
		        			approverData.user_position + 
			  	      " " + approverData.user_name
		        );
		        selectedBox.append(selectedContent);
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
	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	/*-----------------------------------*/
    	//여기 아래 부분
    	$('#summernote').summernote({
				height: 300,                 // 에디터 높이
				minHeight: null,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				lang: "ko-KR",					// 한글 설정
				toolbar: [
    				    // [groupName, [list of button]]
    				    ['fontname', ['fontname']],
    				    ['fontsize', ['fontsize']],
    				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    				    ['color', ['forecolor','color']],
    				    ['table', ['table']],
    				    ['para', ['ul', 'ol', 'paragraph']],
    				    ['height', ['height']],
    				    ['insert',['picture','link','video']],
    				    ['view', ['fullscreen', 'help']]
    				  ],
    				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
    				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
              
    	});
    	
    	
    	$('#templateDropdown').change(function() {
            var selectedTemplate = $(this).val();
            var existingContent = $('#summernote').summernote('code'); // 에디터의 내용을 가져옴

            if (!isEditorContentEmpty(existingContent)) {
                var confirmMsg = "현재 작성중인 내용이 있습니다. 선택한 양식을 적용하시겠습니까?";
                if (confirm(confirmMsg)) {
                    applyTemplate(selectedTemplate);
                } else {
                    $('#templateDropdown').val(''); // 선택을 취소하면 드롭다운을 선택하지 않은 상태로 변경
                }
            } else {
                applyTemplate(selectedTemplate);
            }
        });
    	
    	
    	// 양식에 맞는 테이블을 적용하는 함수
        function applyTemplate(template) {
        	$('#summernote').summernote('reset');
            if (template === 'expense_report') {
                var tableHtml = `<table class="table table-bordered"><tbody><tr><td colspan="3" style="text-align: center; "><b><span style="font-size: 28px;">지출결의서</span></b></td></tr><tr><td style="text-align: center; ">총 지출 금액</td><td colspan="2" style="text-align: right; ">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 000,000,000원&nbsp;</td></tr><tr><td rowspan="10" style="text-align: center; ">내역</td><td style="text-align: center; ">적요</td><td style="text-align: center;">금액</td></tr><tr><td><br></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr></tbody></table>`;
                $('#summernote').summernote('pasteHTML', tableHtml);
            }
            if (template === 'vacation_app') {
                var tableHtml = `<table class="table table-bordered"><tbody><tr><td colspan="3" style="text-align: center; "><b><span style="font-size: 28px;">휴가신청서</span></b></td></tr><tr><td style="text-align: center; ">휴가 신청일</td><td colspan="2" style="text-align: center; ">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; @@일&nbsp;</td></tr><tr><td style="text-align: center; ">시작일</td><td colspan="2">00월 00일</td></tr><tr><td style="text-align: center; ">종료일</td><td colspan="2">00월 00일</td></tr><tr><td style="text-align: center; ">계획</td><td colspan="2"></td></tr></tbody></table>`;
                $('#summernote').summernote('pasteHTML', tableHtml);
            }
            if (template === 'round_robin') {
                var tableHtml = `<table class="table table-bordered"><tbody><tr><td colspan="3" style="text-align: center; "><b><span style="font-size: 28px;">지출품의서</span></b></td></tr><tr><td style="text-align: center; ">품의 금액</td><td colspan="2" style="text-align: right; ">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;000,000,000원</td></tr><tr><td colspan="3" style="text-align: center; ">품의 사유 및 상세 내역</td></tr><tr><td colspan="3"></td></tr></tbody></table>`;
                $('#summernote').summernote('pasteHTML', tableHtml);
            }
            // 다른 양식들에 대한 처리도 추가 가능
        }
    	
        function isEditorContentEmpty(content) {
            // 에디터의 내용이 <p><br></p>로 이뤄진 빈 태그인지 확인
            //console.log(content.trim())
            var i = content.replace(/<p><br><\/p>/gi, '');
            //console.log(!i);
            
            return !i;
        }
    	
    	//작성버튼 onclick
    	$("#submit_btn").click(function() {
            // form을 submit
            $("#regi_form").submit();
        });
    	
    	
    	
    	
    });
    </script>
</body>
</html>