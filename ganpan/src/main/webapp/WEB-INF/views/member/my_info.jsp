<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	전자우편: ${sessionScope.mvo.eMail} <br> 별명: ${sessionScope.mvo.nickName}
</div>

<hr>
		<input type="button" id="" value="내 정보 보기"/><br>
		<input type="button" id="my_info_update" value="내 정보 수정"/><br>
		<input type="button" id="my_ganpan_list" value="소유 작업"/><br>
		<input type="button" id="my_join_ganpan_list" value="참여 작업"/><br>
		<input type="button" id="leave" value="회원탈퇴"/><br>
		<input type="button" id="invitation_list" value="초대 현황"/><br>
		
		<a href="">내 정보 보기</a>
		<a href="">내 정보 수정</a>
		<a href="">내 소유 작업</a>
		<a href="">참여 작업</a>
		<a href="">회원탈퇴</a>
		<a href="">초대 현황</a>
		
		

		<br><br>
		내정보보기 들어가면 바로 보여줄 내용들<br>
		전자우편: ${sessionScope.mvo.eMail} <br>
		별명: ${sessionScope.mvo.nickName}
