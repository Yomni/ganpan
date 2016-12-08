<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<div class="container">
<div class="row">
<div class="col-md-6">
	<h2>그룹 초대 현황</h2>
	<table class="table table-hover" id="inviteTable">
		<thead>
			<tr>
				<th>간판 제목</th>
				<th>그룹장</th>
				<th>초대 날짜</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${inviteList}" var="invitationMngVO" varStatus="status">			
				<tr>	
					<td>${invitationMngVO.signBoardVO.signBoardName}</td>
					<td>${invitationMngVO.signBoardVO.bossMemberVO.nickName}</td>
					<td>${invitationMngVO.invitationDate}</td>
					<td><%-- <input type="button" id="accept${status.count}" value="수락"/> --%>
						<button type="button" class="btn btn-success" id="accept${status.count}" value="수락" >  					
							<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
						</button>
					</td>
					<td>
						<button type="button" class="btn btn-danger" id="reject${status.count}" value="거절">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>
</div>
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