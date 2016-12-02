<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
	<head>
		<title><tiles:insertAttribute name="title" ignore="true" /></title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	</head>

	<body>
		<div id="page-wrapper">
			
			<div id="header">
				<tiles:insertAttribute name="header" />
			</div>
			<div id="banner">
				<tiles:insertAttribute name="banner" />
			</div>
			<div id="main">
				<tiles:insertAttribute name="main" />
			</div>
			<div id="footer">
				<tiles:insertAttribute name="footer" />
			</div>
</html>

