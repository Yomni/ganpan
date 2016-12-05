<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Two Column 2 - Halcyonic by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body class="subpage">
		<div id="page-wrapper">

			<!-- Content -->
				<div id="content-wrapper">
					<div id="content">
						<div class="container">
							<div class="row">
								<div class="3u 12u(mobile)">

									<!-- Sidebar -->
										<section>
											<header>
												<h2>칸반 제목</h2>
											</header>
											<ul class="link-list">
												<li><a href="${pageContext.request.contextPath}/board/change_record.do">변경 이력 보기</a></li>
												<li><a href="${pageContext.request.contextPath}/board/group_member_list.do">참여 구성원 보기</a></li>
												<li><a href="${pageContext.request.contextPath}/board/ganpan_setting.do">간판 설정</a></li>
											</ul>
										</section>
								</div>
								
								
								
								<div id="sample">
									  <h3>GoJS Kanban Board</h3>
									  <div id="myDiagramDiv" style="border: solid 1px gray; width:100%; height:500px;"></div>
									  <p></p>
									  <button id="SaveButton" onclick="save()">Save</button>
									  <button onclick="load()">Load</button>
									  Diagram Model saved in JSON format:
									  <br>
								</div>
								
								
								
								
								
								<div class="9u 12u(mobile) important(mobile)">
									<!-- Main Content -->
										<section>
											<header>
												<h2>내 간판 명</h2>
											</header>
											<section>
											</section>
											
											
											<div class="container-fluid">
												<!-- 간판 레이아웃 -->
										        <div id="sortableKanbanBoards" class="row">
										            <div class="panel panel-primary kanban-col"  style="border: 1px solid black">
										                <div class="panel-heading">
										                    TODO
										                    <i class="fa fa-2x fa-plus-circle pull-right"></i>
										                </div>
										                <div class="panel-body">
										                    <div id="TODO" class="kanban-centered">
										                    	<!-- work -->
										                        <article class="kanban-entry grab" id="item1" draggable="true">
										                            <div class="kanban-entry-inner">
										                                <div class="kanban-label">
										                                	<c:forEach items="${sblist }" var="sblist">
											                                    <p>${sblist }</p>
										                                		
										                                	</c:forEach>
										                                </div>
										                            </div>
										                        </article>
										                        
										                    </div><!-- todo -->
										                </div><!-- panel -->
										                <div class="panel-footer">
										                    <a href="#">Add a card...</a>
										                </div>
										            </div>
										            
										            <div class="panel panel-primary kanban-col"  style="border: 1px solid black">
										                <div class="panel-heading">
										                    DOING
										                    <i class="fa fa-2x fa-plus-circle pull-right"></i>
										                </div>
										                <div class="panel-body">
										                    <div id="DOING" class="kanban-centered">
										                    	<!-- work -->
										                        <article class="kanban-entry grab" id="item1" draggable="true">
										                            <div class="kanban-entry-inner">
										                                <div class="kanban-label">
										                                    <p>work1</p>
										                                </div>
										                            </div>
										                        </article>
										                        
										                    </div><!-- todo -->
										                </div><!-- panel -->
										                <div class="panel-footer">
										                    <a href="#">Add a card...</a>
										                </div>
										            </div>
										            
										            <div class="panel panel-primary kanban-col"  style="border: 1px solid black">
										                <div class="panel-heading">
										                    DONE
										                    <i class="fa fa-2x fa-plus-circle pull-right"></i>
										                </div>
										                <div class="panel-body">
										                    <div id="DONE" class="kanban-centered">
										                    	<!-- work -->
										                        <article class="kanban-entry grab" id="item1" draggable="true">
										                            <div class="kanban-entry-inner">
										                                <div class="kanban-label">
										                                    <p>work1</p>
										                                </div>
										                            </div>
										                        </article>
										                        
										                    </div><!-- todo -->
										                </div><!-- panel -->
										                <div class="panel-footer">
										                    <a href="#">Add a card...</a>
										                </div>
										            </div>
										            
										            
										            
										
										        </div>
   										 </div><!-- ganpan -->
											
											
											
										</section>
								</div><!-- main content -->
							</div>
						</div>
					</div>
				</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/skel-viewport.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
		</div>

	</body>
</html>