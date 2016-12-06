<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
test page
	<a href="${pageContext.request.contextPath}/go_home.do">홈으로</a><br>
	${pageContext.request.contextPath}
	<h3>session 확인</h3>
		전자우편: ${sessionScope.mvo.eMail} <br>
		별명: ${sessionScope.mvo.nickName}
		<hr>
		<a href="">내 정보 보기</a><br>
		<a href="">내 정보 수정</a><br>
		<a href="${pageContext.request.contextPath}/go_member/my_ganpan_list.do">내 소유 작업</a><br>
		<a href="">참여 작업</a><br>
		<a href="">회원탈퇴</a><br>
		<a href="">초대 현황</a><br>
		<a href="?signBoardName=간판&bossNickName=우주선">그룹원 초대</a><br>