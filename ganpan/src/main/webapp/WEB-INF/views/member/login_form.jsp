<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
   $(document).ready(function(){   
      $("#loginForm").submit(function(){         
         if($("#loginForm :input[name=id]").val()==""){
            alert("아이디를 입력하세요!");
            return false;
         }
         if($("#loginForm :input[name=password]").val()==""){
            alert("패스워드를 입력하세요!");
            return false;
         }
      });
   });
</script>
<form name="loginForm" action="${pageContext.request.contextPath}/login.do" method="post">
	전자우편 또는 별명: <input name="id" type="text" /><br>
	비밀번호: <input name="password" type="password" /><br>
	<input type="submit" value="들어가기" />
</form>
