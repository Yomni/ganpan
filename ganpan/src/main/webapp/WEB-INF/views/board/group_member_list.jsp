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
								<section>
									<header>
										<h2>구성원 보기</h2>
									</header>
									<p>
									그룹 구성원 명단<br>
									그룹장 : ${oList[0].signBoardVO.bossMemberVO.nickName}<br>
									<c:forEach items="${oList}" var="list">
										${rsvo.signBoardName}<br>
										${rsvo.bossMemberVO.nickName}<br>
										${list.workerNickName.nickName}<br>
										그룸원 : ${list.workerNickName.nickName }<br>
									</c:forEach>
									</p>
								</section>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>