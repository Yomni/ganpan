<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(function(){
		var checkResultNickName="";	
		var checkResultEMail="";		
		$("#regForm").submit(function(){	
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
		$(":input[name=eMail]").keyup(function(){
			var eMail=$(this).val().trim();
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/eMailCheckAjax.do",				
				data:"eMail="+eMail,
				success:function(data){						
					if(data=="fail"){
						$("#eMailCheckView").html(eMail+" 사용불가!").css("color", "red");
						checkResultEMail="";
					}else{
						$("#eMailCheckView").html(eMail+" 사용가능!").css("color","green");		
						checkResultEMail=eMail;
					}					
				}//callback			
			});//ajax
		});//keyup
		$(":input[name=nickName]").keyup(function(){
			var nickName=$(this).val().trim();
			if(nickName.length<2 || nickName.length>15){
				$("#nickNameCheckView").html("별명은 2자이상 15자 이하여야 합니다!").css("color", "red");
				return;
			}else{
				$("#nickNameCheckView").html("");
			}
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/nickNameCheckAjax.do",				
				data:"nickName="+nickName,
				success:function(data){						
					if(data=="fail"){
					$("#nickNameCheckView").html(nickName+" 사용불가!").css("color", "red");
						checkResultNickName="";
					}else{						
						$("#nickNameCheckView").html(nickName+" 사용가능!").css("color", "green");		
						checkResultNickName=nickName;
					}					
				}//callback			
			});//ajax
		});//keyup	
	});//ready
</script>

<form method="post" action="${pageContext.request.contextPath}/register.do" id="regForm">
	전자우편 <input type="text" name="eMail"><span id="eMailCheckView"></span><br>
	별명 <input type="text" name="nickName"><span id="nickNameCheckView"></span><br> 
	비밀번호 <input type="password" name="password" id="password"><span id="passwordCheckView"></span><br> 
	비밀번호 확인 <input type="password" id="passwordCheck"><br> 
	<input type="submit" value="회원가입">
</form>
