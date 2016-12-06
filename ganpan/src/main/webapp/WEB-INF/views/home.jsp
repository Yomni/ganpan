<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<c:choose>
	<c:when test="${sessionScope.mvo == null}">
	<div class="jumbotron" id="jumbotron-main">
		<div class="container-fluid">
			<div class="col-md-6">
				<h1>
					간판에 <br> 가입하세요!
				</h1>
				<p>공동작업에 대한 계획을 한눈에 확인하세요!</p>
				<p>놀라울 만큼 간단합니다!</p>
			</div>
			<!-- col-md-6 -->
			
			<div class="col-md-6">
				<form action="register.do" method="post" id="registerForm">
					<input type="text" class="form-control" name="nickName" id="nickName" placeholder="별명">
					<br>
					<input type="email" class="form-control" name="eMail" id="eMail" placeholder="전자우편">
					<br>
					<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호">
					<br>
					<button type="submit" class="btn btn-default btn-success btn-block" id="registerBtn">가입하기</button>
				</form>
			</div>
			<!-- col-md-6 -->
		</div>
		<!-- container-fluid -->
	</div>
	<!-- jumbotron -->
	<div class="container">
		<p>우리거 다 구현하면 채울 예정</p>
		<!-- 		<a href="gomember/my_info.do">내 정보 보기</a> -->
	</div>
	<!-- main container-fluid -->
	</c:when>
	<c:otherwise>
	<div class="jumbotron" id="jumbotron-main">
		<div class="container-fluid">
			로그인 index 화면
			${sessionScope.mvo}
		</div>
		<!-- container-fluid -->
	</div>
	<!-- jumbotron -->
	<a href="${pageContext.request.contextPath}/go_board/create_new_ganpan.do">간판 만들기</a><br>
	<div class="container">
		<c:forEach items="${sessionScope.slist}" var="ganpan">
			<a href="#">${ganpan.signBoardName}</a>
		</c:forEach>
	</div>
	</c:otherwise>
	</c:choose>
</div>
<!-- /container -->

<c:if test="${sessionScope.mvo == null}">
<!-- jquery -->
<script type="text/javascript">
	$(function() {
		$("#registerBtn").click(function() {
			var nickName = $("#nickName").val().trim();
			var eMail = $("#eMail").val().trim();
			var password = $("#password").val().trim();
			if (nickName == "") {
				alert("별명을 입력하세요!");
				$("#nickName").focus();
				return false;
			}
			if (eMail == "") {
				alert("전자우편을 입력하세요!");
				$("#eMail").focus();
				return false;
			}
			if (password == "") {
				alert("비밀번호을 입력하세요!");
				$("#password").focus();
				return false;
			}
		}); // btn click
	}); // ready
</script>
</c:if>