<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
	<head>
		<title><tiles:insertAttribute name="title" ignore="true" /></title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css"/>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
	</head>
	<body>
		<div id="page-wrapper">
			<div id="header">
				<tiles:insertAttribute name="header" />
			</div>
			<div id="main">
				<tiles:insertAttribute name="main" />
			</div>
			<div id="footer">
				<tiles:insertAttribute name="footer" />
			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/skel.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/skel-viewport.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
		</div>


</body>
</html>