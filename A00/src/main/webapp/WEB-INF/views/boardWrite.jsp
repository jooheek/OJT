<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 작성</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script type="text/javascript">


	$(document).ready(function(){
		
	});

	//작성페이지
	function insertBoard(){
		var projectId = $('#projectId').val();
		var projectName = $('#projectName').val();
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		var projectManager = $('#projectManager').val();
		var projectContractor = $('#projectContractor').val();
		var projectArea = $('#projectArea').val();
		var teamName = $('#teamName').val();
		var expense = $('#expense').val();
		var outsourcingCost = $('#outsourcingCost').val();
		var netSales = $('#netSales').val();
		var sales = $('#sales').val();
		var goods = $('#goods').val();

		var yn = confirm("프로젝트를 등록하시겠습니까?");
		console.log(projectId);
		if(yn){
			$.ajax({
				url		:"/board/insertBoard",
				data	:$("#insertForm").serialize,
				dataType:"JSON",
				cache	:false,
				async	:true,
				type	:"POST",
				success :function(obj){
					insertBoardCallback(obj);
				},
				error	:function(xhr,status,error){
					alert("작성중 오류발생 : "+error);
				}
			});
		}
	}
	
	//작성 콜백함수
	function insertBoardCallback(obj){
		if(obj != null){
			var result = obj.result;

			if(result=="success"){
				alert("프로젝트가 등록되었습니다.");
				goBoardList();
			}else{
				alert("프로젝트 등록에 실패했습니다.");
				return;
			}
		}
	}

	//목록 페이지로 이동
	function goBoardList(){
		location.href="boardList";
	}


</script>
</head>
<body>
<div class="col-md-12 table-responsive">
    	<form id="insertForm" name="insertForm">
			<table  class="table table-bordered table-hover table-sortable" id="tab_logic">
				<thead>
					<tr>
                        <th>프로젝트 아이디</th>
                        <th>프로젝트 명</th>
                        <th>프로젝트 매니저</th>
                        <th>계약사</th>
                        <th>분야</th>
                        <th>팀 이름</th>
                        <th>시작 일자</th>
                        <th>마감 일자</th>
                        <th>비용</th>
                        <th>외주비</th>
                        <th>순 매출</th>
                        <th>매출</th>
                        <th>상품비</th>
                    </tr>
				</thead>
				<tbody>
    				<tr>
						<td id="projectId">
						    <input type="text" name='projectId' id='projectId' value=""/>
						</td>
						<td id="projectName">
						    <input type="text" name='projectName' id='projectName' value=""/>
						</td>
					    <td id="projectManager">
						   <input type="text" name='projectManager' id='projectManager' value=""/>
						</td>
						<td id="projectContractor">
						   <input type="text" name='projectContractor' id='projectContractor' value=""/>
						</td>
						<td id="projectArea">
						   <select  id="projectArea"onchange ="projectArea(this.value)">
					        <option value="----">분야</option>
					     	<option value="민간">민간</option>
					        <option value="공공">공공</option>
					        <option value="통신">통신</option>
						   </select>
						</td>
						<td id="teamName">
						    <input type="text" name='teamName' id='teamName' value=""/>
						</td>
						<td id="startDate">
						   <input type="text" name='startDate' id='startDate' value=""/>
						</td>
						<td id="endDate">
						   <input type="text" id='endDate' value=""/>
						</td>
						<td id="expense">
						   <input type="text" id='expense'value=""/>
						</td>
						<td id="outsourcingCost">
						   <input type="text" id='outsourcingCost'value=""/>
						</td>
						<td id="netSales">
						   <input type="text" id='netSales' value=""/>
						</td>
						<td id="sales">
						  <input type="text" id='sales'value=""/>
						</td>
						<td id="goods">
						   <input type="text" id='goods'value=""/>
						</td>
					</tr>
				</tbody>
			</table>
			<button type="button" onclick = "javascript:goBoardList();">목록으로</button>
			<button type="button" onclick = "javascript:insertBoard(); ">등록하기</button>
			</form>
		</div>


<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
</body>
</html>