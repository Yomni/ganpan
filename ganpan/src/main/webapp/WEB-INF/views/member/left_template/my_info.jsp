<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="container">
		<div class="row">
		 <div class="col-md-8">
		 <br><br>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						<span class="glyphicon glyphicon-check" aria-hidden="true"></span>
						내 정보 보기<br>
					</h3>
				</div>
				<div class="panel-body">
					<table class="table table-hover" id="myJoinGanpanTable">
						<tr>
							<td>전자우편</td>
							<td>${sessionScope.mvo.eMail}</td>
						</tr>
						<tr>
							<td>별명</td>
							<td>${sessionScope.mvo.nickName}</td>
						</tr>
					</table>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>

