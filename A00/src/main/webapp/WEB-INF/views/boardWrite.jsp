<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 작성</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<style>
	th{
		text-align:center;
		font-size: 13px;
		/* width:20%; */
	}
    td{
    	text-align:center;
    }
    #num{
    	text-align:right;
    }
    input{
    	width:70px;
    }
    #startDate,#endDate{
    	width:135px;
    }
    select{
    	height:30px;
    }

</style>
<script type="text/javascript">

	$(document).ready(function(){
		
	});

	//작성페이지
	function insertBoard(){

 		var jsonData = new Object();
		jsonData.projectId = $('#projectId').val();
		jsonData.projectName =  $('#projectName').val();
		jsonData.projectManager = $('#projectManager').val();
		jsonData.projectContractor = $('#projectContractor').val();
		jsonData.projectArea =  $('#projectArea option:selected').val();
		jsonData.teamName = $('#teamName').val();
		jsonData.startDate = $('#startDate').val();
		jsonData.endDate = $('#endDate').val();
		jsonData.expense = $('#expense').val();
		jsonData.netSales = $('#netSales').val();
		jsonData.sales = $('#sales').val();
		jsonData.goods = $('#goods').val(); 

		var projectId = $('#projectId').val();
		var projectName = $('#projectName').val();
		var projectManager = $('#projectManager').val();
		var projectContractor = $('#projectContractor').val();
		var projectArea = $('#projectArea option:selected').val();
		var teamName = $('#teamName').val();
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		var expense = $('#expense').val();
		var outsourcingCost = $('#outsourcingCost').val();
		var netSales = $('#netSales').val();
		var sales = $('#sales').val();
		var goods = $('#goods').val();


		/*if(projectId == ""){
			alert("프로젝트 아이디를 입력해주세요");
			$("#projectId").focus();
			return;
		}
		
		if(projectName == ""){
			alert("프로젝트 명을 입력해주세요");
			$("#projectName").focus();
			return;
		}
		
		if(startDate == ""){
			alert("시작 날짜를 입력해주세요");
			$("#startDate").focus();
			return;
		}
		
		if(endDate == ""){
			alert("마감 날짜를 입력해주세요");
			$("#endDate").focus();
			return;
		} */

		

		
		
		var yn = confirm("프로젝트를 등록하시겠습니까?");

		if(yn){
			$.ajax({
				url		:"/board/insertBoard",
				data	:JSON.stringify(jsonData),
				contentType: 'application/json;charset=UTF-8',
				//dataType:"JSON",
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
			console.log();
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

	<div class="col-md-12">
		<form>
				<table class="table" width="80%">
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
							<td>
							    <input type="text" name='projectId' id='projectId' value=""/>
							</td>
							<td>
							    <input type="text" name='projectName' id='projectName' value=""/>
							</td>
						    <td>
							   <input type="text" name='projectManager' id='projectManager' value=""/>
							</td>
							<td>
							   <input type="text" name='projectContractor' id='projectContractor' value=""/>
							</td>
							<td>
							   <select id="projectArea" name='projectArea'>
						        <option value="----">분야</option>
						     	<option value="민간">민간</option>
						        <option value="공공">공공</option>
						        <option value="통신">통신</option>
							   </select>
							</td>
							<td>
							    <input type="text" name='teamName' id='teamName' value=""/>
							</td>
							<td>
							   <input type='date' name='startDate' id='startDate' value=""/>
							</td>
							<td>
							   <input type="date"  name='endDate' id='endDate' value=""/>
							</td>
							<td>
							   <input type="text" name='expense' id='expense' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="0"/>
							</td>
							<td>
							   <input type="text" name='outsourcingCost' id='outsourcingCost' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="0"/>
							</td>
							<td>
							   <input type="text" name='netSales' id='netSales'oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="0"/>
							</td>
							<td>
							  <input type="text" name='sales' id='sales'oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="0"/>
							</td>
							<td>
							   <input type="text" name='goods' id='goods' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="0"/>
							</td>
						</tr>
					</tbody>
				</table>
				</form>
				<button type="button" onclick = "javascript:goBoardList();" class="btn btn-secondary btn-sm" >목록으로</button>
				<button type="button" onclick = "javascript:insertBoard();" class="btn btn-primary btn-sm">등록하기</button>
				</div>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
</body>
</html>