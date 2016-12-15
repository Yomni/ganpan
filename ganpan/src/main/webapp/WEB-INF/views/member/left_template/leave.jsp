<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
			<br><br><br><br><br><br>
				<div class="panel panel-danger">
				  <div class="panel-heading">
				    <h2 class="panel-title">
						<span class="glyphicon glyphicon-plane" aria-hidden="true"></span>
						회원 탈퇴
					</h2>
				  </div>
				  <div class="panel-body" style="text-align: center;">
				  	<form action="${pageContext.request.contextPath}/leave.do" class="form-inline" method="post">
				  		<input type="hidden" value="" />
				  		<label for="exampleInputName2">비밀번호</label>
				    	<input type="password" class="form-control" id="password" name="password"/>
			 			<button type="submit" class="btn btn-danger">탈퇴하기</button><br>
				  		<label for="exampleInputName2">※주의: 탈퇴 시 보유한 간판이 모두 삭제됩니다!</label>
				  	</form>
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>