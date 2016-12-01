<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<h3>새 간판 생성하기</h3>
새로운 간판을 생성합니다
<hr>
<form name="createForm" action="${pageContext.request.contextPath}/createNewGanpan.do" method="post">
	소유자 : ${sessionScope.mvo.nickName} <br>
	간판명: <input type="text" name="title" /><span id="titleCheckView"></span><br>
	간판공개<input type="radio" name="ganpanType" value="public"> <br>
	간판잠금<input type="radio" name="ganpanType" value="private"> <br>
	<input type="submit" value="새 간판 생성하기" />
</form> 
