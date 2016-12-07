<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<h2>그룹원으로 초대할 회원의 별명이나 전자우편 주소로 초대해주세요.</h2>
		<form method="post" action="${pageContext.request.contextPath}/inviteWorker.do" >
			<input type="hidden" value="${svo.signBoardName}" name="signBoardName">
			<input type="hidden" value="${svo.bossMemberVO.nickName}" name="bossNickName">
			<div class="form-group">
				<h4><span id="memberCheckView"></span></h4>
				<label for="memberInfo">초대하실 회원의 별명이나 전자우편</label>
				<input type="text" class="form-control" id="id" name="id" placeholder="초대하실 회원의 별명이나 전자우편" required="required"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-default btn-success btn-block" id="invitationBtn">초대하기</button>
			</div>
		</form>
		
	<h2>그룹 초대 현황</h2>
		<table border="1" id="inviteTable">
			<thead>
				<tr>
					<th>별명</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${inviteList}" var="invitationMngVO" varStatus="status">			
					<tr>	
						<td>${invitationMngVO.nickName}</td>
						<td>${invitationMngVO.eMail}</td>
						<td><input type="button" id="cancel${status.count}" value="초대 취소"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		<c:forEach items="${inviteList}" varStatus="status">
			$("#cancel${status.count}").click(function(){
				var workerNickName = $("#inviteTable tr:eq(${status.count}) td:eq(0)").text();
				location.href="${pageContext.request.contextPath}/cancelInvitation.do?signBoardName="+workerNickName;
			});
		</c:forEach>
	});//ready
</script>