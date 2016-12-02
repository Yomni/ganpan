<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<table border="1">
	<tr>
		<td>간판 이름&nbsp;</td>
		<td>그룹장</td>
	</tr>
	<tr>
		<c:forEach items="${sbList}" var="signBoardVO">
			<td>${signBoardVO.signBoardName}&nbsp;
			<td>${signBoardVO.bossMemberVO.nickName}</td>
		</c:forEach>
	</tr>
</table>