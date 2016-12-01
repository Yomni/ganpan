<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
