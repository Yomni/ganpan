<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">간판에 초대할 회원의 별명이나 전자우편를 입력해주세요</h3>
				</div>
				<div class="panel-body">
				<form method="post" action="${pageContext.request.contextPath}/inviteWorker.do" name="inviteForm">
					<input type="hidden" value="${svo.signBoardName}" name="signBoardName"> 
					<input type="hidden" value="${svo.bossMemberVO.nickName}" name="bossNickName"> 
					<input type="hidden" id="value" value="email" name="type">
					<div class="form-group">
						<h4>
							<span id="idCheckView"></span>
						</h4>
						<input type="text" class="form-control" id="id" name="id" placeholder="초대하실 회원의 별명이나 전자우편" required="required" />
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-success pull-right" id="invitationBtn">초대하기</button>
					</div>
				</form>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">그룹 초대 현황</h3>
					</div>
					<div class="panel-body">	
						<table id="inviteTable" class="table table-hover">
							<thead>
								<tr>
									<th>별명</th>
									<th>이메일</th>
									<th>초대 날짜</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${mListVO.list}" var="MList" varStatus="status">
									<tr>
										<td>${MList.NICKNAME}</td>
										<td>${MList.EMAIL}</td>
										<td>${MList.INVITATIONDATE}</td>
										<td>
											<%-- <input type="button" id="cancel${status.count}" value="초대 취소" /> --%>
											<button type="button" class="btn btn-sm btn-danger" id="cancel${status.count}" value="초대 취소" aria-label="Left Align">
												<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<nav>
  							<ul class="pagination">
								 <c:choose>
							       <c:when test="${mListVO.pagingBean.isPreviousPageGroup()}">
							        <li>
					   				 <a href="${pageContext.request.contextPath}/sendInvitationList.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}&pageNo=${mListVO.pagingBean.getStartPageOfPageGroup()-1}" aria-label="Previous">
					   				 <span aria-hidden="true">&laquo;</span></a>
						            </li>
							       </c:when>
							 	 </c:choose>
					        	<c:forEach begin="${mListVO.pagingBean.getStartPageOfPageGroup()}" end="${mListVO.pagingBean.getEndPageOfPageGroup()}" varStatus="order">
					        		<li><a href="${pageContext.request.contextPath}/sendInvitationList.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}&pageNo=${order.index}">
					        			${order.index}</a>
					        		</li>
					        	</c:forEach> 
						       <c:choose>
						        <c:when test="${mListVO.pagingBean.isNextPageGroup()}">
						          <li>
						     	    <a href="${pageContext.request.contextPath}/sendInvitationList.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}&pageNo=${mListVO.pagingBean.getEndPageOfPageGroup()+1}" aria-label="Next">
						     	     <span aria-hidden="true">&raquo;</span></a>
						     	  </li>
						        </c:when>
					 		  </c:choose>
					       </ul>
					   </nav>
					</div>
			  </div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$("#invitationBtn").click(function() {
		//email형식일때와 닉네임일 때 구분해서 hidden값으로 controller에 넘겨줌
			var id = document.inviteForm.id;
			if (id.value.indexOf('@') == -1) {
				$("#value").val("nickName");
			}
			if(checkResultGroup=="")
				return false;
		});
		<c:forEach items="${mListVO.list}" varStatus="status">
			$("#cancel${status.count}").click(function(){
				var workerNickName = $("#inviteTable tr:eq(${status.count}) td:eq(0)").text();
				location.href = "${pageContext.request.contextPath}/cancelInvitation.do?signBoardName=${svo.signBoardName}&nickName="
								+ workerNickName+ "&bossNickName=${svo.bossMemberVO.nickName}"					
			});
		</c:forEach>

        var checkResultGroup="";
        $("#id").keyup(function(){
        	var id = $(this).val().trim();
           $.ajax({
              type:"POST",
              url:"${pageContext.request.contextPath}/groupCheckAjax.do",            
              data:"id="+id+"&signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}",
              success:function(data){   
                 if(data=="idfail"){// 회원 테이블에 존재하지 않는 경우
                    $("#idCheckView").html("존재하지 않는 사용자입니다!").css("color", "red");
                    checkResultGroup="";
                 }else if(data=="groupbossfail"){// 그룹장이 자신을 초대한 경우
                    $("#idCheckView").html("자신에게 초대할 수 없습니다!").css("color", "red");
                    checkResultGroup="";
                 }else if(data=="alreadyinvitefail"){ 
                	 alert("alreadyinvitefail");
                     $("#idCheckView").html("이미 초대하신 회원입니다!").css("color", "red");
                     checkResultGroup="";
                 }else if(data=="groupfail"){// 그룹에 있는 회원이 아닌 경우
                     $("#idCheckView").html("초대 가능합니다").css("color","green"); 
                     checkResultGroup="group";
                 }else{
                    checkResultGroup="";
                    $("#idCheckView").html("이미 조에 속해있는 회원입니다!").css("color", "red");     
                 }               
              }//callback         
           });//ajax
        });//keyup
        
	});//ready
</script>