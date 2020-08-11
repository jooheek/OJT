<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

<div class="container">
    <div class="row clearfix">
    	<div class="col-md-12 table-responsive">
			<table class="table table-bordered table-hover table-sortable" id="tab_logic">
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
    				<tr>
    				<td data-name="projectCode">
    				${board.projectCode}
    				</td>
					<td data-name="projectId">
					<input type="text" name='projectManager' class="form-control" value="${board.projectId}"/>
					</td>
					<td data-name="projectName">
						<input type="text" name='projectManager' class="form-control" value="${board.projectName}"/>
					</td>
 					<td data-name="projectManager">
					    <input type="text" name='projectManager' class="form-control" value="${board.projectManager}"/>
					</td>
					<td data-name="projectContractor">
						  <input type="text" name='projectContractor'class="form-control"value="${board.projectContractor}"/>
					</td>
					<td data-name="projectArea">
					    <select name="sel0" value="${board.projectArea}" >
				        <option value="분야">분야</option>
				        <option value="민간">민간</option>
				        <option value="공공">공공</option>
				        <option value="통신">통신</option>
					    </select>
					</td>
					<td data-name="teamName">
					    <input type="text" name='teamName' class="form-control" value="${board.teamName}"/>
					</td>
					<td data-name="startDate">
					    <input type="text" name='startDate' class="form-control" value="${board.startDate}"/>
					</td>
					<td data-name="endDate">
					    <input type="text" name='endDate' class="form-control" value="${board.endDate}"/>
					</td>
					<td data-name="expense">
						<input type="text" name='expense' class="form-control" value="${board.expense}"/>
					</td>
					<td data-name="outsourcingCost">
				    <input type="text" name='outsourcingCost' class="form-control" value="${board.outsourcingCost}"/>
					</td>
					<td data-name="netSales">
					    <input type="text" name='netSales' class="form-control" value="${board.netSales}"/>
					</td>
					<td data-name="sales">
					    <input type="text" name='sales' class="form-control" value="${board.sales}"/>
					</td>
					<td data-name="goods">
					  <input type="text" name='goods' class="form-control" value="${board.goods}"/>
					</td>
					</tr>
				</tbody>
			</table>
			
			<button>저장</button>
			<button onclick="history.back()">목록으로</button>
			<button id="deleteBtn" onclick="test()">삭제</button>
		</div>
	</div>
</div>

<%-- <c:forEach var="name" items="${board}" varStatus="status">
    				<p>${name.projectCode}</p>
				</c:forEach> --%>

<script type="text/javascript">
/* window.test = function() {
	  location.href="//delete?projectCode='${board.projectCode}'"
	}
 */

$(document).ready(function(){
	$("#deleteBtn").on("click",function(){
		location.href="/board/delete?projectCode=${board.projectCode}";
		console.log(projectCode);
		
	//$("#selectBox option:selected").val();
	
	});
})


</script>

</body>
</html>