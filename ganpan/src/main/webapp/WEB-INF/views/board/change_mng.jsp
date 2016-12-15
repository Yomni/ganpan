<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery.sortable.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/droppable.css" />

<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<h2 class="text-center">${rsvo.signBoardName}</h2>
			<ul class="link-list">
				<li><a
					href="${pageContext.request.contextPath}/board/change_record.do">변경
						이력 보기</a></li>
				<li><a
					href="${pageContext.request.contextPath}/showMemberList.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}">참여
						구성원 보기</a></li>
				<c:if
					test="${rsvo.bossMemberVO.nickName==sessionScope.mvo.nickName}">
					<li><a
						href="${pageContext.request.contextPath}/ganpanSettingPage.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}">간판
							설정</a></li>
				</c:if>
			</ul>
			<table class="table table-bordered">
				<thead>
					<tr>
						<%-- <c:forEach items="${rsvo.boardList}" var="rsvo">
							<th>
								<c:if test="${rsvo.boardGenreVO.boardNo == 1}">해야 할 작업</c:if>
								<c:if test="${rsvo.boardGenreVO.boardNo == 2}">하고 있는 작업</c:if> 
								<c:if test="${rsvo.boardGenreVO.boardNo == 3}">끝난 작업</c:if>
							</th>
						</c:forEach> --%>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>todo의 변경이력</td><td>doing의 변경이력</td><td>done의 변경이력</td>
					</tr>
					<tr>
						<td>
						<c:forEach items="${changeMngMap.todoChangeMngList }" var="todoList">
							${todoList. }
						</c:forEach>
							<div>로그1</div>
							<div>로그2</div>
							<div>로그3</div>
						</td>
						<td>
							<div>로그1</div>
							<div>로그1</div>
							<div>로그1</div>
						</td>
						<td>
							<div>로그1</div>
							<div>로그1</div>
							<div>로그1</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- col-md-10 col-md-offset-1 -->
	</div>
	<!-- row -->
</div>
<!-- container -->

<!-- 
	1. sortable
	2. drag & drop
	3. ajax변경
 -->
<c:if test="${sessionScope.mvo != null}">
	<script type="text/javascript">
	</script>
</c:if>
