<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main Content -->
<div class="container">
	<div class="row">
		<h2 class="text-center text-capitalize page-header">구성원</h2>
		<div class="col-md-6 col-md-offset-3">
			<table class="table table-hover">
				<tbody>
					<tr>
						<td>조장</td>
						<td><span class="glyphicon glyphicon-star" aria-hidden="true"></span></td>
						<td>${oListVO.list[0].signBoardVO.bossMemberVO.nickName}</td>
					</tr>
					<c:forEach items="${oListVO.list}" var="list" begin="0" varStatus="order">
						<tr>
							<c:if test="${list.workerMemberVO.nickName != list.signBoardVO.bossMemberVO.nickName}">
								<td></td>
								<td><span class="glyphicon glyphicon-user" aria-hidden="true"></span></td>
								<td>${list.workerMemberVO.nickName}</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav class="text-center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${oListVO.pagingBean.isPreviousPageGroup()}">
							<li><a href="${pageContext.request.contextPath}/showMemberList.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}&pageNo=${oListVO.pagingBean.getStartPageOfPageGroup()-1}" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a></li>
						</c:when>
					</c:choose>
					<c:forEach begin="${oListVO.pagingBean.getStartPageOfPageGroup()}" end="${oListVO.pagingBean.getEndPageOfPageGroup()}" varStatus="order">
						<c:choose>
							<c:when test="${oListVO.pagingBean.nowPage == order.index}">
								<li class="active">
							</c:when>
							<c:otherwise>
								<li>
							</c:otherwise>
						</c:choose>
						<a href="${pageContext.request.contextPath}/showMemberList.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}&pageNo=${order.index}"> ${order.index}</a>
						</li>
					</c:forEach>
					<c:choose>
						<c:when test="${oListVO.pagingBean.isNextPageGroup()}">
							<li><a href="${pageContext.request.contextPath}/showMemberList.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}&pageNo=${oListVO.pagingBean.getEndPageOfPageGroup()+1}" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a></li>
						</c:when>
					</c:choose>
				</ul>
			</nav>
		</div>
	</div>
</div>