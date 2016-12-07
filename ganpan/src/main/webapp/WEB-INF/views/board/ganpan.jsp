<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>칸반 제목</h2>
<ul class="link-list">
	<li><a href="${pageContext.request.contextPath}/board/change_record.do">변경 이력 보기</a></li>
	<li><a href="${pageContext.request.contextPath}/board/group_member_list.do">참여 구성원 보기</a></li>
	<li><a href="${pageContext.request.contextPath}/ganpanSettingPage.do">간판 설정</a></li>
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
		<c:forEach items="${rsvo.boardList}" var="rsvo">
			<c:forEach items="${rsvo.works}" var="works">
				<tr>
					<td>${works.workName}|${works.organizationVO.workerNickName.nickName}</td>
				</tr>
			</c:forEach>
		</c:forEach>
	</tbody>
</table>
