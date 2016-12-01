<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

${mvo.nickName}님 회원가입을 축하합니다!
간판 사용 안내를 보시려면 왼쪽 상자를,<br>
간판을 만드시려면 오른쪽 상자를 눌러주세요.<br><br>
<input type="button" class="action" id="ganpanGuideBtn" value="간판사용안내" />
<input type="button" class="action" id="createBtn" value="간판 만들기"> 

<script type="text/javascript">
$(document).ready(function(){
   $("#createBtn").click(function(){ 
      location.href="${pageContext.request.contextPath}/board/create_new_ganpan.do";
   });
   $("#ganpanGuideBtn").click(function(){ 
      location.href="${pageContext.request.contextPath}/board/guide.do";
   });
});
</script>