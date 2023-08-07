<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page session="false"%>
<html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/scss"
	href="../../resources/dist/assets/scss/style.scss" />
<link rel="stylesheet" type="text/css"
	href="../../resources/dist/assets/css/style.css" />
<head>
<title>메인페이지</title>
<!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 11]>
    	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    	<![endif]-->
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<!-- Favicon icon -->
<link rel="icon" href="../../resources/dist/assets/images/favicon.ico"
	type="image/x-icon">

<!-- vendor css -->
<link rel="stylesheet" href="../../resources/dist/assets/css/style.css">
<link rel="stylesheet" href="../../resources/dist/assets/css/main.css">
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
	<input id="userinfo_no" type="hidden" value="${user.user_no}" />
	<input id="userinfo_name" type="hidden" value="${user.user_name}" />
	<input id="userinfo_dept" type="hidden" value="${dept}" />
	<input id="userinfo_position" type="hidden" value="${user.user_position}" />
	<input id="userinfo_profile" type="hidden" value="${user.user_profile}" />
	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<!-- [ breadcrumb ] start -->
			<div class="row">
				<div class="col-md-4 paddingSet">
					<div class="card" id="mypage">
						<div class="card-header">
							<h5>
								<i class="bi bi-person-circle iconSet"></i>내 정보
							</h5>
						</div>
						<div class="card-body" id="attend" style="padding: 10;">
							<div id="profileImg">
								<img class="img-radius" src="${user.user_profile}" alt="User-Profile-Image"/>
							</div>
							<div class="lead m-t-0 myinfo" style="padding-top:5px; padding-bottom:5px;"><b>${user.user_name}</b></div>
							<div class="myinfo">사원번호 ${user.user_no}</div>
							<div class="myinfo">${dept}/${user.user_position}</div>
							<div class="myinfo">메일 ${user.user_email}</div>
						    <c:if test="${formattedStartTime != null}">
						        <div class="myinfo" id="startTime" style="color:grey; padding-top:5px;"><b>출근</b> : ${formattedStartTime}</div>
						    	<input type="hidden" value="${attend.at_no}" id="attendNo"/>
						    </c:if>							
						    <c:if test="${formattedEndTime != null}">
							    <div class="myinfo" id="endTime" style="color:grey;"><b>퇴근</b> : ${formattedEndTime}</div>
						    </c:if>								    
						</div>
						<div class="attenBtn">
							<button type="button" class="btn btn-outline-primary">
								<i class="feather mr-2 icon-check-circle"></i>출근
							</button>
							<button type="button" class="btn btn-outline-primary">
								<i class="feather mr-2 icon-check-circle"></i>퇴근
							</button>
						</div>
					</div>
				</div>

				<!-- [ Hover-table ] start -->
				<div class="col-md-8 paddingSet">
					<div class="card emailBox">
						<div class="card-header paddingBottomSet">
							<h5>
								<i class="bi bi-envelope-check-fill iconSet"></i>수신 메일
							</h5>
							<div class="card-header-right">
								<div class="btn-group card-option">
									<button type="button" class="btn dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<i class="feather icon-more-horizontal"></i>
									</button>
									<ul
										class="list-unstyled card-option dropdown-menu dropdown-menu-right">
										<li class="dropdown-item full-card"><a href="#!"><span><i
													class="feather icon-maximize"></i> maximize</span><span
												style="display: none"><i
													class="feather icon-minimize"></i> Restore</span></a></li>
										<li class="dropdown-item minimize-card"><a href="#!"><span><i
													class="feather icon-minus"></i> collapse</span><span
												style="display: none"><i class="feather icon-plus"></i>
													expand</span></a></li>
										<li class="dropdown-item reload-card"><a href="#!"><i
												class="feather icon-refresh-cw"></i> reload</a></li>
										<li class="dropdown-item close-card"><a href="#!"><i
												class="feather icon-trash"></i> remove</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card-body table-border-style">
							<div class="table-responsive">
								<table class="table table-hover align-middle" id="emailTable">
									<thead>
										<tr>
											<th class="align-middle">
												<div class="chk-option">
													<label
														class="check-task custom-control custom-checkbox d-flex justify-content-center done-task">
														<input type="checkbox" class="custom-control-input">
														<span class="custom-control-label"></span>
													</label>
												</div>
											</th>
											<th class="align-middle">제목</th>
											<th class="align-middle">발신자</th>
											<th class="align-middle">수신일</th>
										</tr>
									</thead>
									<tbody id="mailList">
										<c:forEach items="${emails}" var="email">
											<tr>
												<td>
													<div class="chk-option">
														<label
															class="check-task custom-control custom-checkbox d-flex justify-content-center done-task">
															<input type="checkbox" class="custom-control-input">
															<span class="custom-control-label"></span>
														</label>
													</div>
												</td>
												<td class="align-middle">
													<c:out value="${email.mail_title}" />
													<input type="hidden" value="${email.mail_title}" class="mailTitle"/>
												</td>
												<td class="align-middle"><c:out value="${email.user_name}" />
													<input type="hidden" value="${email.user_name}" class="mailUserName"/>
												</td>
												<td class="align-middle"><fmt:formatDate value="${email.mail_regdate}" pattern="yyyy/MM/dd" /></td>
											</tr>
											<input type="hidden" value="${email.mail_content}" class="mailContent"/>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div id="vbigGroup">
					<div class="col-lg-8 " id="bigGroup1">
					
						<div class="w-100" id="smallGroup">
							<div class="col-lg-6 paddingSet">
								<div class="mainCard">
									<div class="card-header">
										<h5>
											<i class="bi bi-journal-bookmark-fill iconSet"></i>공지사항
										</h5>
									</div>
									<div class="card-body readDoc">
										<ul id="noticeList">
											<c:forEach items="${notices}" var="notice">
												<li><i class="bi bi-stop-fill listIconSet"></i> 
													<c:out value="${notice.noti_no}" />. 
													<strong><c:out value="${notice.noti_title}" /></strong>
													&nbsp;&nbsp;
													[<c:out value="${notice.user.user_name}" />]
													<input type="hidden" value="${notice.noti_title}" id="noticeTitle"/>
													<input type="hidden" value="${notice.noti_content}" id="noticeContent"/>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>

							<div class="col-lg-6 paddingSet">
								<div class="mainCard">
									<div class="card-header cardList"
										style="display: flex; padding-top: 15px; align-items: center;">
										<h5>
											<i class="bi bi-file-earmark-check iconSet"></i>결재 목록
										</h5>
										<ul class="nav nav-pills mb-3" style="left: 40px;"
											id="pills-tab" role="tablist">
											<li class="nav-item"><a class="nav-link active docBtn"
												id="pills-home-tab" data-toggle="pill" href="#pills-home"
												role="tab" aria-controls="pills-home" aria-selected="true">대기</a>
											</li>
											<li class="nav-item"><a class="nav-link docBtn"
												id="pills-profile-tab" data-toggle="pill"
												href="#pills-profile" role="tab"
												aria-controls="pills-profile" aria-selected="false">완료</a></li>
										</ul>
									</div>
									<div id="docComplete">
										<div class="card-body">
											<div class="tab-content" id="pills-tabContent">
												<div class="tab-pane fade show active readDoc"
													id="pills-home" role="tabpanel"
													aria-labelledby="pills-home-tab">
													<ul>
														<c:forEach items="${docs}" var="doc">
															<c:if test="${doc.doc_status eq '결재대기'}">
																<li><i class="bi bi-stop-fill listIconSet"></i>
																<c:out value="${doc.doc_title}" /> - <fmt:formatDate
																		value="${doc.doc_regdate}" pattern="yyyy/MM/dd" /></li>
															</c:if>
														</c:forEach>
													</ul>
												</div>
												<div class="tab-pane fade readDoc" id="pills-profile"
													role="tabpanel" aria-labelledby="pills-profile-tab">
													<ul>
														<c:forEach items="${docs}" var="doc">
															<c:if test="${doc.doc_status eq '결재완료'}">
																<li><i class="bi bi-stop-fill listIconSet"></i>
																<c:out value="${doc.doc_title}" /> - <fmt:formatDate
																		value="${doc.doc_regdate}" pattern="yyyy/MM/dd" />
																	(승인)</li>
															</c:if>
														</c:forEach>
														<c:forEach items="${docs}" var="doc">
															<c:if test="${doc.doc_status eq '반려'}">
																<li><i class="bi bi-stop-fill listIconSet"></i>
																<c:out value="${doc.doc_title}" /> - <fmt:formatDate
																		value="${doc.doc_regdate}" pattern="yyyy/MM/dd" />
																	(반려)</li>
															</c:if>
														</c:forEach>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					
						
						<div id="bigGroup2" >
							<div class="col-lg-6 paddingSet">
								<div class="mainCard">
									<div class="card-header">
										<h5><i class="bi bi-calendar3 iconSet"></i>오늘의 일정</h5>
									</div>
									<div class="card-body readDoc">
										<ul id="scheduleList">
											<c:forEach items="${schedules}" var="schedule">
												<li>
													<p style="margin-bottom:0px !important;"><i class="bi bi-stop-fill listIconSet"></i><b><c:out value="${schedule.sch_name}" /></b></p>
													<div style="color:grey;"><fmt:formatDate value="${schedule.sch_start}" pattern="yyyy/MM/dd hh:mm:ss" /> ~ <fmt:formatDate value="${schedule.sch_end}" pattern="yyyy/MM/dd hh:mm:ss" /></div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							
							<div class="col-lg-6 paddingSet">
								<div class="mainCard">
									<div class="card-header">
										<h5><i class="bi bi-search iconSet"></i>사원검색</h5>
									</div>
		                                
							         <form id='searchForm'>
							         	<div class="card-body readDoc">
											<div class="input-group mb-3">
				                                <div class="input-group mb-3" id="inputBox">
				                                    <input type="text" style="height:40px;" name="user_name" id="searchByName" class="form-control" placeholder="사원 이름 입력" aria-label="Recipient's username" aria-describedby="basic-addon2">
				                                    <div class="input-group-append">
				                                        <button class="btn btn-primary" style="height:40px;" id="searchUsers" type="button">Button</button>
				                                    </div>
				                                </div>					                     
					                     	</div>
							             </div>
					                  </form>
					                  
					                <div class="card-body" id="searchResults">

									</div>
								</div>
							</div>
						</div>
						
					</div>
				

					<div class="col-8 col-lg-4 paddingSet">
						<div class="mainCard" style="height:550px;">
							<div class="card-header cardList"
								style="display: flex; padding-top: 15px; align-items: center;">
								<h5>
									<i class="bi bi-sticky iconSet"></i>메모장
								</h5>
								<ul class="nav nav-tabs mb-3" style="left: 40px;" id="myTab"
									role="tablist">
									<li class="nav-item"><a
										class="nav-link active text-uppercase" id="home-tab"
										data-toggle="tab" href="#home" role="tab" aria-controls="home"
										aria-selected="true">조회</a></li>
									<li class="nav-item"><a class="nav-link text-uppercase"
										id="profile-tab" data-toggle="tab" href="#profile" role="tab"
										aria-controls="profile" aria-selected="false">작성</a></li>
								</ul>
							</div>
							<div id="docComplete">
								<div class="card-body">
									<div class="tab-content" id="myTabContent">
										<div class="tab-pane fade show active readDoc" id="home"
											role="tabpanel" aria-labelledby="home-tab">
											<ul id="noteList">
												<c:forEach items="${notes}" var="note">
													<li class="noteDetail" data-toggle="modal" data-target="#exampleModalLong">
														<i class="bi bi-stop-fill listIconSet"></i>
														<c:out value="${note.note_title}" />
													</li>
													<input type="hidden" value="${note.note_title}"/>
													<input type="hidden" value="${note.note_content}"/>
													<input type="hidden" value="${note.note_no}"/>
												</c:forEach>
											</ul>
										</div>
										<div class="tab-pane fade" id="profile" role="tabpanel"
											aria-labelledby="profile-tab">
											<input type="hidden" id="noteWriter" value="${user.user_no}"/>
											<input type="text" id="noteTitle" placeholder="제목" required />
											<textarea rows="6" cols="39" id="noteContent" placeholder="내용"></textarea>
											<div
												style="display: inline-block; margin: 0 20px; float: right;">
												<button type="button" class="btn btn-primary align-middle"
													id="noteRegister">등록</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>	
					<!-- 메모장 관련 모달창 -->
					<div class="col-xl-4 col-md-6">
						<div class="card-body">
							<div id="exampleModalLong" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLongTitle"></h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										</div>
										<div class="modal-body" id="viewNote">
											
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" id="noteUpdate">수정</button>
											<button type="button" class="btn btn-primary" id="noteDelete">삭제</button>
											<button type="button" class="btn btn-primary" id="noteUpdateComplete">수정완료</button>
											<input type="hidden" id="readNoteNo" value=""/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 메일, 공지사항 모달창 -->
					<div class="col-xl-4 col-md-6">
						<div class="card-body">
							<div id="exampleModalCenter" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalCenterTitle"></h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										</div>
										<div class="modal-body" id="viewContent">
										
										</div>
										<div class="modal-footer">
											<button type="button" class="btn  btn-primary" data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Widget primary-success card end -->
		</div>
		<!-- [ Main Content ] end -->
	</div>
	<!-- [ Main Content ] end -->

	<!-- Required Js -->
	<script src="../../resources/dist/assets/js/vendor-all.min.js"></script>
	<script src="../../resources/dist/assets/js/plugins/bootstrap.min.js"></script>
	<script src="../../resources/dist/assets/js/pcoded.min.js"></script>

	<!-- Apex Chart -->
	<script src="../../resources/dist/assets/js/plugins/apexcharts.min.js"></script>

	<!-- custom-chart js -->
	<script src="../../resources/dist/assets/js/pages/dashboard-main.js"></script>

