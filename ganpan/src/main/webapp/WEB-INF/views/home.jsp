<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="jumbotron" id="jumbotron-main">
		<div class="container-fluid">
			<div class="col-md-6">
				<h1>
					간판에 <br> 가입하세요!
				</h1>
				<p>공동작업에 대한 계획을 한눈에 확인하세요!</p>
				<p>놀라울 만큼 간단합니다!</p>
			</div>
			<!-- col-md-6 -->

			<div class="col-md-6">
				<form action="register.do" method="post" id="registerForm">
					<input type="text" class="form-control" name="nickName" id="nickName" placeholder="별명">
					<br>
					<input type="email" class="form-control" name="eMail" id="eMail" placeholder="전자우편">
					<br>
					<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호">
					<br>
					<button type="submit" class="btn btn-default btn-success btn-block" id="registerBtn">가입하기</button>
				</form>
			</div>
			<!-- col-md-6 -->
		</div>
		<!-- container-fluid -->
	</div>
	<!-- jumbotron -->


	<c:if test="${!empty sessionScope.mvo}">
	    <div class="4u 12u(mobile)">
	
	       <!-- Box #3 -->
	          <section>
	             <header>
	                <h2>내 간판 리스트</h2>
	             </header>
	             
	             
	             <ul class="nav nav-tabs" role="tablist" id="myTab">
	               <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">모든 칸반</a></li>
	               <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">공개 칸반</a></li>
	               <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">비공개 칸반</a></li>
	             </ul>
	             
	             <div class="tab-content">
	               <div role="tabpanel" class="tab-pane fade in active" id="home">
	                   <table>
	                      <tr>
	                         <th>간판 제목</th>
	                         <th>그룹장</th>
	                      </tr>
	                      <c:forEach items="${sbMap.allList}" var="signBoardVO">         
	                         <tr>   
	                            <td>${signBoardVO.signBoardName}</td>
	                            <td>${signBoardVO.bossMemberVO.nickName}</td>
	                         </tr>
	                      </c:forEach>
	                   </table>
	               </div>
	               <div role="tabpanel" class="tab-pane fade" id="profile">
	                   <table>
	                      <tr>
	                         <th>간판 제목</th>
	                         <th>그룹장</th>
	                      </tr>
	                      <c:forEach items="${sbMap.publicList}" var="signBoardVO">         
	                         <tr>   
	                            <td>${signBoardVO.signBoardName}</td>
	                            <td>${signBoardVO.bossMemberVO.nickName}</td>
	                         </tr>
	                      </c:forEach>
	                   </table>
	             </div>
	               <div role="tabpanel" class="tab-pane fade" id="messages">
	                   <table>
	                      <tr>
	                         <th>간판 제목</th>
	                         <th>그룹장</th>
	                      </tr>
	                      <c:forEach items="${sbMap.privateList}" var="signBoardVO">         
	                         <tr>   
	                            <td>${signBoardVO.signBoardName}</td>
	                            <td>${signBoardVO.bossMemberVO.nickName}</td>
	                         </tr>
	                      </c:forEach>
	                   </table>
	             </div>
	             </div>
	             
	          </section>
	
	    </div>
	 </c:if>


	<div class="container">
		<p>우리거 다 구현하면 채울 예정</p>
<!-- 		<a href="gomember/my_info.do">내 정보 보기</a> -->
	</div>
	<!-- main container-fluid -->
</div>
<!-- /container -->

<!-- jquery -->
<script type="text/javascript">
	$(function() {
		$("#registerBtn").click(function() {
			var nickName = $("#nickName").val().trim();
			var eMail = $("#eMail").val().trim();
			var password = $("#password").val().trim();
			if(nickName == "") {
				alert("별명을 입력하세요!");
				$("#nickName").focus();
				return false;
			}
			if(eMail == "") {
				alert("전자우편을 입력하세요!");
				$("#eMail").focus();
				return false;
			}
			if(password == "") {
				alert("비밀번호을 입력하세요!");
				$("#password").focus();
				return false;
			}
		}); // btn click
	}); // ready
</script>
