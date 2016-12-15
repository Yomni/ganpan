<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<table class="table table-hover">
					<thead>
						<tr>
							<th colspan="3">조원 목록</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>조장</td>
							<td><span class="glyphicon glyphicon-star" aria-hidden="true"></span></td>
							<td> ${oListVO.list[0].signBoardVO.bossMemberVO.nickName}</td>
							<td> </td>
						</tr>
						<c:forEach items="${oListVO.list}" var="list" begin="0" varStatus="order">
							<tr>
								<c:if test="${list.workerMemberVO.nickName != list.signBoardVO.bossMemberVO.nickName}">
									<td></td>
									<td><span class="glyphicon glyphicon-user" aria-hidden="true"></span></td>
									<td> ${list.workerMemberVO.nickName}</td>
									<td> 
										<a class="btn btn-sm btn-default" href="${pageContext.request.contextPath}/banish.do?signBoardName=
										${list.signBoardVO.signBoardName}&bossNickName=
										${list.signBoardVO.bossMemberVO.nickName}&workerNickName=
										${list.workerMemberVO.nickName}">그룹에서 추방</a>
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					<nav>
	  					<ul class="pagination">
							 <c:choose>
							       <c:when test="${oListVO.pagingBean.isPreviousPageGroup()}">
							        <li>
					   				 <a href="${pageContext.request.contextPath}/goManageSignBoardMember.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}&pageNo=${oListVO.pagingBean.getStartPageOfPageGroup()-1}" aria-label="Previous">
					   				 <span aria-hidden="true">&laquo;</span></a>
						            </li>
							       </c:when>
							 	 </c:choose>
					        	<c:forEach begin="${oListVO.pagingBean.getStartPageOfPageGroup()}" end="${oListVO.pagingBean.getEndPageOfPageGroup()}" varStatus="order">
					        		<li><a href="${pageContext.request.contextPath}/goManageSignBoardMember.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}&pageNo=${order.index}">
					        			${order.index}</a>
					        		</li>
					        	</c:forEach> 
						       <c:choose>
						        <c:when test="${oListVO.pagingBean.isNextPageGroup()}">
						          <li>
						     	    <a href="${pageContext.request.contextPath}/goManageSignBoardMember.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}&pageNo=${oListVO.pagingBean.getEndPageOfPageGroup()+1}" aria-label="Next">
						     	     <span aria-hidden="true">&raquo;</span></a>
						     	  </li>
						       </c:when>
						  </c:choose>
					  </ul>
				 </nav>
			</div>
		</div>
	</div>
</div>