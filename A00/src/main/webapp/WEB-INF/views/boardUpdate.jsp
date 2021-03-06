<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시글 수정</title>
<%
	 String projectCode = request.getParameter("projectCode");
%>
<c:set var = "projectCode" value="<%=projectCode %>"/>

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

<script>
	$(document).ready(function(){
		getBoardDetail();
	});

	//게시판 목록페이지 이동
	function goBoardList(){
		location.href="/board/boardList";
	}

	//게시글 상세 조회 
	function getBoardDetail(projectCode){

		var projectCode = $("#projectCode").val();

		if(projectCode != null){

			$.ajax({
				url		: "/board/getBoardDetail",
				data	:$("#boardForm").serialize(),
				dataType:"JSON",
				cache	:false,
				async	:true,
				type	:"POST",
				success :function(obj){
					getBoardDetailCallback(obj);
				},
				error	:function(xhr,status,err){
					alert("getBoardDetail 오류 발생 "+err)
				}
			});
			
		}else{
			alert("오류발생")};
	}
	

	function getBoardDetailCallback(obj){
		var str ="";

		if(obj != null){
			
			var projectCode = obj.projectCode;
			var projectId = obj.projectId;
			var projectName = obj.projectName;
			var projectManager = obj.projectManager;
			var projectContractor = obj.projectContractor;
			var projectArea = obj.projectArea;
			var teamName = obj.teamName;
			var startDate = obj.startDate;
			var endDate = obj.endDate;
			var expense = obj.expense.toLocaleString();
			var outsourcingCost = obj.outsourcingCost.toLocaleString();
			var netSales = obj.netSales.toLocaleString();
			var sales = obj.sales.toLocaleString();
			var goods = obj.goods.toLocaleString();


           $("#projectCode").text(projectCode);
            $("#projectId").val(projectId);            
            $("#projectName").val(projectName);
            $("#projectManager").text(projectManager);
            $("#projectContractor").text(projectContractor);
            $("#projectArea").text(projectArea);
            $("#teamName").text(teamName);
            $("#startDate").val(startDate);
            $("#endDate").val(endDate);
            $("#expense").text(expense);
            $("#outsourcingCost").text(outsourcingCost);
            $("#netSales").text(netSales);
            $("#sales").text(sales);
            $("#goods").text(goods); 

		}else{
			alert("등록된 글이 존재하지 않습니다.");
			return;
		}
		
	}

	//게시글 수정
	function updateBoard(){
		var projectId =$("#projectId").val();
		var projectName =$("#projectName").val();
		var startDate =$("#startDate").val();
		var endDate =$("#endDate").val();
		/*  $("#projectCode").text(projectCode);
         $("#projectManager").text(projectManager);
         $("#projectContractor").text(projectContractor);
         $("#projectArea").text(projectArea);
         $("#teamName").text(teamName);
         $("#expense").text(expense);
         $("#outsourcingCost").text(outsourcingCost);
         $("#netSales").text(netSales);
         $("#sales").text(sales);
         $("#goods").text(goods); 
          */
		if(projectId == ""){
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
		}

		var yn = confirm("프로젝트를 수정하시겠습니까?");

		if(yn){
			$.ajax({
				url		:"/board/updateBoard",
				data	:$("#boardForm").serialize(),
				dataType:"JSON",
				cache	:false,
				async	:true,
				type	:"POST",
				success :function(obj){
					updateBoardCallback(obj);
				},
				error:function(xhr,status,error){

				}
			});
		}
	}

	//게시글 수정 콜백 함수
	function updateBoardCallback(obj){

		if(obj != null){

			var result = obj.result;

			if(result == "success"){
				alert("게시글을 수정하였습니다.");
				goBoardList();
			}else{
				alert("게시글 수정을 실패하였습니다.");
				return;
			}
		}
	}

	
	
</script>


</head>
<body>

<div class="col-md-12 table-responsive">
    	<form id="boardForm" name="boardForm">
                <table class="table">
                         <thead>
                               <tr>
                                   	<th>코드</th>
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
                   			<tbody id="tbody">
							 	<tr>
									<td id='projectCode'></td>
									<td><input type='text' name='projectId' id='projectId'  value=''/></td>
									<td><input type='text' name='projectName' id='projectName'  value=''/></td>
									<td id='projectManager'></td>
									<td id='projectContractor'></td>
									<td id='projectArea'></td>
									<td id='teamName'></td>
									<td><input type='date' name='startDate' id='startDate'  value=''/></td>
									<td><input type='date' name='endDate' id='endDate'  value=''/></td>
									<td id='expense'></td>
									<td id='outsourcingCost'></td>
									<td id='netSales'></td>
									<td id='sales'></td>
									<td id='goods'></td>	
								</tr>
							
                  		 	</tbody>
              </table>
               <input type="hidden" id="projectCode" name="projectCode"  value="${projectCode}"/>
              <!--  <input type="hidden" id="searchType" name="searchType"  value="U"/> -->
                <!-- 조회 -->
         </form>
         <div>
         	<button type="button" onclick="javascript:goBoardList();"class="btn btn-secondary btn-sm">목록으로</button>
         	<button type="button" onclick="javascript:updateBoard();" class="btn btn-primary btn-sm">수정하기</button>
         </div>
</div>




<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>   
</body>
</html>