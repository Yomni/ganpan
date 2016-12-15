<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<form method="post" action="${pageContext.request.contextPath}/updateMember.do" >
				 <div class="panel panel-default">
			  		<div class="panel-heading">
			  		  	<h3 class="panel-title">
							<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
							회원 정보를 수정하세요
						</h3>
			 		 </div>
			  		<div class="panel-body">
						<div class="form-group">
							<h4><span id="eMailCheckView"></span></h4>
							<label for="eMail">전자우편</label>
							<input type="email" class="form-control" id="eMail" name="eMail" placeholder="전자우편"
								value="${mvo.eMail}" required="required"/>
						</div>
						<div class="form-group">
							<h4><span id="nickNameCheckView"></span></h4>
							<label for="nickName">별명</label>
							<input type="text" class="form-control" id="nickName" name="nickName" placeholder="별명"
								value="${mvo.nickName}" readonly="readonly" required="required"/>
						</div>
						<div class="form-group">
							<h4><span id="passwordView"></span></h4>
							<label for="password">비밀번호</label>
							<input type="password" class="form-control" id="password"
								value="${mvo.password}" name="password" placeholder="비밀번호" required="required"/>
						</div>
						<div class="form-group">
							<h4><span id="passwordCheckView"></span></h4>
							<label for="passwordCheck">비밀번호 확인</label>
							<input type="password" class="form-control" id="passwordCheck" 
								value="${mvo.password}" placeholder="비밀번호 확인" required="required"/>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-default btn-success btn-block" id="updateBtn">회원정보수정</button>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var checkResultEMail = true;
		var checkResultPassword = true;
		
		$("#updateBtn").click(function() {
			var eMail = $("#eMail").val().trim();
			var password = $("#password").val().trim();
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
			var password=$(this).val();
			var passwordCheck = $("#passwordCheck").val();
			if(password == ""){
				$("#passwordView").html("");
				$("#passwordCheck").html("");
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
			}
			if(password != passwordCheck) {
				$("#passwordCheckView").html(
					"<div class='alert alert-danger' role='alert'>"
					+ "입력하신 비밀번호와 일치하지 않습니다."
					+ "</div>");
				checkResultPassword = false;
				return;
			}
			else {
				$("#passwordCheckView").html("");
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
			if("${mvo.eMail}" != eMail) {
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
			} else {// end - if
				$("#eMailCheckView").html("");	
				checkResultEMail=true;
			} // end - else
		});//eMail keyup
	});//ready
</script>