<!-- JS -->
<script type="text/javascript">
// 메모 관련 함수 : 등록, 삭제, 수정, 목록 조회
var note = (function(){
	// 메모 추가
	function add(memo, callback, error){
		console.log(memo);
		$.ajax({
			type: 'POST',
			url: '/page/notes/new',
			data: JSON.stringify(memo),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
				noteTitle.value = null;
				noteContent.value = null;
				$("#home-tab").tab('show');
				
			},
			error: function(xhr, status, err){
				if(error){
					error(err);
				}
			}
		})
	}
	
	// 메모 삭제
	function remove(note_no, callback, error){
		console.log(note_no);
		$.ajax({
			type: 'DELETE',
			url: '/page/notes/delete/' + note_no,
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, err){
				if(error){
					error(err);
				}
			}
		})
	}
	
	// 메모 수정
	function update(updateMemo, callback, error){
		console.log("updateMemo : " + updateMemo.note_no);
		$.ajax({
			type: 'PATCH',
			url: '/page/notes/update/' + updateMemo.note_no,
			data: JSON.stringify(updateMemo),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, err){
				if(error){
					error(err);
				}
			}			
		})
	}
	
	// 사용자의 전체 메모 리스트 가져오기
	function getList(param, callback, error){
		console.log("param : " + param);
		var user_no = param.user_no;
		
		$.getJSON(
			"/page/notes/list/" + user_no,
			function(data){
				if(callback){
					callback(data);
				}
			}
		).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	return {
		add: add,
		remove: remove,
		update: update,
		getList: getList
	};
})();

