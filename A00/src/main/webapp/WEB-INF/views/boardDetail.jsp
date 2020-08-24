<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<title>게시글 상세</title>
<% 
	String projectCode = request.getParameter("projectCode");
%>
<c:set var ="projectCode" value="<%=projectCode %>"/>
<script type="text/javascript">
	$(document).ready(function(){
		getBoardDetail();
	});

	//게시판 목록페이지로 이동
	function goBoardList(){
		location.href="/board/boardList";
	}
	//게시판 수정페이지로 이동
	function goBoardUpdate(){

		var projectCode = $("#projectCode").val();

		location.href="/board/boardUpdate?projectCode="+projectCode;
	}

	//게시글 상세 조회 
	function getBoardDetail(projectCode){

		var projectCode = $("#projectCode").val();

		if(projectCode != ""){

			$.ajax({
				url: "/board/getBoardDetail",
				data:$("#boardForm").serialize(),
				dataType:"JSON",
				cache:false,
				async:true,
				type:"POST",
				success:function(obj){
					getBoardDetailCallback(obj);
				},
				error:function(xhr,status,err){
					alert("getBoardDetail 오류 발생 "+err)
				}
			});
			
		}else{
			alert("오류발생")};
	}

	//게시글 상세조회 콜백함수
	function getBoardDetailCallback(obj){

		var str ="";

		if(obj != null){

			var projectCode = obj.projectCode;
			var projectId = obj.projectId;
			var projectName = obj.projectName;
			var startDate = obj.startDate;
			var endDate = obj.endDate;
			var projectManager = obj.projectManager;
			var projectContractor = obj.projectContractor;
			var projectArea = obj.projectArea;
			var teamName = obj.teamName;
			var expense = obj.expense;
			var outsourcingCost = obj.outsourcingCost;
			var netSales = obj.netSales;
			var sales = obj.sales;
			var goods = obj.goods;

			str +="<tr><td>"+projectCode+"</td>";
            str +="<td>"+projectId+"</td>";
            str +="<td>"+projectName+"</td>";
            str +="<td>"+startDate+"</td>";
            str +="<td>"+endDate+"</td>";
            str +="<td>"+projectManager+"</td>";
            str +="<td>"+projectContractor+"</td>";
            str +="<td>"+projectArea+"</td>";
            str +="<td>"+teamName+"</td>";
            str +="<td>"+expense+"</td>";
            str +="<td>"+outsourcingCost+"</td>";
            str +="<td>"+netSales+"</td>";
            str +="<td>"+sales+"</td>";
            str +="<td>"+goods+"</td>";
            str +="</tr>";				
		
		}else{
			alert("등록된 프로젝트가 존재하지 않습니다.");
			return;
		}
		$("#tbody").html(str);
	}

	//게시글 삭제
	function deleteBoard(){

		var projectCode = $("#projectCode").val();

		var yn = confirm("프로젝트를 삭제하시겠습니까?");
	
		if(yn){

			$.ajax({
				url: "/board/deleteBoard",
				data:$("#boardForm").serialize(),
				dataType:"JSON",
				cache:false,
				async:true,
				type:"POST",
				success:function(obj){
					deleteBoardCallback(obj);
				},
				error:function(xhr,status,err){
					alert("error : "+err);
				}
			});
		}
	}

	//게시글 삭제 콜백
	function deleteBoardCallback(obj){

		if(obj!= null){
			var result = obj.result;

			if(result == "success"){
				alert("게시글이 삭제되었습니다.");
				goBoardList();
			}else{
				alert("게시글 삭제를 실패하였습니다.");	
				return;
			}
		}
	}




</script>

</head>
<body>

<div class="col-md-12 table-responsive">
    	<form id="boardForm" name="boardForm">
                <table class="table" width="80%">
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

                   </tbody>
              </table>
               <input type="hidden" id="projectCode" name="projectCode"  value="${projectCode}"/> 
             <!--   <input type="hidden" id="searchType" name="searchType"  value="S"/> -->
                <!-- 조회 -->
         </form>
         <div>
         	<button type="button" onclick="javascript:goBoardList();">목록으로</button>
         	<button type="button" onclick="javascript:goBoardUpdate();">수정하기</button>
         	<button type="button" onclick="javascript:deleteBoard();">삭제하기</button>
         </div>
</div>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
</body>
</html>