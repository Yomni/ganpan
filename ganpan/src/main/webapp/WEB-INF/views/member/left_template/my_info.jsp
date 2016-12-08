<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="container">
		<div class="row">
			<table class="table table-hover" id="myJoinGanpanTable">
				<tr class="success">
					<th colspan="2"><h3>내정보보기</h3></th>
				</tr>
				<tr>
					<td>전자우편</td>
					<td>${sessionScope.mvo.eMail} </td>
				</tr>
				<tr>
					<td>별명</td>
					<td>${sessionScope.mvo.nickName}</td>
				</tr>
			</table>
		</div>
	</div>
</div>

