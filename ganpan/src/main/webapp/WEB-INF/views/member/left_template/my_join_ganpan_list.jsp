<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
	<tr>
		<th>간판 제목</th>
		<th>그룹장</th>
	</tr>
	<c:forEach items="${sbList}" var="signBoardVO">			
		<tr>	
			<td>${signBoardVO.signBoardName}</td>
			<td>${signBoardVO.bossMemberVO.nickName}</td>
		</tr>
	</c:forEach>
</table>