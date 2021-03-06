<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>그룹 초대 현황</h2>
				<table class="table table-hover" id="inviteTable">
					<thead>
						<tr>
							<th>간판 제목</th>
							<th>그룹장</th>
							<th>초대 날짜</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${iListVO.list}" var="invitationMngVO" varStatus="status">			
							<tr>	
								<td>${invitationMngVO.signBoardVO.signBoardName}</td>
								<td>${invitationMngVO.signBoardVO.bossMemberVO.nickName}</td>
								<td>${invitationMngVO.invitationDate}</td>
								<td><%-- <input type="button" id="accept${status.count}" value="수락"/> --%>
									<button type="button" class="btn btn-success" id="accept${status.count}" value="수락" >  					
										<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
									</button>
								</td>
								<td>
									<button type="button" class="btn btn-danger" id="reject${status.count}" value="거절">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<nav class="text-center">
					<ul class="pagination">
						 <c:choose>
					       <c:when test="${iListVO.pagingBean.isPreviousPageGroup()}">
					        <li>
			   				 <a href="${pageContext.request.contextPath}/invitationList.do?pageNo=${iListVO.pagingBean.getStartPageOfPageGroup()-1}" aria-label="Previous">
			   				 <span aria-hidden="true">&laquo;</span></a>
				            </li>
					       </c:when>
					 	 </c:choose>
			        	<c:forEach begin="${iListVO.pagingBean.getStartPageOfPageGroup()}" end="${iListVO.pagingBean.getEndPageOfPageGroup()}" varStatus="order">
			        		<c:choose>
								<c:when test="${iListVO.pagingBean.nowPage == order.index}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
			        		<a href="${pageContext.request.contextPath}/invitationList.do?pageNo=${order.index}">
			        			${order.index}</a>
			        		</li>
			        	</c:forEach> 
				       <c:choose>
				        <c:when test="${iListVO.pagingBean.isNextPageGroup()}">
				          <li>
				     	    <a href="${pageContext.request.contextPath}/invitationList.do?pageNo=${iListVO.pagingBean.getEndPageOfPageGroup()+1}" aria-label="Next">
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

<script type="text/javascript">
	$(document).ready(function(){
		<c:forEach items="${iListVO.list}" varStatus="status">
			$("#accept${status.count}").click(function(){
				var signBoardName = $("#inviteTable tr:eq(${status.count}) td:eq(0)").text();
				var bossNickName = $("#inviteTable tr:eq(${status.count}) td:eq(1)").text();
				location.href="${pageContext.request.contextPath}/acceptInvitation.do?signBoardName="+signBoardName+"&bossNickName="+bossNickName;
			}); // click
			$("#reject${status.count}").click(function(){
				var signBoardName = $("#inviteTable tr:eq(${status.count}) td:eq(0)").text();
				var bossNickName = $("#inviteTable tr:eq(${status.count}) td:eq(1)").text();
				location.href="${pageContext.request.contextPath}/rejectInvitation.do?signBoardName="+signBoardName+"&bossNickName="+bossNickName;
			}); // click
		</c:forEach> // forEach
	});//ready
</script>