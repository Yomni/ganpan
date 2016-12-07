<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<h3 class="text-center">'${sbList[0].signBoardName}'간판명 ${signBoardCount}개의 검색결과</h3>
	<div class="col-md-5 col-md-offset-4">
		<table class="table table-hover">
			<thead>
				<tr>
					<th></th>
					<th>별명</th>
					<th>간판명</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<c:forEach items="${sbList}" var="svo">
					<td><span class="glyphicon glyphicon-user" aria-hidden="true"></span></td>
					<td>${svo.bossMemberVO.nickName}</td>
					<td><a href="${pageContext.request.contextPath}/showGanpan.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}">
						${svo.signBoardName}</a></td>
				</c:forEach>
				</tr>
			</tbody>
		</table>
		<div class="bg-danger">
			페이징 예정
		</div>
	</div>
</div>