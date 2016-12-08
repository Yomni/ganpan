<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery.sortable.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/droppable.css" />
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<h2 class="text-center">${rsvo.signBoardName}</h2>
			<ul class="link-list">
				<li><a href="${pageContext.request.contextPath}/board/change_record.do">변경 이력 보기</a></li>
				<li><a href="${pageContext.request.contextPath}/showMemberList.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}">참여 구성원 보기</a></li>
				<li><a href="${pageContext.request.contextPath}/ganpanSettingPage.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}">간판 설정</a></li>
			</ul>
			<table class="table table-bordered">
				<thead>
					<tr>
						<c:forEach items="${rsvo.boardList}" var="rsvo">
							<th>${rsvo.boardGenreVO.boardName}</th>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach items="${rsvo.boardList}" var="boardList">
							<td><c:if test="${boardList.boardGenreVO.boardName == '해야 할 작업'}">
									<a class="btn btn-default" href="${pageContext.request.contextPath}/
								goCreateWork.do?signBoardName=${rsvo.signBoardName}
								&bossNickName=${rsvo.bossMemberVO.nickName}"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> </a>
								</c:if>
								<ul class="list-unstyled connected" id="${boardList.boardGenreVO.boardName}">
									<c:forEach items="${boardList.works}" var="works">
										<li class="panel panel-info " id="draggablePanelList" draggable="true">
											<div class="panel-heading">${works.workName}</div>
											<div class="panel-body">
												<a href="#" data-toggle="modal" data-target="#${works.workNo}" id="workerNickName">${works.organizationVO.workerMemberVO.nickName}</a>
											</div>
										</li>

										<div class="modal fade" id="${works.workNo}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<h4 class="modal-title">${works.workName}</h4>
													</div>
													<div class="modal-body">
														<p>${works.workDetails}</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default">닫기</button>
														<button type="button" class="btn btn-primary">수정</button>
														<button type="button" class="btn btn-danger">삭제</button>
													</div>
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
			
			<!-- test용도 -->
			<div class="sideBySide">
				<div class="left">
					<ul class="source connected">
						<li data-stock-symbol="BMW">BMW</li>
						<li data-stock-symbol="DDFAIF">Daimler</li>
						<li data-stock-symbol="FIADF">Fiat</li>
						<li data-stock-symbol="F">Ford</li>
						<li data-stock-symbol="POAHF">Porsche</li>
						<li data-stock-symbol="TSLA">Tesla</li>
						<li data-stock-symbol="VLKAF">Volkswagen</li>
					</ul>
				</div>
				<div class="right">
					<ul class="target connected">
					</ul>
				</div>
			</div>
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
<script type="text/javascript">
	$(function() {
		$("#해야 할 작업, #하고있는 작업").sortable({
			connectWith : "#하고있는 작업"
		}); // sortable todo->doing
		$("#하고있는 작업, #끝난 작업").sortable({
			connectWith : "#끝난 작업"
		}); // sortable doing->done
	}); // ready 
</script>