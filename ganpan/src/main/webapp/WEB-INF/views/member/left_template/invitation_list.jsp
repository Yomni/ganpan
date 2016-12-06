<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<h2>그룹 초대 현황</h2>
	<table border="1" id="inviteTable">
		<thead>
			<tr>
				<th>간판 제목</th>
				<th>그룹장</th>
				<th>초대 날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${inviteList}" var="invitationMngVO" varStatus="status">			
				<tr>	
					<td>${invitationMngVO.signBoardVO.signBoardName}</td>
					<td>${invitationMngVO.signBoardVO.bossMemberVO.nickName}</td>
					<td>${invitationMngVO.invitationDate}</td>
					<td><input type="button" id="accept${status.count}" value="수락"/></td>
					<td><input type="button" id="reject${status.count}" value="거절"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		<c:forEach items="${inviteList}" varStatus="status">
			$("#accept${status.count}").click(function(){
				var signBoardName = $("#inviteTable tr:eq(${status.count}) td:eq(0)").text();
				var bossNickName = $("#inviteTable tr:eq(${status.count}) td:eq(1)").text();
				location.href="${pageContext.request.contextPath}/acceptInvitation.do?signBoardName="+signBoardName+"&bossNickName="+bossNickName;
// 				alert($("#inviteTable tr:eq(${status.count}) td:eq(1)").text());
			});
			$("#reject${status.count}").click(function(){
				var signBoardName = $("#inviteTable tr:eq(${status.count}) td:eq(0)").text();
				var bossNickName = $("#inviteTable tr:eq(${status.count}) td:eq(1)").text();
				location.href="${pageContext.request.contextPath}/rejectInvitation.do?signBoardName="+signBoardName+"&bossNickName="+bossNickName;
			});
		</c:forEach>
	});//ready
</script>