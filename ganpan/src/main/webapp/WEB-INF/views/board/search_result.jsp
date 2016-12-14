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
				<c:forEach items="${sbList}" var="svo">
				<tr>
					<td><span class="glyphicon glyphicon-user" aria-hidden="true"></span></td>
					<td>${svo.bossMemberVO.nickName}</td>
					<td><a href="${pageContext.request.contextPath}/showSignBoard.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}">
						${svo.signBoardName}</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table><br>
		<c:choose>
			<c:when test="${pb.isPreviousPageGroup()}">
				<a href="${pageContext.request.contextPath}/findSignBoardListByTitle.do?title=${title}&pageNo=${pb.getStartPageOfPageGroup()-1}">◀</a>
			</c:when>
		</c:choose>
			<c:forEach begin="${pb.getStartPageOfPageGroup()}" end="${pb.nowPage-1}" varStatus="order">[<a href="${pageContext.request.contextPath}/findSignBoardListByTitle.do?title=${title}&pageNo=${order.index}">${order.index}</a>]</c:forEach>[${pb.nowPage}]<c:forEach begin="${pb.nowPage+1}" end="${pb.getEndPageOfPageGroup()}" varStatus="order">[<a href="${pageContext.request.contextPath}/findSignBoardListByTitle.do?title=${title}&pageNo=${order.index}">${order.index}</a>]</c:forEach> 
		<c:choose>
			<c:when test="${pb.isNextPageGroup()}">
				<a href="${pageContext.request.contextPath}/findSignBoardListByTitle.do?title=${title}&pageNo=${pb.getEndPageOfPageGroup()+1}">▶</a>
			</c:when>
		</c:choose>
	</div>
</div>