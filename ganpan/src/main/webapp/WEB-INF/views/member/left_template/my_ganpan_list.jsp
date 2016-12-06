<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<table border="1">
		<thead>
			<tr>
				<th>간판 제목</th>
				<th>그룹장</th>
				<th>이동</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${sbList}" var="signBoardVO">			
				<tr>	
					<td>${signBoardVO.signBoardName}</td>
					<td>${signBoardVO.bossMemberVO.nickName}</td>
					<td><a href="showContentList.do?bossNickName=${signBoardVO.bossMemberVO.nickName}&signBoardName=${signBoardVO.signBoardName}">간판으로 이동</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>