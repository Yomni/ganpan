<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Header -->
<div id="header-wrapper">
	<header id="header" class="container">
		<div class="row">
			<div class="12u">
				<!-- Logo -->
				<h1>
					<a href="${pageContext.request.contextPath}/homeSignBoardList.do" id="logo">로고자리</a>
				</h1>
				<!-- Nav -->
				<div>
					<nav id="nav">
						<form action="findSignBoardListByTitle.do" class="form-inline">
							<input type="text" class="form-control" name="title" placeholder="검색어 입력">
							<button type="submit" class="btn btn-default">검색</button>
						</form>
						<c:choose>
							<c:when test="${empty sessionScope.mvo}">
								<a href="${pageContext.request.contextPath}/member/loginForm.do">들어가기</a>
								<a href="${pageContext.request.contextPath}/member/registerForm.do">회원가입</a>
							</c:when>
							<c:otherwise>
					  	  			${mvo.nickName}님 환영^^
									<a href="${pageContext.request.contextPath}/member/my_info.do">내정보</a>
								<a href="${pageContext.request.contextPath}/logout.do">나가기</a>
								<a href="${pageContext.request.contextPath}/board/ganpan.do">내 간판</a>
							</c:otherwise>
						</c:choose>
						<a href="${pageContext.request.contextPath}/home.do">처음으로</a> <a href="${pageContext.request.contextPath}/board/guide.do">소개글</a> <a href="${pageContext.request.contextPath}/page/threecolumn.do">(양쪽에 메뉴)</a> <a href="${pageContext.request.contextPath}/page/twocolumn_left.do">(왼쪽에 메인)</a> <a href="${pageContext.request.contextPath}/page/twocolumn_right.do">(오른쪽 메인)</a>
					</nav>
				</div>
			</div>
		</div>
	</header>
</div>