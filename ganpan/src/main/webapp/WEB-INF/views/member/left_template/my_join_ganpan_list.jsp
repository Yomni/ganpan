<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-md-offset-3 text-center">
				<c:choose>
					<c:when test="${empty sbList}">
						<h3>참여하신 간판이 없습니다</h3>
					</c:when>
					<c:otherwise>
						<h2>참여 간판 목록</h2>
						<br>
						<table class="table table-hover" id="myJoinGanpanTable">
							<thead>
								<tr>
									<th>간판명</th>
									<th>조장</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sbList}" var="signBoardVO" varStatus="status">
									<tr>
										<td><a href="${pageContext.request.contextPath}/showSignBoard.do?bossNickName=${signBoardVO.bossMemberVO.nickName}&signBoardName=${signBoardVO.signBoardName}">${signBoardVO.signBoardName} </a></td>
										<td>${signBoardVO.bossMemberVO.nickName}</td>
										<td>
											<a class="btn btn-sm btn-danger" id="leave${status.count}" aria-label="Left Align"
											href="${pageContext.request.contextPath}/leaveOrganization.do
											?signBoardName=${signBoardVO.signBoardName}&bossNickName=${signBoardVO.bossMemberVO.nickName}">
												<span class="glyphicon glyphicon-plane" aria-hidden="true"></span>
											</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- col -->
		</div>
		<!-- row -->
	</div>
	<!-- container -->

</div>
<script type="text/javascript">
	$(document).ready(function() {
		<c:forEach items="${sbList}" varStatus="status">
		$("#leave${status.count}").click(function() {
			if (confirm("정말 간판을 나가시겠습니까?") == false) {
				return false;
			} // if
		}); // function
		</c:forEach> // forEach
	});//ready
</script>
