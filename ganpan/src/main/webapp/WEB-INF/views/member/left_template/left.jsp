<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><a href="${pageContext.request.contextPath}/go_member/left_template/my_info.do">내 정보 보기<!-- <span class="sr-only">(current)</span> --></a></li>
				<li><a href="${pageContext.request.contextPath}/go_member/left_template/my_info_update.do">내 정보 수정</a></li>
				<li><a href="${pageContext.request.contextPath}/member/leave.do">회원 탈퇴</a></li>
			</ul>
			<ul class="nav nav-sidebar">
				<li><a href="${pageContext.request.contextPath}/mySignBoardList.do">소유 작업</a></li>
				<li><a href="${pageContext.request.contextPath}/myJoinSignBoardList.do">참여 작업</a></li>
				<li><a href="${pageContext.request.contextPath}/invitationList.do">초대 현황</a></li>
			</ul>
		</div>
	</div>
</div>

