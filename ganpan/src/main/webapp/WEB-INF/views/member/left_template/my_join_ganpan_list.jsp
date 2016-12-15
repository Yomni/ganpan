<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-md-offset-3 text-center">
				<c:choose>
					<c:when test="${empty sbListVO.list}">
						<h2>
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						참여하신 간판이 없습니다
						</h2>
					</c:when>
					<c:otherwise>
						<h2>참여 간판 목록</h2>
						<br>
						<table class="table table-bordered table-hover" id="myJoinGanpanTable">
							<thead>
								<tr>
									<th class="text-center">간판명</th>
									<th class="text-center">조장</th>
									<th class="text-center">나가기</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sbListVO.list}" var="signBoardVO" varStatus="status">
									<tr>
										<td><a href="${pageContext.request.contextPath}/showSignBoard.do?bossNickName=${signBoardVO.bossMemberVO.nickName}&signBoardName=${signBoardVO.signBoardName}">${signBoardVO.signBoardName} </a></td>
										<td>${signBoardVO.bossMemberVO.nickName}</td>
										<td>
											<a class="btn btn-sm btn-danger" id="leave${status.count}" aria-label="Left Align"
											href="${pageContext.request.contextPath}/leaveOrganization.do
											?signBoardName=${signBoardVO.signBoardName}&bossNickName=${signBoardVO.bossMemberVO.nickName}">
												<span class="glyphicon glyphicon-plane" aria-hidden="true"></span>
											</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table><br>
				        <nav class="text-center">
				             <ul class="pagination">
				               <c:choose>
				                  <c:when test="${sbListVO.pagingBean.isPreviousPageGroup()}">
				                   <li>
				                     <a href="${pageContext.request.contextPath}/myJoinSignBoardList.do?pageNo=${sbListVO.pagingBean.getStartPageOfPageGroup()-1}" aria-label="Previous">
				                     <span aria-hidden="true">&laquo;</span></a>
				                    </li>
				                  </c:when>
				                </c:choose>
				                <c:forEach begin="${sbListVO.pagingBean.getStartPageOfPageGroup()}" end="${sbListVO.pagingBean.getEndPageOfPageGroup()}" varStatus="order">
				                   <li><a href="${pageContext.request.contextPath}/myJoinSignBoardList.do?pageNo=${order.index}">
				                      ${order.index}</a>
				                   </li>
				                </c:forEach> 
				               <c:choose>
				                <c:when test="${sbListVO.pagingBean.isNextPageGroup()}">
				                  <li>
				                    <a href="${pageContext.request.contextPath}/myJoinSignBoardList.do?pageNo=${sbListVO.pagingBean.getEndPageOfPageGroup()+1}" aria-label="Next">
				                     <span aria-hidden="true">&raquo;</span></a>
				                  </li>
				                </c:when>
				              </c:choose>
				            </ul>
				        </nav>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- col -->
		</div>
		<!-- row -->
	</div>
	<!-- container -->

</div>
<script type="text/javascript">
	$(document).ready(function() {
		<c:forEach items="${sbListVO.list}" varStatus="status">
		$("#leave${status.count}").click(function() {
			if (confirm("정말 간판을 나가시겠습니까?") == false) {
				return false;
			} // if
		}); // function
		</c:forEach> // forEach
	});//ready
</script>
