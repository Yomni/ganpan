<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<h2>구성원 보기</h2>
			<p>
				그룹 구성원 명단<br> 그룹장 : ${oList[0].signBoardVO.bossMemberVO.nickName}<br>
				<c:forEach items="${oList}" var="list" begin="1">
					그룹원 : ${list.workerMemberVO.nickName }<br>
				</c:forEach>
			</p>
		</div>
	</div>
</div>