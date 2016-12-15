<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<!-- Static navbar -->
<nav class="navbar navbar-default navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<%-- 홈화면 가는 icon삽입 --%>
			<c:choose>
			<c:when test="${sessionScope.mvo == null }">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/go_home.do"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span></a>
			</c:when>
			<c:otherwise>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/getLoginHome.do?nickName=${mvo.nickName}"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span></a>
			</c:otherwise>
			</c:choose>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/go_board/guide.do">소개</a></li>
			</ul>
			<span class="pull-right">
				<form action="${pageContext.request.contextPath}/findSignBoardListByTitle.do" method="get" class="navbar-form navbar-left" role="search">
					<div class="input-group">
						<input type="text" class="form-control" name="title" placeholder="간판명으로 검색" required="required"> 
						<span class="input-group-btn">
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
						</span>
					</div>
				</form>
				<c:choose>
				<c:when test="${sessionScope.mvo == null}">
				<a class="btn btn-primary2 navbar-btn" href="${pageContext.request.contextPath}/go_member/login_form.do">들어가기</a>
				<a class="btn btn-purple navbar-btn" href="${pageContext.request.contextPath}/go_member/register_form.do">회원가입</a>
				</c:when>
				<c:otherwise>
				<a class="btn btn-primary2 navbar-btn" href="${pageContext.request.contextPath}/go_member/left_template/my_info.do">내 정보</a> 
				<a class="btn btn-danger navbar-btn" href="${pageContext.request.contextPath}/logout.do">나가기</a>
				</c:otherwise>
				</c:choose>
			</span>
		</div>
		<!--/.nav-collapse -->
	</div>
	<!-- container -->
</nav>
<!-- navbar -->