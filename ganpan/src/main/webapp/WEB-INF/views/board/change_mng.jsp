<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="text-center page-header">변경 이력</h2>
				<a class="btn btn-info" href="${pageContext.request.contextPath}/showSignBoard.do?signBoardName=${signBoardName}&bossNickName=${bossNickName}">간판보기</a>
			<div class="pull-right">
				<a class="btn btn-info" href="${pageContext.request.contextPath}/showMemberList.do?signBoardName=${signBoardName}&bossNickName=${bossNickName}">참여 구성원 보기</a>
				<c:if test="${bossNickName == mvo.nickName}">
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/ganpanSettingPage.do?signBoardName=${signBoardName}&bossNickName=${bossNickName}">간판 설정</a>
				</c:if>
			</div>
			<br> <br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>해야 할 작업의 변경 이력</th>
						<th>하고 있는 작업의 변경 이력</th>
						<th>끝난 작업의 변경 이력</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>작업자</th>
										<th>작업일시</th>
										<th>작업이름</th>
										<th>변경종류</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${changeMngMap.toDoListVO.list}" var="toDoList">
										<tr>
											<td>${toDoList.changeWorker}</td>
											<td>${toDoList.changeMngDate}</td>
											<td>${toDoList.workVO.workName}</td>
											<td>${toDoList.changeGenreVO.changeName}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<nav class="text-center">
								<ul class="pagination pagination-sm">
									<c:choose>
										<c:when test="${changeMngMap.toDoListVO.pagingBean.isPreviousPageGroup()}">
											<li><a href="${pageContext.request.contextPath}/changeMng.do?signBoardName=${signBoardName}&bossNickName=${bossNickName}&
											toDoPageNo=${changeMngMap.toDoListVO.pagingBean.getStartPageOfPageGroup()-1}&
											doingPageNo=${changeMngMap.doingListVO.pagingBean.nowPage}&
											donePageNo=${changeMngMap.doneListVO.pagingBean.nowPage}&
											" aria-label="Previous">
													<span aria-hidden="true">&laquo;</span>
												</a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${changeMngMap.toDoListVO.pagingBean.getStartPageOfPageGroup()}" end="${changeMngMap.toDoListVO.pagingBean.getEndPageOfPageGroup()}" varStatus="order">
										<c:choose>
											<c:when test="${changeMngMap.toDoListVO.pagingBean.nowPage == order.index}">
												<li class="active">
											</c:when>
											<c:otherwise>
												<li>
											</c:otherwise>
										</c:choose>
										<a href="${pageContext.request.contextPath}/changeMng.do?signBoardName=${signBoardName}&bossNickName=${bossNickName}&
											toDoPageNo=${order.index}&
											doingPageNo=${changeMngMap.doingListVO.pagingBean.nowPage}&
											donePageNo=${changeMngMap.doneListVO.pagingBean.nowPage}&
											">${order.index}</a>
										</li>
									</c:forEach>
									<c:choose>
										<c:when test="${changeMngMap.toDoListVO.pagingBean.isNextPageGroup()}">
											<li><a href="${pageContext.request.contextPath}/changeMng.do?signBoardName=${signBoardName}&bossNickName=${bossNickName}&
											toDoPageNo=${changeMngMap.toDoListVO.pagingBean.getEndPageOfPageGroup()+1}&
											doingPageNo=${changeMngMap.doingListVO.pagingBean.nowPage}&
											donePageNo=${changeMngMap.doneListVO.pagingBean.nowPage}&">
													<span aria-hidden="true">&raquo;</span>
												</a></li>
										</c:when>
									</c:choose>
								</ul>
							</nav>
						</td>
						<td>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>작업자</th>
										<th>작업일시</th>
										<th>작업이름</th>
										<th>변경종류</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${changeMngMap.doingListVO.list}" var="doingList">
										<tr>
											<td>${doingList.changeWorker}</td>
											<td>${doingList.changeMngDate}</td>
											<td>${doingList.workVO.workName}</td>
											<td>${doingList.changeGenreVO.changeName}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<nav class="text-center">
								<ul class="pagination pagination-sm">
									<c:choose>
										<c:when test="${changeMngMap.doingListVO.pagingBean.isPreviousPageGroup()}">
											<li><a href="${pageContext.request.contextPath}/changeMng.do?signBoardName=${signBoardName}&bossNickName=${bossNickName}&
											toDoPageNo=${changeMngMap.toDoListVO.pagingBean.nowPage}&
											doingPageNo=${changeMngMap.doingListVO.pagingBean.getStartPageOfPageGroup()-1}&
											donePageNo=${changeMngMap.doneListVO.pagingBean.nowPage}&
											" aria-label="Previous">
													<span aria-hidden="true">&laquo;</span>
												</a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${changeMngMap.doingListVO.pagingBean.getStartPageOfPageGroup()}" end="${changeMngMap.doingListVO.pagingBean.getEndPageOfPageGroup()}" varStatus="order">
										<c:choose>
											<c:when test="${changeMngMap.doingListVO.pagingBean.nowPage == order.index}">
												<li class="active">
											</c:when>
											<c:otherwise>
												<li>
											</c:otherwise>
										</c:choose>
										<a href="${pageContext.request.contextPath}/changeMng.do?signBoardName=${signBoardName}&bossNickName=${bossNickName}&
											toDoPageNo=${changeMngMap.toDoListVO.pagingBean.nowPage}&
											doingPageNo=${order.index}&
											donePageNo=${changeMngMap.doneListVO.pagingBean.nowPage}&
											">${order.index}</a>
										</li>
									</c:forEach>
									<c:choose>
										<c:when test="${changeMngMap.doingListVO.pagingBean.isNextPageGroup()}">
											<li><a href="${pageContext.request.contextPath}/changeMng.do?signBoardName=${signBoardName}&bossNickName=${bossNickName}&
											toDoPageNo=${changeMngMap.toDoListVO.pagingBean.nowPage}&
											doingPageNo=${changeMngMap.doingListVO.pagingBean.getEndPageOfPageGroup()+1}&
											donePageNo=${changeMngMap.doneListVO.pagingBean.nowPage}&">
													<span aria-hidden="true">&raquo;</span>
												</a></li>
										</c:when>
									</c:choose>
								</ul>
							</nav>
						</td>
						<td>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>작업자</th>
										<th>작업일시</th>
										<th>작업이름</th>
										<th>변경종류</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${changeMngMap.doneListVO.list}" var="doneList">
										<tr>
											<td>${doneList.changeWorker}</td>
											<td>${doneList.changeMngDate}</td>
											<td>${doneList.workVO.workName}</td>
											<td>${doneList.changeGenreVO.changeName}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<nav class="text-center">
								<ul class="pagination pagination-sm">
									<c:choose>
										<c:when test="${changeMngMap.doneListVO.pagingBean.isPreviousPageGroup()}">
											<li><a href="${pageContext.request.contextPath}/changeMng.do?signBoardName=${signBoardName}&bossNickName=${bossNickName}&
											toDoPageNo=${changeMngMap.toDoListVO.pagingBean.nowPage}&
											doingPageNo=${changeMngMap.doingListVO.pagingBean.nowPage}&
											donePageNo=${changeMngMap.doneListVO.pagingBean.getStartPageOfPageGroup()-1}&
											" aria-label="Previous">
													<span aria-hidden="true">&laquo;</span>
												</a></li>
										</c:when>
									</c:choose>
									<c:forEach begin="${changeMngMap.doneListVO.pagingBean.getStartPageOfPageGroup()}" end="${changeMngMap.doneListVO.pagingBean.getEndPageOfPageGroup()}" varStatus="order">
										<c:choose>
											<c:when test="${changeMngMap.doneListVO.pagingBean.nowPage == order.index}">
												<li class="active">
											</c:when>
											<c:otherwise>
												<li>
											</c:otherwise>
										</c:choose>
										<a href="${pageContext.request.contextPath}/changeMng.do?signBoardName=${signBoardName}&bossNickName=${bossNickName}&
											toDoPageNo=${changeMngMap.toDoListVO.pagingBean.nowPage}&
											doingPageNo=${changeMngMap.doingListVO.pagingBean.nowPage}&
											donePageNo=${order.index}&
											">${order.index}</a>
										</li>
									</c:forEach>
									<c:choose>
										<c:when test="${changeMngMap.doneListVO.pagingBean.isNextPageGroup()}">
											<li><a href="${pageContext.request.contextPath}/changeMng.do?signBoardName=${signBoardName}&bossNickName=${bossNickName}&
											toDoPageNo=${changeMngMap.toDoListVO.pagingBean.nowPage}&
											doingPageNo=${changeMngMap.doingListVO.pagingBean.nowPage}&
											donePageNo=${changeMngMap.doneListVO.pagingBean.getEndPageOfPageGroup()+1}&">
													<span aria-hidden="true">&raquo;</span>
												</a></li>
										</c:when>
									</c:choose>
								</ul>
							</nav>
						</td>
					</tr>
				</tbody>
			</table>
			<h2 class="text-center">총 변경 이력</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>작업자</th>
						<th>작업일시</th>
						<th>작업이름</th>
						<th>작업한 간판 종류</th>
						<th>변경종류</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${changeMngMap.totalChangeMngList}" var="totalList">
						<tr>
							<td>${totalList.changeMngNo}</td>
							<td>${totalList.changeWorker}</td>
							<td>${totalList.changeMngDate}</td>
							<td>${totalList.workVO.workName}</td>
							<td>
								<c:choose>
								<c:when test="${totalList.boardNo == 1}">해야 할 작업</c:when>
								<c:when test="${totalList.boardNo == 2}">하고 있는 작업</c:when>
								<c:when test="${totalList.boardNo == 3}">끝난 작업</c:when>
								</c:choose>
							</td>
							<td>${totalList.changeGenreVO.changeName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- col-md-10 col-md-offset-1 -->
	</div>
	<!-- row -->
</div>
<!-- container -->
