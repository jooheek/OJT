<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ taglib uri=" http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<!-- datepicker사용 -->
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="UTF-8">
<title>window for update and delete</title>
</head>
<body>

<c:set var="now" value="<%= new java.util.Date() %>" />
<div class="container">
    <div class="row clearfix">
    	<div class="col-md-12">
    	<form id="frm" name="readForm" role="form">
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
    				<input type="hidden" name="projectCode" value="${board.projectCode}">
    				</td>
					<td data-name="projectId">
					<input type="text" name='projectId' class="form-control" value="${board.projectId}"/>
					</td>
					<td data-name="projectName">
						<input type="text" name='projectName' class="form-control" value="${board.projectName}"/>
					</td>
 					<td data-name="projectManager">
					    <input type="text" name='projectManager' class="form-control" value="${board.projectManager}"/>
					</td>
					<!-- input name설정을 동일하게 해서 데이터를 넘기면 다른 곳으로 이동되는 오류가 있었다 -->
					<td data-name="projectContractor">
						  <input type="text" name='projectContractor'class="form-control"value="${board.projectContractor}"/>
					</td>
					<td data-name="projectArea">
					    <select name="projectArea" id="selected">
				        <option value="분야">분야</option>
				        <option value="민간">민간</option>
				        <option value="공공">공공</option>
				        <option value="통신">통신</option>
					    </select>
					</td>
					<td data-name="teamName">
					    <input type="text" name='teamName' class="form-control" value="${board.teamName}"/>
					</td>
					<!-- update를 하면 데이터가 뭉쳐서 나오는 현상... -->
					<td data-name="startDate">
					<input type="text" name='startDate' class="form-control" value="${board.startDate}"/>
					<!-- fmt 적용해야함 -->
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
			<button type="submit" onclick="update()">수정</button>
			</form>
			
			<button type="submit" class="listBtn" >목록으로</button>
			<button type="submit" class="deleteBtn" >삭제</button>
		</div>
	</div>
</div>
<%-- <c:forEach var="name" items="${board}" varStatus="status">
    				<p>${name.projectCode}</p>
				</c:forEach> --%>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script type="text/javascript">


function update(){
	
	var data = $("form").serialize();
	console.log(data);

	$.ajax({
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify(data),
		url:'/board/update',
		type:'POST',
		success:function(){
			alert("success");
		},
		error:function(error){
			alert("error : "+error);
		}
		
	});
}


/* $(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".updateBtn").on("click", function(){
				var result = confirm(${board.projectCode}+"번째 프로젝트를 수정하시겠습니까?")
				if(result){
					formObj.attr("action", "/board/update?projectCode="+${board.projectCode});
					formObj.attr("method", "post");
					formObj.submit();
					
				}				
			})
			
			
			// 삭제
			 $(".deleteBtn").on("click", function(){
				var result = confirm(${board.projectCode}+"번째 프로젝트를 삭제하시겠습니까?");
				if(result){
					formObj.attr("action", "/board/delete?projectCode="+${board.projectCode});
					formObj.attr("method", "post");
					formObj.submit();
				}
			})
			 
			// 취소
			$(".listBtn").on("click", function(){
				
				location.href = "/board/";
			})

		}) */
		

</script>


</body>
</html>