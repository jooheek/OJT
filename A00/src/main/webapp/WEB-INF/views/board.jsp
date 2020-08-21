<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ taglib uri=" http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<%@ page session="false" %>


<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

	<title>ajax_board</title>
	<meta charset="utf-8" />
	

</head>
<body>

<%-- ${getList} --%>

<section id="tabs" class="project-tab">
            <div class="container">
                <div class="row">
                    <div><%--class="col-md-12" --%>
                        <nav>
                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">프로젝트별</a>
                                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">팀별 </a>
                                <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">개인 별</a>
                            </div>
                        </nav>
                       
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
								 <div class="pull-right" style="margin:10px;">
									<%-- <label class="control-label" style="float:left;">프로젝트 명 :</label>
										<div class="pull-right" style="width:200px;float:right;" >
											<c:if test="${!empty listB}">
												<select id="selectBox" name='projectName' class="form-control">
													<c:forEach var ="list" items="${listB}" varStatus="i">
													<option value="${list.projectCode}">${list.projectName}</option>
													</c:forEach>
												</select>
											</c:if>
										</div> --%>
									<!-- /.select -->
								</div>
								<form role="form" method="get">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>projectId</th>
                                            <th>projectName</th>
                                            <th>projectManager</th>
                                            <th>projectContractor</th>
                                            <th>projectArea</th>
                                            <th>teamName</th>
                                            <th>startDate</th>
                                            <th>endDate</th>
                                            <th>expense</th>
                                            <th>outsourcingCost</th>
                                            <th>netSales</th>
                                            <th>sales</th>
                                            <th>goods</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var ="listB" items="${listB}">
                                        <tr>
                                        	<td></td>
                                        	<!-- rownum동작안됨 -->
	                                        <td><c:out value="${listB.projectId}"/></td>
	                                        <td>
	                                        	<a href="/board/get?projectCode=<c:out value="${listB.projectCode}"/>">
	                                        	<c:out value="${listB.projectName}"/></a>
	                                        </td>
	                                        <td><c:out value="${listB.projectManager}"/></td>
	                                        <td><c:out value="${listB.projectContractor}"/></td>
	                                        <td><c:out value="${listB.projectArea}"/></td>
	                                        <td><c:out value="${listB.teamName}"/></td>
	                                        <%-- <fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd HH:mm:ss" /> --%>
	                                        <td><c:out value="${listB.startDate}"/></td>
	                                        <td><c:out value="${listB.endDate}"/></td>
	                                        <td><c:out value="${listB.expense}"/></td>
	                                        <td><c:out value="${listB.outsourcingCost}"/></td>
	                                        <td><c:out value="${listB.netSales}"/></td>
	                                        <td><c:out value="${listB.sales}"/></td>
	                                        <td><c:out value="${listB.goods}"/></td>
                                        </tr>
                                      </c:forEach>
                                      <c:if test="${empty listB}">
                                      ${"데이터가 존재하지 않습니다."}
                                      </c:if>
                                      	<tr>
											<td data-name="projectCode">
											</td>
											<td data-name="projectId">
											    <input type="text" id='projectId'  class="form-control"/>
											</td>
											<td data-name="projectName">
											    <input type="text" id='projectName' class="form-control"/>
											</td>
					    					<td data-name="projectManager">
											    <input type="text" id='projectManager' class="form-control"/>
											</td>
											<td data-name="projectContractor">
											    <input type="text" id='projectContractor'class="form-control"/>
											</td>
											<td data-name="projectArea">
											    <select name="sel0" onchange=area(this.value)>
					        				        <option value="----">분야</option>
					    					        <option value="민간">민간</option>
					        				        <option value="공공">공공</option>
					        				        <option value="통신">통신</option>
											    </select>
											</td>
											<td data-name="teamName">
											    <input type="text" id='teamName' class="form-control"/>
											</td>
											<td data-name="startDate">
											    <input type="text" id='startDate' class="form-control"/>
											</td>
											<td data-name="endDate">
											    <input type="text" id='endDate' class="form-control"/>
											</td>
											<td data-name="expense">
											    <input type="text" id='expense' class="form-control"/>
											</td>
											<td data-name="outsourcingCost">
											    <input type="text" id='outsourcingCost' class="form-control"/>
											</td>
											<td data-name="netSales">
											    <input type="text" id='netSales' class="form-control"/>
											</td>
											<td data-name="sales">
											    <input type="text" id='sales' class="form-control"/>
											</td>
											<td data-name="goods">
											    <input type="text" id='goods' class="form-control"/>
											</td>
										</tr>
                                    </tbody>
                                </table>
               					<%--./table --%>
               					<div class="search" style="width:400px;position:absolute;left:50%;">
               						<select name="searchType">
               							<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
     									<option value="N"<c:out value="${scri.searchType eq 'N' ? 'selected' : ''}"/>>프로젝트 명</option>
               						</select>
								  <input type="text" name="keyword" id="keywordInput" value="${scri.keyword }">
								  <button class="btn btn-secondary" type="button" id="searchBtn">검색</button>
							
								</div>
                            	<%--./search form --%>
	                            <nav aria-label="Page navigation example">
								  <ul class="pagination">
								  
								  <c:if test="${pageMaker.prev}">
								    <li class="page-item">
								      <a class="page-link" href='<c:url value="/board${pageMaker.makeSearch(pageMaker.startPage-1) }"/>' aria-label="Previous"><span aria-hidden="true">&laquo;</span><span class="sr-only">prev</span></a>
								    </li>
								   </c:if>
								   
								    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
									    <li class="page-item">
									        <a class="page-link" href='<c:url value="/board${pageMaker.makeSearch(pageNum) }"/>'><i class="fa">${pageNum }</i></a>
									    </li>
									</c:forEach>
								    
								   <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
								    <li class="page-item">
								      <a class="page-link" href='<c:url value="/board${pageMaker.makeSearch(pageMaker.endPage+1) }"/>' aria-label="Next"><span aria-hidden="true">&raquo;</span><span class="sr-only">next</span></a>
								    </li>
								   </c:if>
								   
								  </ul>
								</nav>
								</form>
							<%--./pagination --%>
                        </div>
                    </div>
                    <div style="float:right;">
                    	<button id="insert" type ="button">입력</button>
                    	
                    	<button id="input" type ="button">저장</button>
                    	<!-- 새로운 데이터 저장 버튼 -->
                    	
                    	<!--  row에 데이터를 입력하고 저장하면 데이터 입력됨 -->
                    <!-- 	<button id="write" type ="button">//입력</button>
                    	입력버튼 누를떄마다 밑에 row하나씩 생김
                    	<button id ="update" type="button">수정</button>
                    	projectName클릭하면 input text가 생기고 수정가능 -->
                   	</div>
                </div>
            </div>
            </div>
        </section>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>     
<script type="text/javascript">
$(document).ready(function(){
	$("#insert").on("click",function(){
		location.href="writeView";
		
	});

	$('#searchBtn').on("click",function(){
		self.location="board"+'${pageMaker.makeQuery(1)}'+"&searchType="+$('select option:selected').val()+"&keyword="+encodeURIComponent($('#keywordInput').val());
		console.log($('select option:selected').val())
	});	
})
</script>
   
</body>
</html>
