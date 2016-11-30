<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(function(){
		var checkResultEMail="";		
		$("#updateForm").submit(function(){	
			if($(":input[name=eMail]").val().trim()==""){
				alert("전자우편을 입력하세요");				
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
			if(checkResultEMail == ""){
				alert("전자우편 중복확인을 해주세요!");
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
	});//ready
</script>

<form method="post" action="${pageContext.request.contextPath}/updateMember.do" id="updateForm">
	전자우편 <input type="text" name="eMail" value="${sessionScope.mvo.eMail}"><span id="eMailCheckView"></span><br>
	별명 <input type="text" name="nickName" readonly="readonly"  value="${sessionScope.mvo.nickName}"><br> 
	비밀번호 <input type="password" name="password" id="password" ><span id="passwordCheckView"></span><br> 
	비밀번호 확인 <input type="password" id="passwordCheck"><br> 
	<input type="submit" value="회원정보수정">
</form>
