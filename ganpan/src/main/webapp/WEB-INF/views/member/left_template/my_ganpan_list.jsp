<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-md-offset-3 text-center">
				<h2>나의 간판 목록</h2>
				<br>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th class="text-center">간판명</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sbList}" var="signBoardVO">
							<tr>
								<td><a href="showSignBoard.do?bossNickName=${signBoardVO.bossMemberVO.nickName}
									&signBoardName=${signBoardVO.signBoardName}">${signBoardVO.signBoardName}</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- col -->
		</div>
		<!-- row -->
	</div>
	<!-- container -->
</div>