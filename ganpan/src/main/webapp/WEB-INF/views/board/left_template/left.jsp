<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-sm-3 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li><a href="${pageContext.request.contextPath}/showSignBoard.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}">간판으로 돌아가기</a></li>
		<li><a href="${pageContext.request.contextPath}/ganpanSettingPage.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}">간판 설정<span class="sr-only">(current)</span></a></li>
		<li><a href="${pageContext.request.contextPath}/sendInvitationList.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}">조원 초대</a></li>
		<li><a href="${pageContext.request.contextPath}/goManageSignBoardMember.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}">조원 관리</a></li>
	</ul>
</div>

