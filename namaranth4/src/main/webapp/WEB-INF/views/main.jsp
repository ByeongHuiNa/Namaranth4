<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/scss" href="../../resources/dist/assets/scss/style.scss" />
<link rel="stylesheet" type="text/css" href="../../resources/dist/assets/css/style.css" />

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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded" />
    <!-- Favicon icon -->
    <link rel="icon" href="../../resources/dist/assets/images/favicon.ico" type="image/x-icon">

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
	<input id="userinfo_name" type="hidden" value="${user.user_name}"/>
	<input id="userinfo_dept" type="hidden" value="${dept}"/>
	<input id="userinfo_position" type="hidden" value="${user.user_position}"/>
	<div class="pcoded-main-container">
	    <div class="pcoded-content">
	        <!-- [ breadcrumb ] start -->
              <div class="row">
                  <div class="col-md-4 paddingSet">
                      <div class="card" id="mypage">
                          <div class="card-header">
                              <h5>내 정보</h5>
                          </div>
                          <div class="card-body">
                              <p class="lead m-t-0">Your title goes here</p>
                              <mark>highlight</mark> text.
                              <br>
                              <del>This line of text is meant to be treated as deleted text.</del>
                              <br>
                              <ins>This line of text is meant to be treated as an addition to the document.</ins>
                              <br>
                              <strong>rendered as bold text</strong>

                              <br>
                              <em>rendered as italicized text</em>
                          </div>
                      </div>
                      <div class="card-body" id="alertMsg">
						<div class="alert alert-primary alert-dismissible fade show" role="alert">
							<strong>Holy guacamole!</strong> You should check in on some of those fields below.
							<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
					  </div>
                  </div>
                  <div class="col-md-8 paddingSet">
	                <div class="card table-card" id="email">
	                    <div class="card-header">
	                        <h5>수신 메일</h5>
	                        <div class="card-header-right">
	                            <div class="btn-group card-option">
	                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                    <i class="feather icon-more-horizontal"></i>
	                                </button>
	                                <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right">
	                                    <li class="dropdown-item full-card"><a href="#!"><span><i class="feather icon-maximize"></i> maximize</span><span style="display:none"><i class="feather icon-minimize"></i> Restore</span></a></li>
	                                    <li class="dropdown-item minimize-card"><a href="#!"><span><i class="feather icon-minus"></i> collapse</span><span style="display:none"><i class="feather icon-plus"></i> expand</span></a></li>
	                                    <li class="dropdown-item reload-card"><a href="#!"><i class="feather icon-refresh-cw"></i> reload</a></li>
	                                    <li class="dropdown-item close-card"><a href="#!"><i class="feather icon-trash"></i> remove</a></li>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="card-body p-0">
	                        <div class="table-responsive">
	                            <table class="table table-hover mb-0">
	                                <thead>
	                                    <tr>
	                                        <th>
	                                            <div class="chk-option">
	                                                <label class="check-task custom-control custom-checkbox d-flex justify-content-center done-task">
	                                                    <input type="checkbox" class="custom-control-input">
	                                                    <span class="custom-control-label"></span>
	                                                </label>
	                                            </div>
	                                            Assigned
	                                        </th>
	                                        <th>Name</th>
	                                        <th>Due Date</th>
	                                        <th class="text-right">Priority</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td>
	                                            <div class="chk-option">
	                                                <label class="check-task custom-control custom-checkbox d-flex justify-content-center done-task">
	                                                    <input type="checkbox" class="custom-control-input">
	                                                    <span class="custom-control-label"></span>
	                                                </label>
	                                            </div>
	                                            <div class="d-inline-block align-middle">
	                                                <img src="../../resources/dist/assets/images/user/avatar-4.jpg" alt="user image" class="img-radius wid-40 align-top m-r-15">
	                                                <div class="d-inline-block">
	                                                    <h6>John Deo</h6>
	                                                    <p class="text-muted m-b-0">Graphics Designer</p>
	                                                </div>
	                                            </div>
	                                        </td>
	                                        <td>Able Pro</td>
	                                        <td>Jun, 26</td>
	                                        <td class="text-right"><label class="badge badge-light-danger">Low</label></td>
	                                    </tr>
	                                    <tr>
	                                        <td>
	                                            <div class="chk-option">
	                                                <label class="check-task custom-control custom-checkbox d-flex justify-content-center done-task">
	                                                    <input type="checkbox" class="custom-control-input">
	                                                    <span class="custom-control-label"></span>
	                                                </label>
	                                            </div>
	                                            <div class="d-inline-block align-middle">
	                                                <img src="../../resources/dist/assets/images/user/avatar-2.jpg" alt="user image" class="img-radius wid-40 align-top m-r-15">
	                                                <div class="d-inline-block">
	                                                    <h6>Jenifer Vintage</h6>
	                                                    <p class="text-muted m-b-0">Web Designer</p>
	                                                </div>
	                                            </div>
	                                        </td>
	                                        <td>Mashable</td>
	                                        <td>March, 31</td>
	                                        <td class="text-right"><label class="badge badge-light-primary">high</label></td>
	                                    </tr>
	                                    <tr>
	                                        <td>
	                                            <div class="chk-option">
	                                                <label class="check-task custom-control custom-checkbox d-flex justify-content-center done-task">
	                                                    <input type="checkbox" class="custom-control-input">
	                                                    <span class="custom-control-label"></span>
	                                                </label>
	                                            </div>
	                                            <div class="d-inline-block align-middle">
	                                                <img src="../../resources/dist/assets/images/user/avatar-3.jpg" alt="user image" class="img-radius wid-40 align-top m-r-15">
	                                                <div class="d-inline-block">
	                                                    <h6>William Jem</h6>
	                                                    <p class="text-muted m-b-0">Developer</p>
	                                                </div>
	                                            </div>
	                                        </td>
	                                        <td>Flatable</td>
	                                        <td>Aug, 02</td>
	                                        <td class="text-right"><label class="badge badge-light-success">medium</label></td>
	                                    </tr>
	                                    <tr>
	                                        <td>
	                                            <div class="chk-option">
	                                                <label class="check-task custom-control custom-checkbox d-flex justify-content-center done-task">
	                                                    <input type="checkbox" class="custom-control-input">
	                                                    <span class="custom-control-label"></span>
	                                                </label>
	                                            </div>
	                                            <div class="d-inline-block align-middle">
	                                                <img src="../../resources/dist/assets/images/user/avatar-2.jpg" alt="user image" class="img-radius wid-40 align-top m-r-15">
	                                                <div class="d-inline-block">
	                                                    <h6>David Jones</h6>
	                                                    <p class="text-muted m-b-0">Developer</p>
	                                                </div>
	                                            </div>
	                                        </td>
	                                        <td>Guruable</td>
	                                        <td>Sep, 22</td>
	                                        <td class="text-right"><label class="badge badge-light-primary">high</label></td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                        </div>
	                    </div>
	                </div>
                  </div>
                  <div class="col-md-6 col-lg-4 paddingSet">
                      <div class="mainCard">
                          <div class="card-header">
                              <h5>Unordered</h5>
                          </div>
                          <div class="card-body">
                              <ul>
                                  <li>Lorem ipsum dolor sit amet</li>
                                  <li>Nulla volutpat aliquam velit
                                      <ul>
                                          <li>Phasellus iaculis neque</li>
                                          <li>Ac tristique libero volutpat at</li>
                                      </ul>
                                  </li>
                                  <li>Eget porttitor lorem</li>
                              </ul>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-6 col-lg-4 paddingSet">
                      <div class="mainCard">
                          <div class="card-header">
                              <h5>Unordered</h5>
                          </div>
                          <div class="card-body">
                              <ul>
                                  <li>Lorem ipsum dolor sit amet</li>
                                  <li>Nulla volutpat aliquam velit
                                      <ul>
                                          <li>Phasellus iaculis neque</li>
                                          <li>Ac tristique libero volutpat at</li>
                                      </ul>
                                  </li>
                                  <li>Aenean sit amet erat nunc</li>
                              </ul>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-6 col-lg-4 paddingSet">
                      <div class="mainCard">
                          <div class="card-header">
                              <h5>Ordered</h5>
                          </div>
                          <div class="card-body">
                              <ol>
                                  <li>Nulla volutpat aliquam velit
                                      <ul>
                                          <li>Phasellus iaculis neque</li>
                                          <li>Vestibulum laoreet porttitor sem</li>
                                      </ul>
                                  </li>
                                  <li>Faucibus porta lacus fringilla vel</li>
                              </ol>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-12 col-lg-8 paddingSet">
                      <div class="mainCard">
                          <div class="card-header">
                              <h5>Ordered</h5>
                          </div>
                          <div class="card-body">
                              <ol>
                                  <li>Nulla volutpat aliquam velit
                                      <ul>
                                          <li>Phasellus iaculis neque</li>
                                          <li>Vestibulum laoreet porttitor sem</li>
                                      </ul>
                                  </li>
                                  <li>Faucibus porta lacus fringilla vel</li>
                                  <li>Eget porttitor lorem</li>
                              </ol>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-6 col-lg-4 paddingSet">
                      <div class="mainCard">
                          <div class="card-header">
                              <h5>Ordered</h5>
                          </div>
                          <div class="card-body">
                              <ol>
                                  <li>Nulla volutpat aliquam velit
                                      <ul>
                                          <li>Phasellus iaculis neque</li>
                                          <li>Vestibulum laoreet porttitor sem</li>
                                      </ul>
                                  </li>
                                  <li>Faucibus porta lacus fringilla vel</li>
                                  <li>Eget porttitor lorem</li>
                              </ol>
                          </div>
                      </div>
                  </div>
              </div>
	          <!-- Widget primary-success card end -->

	        </div>
	        <!-- [ Main Content ] end -->
	    </div>
	</div>
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
    <script src="../../resources/dist/assets/js/vendor-all.min.js"></script>
    <script src="../../resources/dist/assets/js/plugins/bootstrap.min.js"></script>
	<script src="../../resources/dist/assets/js/pcoded.min.js"></script>

<!-- Apex Chart -->
<script src="../../resources/dist/assets/js/plugins/apexcharts.min.js"></script>

<!-- custom-chart js -->
<script src="../../resources/dist/assets/js/pages/dashboard-main.js"></script>

<!-- JS -->
<script type="text/javascript">
$(document).ready(function() {
	let info = '<span>' + $("#userinfo_dept").val() + "/" + $('#userinfo_position').val() + "</span>";
	$('#username').text($('#userinfo_name').val());
	$('#more-details').prepend(info);
});

</script>
</body>

</html>
