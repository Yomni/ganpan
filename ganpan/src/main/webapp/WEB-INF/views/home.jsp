<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Content -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div id="content-wrapper">
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="4u 12u(mobile)">

						<!-- Box #1 -->
							<section>
								<header>
									<h2>우리가 누구인가?</h2>
									<h3>&nbsp;간판은 최고의 일정관리 도구 입니다.</h3>
								</header>
								<a href="#" class="feature-image"><img src="${pageContext.request.contextPath}/resources/images/pic05.jpg" alt="" /></a>
								<p>
									전 세계 30,000,000명 사람들이 사용하고 있습니다. 
								</p>
							</section>
					</div>
					
					<div class="4u 12u(mobile)">

						<!-- Box #3 -->
							<section>
								<header>
									<h2>간판은 유용합니다</h2>
									<h3>다음과 같이 사용되고 있습니다.</h3>
								</header>
								<ul class="quote-list">
									<li>
										<img src="${pageContext.request.contextPath}/resources/images/pic06.jpg" alt="" />
										<p>"개인일정관리에 좋아요"</p>
										<span>Jane Doe, CEO of UntitledCorp</span>
									</li>
									<li>
										<img src="${pageContext.request.contextPath}/resources/images/pic07.jpg" alt="" />
										<p>"팀프로젝트 관리에 최고입니다!"</p>
										<span>John Doe, President of FakeBiz</span>
									</li>
									<li>
										<img src="${pageContext.request.contextPath}/resources/images/pic08.jpg" alt="" />
										<p>"삶은 간판을 만나기 전과 이후로 나뉜다."</p>
										<span>Mary Smith, CFO of UntitledBiz</span>
									</li>
								</ul>
							</section>

					</div>
					
					<c:if test="${!empty sessionScope.mvo}">
						<div class="4u 12u(mobile)">
	
							<!-- Box #3 -->
								<section>
									<header>
										<h2>내 간판 리스트</h2>
									</header>
									
									
									<ul class="nav nav-tabs" role="tablist" id="myTab">
									  <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">모든 칸반</a></li>
									  <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">공개 칸반</a></li>
									  <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">비공개 칸반</a></li>
									</ul>
									
									<div class="tab-content">
									  <div role="tabpanel" class="tab-pane fade in active" id="home">
											<table>
												<tr>
													<th>간판 제목</th>
													<th>그룹장</th>
												</tr>
												<c:forEach items="${sbMap.allList}" var="signBoardVO">			
													<tr>	
														<td>${signBoardVO.signBoardName}</td>
														<td>${signBoardVO.bossMemberVO.nickName}</td>
													</tr>
												</c:forEach>
											</table>
									  </div>
									  <div role="tabpanel" class="tab-pane fade" id="profile">
											<table>
												<tr>
													<th>간판 제목</th>
													<th>그룹장</th>
												</tr>
												<c:forEach items="${sbMap.publicList}" var="signBoardVO">			
													<tr>	
														<td>${signBoardVO.signBoardName}</td>
														<td>${signBoardVO.bossMemberVO.nickName}</td>
													</tr>
												</c:forEach>
											</table>
									</div>
									  <div role="tabpanel" class="tab-pane fade" id="messages">
											<table>
												<tr>
													<th>간판 제목</th>
													<th>그룹장</th>
												</tr>
												<c:forEach items="${sbMap.privateList}" var="signBoardVO">			
													<tr>	
														<td>${signBoardVO.signBoardName}</td>
														<td>${signBoardVO.bossMemberVO.nickName}</td>
													</tr>
												</c:forEach>
											</table>
									</div>
									</div>
									
								</section>
	
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function(){
        
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        	  e.target // newly activated tab
        	  e.relatedTarget // previous active tab
        	})
	}); // ready
	</script>