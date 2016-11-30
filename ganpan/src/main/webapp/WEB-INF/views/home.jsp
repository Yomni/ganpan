<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(function(){
		var checkResulteMail="";		
		$("#regForm").submit(function(){			
			if($(":input[name=eMail]").val().trim()==""){
				alert("전자우편을 입력하세요");				
				return false;
			}
			if($(":input[name=nickname]").val().trim()==""){
				alert("별명을 입력하세요");				
				return false;
			}
			if($(":input[name=password]").val().trim()==""){
				alert("비밀번호를 입력하세요");				
				return false;
			}
			if(checkResulteMail==""){
				alert("전자우편 중복확인을 하세요");
				return false;
			}		
		});//submit
		$(":input[name=eMail]").keyup(function(){
			var eMail=$(this).val().trim();
			$.ajax({
				type:"POST",
				url:"eMailCheckAjax.do",				
				data:"eMail="+eMail,
				success:function(data){						
					if(data=="fail"){
					$("#eMailCheckView").html(eMail+" 사용불가!").css("red");
						checkResulteMail="";
					}else{						
						$("#eMailCheckView").html(eMail+" 사용가능!").css(
								"background","yellow");		
						checkResulteMail=eMail;
					}					
				}//callback			
			});//ajax
		});//keyup
		$(":input[name=nickname]").keyup(function(){
			var nickname=$(this).val().trim();
			if(nickname.length<2 || nickname.length>15){
				$("#nicknameCheckView").html("별명은 2자이상 15자 이하여야 합니다!").css("red");
				checkResultNickname="";
				return;
			}
			$.ajax({
				type:"POST",
				url:"nickNameCheckAjax.do",				
				data:"nickName="+nickName,
				success:function(data){						
					if(data=="fail"){
					$("#nickNameCheckView").html(nickName+" 사용불가!").css("red");
						checkResultNickName="";
					}else{						
						$("#nickNameCheckView").html(nickName+" 사용가능!").css("yellow");		
						checkResultNickName=nickName;
					}					
				}//callback			
			});//ajax
		});//keyup
		$(":input[name=password]").keyup(function(){
			var password=$(this).val().trim();
			if(password.length<6|| password.length>15){
				$("#passwordCheckView").html("비밀번호는 6자이상 15자 이하여야 합니다!").css("red");
				checkResultPassword="";
				return;
				}			
			}//callback			
	});//ready
</script>

<form method="post" action="register.do" id="regForm">
	전자우편 <input type="text" name="eMail"><span id="eMailCheckView"></span><br>
	별명 <input type="text" name="nickname"><span id="nickNameCheckView"></span><br> 
	비밀번호 <input type="password" name="password"><span id="passwordCheckView"></span><br> 
	비밀번호 확인 <input type="password" name="passwordCheck"><br> 
	<input type="submit" value="회원가입">
</form>
