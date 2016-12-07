<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<!-- Main Content -->
	<h2>구성원 보기</h2>
	그룹 구성원 명단 <br> 그룹장 : ${oList[0].signBoardVO.bossMemberVO.nickName} <br>
	<c:forEach items="${oList}" var="list">
		${list.workerMemberVO.nickName}<br>
		그룹원 : ${list.workerMemberVO.nickName } | 
		<a href="${pageContext.request.contextPath}/banish.do?signBoardName=
		${list.signBoardVO.signBoardName}&bossNickName=
		${list.signBoardVO.bossMemberVO.nickName}&workerNickName=
		${list.workerMemberVO.nickName}">그룹에서 추방</a>
		<br>
	</c:forEach>
</div>