<<<<<<< HEAD
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
												<li><a href="${pageContext.request.contextPath}/group_member_list.do?bossNickName=${sblist.bossNickName}&signBoardName=${sblist.signBoardName} ">참여 구성원 보기</a></li>
												<li><a href="${pageContext.request.contextPath}/ganpanSettingPage.do">간판 설정</a></li>
											</ul>
										</section>
								</div>
								
								
								<div id="sample">
									  <h3>GoJS Kanban Board</h3>
									  <div id="myDiagramDiv" style="border: solid 1px gray; width:100%; height:500px;">
									  <div class="9u 12u(mobile) important(mobile)"></div>
									  </div>
									  <p></p>
									  <button id="SaveButton" onclick="save()">Save</button>
									  <button onclick="load()">Load</button>
									  Diagram Model saved in JSON format:
									  <br>
								</div>
								<table border="1" cellpadding="10">
											<thead>
												<tr>
												<c:forEach items="${rsvo.boardList}" var="rsvo">
													<th>${rsvo.boardGenreVO.boardName }</th>
												</c:forEach>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${rsvo.boardList}" var="rsvo">
														<c:forEach items="${rsvo.works}" var="works">
												<tr>
													<td>
															${works.workName} | ${works.organizationVO.workerNickName.nickName}
													</td>
												</tr>
														</c:forEach>
											</c:forEach>
											</tbody>
										</table>
								
								
								
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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<h2>칸반 제목</h2>
<ul class="link-list">
	<li><a href="${pageContext.request.contextPath}/board/change_record.do">변경 이력 보기</a></li>
	<li><a href="${pageContext.request.contextPath}/board/group_member_list.do">참여 구성원 보기</a></li>
	<li><a href="${pageContext.request.contextPath}/ganpanSettingPage.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}">간판 설정</a></li>
</ul>
<table border="1" cellpadding="10">
	<thead>
		<tr>
			<c:forEach items="${rsvo.boardList}" var="rsvo">
				<th>${rsvo.boardGenreVO.boardName }</th>
			</c:forEach>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${rsvo.boardList}" var="rsvo">
			<c:forEach items="${rsvo.works}" var="works">
				<tr>
					<td>${works.workName}| ${works.organizationVO.workerNickName.nickName}</td>
				</tr>
			</c:forEach>
		</c:forEach>
	</tbody>
</table>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/skel-viewport.min.js"></script>
<script src="assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="assets/js/main.js"></script>
<<<<<<< HEAD
</div>

</body>
>>>>>>> branch 'master' of https://github.com/Yomni/ganpan.git
</html>
=======
>>>>>>> branch 'master' of https://github.com/Yomni/ganpan.git
