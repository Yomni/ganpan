<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-md-8 col-md-offset-4">
	<!-- Content -->
	<div class="container">
		<div class="row">
			<!-- Main Content -->
			<div class="col-md-6">
				<form id="updateSignBoardNameForm" action="${pageContext.request.contextPath}/updateSignBoardName.do">
					<input type="hidden" name="signBoardName" value="${svo.signBoardName}" />
					<input type="hidden" name="bossNickName" value="${svo.bossMemberVO.nickName}" />
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">간판의 이름을 변경합니다</h3>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<input type="text" class="form-control" name="changeTitle" id="changeTitle" placeholder="새로운 간판 이름 작성" required="required" />
							</div>
							<h4>
								<span id="titleCheckView"></span>
							</h4>
							<div class="form-group">
								<button type="submit" class="btn btn-success pull-right" id="changeTitleBtn">수정</button>
							</div>
						</div>
					</div>
				</form>
				<br>

				<form id="updateSignBoardVisibilityForm" action="${pageContext.request.contextPath}/updateVisibility.do">
					<input type="hidden" name="signBoardName" value="${svo.signBoardName}" />
					<input type="hidden" name="bossNickName" value="${svo.bossMemberVO.nickName}" />
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">간판의 공개 범위를 설정합니다</h3>
						</div>
						<div class="panel-body">
							<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
							<input type="radio" name="visibility" value="public" />
							간판 공개 : 누구나 간판을 볼 수 있습니다.<br> <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
							<input type="radio" name="visibility" value="private" />
							간판 비공개 : 그룹원만 볼 수 있습니다.<br>
							<input type="submit" class="btn btn-success pull-right" id="changeVisibilityBtn" value="설정 완료" />
						</div>
					</div>
				</form>
				<br>

				<form id="updateSignBoardBossForm" action="${pageContext.request.contextPath}/updateSignBoardBoss.do">
					<input type="hidden" name="signBoardName" value="${svo.signBoardName}" />
					<input type="hidden" name="bossNickName" value="${svo.bossMemberVO.nickName}" />
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">간판의 조장을 위임합니다</h3>
						</div>
						<div class="panel-body">
							<input type="text" class="form-control" name="id" id="id" placeholder="위임할 그룹원의 전자우편 혹은 별명 작성" required="required" />
							<h4>
								<span id="groupCheckView"></span>
							</h4>
							<input type="submit" class="btn btn-success pull-right" id="changeTitleBtn" value="위임" />
							<br>
						</div>
					</div>
				</form>
				<br>

				<form id="deleteSignBoardForm" action="${pageContext.request.contextPath}/deleteSignBoard.do">
					<input type="hidden" name="signBoardName" value="${svo.signBoardName}" />
					<input type="hidden" name="bossNickName" value="${svo.bossMemberVO.nickName}" />
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">간판을 삭제합니다!</h3>
						</div>
						<div class="panel-body">

							주의) 해당 이력과 모든 정보가 사라집니다 &nbsp;
							<button type="submit" class="btn btn-sm btn-danger" id="deleteGanpanBtn" value="간판 삭제">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		if(${svo.visibility == 0}){
		$("input:radio[name=visibility]:radio[value=public]").attr("checked",true);
		}else{
			$("input:radio[name=visibility]:radio[value=private]").attr("checked",true);
		}
		
		$("#updateSignBoardNameForm").submit(function(){
			if($(":input[name=changeTitle]").val().trim()==""){
				alert("수정하실 간판 이름을 입력하세요!");
				return false;
			}
			if(checkResultTitle == ""){
				alert("이미 소유한 간판 이름입니다.");
				$("#changeTitle").val("");
				return false;
			}
		}); // submit
		
		$("#updateSignBoardVisibilityForm").submit(function(){
			if($(":input[name=visibility]:checked").val()==undefined){
				alert("공개 설정 여부를 선택하세요!");
				return false;
			}
		}); // submit
		
		$("#updateSignBoardBossForm").submit(function(){
			if($(":input[name=id]").val().trim()==""){
				alert("위임하실 그룹원을 입력하세요!");
				return false;
			}
			if(checkResultGroup == ""){
				alert("닉네임을 다시 확인하세요!");
				return false;
			}
		}); // submit
		
		$("#deleteSignBoardForm").submit(function(){
			if(!confirm("정말로 삭제하시겠습니까?")){
				return false;
			}
		}); // submit
		var checkResultTitle="";	
      $(":input[name=changeTitle]").keyup(function(){
			var title=$(this).val().trim();
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/titleCheckAjax.do",				
				data:"title="+title,
				success:function(data){						
					if(data=="fail"){
						$("#titleCheckView").html(title+" 사용불가!").css("color", "red");
						checkResultTitle="";
					}else{
						$("#titleCheckView").html(title+" 사용가능!").css("color","green");		
						checkResultTitle="title";
					}					
				}//callback			
			});//ajax
		});//keyup

		var checkResultGroup="";
      $(":input[name=id]").keyup(function(){
			var id=$(this).val().trim();
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/groupCheckAjax.do",				
				data:"id="+id+"&signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}",
				success:function(data){	
					if(data=="idfail"){
						$("#groupCheckView").html("존재하지 않는 사용자입니다!").css("color", "red");
						checkResultGroup="";
					}else if(data=="groupfail"){
						$("#groupCheckView").html("그룹원이 아니면 위임할 수 없습니다!").css("color", "red");
						checkResultGroup="";
					}else if(data=="groupbossfail"){
						$("#groupCheckView").html("자신에게 위임할 수는 없습니다!").css("color", "red");
						checkResultGroup="";
					}else{
						checkResultGroup="group";
						$("#groupCheckView").html("위임가능!").css("color","green");		
					}					
				}//callback			
			});//ajax
		});//keyup
	}); // ready
</script>
