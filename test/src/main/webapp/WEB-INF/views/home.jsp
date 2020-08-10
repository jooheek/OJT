
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
	                                        <td><c:out value="${list.projectName}"/></td>
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
                                    </tbody>
                                </table>
                            </div>
                            <%--table --%>
                        </div>
                    </div>
                    <div>
                    	<form action ="/board/insertView" method ="get">
                    	<button id="insert" type ="button">입력</button>
                    	</form>
                   	</div>
                </div>
            </div>
        </section>
        
<script type="text/javascript">
$(document).ready(function(){
	$("#insert").on("click",function(){
		location.href="insertView";
		
	
	});
})


</script>        
</body>
</html>
