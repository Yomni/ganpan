<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		// login 페이지로 이동
		$("#my_info_update").click(function(){
			location.href="${pageContext.request.contextPath}/member/my_info_update.do";
		});
		$("#my_ganpan_list").click(function(){
			location.href="${pageContext.request.contextPath}/member/my_ganpan_list.do";
		});
		$("#my_join_ganpan_list").click(function(){
			location.href="${pageContext.request.contextPath}/member/my_join_ganpan_list.do";
		});
		$("#leave").click(function(){
			location.href="${pageContext.request.contextPath}/member/leave.do";
		});
		$("#invitation_list").click(function(){
			location.href="${pageContext.request.contextPath}/member/invitation_list.do";
		});
	});
</script>
<input type="button" id="" value="내 정보 보기"/><br>
<input type="button" id="my_info_update" value="내 정보 수정"/><br>
<input type="button" id="my_ganpan_list" value="소유 작업"/><br>
<input type="button" id="my_join_ganpan_list" value="참여 작업"/><br>
<input type="button" id="leave" value="회원탈퇴"/><br>
<input type="button" id="invitation_list" value="초대 현황"/><br>

<br><br>

전자우편: ${sessionScope.mvo.eMail} <br>
별명: ${sessionScope.mvo.nickName}