<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
	signBoardName
	bossNickName이 넘어온다.
		<h1>${param.signBoardName}<br>${param.bossNickName}<br></h1>
 --%>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<form action="${pageContext.request.contextPath}/createWork.do" method="post">
				<input type="hidden" name="bossNickName" value="${createSignBoardVO.bossMemberVO.nickName}" />
				<div class="form-group">
					<label for="signBoardName">간판명</label>
					<input type="text" class="form-control" id="signBoardName" name="signBoardName" value="${createSignBoardVO.signBoardName}"
						readonly/>
				</div>
				<div class="form-group">
					<label for="workerNickName">담당자</label>
					<input type="text" class="form-control" id="workerNickName" name="workerNickName" value="${mvo.nickName}"
						readonly/>
				</div>
				<div class="form-group">
					<label for="workName">작업명</label>
					<input type="text" class="form-control" id="workName" name="workName" required="required"/>
				</div>
				<div class="form-group">
					<label for="workDetails">작업상세내용</label>
					<textarea class="form-control" name="workDetails" id="workDetails" cols="30" rows="10" required="required"></textarea>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-default" id="createWorkBtn">작업추가</button>
				</div>
			</form>
			<!-- form -->
		</div>
		<!-- col-md -->
	</div>
	<!-- row -->
</div>
<!-- container -->
