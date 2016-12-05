<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
test page
	<h3>session 확인</h3>
		전자우편: ${sessionScope.mvo.eMail} <br>
		별명: ${sessionScope.mvo.nickName}
		<hr>
		<a href="">내 정보 보기</a><br>
		<a href="">내 정보 수정</a><br>
		<a href="">내 소유 작업</a><br>
		<a href="">참여 작업</a><br>
		<a href="">회원탈퇴</a><br>
		<a href="">초대 현황</a><br>