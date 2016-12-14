<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-md-offset-3 text-center">
				<c:choose>
					<c:when test="${empty sbListVO.list}">
						<h3>소유하신 간판이 없습니다</h3>
					</c:when>
					<c:otherwise>
						<h2>나의 간판 목록</h2>
						<br>
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th class="text-center">간판명</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sbListVO.list}" var="signBoardVO">
									<tr>
										<td><a href="showSignBoard.do?bossNickName=${signBoardVO.bossMemberVO.nickName}
									&signBoardName=${signBoardVO.signBoardName}">${signBoardVO.signBoardName}</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table><br>
						<c:choose>
							<c:when test="${sbListVO.pagingBean.isPreviousPageGroup()}">
								<a href="${pageContext.request.contextPath}/mySignBoardList.do?pageNo=${sbListVO.pagingBean.getStartPageOfPageGroup()-1}">◀</a>
							</c:when>
						</c:choose>
							<c:forEach begin="${sbListVO.pagingBean.getStartPageOfPageGroup()}" end="${sbListVO.pagingBean.nowPage-1}" varStatus="order">[<a href="${pageContext.request.contextPath}/mySignBoardList.do?pageNo=${order.index}">${order.index}</a>]</c:forEach>[${sbListVO.pagingBean.nowPage}]<c:forEach begin="${sbListVO.pagingBean.nowPage+1}" end="${sbListVO.pagingBean.getEndPageOfPageGroup()}" varStatus="order">[<a href="${pageContext.request.contextPath}/mySignBoardList.do?pageNo=${order.index}">${order.index}</a>]</c:forEach> 
						<c:choose>
							<c:when test="${sbListVO.pagingBean.isNextPageGroup()}">
								<a href="${pageContext.request.contextPath}/mySignBoardList.do?pageNo=${sbListVO.pagingBean.getEndPageOfPageGroup()+1}">▶</a>
							</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- col -->
		</div>
		<!-- row -->
	</div>

	<!-- container -->
</div>