// 출근, 퇴근
var attend = (function(){
	function attendStart(startTime, callback, error){
		console.log(startTime);
		$.ajax({
			type: 'POST',
			url: '/page/attend/start/' + startTime.user.user_no,
			data: JSON.stringify(startTime),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, err){
				if(error){
					error(err);
				}
			}
		})
	}
	
	function attendEnd(endTime, callback, error){
		console.log(endTime);
		console.log($("#userinfo_no").val());
		$.ajax({
			type: 'POST',
			url: '/page/attend/end/' + $("#userinfo_no").val(),
			data: JSON.stringify(endTime),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, err){
				if(error){
					error(err);
				}
			}
		})
	}
	
	return {
		attendStart: attendStart,
		attendEnd: attendEnd
	};
	
})();

// 검색
var search = (function(){
	function searchUser(param, callback, error){
		var user_name = param.user_name;
		console.log(user_name);
		
		$.getJSON(
			"/page/search/users/" + user_name,
			function(data){
				if(callback){
					callback(data);
				}
			}
		).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	return {
		searchUser: searchUser
	}
})();

$(document).ready(function() {
	// 네비바에 로그인 사용자의 정보 나타내기
	let info = '<span>' + $("#userinfo_dept").val() + "/" + $('#userinfo_position').val() + "</span>";
	$('#username').text($('#userinfo_name').val());
	$('#userprofile').attr("src", $('#userinfo_profile').val());
	$('#more-details').prepend(info);

	// 모달창
	var modal = $('#exampleModalLong'); // 메모장
	var otherModal = $('#exampleModalCenter'); // 공지사항, 결재, 메일
	// 메모 작성자
	var noteWriter = $("#noteWriter");
	// 메모 제목
	var noteTitle = $("#noteTitle");
	// 메모 내용
	var noteContent = $("#noteContent");
	// 메모 등록 버튼
	var noteRegister = $("#noteRegister");
	// 메모 삭제 버튼
	var noteDelete = $("#noteDelete");
	// 메모 수정 버튼
	var noteUpdate = $("#noteUpdate");
	// 메모 수정 완료 버튼
	var noteUpdateComplete = $("#noteUpdateComplete");
	
	// 메일 내용 모달창
	$("#mailList").on("click", "tr", function(){
		let mailTitle = $(this).find(".mailTitle").val();
		let mailContent = $(this).next().val();
		let mailUserName = $(this).find(".mailUserName").val();
		let mailRegdate = $(this).find(".mailRegdate").val();
		
		$("#exampleModalCenterTitle").text(mailTitle);
		$("#viewContent").text(mailContent);
		otherModal.modal('show');
	});
	
	// 공지사항 내용 모달창
	$("#noticeList").on("click", "li", function(){
		let noticeTitle = $(this).find("#noticeTitle").val();
		let noticeContent = $(this).find("#noticeContent").val();
		
		$("#exampleModalCenterTitle").text(noticeTitle);
		$("#viewContent").text(noticeContent);
		otherModal.modal('show');
	})
	
	// 출퇴근 처리
	let start = $(".attenBtn button:nth-child(1)");
	let end = $(".attenBtn button:nth-child(2)");

	start.on("click", function(){
		var startTime = {
			user: {
				user_no: $("#userinfo_no").val()
			},
			start_time: new Date().toISOString(),
			end_time: null
		}
		
		attend.attendStart(startTime, function(result){
			// 출근 모달창
			if(result == 'fail'){
 				$("#exampleModalCenterTitle").text("출근 실패");
				$("#viewContent").text("이미 출근하셨습니다.");
				otherModal.modal('show');
			} else if(result == 'success'){
				window.location.href = "/main";
			}
		})
	})
	
	end.on("click", function(){
		var endTime = {
			at_no: $("#attendNo").val(),
			user: {
				user_no: $("#userinfo_no").val()
			},
			end_time: new Date().toISOString()
		}
		
		attend.attendEnd(endTime, function(result){
			// 퇴근 모달창
			if(result == 'already success'){
 				$("#exampleModalCenterTitle").text("퇴근 실패");
				$("#viewContent").text("이미 퇴근하였습니다.");
				otherModal.modal('show');
			} else if(result == 'fail'){
 				$("#exampleModalCenterTitle").text("퇴근 실패");
				$("#viewContent").text("출근을 먼저 하세요.");
				otherModal.modal('show');
			} else if(result == 'success'){
				window.location.href = "/main";
			}
		})
	})
	
	// 메모장 목록 가져오는 메소드
	function showList(user_no){
		note.getList(
			{user_no : noteWriter.val()},
			function(list){
				var str = ""
				for(var i=0; i<list.length; i++){
					str += '<li class="noteDetail" data-toggle="modal" data-target="#exampleModalLong">';
					str += '<i class="bi bi-stop-fill listIconSet"></i>';
					str += list[i].note_title + '</li>';
					str += '<input type="hidden" value="' + list[i].note_title + '"/>' ;
					str += '<input type="hidden" value="' + list[i].note_content + '"/>';
					str += '<input type="hidden" value="' + list[i].note_no + '"/>';
				}
				$("#noteList").append(str);		
			}
		)
	}
	
	// 메모 등록하기
	noteRegister.on("click", function(e){
		console.log(noteWriter.val());
		var memo = {
			user: {
				user_no: noteWriter.val()
			},
			note_title: noteTitle.val(),
			note_content: noteContent.val()
		};
		
		note.add(memo, function(result){
			$("#noteList").empty();
			showList(noteWriter.val());
			// 등록이 완료됐다는 모달창
			$("#exampleModalCenterTitle").text("제목 : " + memo.note_title);
			$("#viewContent").text("메모 등록이 완료되었습니다.");
			otherModal.modal('show');
		});
	});
	
	// 모달창에 메모 내용 출력하기
 	$("#noteList").on("click", ".noteDetail", function() {
		let noteTitle = $(this).next().val();
		let noteContent = $(this).next().next().val();
		let noteNo = $(this).next().next().next().val();
	
		$("#exampleModalLongTitle").text(noteTitle);
		$("#viewNote").text(noteContent);
		$("#readNoteNo").val(noteNo);
		
		noteDelete.show();
		noteUpdate.show();
		noteUpdateComplete.hide();
	}); 
	
	// 메모 삭제하기
  	noteDelete.on("click", function(){
		let note_no = $("#readNoteNo").val();
		note.remove(note_no, function(result){
			$("#noteList").empty();
			showList(noteWriter.val());
			modal.modal('hide');
			
			// 삭제가 완료됐다는 모달창
			$("#exampleModalCenterTitle").text("삭제 완료");
			$("#viewContent").text("메모가 삭제되었습니다.");
			otherModal.modal('show');
		})
		
	});
	
	// 메모 수정하기
 	noteUpdate.on("click", function(){
 		// 이전 핸들러 삭제
 		noteUpdateComplete.off("click");
 		
 	    var noteWriterNo = $("#userinfo_no").val();
 	    var noteNo = $("#readNoteNo").val();
 	    var noteTitle = $("#exampleModalLongTitle").text();
 	    var noteContent = $("#viewNote").text();

 	    console.log(noteNo);
 	    console.log(noteTitle);
 	    console.log(noteContent);
 		
		// 모달창의 text() 없애기
		$("#exampleModalLongTitle").empty();
		$("#viewNote").empty();
		
		noteDelete.hide();
		noteUpdate.hide();
		noteUpdateComplete.show();
		
		// 모당찰에 입력창 추가하기
		$("#exampleModalLongTitle").append('<input type="text" id="noteTitleUpdate" value="' + noteTitle + '" placeholder="제목"/ required >');
		$("#viewNote").append('<textarea rows="6" cols="58" id="noteContentUpdate" placeholder="내용">' + noteContent + '</textarea>');		

 		noteUpdateComplete.on("click", function(){
 	 	    var noteTitleUpdate = $("#noteTitleUpdate").val();
 	 	    var noteContentUpdate = $("#noteContentUpdate").val();

 	 	    console.log("noteTitleUpdate : " + noteTitleUpdate);
 	 	    console.log("noteContentUpdate : " + noteContentUpdate);
 	 	    console.log("noteNo : " + noteNo);
 	 	    console.log("noteWriterNo : " + noteWriterNo);
 			
 	 		var updateMemo = {
 	 			note_no: noteNo,
 	 			user: {
 	 				user_no: noteWriterNo
 	 			},
 	 			note_title: noteTitleUpdate,
 	 			note_content: noteContentUpdate
 	 		};
 	 		
	 		note.update(updateMemo, function(result){
	 			modal.modal('hide');
	 			
	 			$("#noteList").empty();
	 			showList(noteWriter.val());
	 			
				// 수정이 완료됐다는 모달창
				$("#exampleModalCenterTitle").text("제목 : " + updateMemo.note_title);
				$("#viewContent").text("메모 수정이 완료되었습니다.");
				otherModal.modal('show');
 			})
 		})
 	})
 	
 	// 검색
 	$("#searchUsers").on("click", function(){
 		
 		var param = {
 			user_name: encodeURIComponent($("#searchByName").val())
 		};
 		
 		search.searchUser(param, function(result){
 			var $searchResults = $("#searchResults");
 			$searchResults.empty();
 			
 			if(result.length > 0){
 				$.each(result, function(index, user){
 					var html =  
 						'<p><big>' + user.user_name + '</big> (' + user.dept.dept_name + '/' + user.user_position + ')' + '</p>' +
 						'<div>전화번호 : ' + user.user_phone + '</div>' +
 						'<div>이메일 : ' + user.user_email + '</div>';
 					$searchResults.append(html);
 				});
 			} else {
 	            $searchResults.append('<p>검색 결과가 없습니다.</p>');
 	        }
 		})
 	})
});

</script>
</body>

</html>
