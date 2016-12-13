<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery.sortable.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/droppable.css" />
<!--     <script type="text/javascript">
       $(document).ready(function(){
          $("#deleteWork").click(function(){ 
             if(confirm("게시물을 삭제하시겠습니까?"))
             location.href="${pageContext.request.contextPath}/deleteWork.do?command=delete&workNo=${requestScope.wvo.workNo}";
          });
       });   
   </script> -->

<div class="container">
<<<<<<< HEAD
   <div class="row">
      <div class="col-md-10 col-md-offset-1">
         <h2 class="text-center">${rsvo.signBoardName}</h2>
         <ul class="link-list">
            <li><a href="${pageContext.request.contextPath}/change_mng.do">변경 이력 보기</a></li>
            <li><a href="${pageContext.request.contextPath}/showMemberList.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}">참여 구성원 보기</a></li>
            <c:if test="${rsvo.bossMemberVO.nickName==sessionScope.mvo.nickName}">
               <li><a href="${pageContext.request.contextPath}/ganpanSettingPage.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}">간판 설정</a></li>
            </c:if>
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
                     <td>
                     	<c:if test="${boardList.boardGenreVO.boardName == 'TO_DO' && sessionScope.mvo != null}">
                           <a class="btn btn-default" href="${pageContext.request.contextPath}/
                           goCreateWork.do?signBoardName=${rsvo.signBoardName}
                           &bossNickName=${rsvo.bossMemberVO.nickName}"><span class="glyphicon glyphicon-plus" aria-hidden="true">작업추가</span> </a>
                        </c:if>
                        <ul class="list-unstyled ui-widget-header ui-widget-content" id="${boardList.boardGenreVO.boardName}">
                           <c:forEach items="${boardList.works}" var="works">
                              <li class="panel panel-info" id="draggablePanelList" draggable="true">
                                 <div class="panel-heading">${works.workName}</div>
                                 <div class="panel-body">
                                    <%-- <a href="#" data-toggle="modal" data-target="#${works.workNo}" id="${works.organizationVO.workerMemberVO.nickName}">${works.organizationVO.workerMemberVO.nickName}</a> --%>
                                    <c:choose>
                                    <c:when test="${works.organizationVO.workerMemberVO.nickName == null}">
                                       <button class="btn btn-danger btn-sm" id="${works.workNo}"><span class="glyphicon glyphicon-log-in" aria-hidden="true">작업자로 참여</span></button>
                                    </c:when>
                                    <c:otherwise>
                                       <a href="#" data-toggle="modal" data-target="#${works.workNo}modal" id="${works.workNo}">${works.organizationVO.workerMemberVO.nickName}</a>
                                    </c:otherwise>
                                    </c:choose>
                                 </div>
                              </li>
=======
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<h2 class="text-center">${rsvo.signBoardName}</h2>
			<ul class="link-list">
				<li><a href="${pageContext.request.contextPath}/board/change_record.do">변경 이력 보기</a></li>
				<li><a href="${pageContext.request.contextPath}/showMemberList.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}">참여 구성원 보기</a></li>
				<c:if test="${rsvo.bossMemberVO.nickName==sessionScope.mvo.nickName}">
					<li><a href="${pageContext.request.contextPath}/ganpanSettingPage.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}">간판 설정</a></li>
				</c:if>
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
								<ul class="list-unstyled ui-widget-header ui-widget-content" id="${boardList.boardGenreVO.boardName}">
									<c:forEach items="${boardList.works}" var="works">
										<li class="panel panel-info" id="draggablePanelList" draggable="true">
											<div class="panel-heading">${works.workName}</div>
											<div class="panel-body">
												<%-- <a href="#" data-toggle="modal" data-target="#${works.workNo}" id="${works.organizationVO.workerMemberVO.nickName}">${works.organizationVO.workerMemberVO.nickName}</a> --%>
												<c:choose>
												<c:when test="${works.organizationVO.workerMemberVO.nickName == null}">
													<button class="btn btn-danger btn-sm" id="${works.workNo}">작업자로 참여</button>
												</c:when>
												<c:otherwise>
													<a href="#" data-toggle="modal" data-target="#${works.workNo}modal" id="${works.workNo}">${works.organizationVO.workerMemberVO.nickName}</a>
												</c:otherwise>
												</c:choose>
											</div>
										</li>
>>>>>>> branch 'master' of https://github.com/Yomni/ganpan.git

                              <div class="modal fade" id="${works.workNo}modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                          <button type="button" class="btn btn-default" data-dismiss="modal" id="btn btn-default">닫기</button>
                                          
                                          <button type="button" class="btn btn-primary" data-dismiss="modal">수정</button>
                                          <!-- <button type="button" class="btn btn-danger" data-dismiss="modal" id="deleteWork">삭제</button> -->
                                          <button type="button" class="btn btn-danger" data-dismiss="modal"  
                                          onclick="${pageContext.request.contextPath}/deleteWork.do?signBoardName=${rsvo.signBoardName}
                                          &bossNickName=${rsvo.bossMemberVO.nickName}&workNo=${works.workNo}">삭제</button>
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
   $(function(){
      var workNo = 0;
      $("ul li").mouseover(function() {
         workNo = $(this).find("a").attr("id");
      });
      $("#TO_DO").sortable({
         connectWith:"#DOING",
         update:function(){
            // ajax 사용 예정
         }
      }); // sortable
      $("#DOING").sortable({
         connectWith:"#DONE",
         update:function(){
            // ajax 사용 예정
         }
      }); // sortable

      $("#DONE").sortable({
         connectWith: "#DONE"
      }); // sortable
      
      //$("#${works.workNo}modal").modal('toggle');
      $("#${works.workNo}modal").on("hidden.bs.modal", function(event){
         
      });
      
      /* $("#deleteWork").click(function(){
         if(confirm("게시물을 삭제하시겠습니까?"))
             //location.href="${pageContext.request.contextPath}/deleteWork.do?command=delete&workNo=${requestScope.wvo.workNo}";
            window.location="${pageContext.request.contextPath}/deleteWork.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}&workNo=${works.workNo}";
      }); */
      
      
      $("#DONE").sortable(); // sortable
      
      
      $("ul li div.panel-body button").click(function(){
         location.href="${pageContext.request.contextPath}/joinAsWorkerByWorkNo.do?signBoardName=${rsvo.signBoardName}&bossNickName=${rsvo.bossMemberVO.nickName}&nickName=${sessionScope.mvo.nickName}&workNo="+$(this).attr("id");
      });
   }); //ready
</script>
</c:if>