<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
<div class="row">
<div class="col-md-8 col-md-offset-2">
<h3>새 간판 생성하기</h3>
새로운 간판을 생성합니다
<hr>
<form name="createForm" action="${pageContext.request.contextPath}/createNewSignBoard.do" method="post">
	<div class="form-group">
		<label for="nickName">소유자</label>
		<input type="text" class="form-control" id="nickName" name="bossNickName" value="${sessionScope.mvo.nickName}" readonly/>
	</div>
	<div class="form-group">
		<label for="title">간판명</label>
		<input type="text" class="form-control" id="title" name="title" required="required"/>
		<span id="titleCheckView"></span>
	</div>
	<div class="form-group">
		<label for="signBoardType">공개여부</label><br>
		<span class="glyphicon glyphicon-globe" aria-hidden="true">공개</span>
		<input type="radio" id="signBoardType" name="signBoardType" value="public" required="required"><br>
		<span class="glyphicon glyphicon-lock" aria-hidden="true">비공개</span>
		<input type="radio" id="signBoardType" name="signBoardType" value="private" required="required" >
	</div>
	<button type="submit" class="btn btn-primary">간판 생성</button>
</form> 
</div>
</div>
</div>
<script type="text/javascript">
   $(document).ready(function(){   
	  var checkResultTitle="";		
      $("#createForm").submit(function(){         
         if($("#createForm :input[name=title]").val()==""){
            alert("간판 이름을 입력하세요!");
            return false;
         }
         var ganpanType=$(":input[name=ganpanType]:checked").val();
         if(ganpanType==undefined){
            alert("간판 공개 여부를 설정하세요!");
            return false;
         }
         if(checkResultTitle==""){
				alert("간판 이름 중복확인을 해주세요!");
				return false;
		}
      });
      $(":input[name=title]").keyup(function(){
			var title=$(this).val().trim();
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/titleCheckAjax.do",				
				data:"title="+title,
				success:function(data){						
					if(data=="fail"){
						$("#titleCheckView").html(title+" 사용불가!").css("color", "red");
						checkResultTitle="";
					}else{
						$("#titleCheckView").html(title+" 사용가능!").css("color","green");		
						checkResultTitle=title;
					}					
				}//callback			
			});//ajax
		});//keyup
   });
</script>