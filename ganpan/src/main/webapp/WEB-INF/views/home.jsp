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
						<p>작업에 대한 계획을 한눈에 확인하세요!</p>
						<p>놀라울 만큼 간단합니다!</p>
					</div>
					<!-- col-md-6 -->

					<div class="col-md-6">
						<form action="register_main.do" method="post" id="registerForm">
							<input type="text" class="form-control" name="nickName" id="nickName" placeholder="별명 (*특수문자 사용불가)" required="required" onKeypress="if ((event.keyCode > 32 && event.keyCode < 48) || (event.keyCode > 57 && event.keyCode < 65) || (event.keyCode > 90 && event.keyCode < 97)) event.returnValue = false;">
							<br> <br>
							<input type="email" class="form-control" name="eMail" id="eMail" placeholder="전자우편" required="required">
							<br> <br>
							<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" required="required">
							<br> <br>
							<button type="submit" class="btn btn-purple btn-block" id="registerBtn">가입하기</button>
						</form>
					</div>
					<!-- col-md-6 -->
				</div>
				<!-- container-fluid -->
			</div>
			<!-- jumbotron -->

			<!-- <div class="container"> -->
			<div class="container-fluid">

				<!-- div. row -->
				<div class="row">
					<div class="col-sm-8">
						<h2>우리는 간판입니다!</h2>
						<p>놀랄만큼 똑똑하게 일정을 관리합니다</p>
						<p>공동 작업을 함께 계획합니다</p>
						<p>간판을 즐겨보세요</p>
						<p>
							<a class="btn btn-hovernavy btn-lg" href="${pageContext.request.contextPath}/go_board/guide.do">간판 탐색하기 &raquo;</a>
						</p>
					</div>
				</div>
				<!-- /.row -->

				<hr>

				<div class="row">
					<div class="col-sm-4">
						<img class="img1" src="${pageContext.request.contextPath}/resources/img/analytics.png" alt="">
						<h2>개인 일정 관리</h2>
						<p>무거운 수첩은 이제 그만!</p>
						<p>일정을 관리하는데 놀랄만큼 효과적입니다!</p>
					</div>
					<div class="col-sm-4">
						<img class="img1" src="${pageContext.request.contextPath}/resources/img/reunion.png" alt="">
						<h2>공동 작업</h2>
						<p>언제, 어디서나 모두!</p>
						<p>조원간의 계획을 공유하세요!</p>
					</div>
					<div class="col-sm-4">
						<img class="img1" src="${pageContext.request.contextPath}/resources/img/businessmen.png" alt="">
						<h2>회사 내 똑똑한 도구</h2>
						<p>최고의 시각화 도구</p>
						<p>간판은 당신의 회사 생활을 도와줍니다.</p>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- main container-fluid -->
		</c:when>
		<c:otherwise>
			<div class="row">
				<div class="jumbotron text-center" id="jumbotron-main">
					<h3>간판이 처음이시라면 간판 길잡이의 안내를 받아보세요</h3>
					<h3>
						간판을 만들어보세요&nbsp;<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
					</h3>
					<a href="${pageContext.request.contextPath}/go_board/guide.do" class="btn btn-hovernavy btn-lg">간판 길잡이</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/go_board/create_new_ganpan.do" class="btn btn-hovernavy btn-lg"">간판 만들기</a>
				</div>
				<!-- text-center -->
			</div>
			<!-- row -->
			<hr>
			<div class="row">
				<div class="col-md-8">
					<div class="jumbotron">
						<p class="text-center"><span class="glyphicon glyphicon-sort-by-attributes" aria-hidden="true"></span>작업 현황</p>
						<c:forEach items="${changeList}" var="clist">
						<div class="well well-sm">
							<span class="">${clist.changeWorker}</span>소유의 
						</div>
						</c:forEach>
					</div>
					<!-- jumbotron -->
				</div>
				<!-- col-md-6 -->

				<div class="col-md-4">
					<div class="well">
						<h3>${mvo.nickName}님간판현황 | 총&nbsp;${signBoardCount}개</h3>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>조장</th>
									<th>간판명</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sListVO.list}" var="signBoard">
									<tr>
										<td>${signBoard.signBoardVO.bossMemberVO.nickName}</td>
										<td><a href="${pageContext.request.contextPath}/showSignBoard.do?signBoardName=${signBoard.signBoardVO.signBoardName}
										&bossNickName=${signBoard.signBoardVO.bossMemberVO.nickName}">${signBoard.signBoardVO.signBoardName}</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<nav class="text-center">
							<ul class="pagination pagination-sm">
								<c:choose>
									<c:when test="${sListVO.pagingBean.isPreviousPageGroup()}">
										<li><a href="${pageContext.request.contextPath}/getLoginHome.do?nickName=${mvo.nickName}&pageNo=${sListVO.pagingBean.getStartPageOfPageGroup()-1}" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a></li>
									</c:when>
								</c:choose>
								<c:forEach begin="${sListVO.pagingBean.getStartPageOfPageGroup()}" end="${sListVO.pagingBean.getEndPageOfPageGroup()}" varStatus="order">
									<c:choose>
										<c:when test="${sListVO.pagingBean.nowPage == order.index}">
											<li class="active">
										</c:when>
										<c:otherwise>
											<li>
										</c:otherwise>
									</c:choose>
									<a href="${pageContext.request.contextPath}/getLoginHome.do?nickName=${mvo.nickName}&pageNo=${order.index}"> ${order.index}</a>
									</li>
								</c:forEach>
								<c:choose>
									<c:when test="${sListVO.pagingBean.isNextPageGroup()}">
										<li><a href="${pageContext.request.contextPath}/getLoginHome.do?nickName=${mvo.nickName}&pageNo=${sListVO.pagingBean.getEndPageOfPageGroup()+1}" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
											</a></li>
									</c:when>
								</c:choose>
							</ul>
						</nav>
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
<c:if test="${invitationFlag && sessionScope.mvo != null}">
<script type="text/javascript">
 	$(window).load(function() {
 		if(confirm("조직초대가 있습니다.\n수락하러 가시겠습니까?")){
 			location.href="${pageContext.request.contextPath}/invitationList.do";
 		}
 	}); // LOAD
</script>
</c:if>