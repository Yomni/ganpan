<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<h2>구성원 보기</h2>
			<p>
				조직원 명단<br>
				조장 : ${oList[0].signBoardVO.bossMemberVO.nickName}<br>
				<c:forEach items="${oList}" var="list" begin="0">
					<c:if test="${list.workerMemberVO.nickName != list.signBoardVO.bossMemberVO.nickName}">
						조원 : ${list.workerMemberVO.nickName}<br>
					</c:if>
				</c:forEach>
			</p>
		</div>
	</div>
</div>