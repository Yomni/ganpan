<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Two Column 2 - Halcyonic by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body class="subpage">
		<div id="page-wrapper">

			<!-- Content -->
				<div id="content-wrapper">
					<div id="content">
						<div class="container">
							<div class="row">
								<div class="3u 12u(mobile)">

									<!-- Sidebar -->
										<section>
											<header>
												<h2>칸반 제목</h2>
											</header>
											<ul class="link-list">
												<li><a href="${pageContext.request.contextPath}/board/change_record.do">변경 이력 보기</a></li>
												<li><a href="${pageContext.request.contextPath}/board/group_member_list.do">참여 구성원 보기</a></li>
												<li><a href="${pageContext.request.contextPath}/board/ganpan_setting.do">간판 설정</a></li>
<!-- 												<li><a href="#">Dis parturient montes</a></li> -->
<!-- 												<li><a href="#">Nascetur ridiculus</a></li> -->
											</ul>
										</section>

								</div>
								<div class="9u 12u(mobile) important(mobile)">

									<!-- Main Content -->
										<section>
											<header>
											<span style="display:inline-block; width:265px; background-color:#CCCC; text-align:center">
												<h2>To Do</h2>
											</span>
											<span style="display:inline-block; width:265px; background-color:#CCCC; text-align:center">
												<h2>Doing</h2>
											</span>
											<span style="display:inline-block; width:265px; background-color:#CCCC; text-align:center">
												<h2>Done</h2>
											</span>
											</header>
											<span style="display:inline-block; width:265px; background-color:#CCCC">
												<table border="1">
													<tr>
														<td>1</td>
													</tr>
													<tr>
														<td>1</td>
													</tr>
												</table>
											</span>
											<span style="display:inline-block; width:265px; background-color:#CCCC">
												<table border="1">
													<tr>
														<td>1</td><td>1</td><td>1</td><td>1</td>
													</tr>
													<tr>
														<td>1</td><td>1</td><td>1</td><td>1</td>
													</tr>
												</table>
											</span>
											<span style="display:inline-block; width:265px; background-color:#CCCC">
												<table border="1">
													<tr>
														<td>1</td><td>1</td><td>1</td><td>1</td>
													</tr>
													<tr>
														<td>1</td><td>1</td><td>1</td><td>1</td>
													</tr>
												</table>
											</span>
											
											<p>
												문단1
											</p>
											<p>
												문단2
											</p>
											<p>
												문단3
											</p>
											<p>
												문단4
											</p>
											<p>
												문단5
											</p>
										</section>

								</div>
							</div>
						</div>
					</div>
				</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/skel-viewport.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
		</div>

	</body>
</html>