<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page session="false"%>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/scss" href="../../resources/dist/assets/scss/style.scss" />
<link rel="stylesheet" type="text/css" href="../../resources/dist/assets/css/style.css" />
<link rel="stylesheet" href="../../resources/dist/assets/css/noticeList.css">
<head>
<title>회원정보 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />

<!-- Favicon icon -->
<link rel="icon" href="../../resources/dist/assets/images/favicon.ico" type="image/x-icon">

<!-- vendor css -->
<link rel="stylesheet" href="../../resources/dist/assets/css/style.css">
</head>
<body>
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
	
<section class="pcoded-main-container" >
	<input id="userinfo_no" type="hidden" value="${user.user_no}" />
	<input id="userinfo_name" type="hidden" value="${user.user_name}" />
	<input id="userinfo_dept" type="hidden" value="${dept}" />
	<input id="userinfo_position" type="hidden" value="${user.user_position}" />
	<input id="userinfo_profile" type="hidden" value="${user.user_profile}" />
    <div class="pcoded-content" id="noticePage">
    	<div class="row">
         <div class="col-md-12">
            <div class="card">
                <div class="card-header">
	             	<h5>
						<i class="bi bi-journal-bookmark-fill iconSet"></i>공지사항 목록
					</h5>
                </div>
                <div class="card-body table-border-style" id="noticeBody">
                    <div class="table-responsive">
                        <table class="table table-hover"  id="noticeTable">
                            <thead>
                                <tr>
                                    <th class="align-middle">번호</th>
                                    <th class="align-middle">제목</th>
                                    <th class="align-middle">작성자</th>
                                    <th class="align-middle">작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${list}" var="list">
                            		<tr>
	                           			<td class="align-middle">
	                           				<input type="hidden" name="noti_no" value="${list.noti_no}" class="noticeNo"/>
		                            		<a href='get?noti_no=<c:out value="${list.noti_no}"/>'>
	                            				<c:out value="${list.noti_no}" />
	                            			</a>
	                          				</td>
	                           			<td class="align-middle">
	                            			<a href='get?noti_no=<c:out value="${list.noti_no}"/>'>
	                            				<c:out value="${list.noti_title}" />
	                            			</a>
	                           			</td>
	                           			<td class="align-middle">
	                            			<a href='get?noti_no=<c:out value="${list.noti_no}"/>'>
	                            				<c:out value="${list.user.user_name}" />
	                            			</a>
	                           			</td>
	                           			<td class="align-middle">
	                            			<a href='get?noti_no=<c:out value="${list.noti_no}"/>'>
	                            				<fmt:formatDate value="${list.noti_regdate}" pattern="yyyy/MM/dd" />
	                            			</a>
	                           			</td>
                            		</tr>
                            	</c:forEach>
                            </tbody>
                        </table>
	                   	<c:if test="${not empty message}">
							<div class="alert alert-primary alert-dismissible fade show" role="alert">
								<div>${message}</div>
								<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							</div>	                        
						</c:if>
						    <nav aria-label="Page navigation">
    <ul class="pagination justify-content-center">
        <c:if test="${pageMaker.prev}">
            <li class="page-item paginate_button"><a class="page-link" href="${pageMaker.startPage -1}">Previous</a></li>
        </c:if>
        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            <li class="page-item paginate_button  ${pageMaker.cri.pageNum == num ? "active":""}"><a class="page-link" href="${num}">${num}</a></li>
        </c:forEach>
        <c:if test="${pageMaker.next}">
            <li class="page-item paginate_button"><a class="page-link" href="${pageMaker.endPage +1 }">Next</a></li>
        </c:if>
    </ul>
	</nav>
                        <div class="d-flex justify-content-end" id="registerBtn">
		                    <form action="/notice/register" method="GET" id="registerForm">                        
			                    <button type="button" class="btn btn-primary">등록</button>
			                </form>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
    
    

    
    <form id='actionForm' action="/notice/list" method='get'>
   		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
    	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	</form>
    
</section>
   
   	<!-- Required Js -->
	<script src="../../resources/dist/assets/js/vendor-all.min.js"></script>
	<script src="../../resources/dist/assets/js/plugins/bootstrap.min.js"></script>
	<script src="../../resources/dist/assets/js/pcoded.min.js"></script>
	
	<!-- Apex Chart -->
	<script src="../../resources/dist/assets/js/plugins/apexcharts.min.js"></script>

	<!-- custom-chart js -->
	<script src="../../resources/dist/assets/js/pages/dashboard-main.js"></script>

<script>
$(document).ready(function() {
	// 네비바에 로그인 사용자의 정보 나타내기
	let info = '<span>' + $("#userinfo_dept").val() + "/" + $('#userinfo_position').val() + "</span>";
	$('#username').text($('#userinfo_name').val());
	$('#userprofile').attr("src", $('#userinfo_profile').val());
	$('#more-details').prepend(info);
	
	$("#registerBtn").on("click", function(){
		$("#registerForm").submit();
	})
	
	var actionForm = $("#actionForm");

    $(".paginate_button a").on("click", function (e) {
        e.preventDefault();
        console.log('click');
        actionForm.find("input[name='pageNum']").val($(this).attr("href"));
        actionForm.submit();
    }); 
	
})
</script>
</body>
</html>