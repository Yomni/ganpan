<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="page-wrapper">
		<div id="content-wrapper">
			<div id="content">
				<div class="container">
					<div class="row">
						<div class="12u">
							<!-- Main Content -->
							<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
								<section>
									<header>
										<h2>구성원 보기</h2>
									</header>
									<p>
									그룹 구성원 명단<br>
									그룹장 : ${oList[0].signBoardVO.bossMemberVO.nickName}<br>
									<c:forEach items="${oList}" var="list">
										<%-- 간판 이름 : ${list.signBoardVO.signBoardName}<br>
										보스 이름 : ${list.signBoardVO.bossMemberVO.nickName}<br>
										작업자 이름 : ${list.workerNickName.nickName}<br> --%>
										그룸원 : ${list.workerNickName.nickName } | 
											<a href="${pageContext.request.contextPath}/banish.do?signBoardName=${list.signBoardVO.signBoardName}
												&bossNickName=${list.signBoardVO.bossMemberVO.nickName}
												&workerNickName=${list.workerNickName.nickName}">그룹에서 추방</a><br>
									</c:forEach>
									</p>
								</section>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>