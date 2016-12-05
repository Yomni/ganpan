<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Header -->
<!-- Static navbar -->
<nav class="navbar navbar-default navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<%-- 홈화면 가는 icon삽입 --%>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/gohome.do"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="#about">소개</a></li>
				<%-- dropdown 버튼일단 추후 보정 --%>
				<%--  <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li> --%>
			</ul>
			<span class="pull-right">
				<form action="searchGanpan.do" method="get" class="navbar-form navbar-left" role="search">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="간판명으로 검색"> 
						<span class="input-group-btn">
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
						</span>
					</div>
				</form>
				<a class="btn btn-primary navbar-btn">들어가기</a>
				<a class="btn btn-success navbar-btn">회원가입</a>
			</span>
		</div>
		<!--/.nav-collapse -->
	</div>
	<!-- container -->
</nav>
<!-- navbar -->