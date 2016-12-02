<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!-- banner -->
<div id="banner">
	<div class="container">
		<div class="row">
			
		  	<c:choose>
	  	  		<c:when test="${empty sessionScope.mvo}">
			<!-- 왼편 글자 -->
			<div class="6u 12u(mobile)">
				<!-- Banner Copy -->
				<p>놀랄만큼 쉽습니다.</p>
				<p>놀랄만큼 간단합니다.</p>
				<p>지금 당장 사용해보세요</p>
			</div>
					<!-- 회원가입form -->
					<div class="6u 12u(mobile)">
						<form method="post" action="${pageContext.request.contextPath}/register.do" id="msform">
							<fieldset>
								<h2 class="fs-title">계정을 생성하세요</h2>
								<h2 class="fs-title"><span id="eMailCheckView"></span></h2>
								<input type="text" id="eMail" name="eMail" placeholder="전자우편" />
								<h2 class="fs-title"><span id="nickNameCheckView"></span></h2>
								<input type="text" id="nickName" name="nickName" placeholder="별명" />
								<h2 class="fs-title"><span id="passwordView"></span></h2>
								<input type="password" id="password" id="password" name="password" placeholder="비밀번호" />
								<input type="password" id="passwordCheck" placeholder="비밀번호 확인" /><span id="passwordCheckView"></span>
								<input type="submit" class="next action-button" value="회원가입" />
							</fieldset>
						</form>
					</div>
					<!-- 회원가입form의 div -->
	  	  		</c:when>
	  	  		<c:otherwise>
					<a href="${pageContext.request.contextPath}/board/guide.do" class="button-big">간판 소개</a>
					<a href="${pageContext.request.contextPath}/board/create_new_ganpan.do" class="button-big">간판 만들기</a>
	  	  		</c:otherwise>
	  	  	</c:choose>
		</div>
		<!-- div class row -->
	</div>
	<!-- div class container -->
</div>
<!-- div id=banner -->
<script type="text/javascript">
	$(document).ready(function(){
		var checkResultNickName="";	
		var checkResultEMail="";		
		$("#msform").submit(function(){	
			if($(":input[name=eMail]").val().trim()==""){
				alert("전자우편을 입력하세요");				
				return false;
			}
			if($(":input[name=nickName]").val().trim()==""){
				alert("별명을 입력하세요");				
				return false;
			}
			if($(":input[name=password]").val().trim()==""){
				alert("비밀번호를 입력하세요");				
				return false;
			}
			if($("#password").val()!=$("#passwordCheck").val()){
				alert("비밀번호 중복확인을 하세요");
				return false;
			}
			if(checkResultEMail == "" || checkResultNickName == ""){
				alert("전자우편과 닉네임 중복확인을 해주세요!");
				return false;
			}
		});//submit
		$(":input[name=password]").keyup(function(){
			var password=$(this).val().trim();
			if(password.length<6 || password.length>15){
				$("#passwordView").html("비밀번호는 6자 이상 15자로 입력해주세요").css("color", "red");
				return false;
			}else{
				$("#passwordView").html("");	
			}
		});
		$(":input[name=eMail]").keyup(function(){
			var eMail=$(this).val().trim();
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/eMailCheckAjax.do",				
				data:"eMail="+eMail,
				success:function(data){						
					if(data=="fail"){
						$("#eMailCheckView").html("사용중인 전자우편입니다!").css("color", "red");
						checkResultEMail="";
					}else{
						$("#eMailCheckView").html("");	
						checkResultEMail=eMail;
					}					
				}//callback			
			});//ajax
		});//keyup
		$(":input[name=nickName]").keyup(function(){
			var nickName=$(this).val().trim();
			if(nickName.length<2 || nickName.length>15){
				$("#nickNameCheckView").html("별명은 2자 이상 15자 이하로 입력해주세요").css("color", "red");
				return;
			}else{						
				$("#nickNameCheckView").html("");		
				checkResultNickName=nickName;
			}
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/nickNameCheckAjax.do",				
				data:"nickName="+nickName,
				success:function(data){						
					if(data=="fail"){
					$("#nickNameCheckView").html("사용중인 별명입니다!").css("color", "red");
						checkResultNickName="";
					}else{						
						$("#nickNameCheckView").html("");		
						checkResultNickName=nickName;
					}					
				}//callback			
			});//ajax
		});//keyup	
	});//ready
</script>