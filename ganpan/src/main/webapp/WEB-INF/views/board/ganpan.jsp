<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery.sortable.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/droppable.css" />
<c:set var="memberNickName" value="${sessionScope.mvo.nickName}" />
<c:set value="false" var="rightMoveWork" />
<c:forEach items="${orgList}" var="olist">
	<c:if test="${olist.workerMemberVO.nickName == memberNickName}">
		<c:set value="true" var="rightMoveWork" />
	</c:if>
</c:forEach>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="text-center text-capitalize page-header">${rsvo.signBoardName}</h2>
			<div class="pull-right">
				<a class="btn btn-info" href="${pageContext.request.contextPath}/changeMng.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}">변경 이력 보기</a> 
				<a class="btn btn-info" href="${pageContext.request.contextPath}/showMemberList.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}">참여 구성원 보기</a>
				<c:if test="${rsvo.bossMemberVO.nickName==sessionScope.mvo.nickName}">
					<a class="btn btn-primary" href="${pageContext.request.contextPath}/ganpanSettingPage.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}">간판 설정</a>
				</c:if>
			</div>
			<br> <br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<c:forEach items="${rsvo.boardList}" var="rsvo">
							<th>
							<c:if test="${rsvo.boardGenreVO.boardNo == 1}">해야 할 작업</c:if> 
							<c:if test="${rsvo.boardGenreVO.boardNo == 2}">하고 있는 작업</c:if> 
							<c:if test="${rsvo.boardGenreVO.boardNo == 3}">끝난 작업</c:if>
							</th>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach items="${rsvo.boardList}" var="boardList">
							<td><c:if test="${boardList.boardGenreVO.boardName == 'TO_DO' && sessionScope.mvo != null}">
									<a class="btn btn-default" href="${pageContext.request.contextPath}/goCreateWork.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}"><span class="glyphicon glyphicon-plus" aria-hidden="true">작업추가</span></a>
								</c:if>
								<ul class="list-unstyled ui-widget-header ui-widget-content" id="${boardList.boardGenreVO.boardName}">
									<c:forEach items="${boardList.works}" var="works">
										<li class="panel panel-info" id="draggablePanelList" draggable="true">
											<div class="panel-heading">작업자 : ${works.organizationVO.workerMemberVO.nickName}</div>
											<div class="panel-body">
												<c:choose>
													<c:when test="${works.organizationVO.workerMemberVO.nickName == null && boardList.boardGenreVO.boardNo != 3}">
														<button class="btn btn-danger btn-sm" id="${works.workNo}">작업자로 참여</button>
													</c:when>
													<c:when test="${sessionScope.mvo != null}">
														<a href="#" data-toggle="modal" data-target="#${works.workNo}modal" id="${works.workNo}">작업명 : ${works.workName}</a>
													</c:when>
													<c:otherwise>
														작업명 : ${works.workName}
													</c:otherwise>
												</c:choose>
											</div>
										</li>

										<div class="modal fade" id="${works.workNo}modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<form action="${pageContext.request.contextPath}/updateWork.do" method="post" id="${works.workNo}Form">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<input type="hidden" name="signBoardName" value="${rsvo.signBoardName}"/>
															<input type="hidden" name="bossNickName" value="${rsvo.bossMemberVO.nickName}"/>
															<input type="hidden" name="boardNo" value="${works.boardNo}"/>
															<input type="hidden" name="workNo" value="${works.workNo}"/>
															<input type="hidden" name="organizationVO.workerMemberVO.nickName" value="${works.organizationVO.workerMemberVO.nickName}"/>
															<h4 class="modal-title"><input type="text" name="workName" value="${works.workName}" required="required"/></h4>
														</div>
														<div class="modal-body">
															<p>
																<textarea rows="" cols="" name="workDetails" required="required">${works.workDetails}</textarea>
															</p>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default" data-dismiss="modal" id="btn btn-default">닫기</button>
															<c:if test="${rightMoveWork}">
																<button type="submit" class="btn btn-primary" data-dismiss="modal" id="${works.workNo}">수정</button>
																<button type="button" class="btn btn-danger" data-dismiss="modal" id="${works.workNo}">삭제</button>
															</c:if>
														</div>
													</form>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->
											<!-- 여기까지 뺄 것 -->
										</div>
									</c:forEach>
								</ul></td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- col-md-10 col-md-offset-1 -->
	</div>
	<!-- row -->
</div>
<!-- container -->
<!-- 
   1. sortable
   2. drag & drop
   3. ajax변경
 -->
<c:choose>
<c:when test="${sessionScope.mvo != null}">
<script type="text/javascript">
	if(${rightMoveWork}) {
		$(function(){
			var workNo = 0;
			$("ul li").mouseover(function() {
				workNo = $(this).find("a").attr("id");
			}); // mouseover
			
			$("#TO_DO").sortable({
				connectWith:"#DOING"
			}); // sortable
			
			$("#DOING").sortable({
				connectWith:"#DONE",
				receive:function() {
					$.ajax({
						type:"POST",
						url:"${pageContext.request.contextPath}/moveWorkAjax.do",
						data:"workNo=" + workNo
					}); // ajax
				} // receive
			}); // sortable
			
			$("#DONE").sortable({
				connectWith: "#DONE",
				receive:function() {
					$.ajax({
						type:"POST",
						url:"${pageContext.request.contextPath}/moveWorkAjax.do",
						data:"workNo=" + workNo
					}); // ajax
				} // receive
			}); // sortable
		     
			$(".modal-footer .btn-primary").click(function(){
	     		if(confirm("작업을 수정하시겠습니까?\n*주의) 다른 조원에게도 영향을 줍니다.")){
					$("#"+$(this).attr("id")+"Form").submit();
				} else {
					return false;
				}
	   		}); // click
	   		
			$(".modal-footer .btn-danger").click(function(){
				if(confirm("작업을 삭제하시겠습니까?\n*주의) 다른 조원에게도 영향을 줍니다."))
					location.href="${pageContext.request.contextPath}/deleteWork.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}&workNo="+$(this).attr("id");
			}); // click
		     
			$("ul li div.panel-body button").click(function(){
				location.href="${pageContext.request.contextPath}/joinAsWorkerByWorkNo.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}&nickName=${sessionScope.mvo.nickName}&workNo="+$(this).attr("id");
			}); // clilck
		}); //ready
	}
	else {
		$(".modal-title input").attr("readonly","readonly");
		$(".modal-body p textarea").attr("readonly","readonly");
	}
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
	$(".modal-title input").attr("readonly","readonly");
	$(".modal-body p textarea").attr("readonly","readonly");
</script>
</c:otherwise>
</c:choose>