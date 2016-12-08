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
									<a class="btn btn-default" href="${pageContext.request.contextPath}/
									goCreateWork.do?signBoardName=${rsvo.signBoardName}
									&bossNickName=${rsvo.bossMemberVO.nickName}"><span class="glyphicon glyphicon-plus" aria-hidden="true">작업추가</span> </a>
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
			<div class="sideBySide">
  <div class="left">
    <ul class="source connected">
      <li>Alfa Romeo</li>
      <li>Audi</li>
      <li>BMW</li>
      <li>Ford</li>
      <li>Jaguar</li>
      <li>Mercedes</li>
      <li>Porsche</li>
      <li>Tesla</li>
      <li>Volkswagen</li>
      <li>Volvo</li>
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
<c:if test="${sessionScope.mvo != null}">
<script type="text/javascript">
	$(function() {
		    $(".source li").draggable({
		    	  addClasses: false,
		    	  appendTo: "body",
		    	  helper: "clone"
		    	});
		    	 
		    	$(".target").droppable({
		    	  addClasses: false,
		    	  activeClass: "listActive",
		    	  accept: ":not(.ui-sortable-helper)",
		    	  drop: function(event, ui) {
		    	    $(this).find(".placeholder").remove();
		    	    var link = $("<a href='#' class='dismiss'>x</a>");
		    	    var list = $("<li></li>").text(ui.draggable.text());
		    	    $(list).append(link);
		    	    $(list).appendTo(this);
		    	    updateValues();
		    	  }
		    	}).sortable({
		    	  items: "li:not(.placeholder)",
		    	  sort: function() {
		    	    $(this).removeClass("listActive");
		    	  },
		    	  update: function() {
		    	    updateValues();
		    	  }
		    	}).on("click", ".dismiss", function(event) {
		    	  event.preventDefault();
		    	  $(this).parent().remove();
		    	  updateValues();
		    	});	
	});
	function updateValues() {
	    alert();
	  };
</script>
</c:if>