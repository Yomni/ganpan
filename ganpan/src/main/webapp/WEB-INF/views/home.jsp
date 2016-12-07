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
						<p>공동작업에 대한 계획과 진행 상황을 한눈에 확인하세요!</p>
						<p>놀라울 만큼 간단합니다!</p>
					</div>
					<!-- col-md-6 -->

					<div class="col-md-6">
						<form action="register_main.do" method="post" id="registerForm">
							<input type="text" class="form-control" name="nickName" id="nickName" placeholder="별명" required="required">
							<br>
							<br>
							<input type="email" class="form-control" name="eMail" id="eMail" placeholder="전자우편" required="required">
							<br>
							<br>
							<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" required="required">
							<br>
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
			<div class="row">
				<div class="text-center">
					<a href="${pageContext.request.contextPath}/go_board/guide.do" class="btn btn-lg btn-success">간판 길잡이</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/go_board/create_new_ganpan.do" class="btn btn-lg btn-success">간판 만들기</a>
				</div>
				<!-- text-center -->
			</div>
			<!-- row -->
			<hr>
			<div class="row">
				<div class="col-md-8">
					<div class="jumbotron">변경이력들 공개</div>
					<!-- jumbotron -->
				</div>
				<!-- col-md-6 -->

				<div class="col-md-4">
					<div class="well">
						<h3>${mvo.nickName}님 간판 현황 | 총${signBoardCount}개</h3>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>조장</th>
									<th>간판명</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${slist}" var="signBoard">
									<tr>
										<td>${signBoard.signBoardVO.bossMemberVO.nickName}</td>
										<td><a href="${pageContext.request.contextPath}/showSignBoard.do?signBoardName=${signBoard.signBoardVO.signBoardName}
										&bossNickName=${signBoard.signBoardVO.bossMemberVO.nickName}">${signBoard.signBoardVO.signBoardName}</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- table -->
					</div>
					<!-- well -->
				</div>
				<!-- col-md-6 -->
			</div>
			<!-- row -->
		</c:otherwise>
	</c:choose>
</div>
<!-- /container -->
