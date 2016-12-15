<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<h3 class="text-center">'${sbList[0].signBoardName}'간판명 ${signBoardCount}개의 검색결과</h3>
	<div class="col-md-5 col-md-offset-4">
		<table class="table table-hover">
			<thead>
				<tr>
					<th></th>
					<th>조장</th>
					<th>간판명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sbList}" var="svo">
				<tr>
					<td><span class="glyphicon glyphicon-user" aria-hidden="true"></span></td>
					<td>${svo.bossMemberVO.nickName}</td>
					<td><a href="${pageContext.request.contextPath}/showSignBoard.do?signBoardName=${svo.signBoardName}&bossNickName=${svo.bossMemberVO.nickName}">
						${svo.signBoardName}</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table><br>
        <nav>
             <ul class="pagination">
               <c:choose>
                  <c:when test="${pb.isPreviousPageGroup()}">
                   <li>
                     <a href="${pageContext.request.contextPath}/findSignBoardListByTitle.do?title=${title}&pageNo=${pb.getStartPageOfPageGroup()-1}" aria-label="Previous">
                     <span aria-hidden="true">&laquo;</span></a>
                    </li>
                  </c:when>
                </c:choose>
                <c:forEach begin="${pb.getStartPageOfPageGroup()}" end="${pb.getEndPageOfPageGroup()}" varStatus="order">
                   <li><a href="${pageContext.request.contextPath}/findSignBoardListByTitle.do?title=${title}&pageNo=${order.index}">
                      ${order.index}</a>
                   </li>
                </c:forEach> 
               <c:choose>
                <c:when test="${pb.isNextPageGroup()}">
                  <li>
                    <a href="${pageContext.request.contextPath}/findSignBoardListByTitle.do?title=${title}&pageNo=${pb.getEndPageOfPageGroup()+1}">${order.index}
                     <span aria-hidden="true">&raquo;</span></a>
                  </li>
                </c:when>
              </c:choose>
            </ul>
        </nav>
	</div>
</div>