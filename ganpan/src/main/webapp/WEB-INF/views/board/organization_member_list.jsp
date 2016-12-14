<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<table class="table table-hover">
				<thead>
					<tr>
						<th colspan="3">구성원보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>조장</td>
						<td><span class="glyphicon glyphicon-star" aria-hidden="true"></span></td>
						<td> ${oListVO.list[0].signBoardVO.bossMemberVO.nickName}</td>
					</tr>
					<c:forEach items="${oListVO.list}" var="list" begin="0" varStatus="order">
						<tr>
							<c:if test="${list.workerMemberVO.nickName != list.signBoardVO.bossMemberVO.nickName}">
								<td></td>
								<td><span class="glyphicon glyphicon-user" aria-hidden="true"></span></td>
								<td> ${list.workerMemberVO.nickName}</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
     	 <c:choose>
	       <c:when test="${oListVO.pagingBean.isPreviousPageGroup()}">
   				 <a href="${pageContext.request.contextPath}/showMemberList.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}&pageNo=${oListVO.pagingBean.getStartPageOfPageGroup()-1}">◀</a>
	       </c:when>
		  </c:choose>
        	<c:forEach begin="${oListVO.pagingBean.getStartPageOfPageGroup()}" end="${oListVO.pagingBean.nowPage-1}" varStatus="order">
        		[<a href="${pageContext.request.contextPath}/showMemberList.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}&pageNo=${order.index}">${order.index}</a>]
        	</c:forEach>[${oListVO.pagingBean.nowPage}]<c:forEach begin="${oListVO.pagingBean.nowPage+1}" end="${oListVO.pagingBean.getEndPageOfPageGroup()}" varStatus="order">
        		[<a href="${pageContext.request.contextPath}/showMemberList.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}&pageNo=${order.index}">${order.index}</a>]
        	</c:forEach> 
	     <c:choose>
	        <c:when test="${oListVO.pagingBean.isNextPageGroup()}">
	     	   <a href="${pageContext.request.contextPath}/showMemberList.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}&pageNo=${oListVO.pagingBean.getEndPageOfPageGroup()+1}">▶</a>
	        </c:when>
 		  </c:choose>
		</div>
	</div>
</div>