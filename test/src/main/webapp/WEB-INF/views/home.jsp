
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<html>
<head>
	<title>Home</title>
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
									<label class="control-label" style="float:left;">프로젝트 명 :</label>
										<div class="pull-right" style="width:200px;float:right;" >
											<c:if test="${!empty getList}">
												<select id="selectBox" name='projectName' class="form-control">
													<c:forEach var ="list" items="${getList}" varStatus="i">
													<option value="${list.projectCode}">${list.projectName}</option>
													</c:forEach>
												</select>
											</c:if>
										</div>
									<!-- /.select -->
								</div>
                                <table class="table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>projectCode</th>
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
                                    <c:forEach var ="list" items="${getList}">
                                        <tr>
                                        	<td><c:out value="${list.projectCode}"/></td>
	                                        <td><c:out value="${list.projectId}"/></td>
	                                        <td>
	                                        	<a href="/board/get?projectCode=<c:out value="${list.projectCode}"/>">
	                                        	<c:out value="${list.projectName}"/></a>
	                                        </td>
	                                        <td><c:out value="${list.projectManager}"/></td>
	                                        <td><c:out value="${list.projectContractor}"/></td>
	                                        <td><c:out value="${list.projectArea}"/></td>
	                                        <td><c:out value="${list.teamName}"/></td>
	                                        <td><c:out value="${list.startDate}"/></td>
	                                        <td><c:out value="${list.endDate}"/></td>
	                                        <td><c:out value="${list.expense}"/></td>
	                                        <td><c:out value="${list.outsourcingCost}"/></td>
	                                        <td><c:out value="${list.netSales}"/></td>
	                                        <td><c:out value="${list.sales}"/></td>
	                                        <td><c:out value="${list.goods}"/></td>
                                        </tr>
                                      </c:forEach>
                                      	<tr>
											<td data-name="projectCode">
											</td>
											<td data-name="projectId">
											    <input type="text" name='projectId'  class="form-control"/>
											</td>
											<td data-name="projectName">
											    <input type="text" name='projectName' class="form-control"/>
											</td>
					    					<td data-name="projectManager">
											    <input type="text" name='projectManager' class="form-control"/>
											</td>
											<td data-name="projectContractor">
											    <input type="text" name='projectContractor'class="form-control"/>
											</td>
											<td data-name="projectArea">
											    <select name="sel0">
					        				        <option value="----">분야</option>
					    					        <option value="민간">민간</option>
					        				        <option value="공공">공공</option>
					        				        <option value="통신">통신</option>
											    </select>
											</td>
											<td data-name="teamName">
											    <input type="text" name='teamName' class="form-control"/>
											</td>
											<td data-name="startDate">
											    <input type="text" name='startDate' class="form-control"/>
											</td>
											<td data-name="endDate">
											    <input type="text" name='endDate' class="form-control"/>
											</td>
											<td data-name="expense">
											    <input type="text" name='expense' class="form-control"/>
											</td>
											<td data-name="outsourcingCost">
											    <input type="text" name='outsourcingCost' class="form-control"/>
											</td>
											<td data-name="netSales">
											    <input type="text" name='netSales' class="form-control"/>
											</td>
											<td data-name="sales">
											    <input type="text" name='sales' class="form-control"/>
											</td>
											<td data-name="goods">
											    <input type="text" name='goods' class="form-control"/>
											</td>
										</tr>
                                    </tbody>
                                </table>
                            </div>
                            <%--table --%>
                        </div>
                    </div>
                    <div style="float:right">
                    	<button id="insert" type ="button">저장</button>
                    	<!--  row에 데이터를 입력하고 저장하면 데이터 입력됨 -->
                    	<button id="write" type ="button">입력</button>
                    	<!-- 입력버튼 누를떄마다 밑에 row하나씩 생김 -->
                    	<button id ="update" type="button">수정</button>
                    	<!-- projectName클릭하면 input text가 생기고 수정가능 -->
                   	</div>
                </div>
            </div>
        </section>
        
<script type="text/javascript">
$(document).ready(function(){
	$("#insert").on("click",function(){
		location.href="view";
		console.log(projectCode);
		
	//$("#selectBox option:selected").val();
	
	});
})



</script>        
</body>
</html>
