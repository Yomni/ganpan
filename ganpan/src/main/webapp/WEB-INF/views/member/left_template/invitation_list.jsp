<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<table border="1">
		<thead>
			<tr>
				<th>간판 제목</th>
				<th>그룹장</th>
				<th>초대 날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${inviteList}" var="invitationMngVO">			
				<tr>	
					<td>${invitationMngVO.signBoardVO.signBoardName}</td>
					<td>${invitationMngVO.signBoardVO.bossMemberVO.nickName}</td>
					<td>${invitationMngVO.invitationDate}</td>
					<td><input type="button" id="accept" value="수락"/></td>
					<td><input type="button" id="reject" value="거절"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$("#accept").click(function(){
			alert("dd");
		});
		$("#reject").click(function(){
			alert("dd");
		});
	});//ready
</script>