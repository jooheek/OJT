<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ taglib uri=" http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- datepicker사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<c:set var="now" value="<%= new java.util.Date() %>" />
<div class="container">
    <div class="row clearfix">
    	<div class="col-md-12">
    	<form name="readForm" role="form" method="post">
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
					    <select name="sel0" id="selected" onchange="selectData(this.value)">
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
					<input type="text" name='teamName' class="form-control" value="${board.startDate}"/>
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
			</form>
			<button type="submit" class="updateBtn">수정</button>
			<button type="submit" class="listBtn" >목록으로</button>
			<button type="submit" class="deleteBtn" >삭제</button>
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
//$("#selectBox option:selected").val();


$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			
			$(".updateBtn").on("click", function(){
				var result = confirm(${board.projectCode}+"번째 프로젝트를 수정하시겠습니까?")
				if(result){
					formObj.attr("action", "/board/update?projectCode="+${board.projectCode});
					<!--url에 projectCode값만 넘겨주니까 그값빼고는 넘어가는게 없는것-->
					<!--근데 다른 수정사항은 어떻게 넘어가는거지 -->
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

		})
		
		function selectData(str){
			alert( str+ "선택");
		}
		


</script>

</body>
</html>