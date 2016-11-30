<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		// login 페이지로 이동
		$("#login").click(function(){
			location.href="${pageContext.request.contextPath}/member/loginForm.do";
		});
		$("#logout").click(function(){
			location.href="${pageContext.request.contextPath}/logout.do";
		});
		$("#register").click(function(){
			location.href="${pageContext.request.contextPath}/member/registerForm.do";
		});
		$("#myPage").click(function(){
			location.href="${pageContext.request.contextPath}/member/my_info.do";
		});
	});
</script>
<div class="bs-docs-header" id="content" tabindex="-1">
	<div class="container">
		<h1>간판</h1>
		<p>
		<form action="search.do" class="form-inline">
		  <div class="form-group" align="right">
		      <input type="text" class="form-control" id="search" placeholder="검색어 입력">
		  	  <button type="submit" class="btn btn-default">검색</button>
		  	  <c:choose>
		  	  	<c:when test="${empty sessionScope.mvo}">
			  	  <button type="button" id="login" class="btn btn-primary">들어가기</button>
		  	  	</c:when>
		  	  	<c:otherwise>
		  	  		${mvo.nickName}님 환영^^
			  	  <button type="button" id="myPage" class="btn btn-primary">내정보</button>
			  	  <button type="button" id="logout" class="btn btn-primary">나가기</button>
		  	  	</c:otherwise>
		  	  </c:choose>
		  	  
		  	  <button type="button" id="register" class="btn btn-primary">회원가입</button>
		  </div>
		</form>
	</div>
</div>
<hr>
<h2><a href="${pageContext.request.contextPath}/home.do">kosta shop</a></h2>
