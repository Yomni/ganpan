<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<table border="1" id="myJoinGanpanTable">
		<tr>
			<th>간판 제목</th>
			<th>그룹장</th>
			<th>이동</th>
			<th></th>
		</tr>
		<c:forEach items="${sbList}" var="signBoardVO">
			<tr>
				<td>${signBoardVO.signBoardName}</td>
				<td>${signBoardVO.bossMemberVO.nickName}</td>
				<td><a href="${pageContext.request.contextPath}/showGanpan.do?bossNickName=${signBoardVO.bossMemberVO.nickName}&signBoardName=${signBoardVO.signBoardName}">간판으로 이동</a></td>
				<td><input type="button" id="leave${status.count}" value="간판 탈퇴"/></td>
			</tr>
		</c:forEach>
	</table>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		<c:forEach items="${sbList}" varStatus="status">
			$("#leave${status.count}").click(function(){
				var signBoardName = $("#myJoinGanpanTable tr:eq(${status.count}) td:eq(0)").text();
				var bossNickName = $("#myJoinGanpanTable tr:eq(${status.count}) td:eq(1)").text();
				location.href="${pageContext.request.contextPath}/leaveOrganization.do?signBoardName="+signBoardName+"&bossNickName="+bossNickName;
			});
		</c:forEach>
	});//ready
</script>
