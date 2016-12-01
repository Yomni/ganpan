<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Header -->
<div id="header-wrapper">
		<header id="header" class="container">
			<div class="row">
				<div class="12u">
					<!-- Logo -->
					<h1>
						<a href="${pageContext.request.contextPath}/home.do" id="logo">로고자리</a>
					</h1>
					<!-- Nav -->
					<div>
						<nav id="nav">
							<a href="${pageContext.request.contextPath}/home.do">처음으로</a> 
							<a href="${pageContext.request.contextPath}/page/introduce.do">소개글</a> 
							<a href="${pageContext.request.contextPath}/page/threecolumn.do">(양쪽에 메뉴)</a> 
							<a href="${pageContext.request.contextPath}/page/twocolumn_left.do">(왼쪽에 메인)</a> 
							<a href="${pageContext.request.contextPath}/page/twocolumn_right.do">(오른쪽 메인)</a>
						</nav>
					</div>
				</div>
			</div>
		</header>
</div>
