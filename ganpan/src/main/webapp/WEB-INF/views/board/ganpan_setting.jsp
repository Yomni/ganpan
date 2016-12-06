<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body class="subpage">
	<div id="page-wrapper">
		<!-- Content -->
		<div id="content-wrapper">
			<div id="content">
				<div class="container">
					<div class="row">
						<div class="3u 12u(mobile)">

							<!-- Sidebar -->
								<section>
									<ul class="link-list">
										<li><a href="${pageContext.request.contextPath}/ganpanSettingPage.do">간판 설정</a></li>
										<li><a href="${pageContext.request.contextPath}/inviteGroupMemberPage.do">그룹원 초대</a></li>
										<li><a href="${pageContext.request.contextPath}/manageGroupMemberPage.do">그룹원 관리</a></li>
									</ul>
								</section>
						</div>
						<div class="9u 12u(mobile) important(mobile)">
							<!-- Main Content -->
							<section>
								<form id="updateSignBoardNameForm" action="${pageContext.request.contextPath}/updateSignBoardName.do">
									<input type="hidden" name="" value="" />
									<h2>이름 바꾸기</h2>
									<input type="text" name="changeTitle" id="changeTitle" placeholder="새로운 간판 이름 작성" />
									<span id="titleCheckView"></span><br>
									<input type="submit" id="changeTitleBtn" value="이름바꾸기" /><br>
								</form><br>
								
								<form id="updateSignBoardVisibilityForm" action="${pageContext.request.contextPath}/updateSignBoardVisibility.do">
									<h2>공개 범위 설정</h2>
									간판 공개<br><input type="radio" name="visibility" value="public" />
									누구나 간판을 볼 수 있습니다.<br>
									간판 비공개<br><input type="radio" name="visibility" value="private"/>
									그룹원만 볼 수 있습니다.<br>
									<input type="submit" id="changeVisibilityBtn" value="설정 완료" />
								</form><br>
								
								<form id="updateSignBoardBossForm" action="${pageContext.request.contextPath}/updateSignBoardBoss.do">
									<h2>그룹장 위임</h2>
									<input type="text" name="changeBoss" id="changeBoss" placeholder="위임할 그룹원의 전자우편 혹은 별명 작성" />
									<input type="submit" id="changeTitleBtn" value="이름바꾸기" /><br>
								</form><br>
								
								<form id="deleteSignBoardForm" action="${pageContext.request.contextPath}/deleteSignBoard.do">
								<h2>간판 삭제</h2>
								*주의) 간판을 삭제합니다! 해당 이력과 모든 정보가 사라집니다.
								<input type="submit" id="deleteGanpanBtn" value="간판 삭제" />
								</form>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
	<script type="text/javascript">
		$(document).ready(function(){
			if(${svo.visibility} == 0){
				$("input:radio[name=visibility]:radio[value=public]").attr("checked",true);
			}else{
				$("input:radio[name=visibility]:radio[value=private]").attr("checked",true);
			}
			$("#updateSignBoardNameForm").submit(function(){
				if($(":input[name=changeTitle]").val().trim()==""){
					alert("수정하실 간판 이름을 입력하세요!");
					return false;
				}
				if(checkResultTitle==""){
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
				if($(":input[name=changeBoss]").val().trim()==""){
					alert("위임하실 그룹원을 입력하세요!");
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
							checkResultTitle=title;
						}					
					}//callback			
				});//ajax
			});//keyup
		}); // ready
	</script>