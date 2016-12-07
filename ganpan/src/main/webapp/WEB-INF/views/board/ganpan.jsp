<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<div class="uppercase">
			<h2 class="text-center">${rsvo.signBoardName}</h2>
			</div>
			<ul class="link-list">
				<li><a href="${pageContext.request.contextPath}/board/change_record.do">변경 이력 보기</a></li>
				<li><a href="${pageContext.request.contextPath}/board/group_member_list.do">참여 구성원 보기</a></li>
				<li><a
					href="${pageContext.request.contextPath}/ganpanSettingPage.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}"
				>간판 설정</a></li>
			</ul>
			<table class="table table-bordered">
				<thead>
					<tr>
						<c:forEach items="${rsvo.boardList}" var="rsvo">
							<th>${rsvo.boardGenreVO.boardName}</th>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rsvo.boardList}" var="boardList">
						<tr>
							<c:if test="${boardList.boardGenreVO.boardName == 'TO_DO'}">
								<td><a class="btn btn-default"
									href="${pageContext.request.contextPath}/
									go_board/create_work.do?signBoardName=${rsvo.signBoardName}
									&bossNickName=${rsvo.bossMemberVO.nickName}">
									<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
									</a>
								</td>
							</c:if>
							<c:forEach items="${boardList.works}" var="works">
								<td>${works.workName}|${works.organizationVO.workerNickName.nickName}</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>