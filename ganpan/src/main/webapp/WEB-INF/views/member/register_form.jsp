<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 회원가입form -->
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<p><h1>간판에 가입하기</h1></p>
			<p><h4>작업을 계획하고, 진행상황을 한번에 확인하세요</h4></p>
			<form method="post" action="${pageContext.request.contextPath}/register.do" >
				<div class="form-group">
					<h4><span id="eMailCheckView"></span></h4>
					<label for="eMail">전자우편</label>
					<input type="email" class="form-control" id="eMail" name="eMail" placeholder="전자우편" />
				</div>
				<div class="form-group">
					<h4><span id="nickNameCheckView"></span></h4>
					<label for="nickName">별명</label>
					<input type="text" class="form-control" id="nickName" name="nickName" placeholder="별명" />
				</div>
				<div class="form-group">
					<h4><span id="passwordView"></span></h4>
					<label for="password">비밀번호</label>
					<input type="password" class="form-control" id="password" id="password" name="password" placeholder="비밀번호" />
				</div>
				<div class="form-group">
					<h4><span id="passwordCheckView"></span></h4>
					<label for="passwordCheck">비밀번호 확인</label>
					<input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호 확인" />
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-default btn-success btn-block" id="registerBtn">가입하기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 회원가입 form의 div -->
<script type="text/javascript">
	$(document).ready(function(){
		var checkResultNickName = false;	
		var checkResultEMail = false;
		var checkResultPassword = false;
		
		$("#registerBtn").click(function() {
			var nickName = $("#nickName").val().trim();
			var eMail = $("#eMail").val().trim();
			var password = $("#password").val().trim();
			if(eMail == "") {
				alert("전자우편을 입력하세요!");
				$("#eMail").focus();
				return false;
			}
			if(nickName == "") {
				alert("별명을 입력하세요!");
				$("#nickName").focus();
				return false;
			}
			if(password == "") {
				alert("비밀번호을 입력하세요!");
				$("#password").focus();
				return false;
			}
			if(checkResultNickName == false) {
				alert("별명을 확인하세요!");
				$("#nickName").val("").focus();
				return false;
			}	
			if(checkResultEMail == false) {
				alert("전자우편을 확인하세요!");
				$("#eMail").val("").focus();
				return false;
			}	
			if(checkResultPassword == false) {
				alert("비밀번호를 확인하세요!");
				$("#passwordCheck").val("");
				$("#password").val("").focus();
				return false;
			}
		});//submit
		
		$("#password").keyup(function(){
			var password=$(this).val().trim();
			if(password == ""){
				$("#passwordView").html("");
				checkResultPassword = false;
				return;
			} 
			if(password.length < 6 || password.length > 15){
				$("#passwordView").html(
					"<div class='alert alert-danger' role='alert'>"
					+ "비밀번호는 6자 이상 15자 이하로 작성해주세요."
					+ "</div>");
				checkResultPassword = false;
				return;
			} else {
				$("#passwordView").html("");
				checkResultPassword = true;
			}
		}); //password key up
		
		$("#passwordCheck").keyup(function(){
			var passwordCheck=$(this).val().trim();
			var password = $("#password").val().trim();
			if(passwordCheck == "") {
				$("#passwordCheckView").html("");
				checkResultPassword = false;
				return;
			}
			if(password != passwordCheck) {
				$("#passwordCheckView").html(
					"<div class='alert alert-danger' role='alert'>"
					+ "입력하신 비밀번호와 일치하지 않습니다."
					+ "</div>");
				checkResultPassword = false;
				return;
			} else {
				$("#passwordCheckView").html("");
				checkResultPassword = true;
			}
		}); //passwordCheck key up
		
		$("#eMail").keyup(function(){
			var eMail=$(this).val().trim();
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/eMailCheckAjax.do",				
				data:"eMail="+eMail,
				success:function(data){						
					if(data=="fail"){
						$("#eMailCheckView").html(
							"<div class='alert alert-danger' role='alert'>"
							+ "사용중인 전자우편입니다."
							+ "</div>");
						checkResultEMail=false;
					}else{
						$("#eMailCheckView").html("");	
						checkResultEMail=true;
					}					
				}//callback			
			});//ajax
		});//keyup
		
		$("#nickName").keyup(function(){
			var nickName=$(this).val().trim();
			if(nickName == "") {
				$("#nickNameCheckView").html("");		
				checkResultNickName = false;
				return;
			}
			if(nickName.length<2 || nickName.length>15){
				$("#nickNameCheckView").html(
					"<div class='alert alert-danger' role='alert'>"
					+ "별명은 2자 이상 15자 이하로 작성해주세요."
					+ "</div>");
				checkResultNickName = false;
				return;
			} else {						
				$("#nickNameCheckView").html("");		
			}
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/nickNameCheckAjax.do",				
				data:"nickName=" + nickName,
				success:function(data){					
					if(data=="fail"){
						$("#nickNameCheckView").html(
							"<div class='alert alert-danger' role='alert'>"
							+ " 사용중인 별명입니다."
							+ "</div>");
						checkResultNickName = false;
					} else {					
						$("#nickNameCheckView").html("");		
						checkResultNickName = true;
					}					
				}//callback			
			});//ajax
		});//keyup	
	});//ready
</script>