<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 회원가입form -->
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<form name="loginForm" action="${pageContext.request.contextPath}/login.do" method="post">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
						<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
						간판 접속</h3>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label for="id">전자우편 또는 별명</label>
							<input type="text" name="id" class="form-control" id="id" required="required"/>
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label>
							<input type="password" name="password" class="form-control" id="password" required="required"/><br>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-success btn-block" id="loginBtn">들어가기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<%-- script --%>
<script type="text/javascript">
   $(document).ready(function(){   
      $("#loginBtn").click(function(){         
         if($("#id").val()==""){
            alert("아이디를 입력하세요!");
            $("#id").focus();
            return false;
         }
         if($("#password").val()==""){
            alert("패스워드를 입력하세요!");
            $("#password").focus();
            return false;
         }
      }); // click
   }); // ready
</script>