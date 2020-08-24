<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ taglib uri=" http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<%@ page session="false" %>


<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

	<title>Home</title>
	<meta charset="utf-8" />
<script type="text/javascript">

	$(document).ready(function(){
		getBoardList();
		console.log(projectCode);
	});

	
	//게시판 상세페이지로 이동
	function goBoardDetail(projectCode){
		location.href="/board/boardDetail?projectCode="+projectCode;

		console.log(projectCode);
	}	

	//게시판 작성페이지로 이동
	function goBoardWrite(){
		location.href="/board/boardWrite";
	}
	//게시판 목록 조회
	function getBoardList(){
		$.ajax({
			
			url:"/board/getBoardList",
			data:$("#boardForm").serialize(),
			async:true,
			type:"POST",
			dataType:"JSON",
			success:function(obj){
				getBoardListCallback(obj);
			},
			error:function(xhr,status,error){
				alert("error"+error)
			}
		});
	}
	//게시판 목록 데이터 불러오기
	function getBoardListCallback(obj){

		var list = obj;
		var listLength = obj.length;
		
		var str="";

		if(listLength > 0){
			for(var i=0; i < listLength ;i++){
				var projectCode = list[i].projectCode;
				var projectId = list[i].projectId;
				var projectName = list[i].projectName;
				var startDate = list[i].startDate;
				var endDate = list[i].endDate;
				var projectManager = list[i].projectManager;
				var projectContractor = list[i].projectContractor;
				var projectArea = list[i].projectArea;
				var teamName = list[i].teamName;
				var expense = list[i].expense;
				var outsourcingCost = list[i].outsourcingCost;
				var netSales = list[i].netSales;
				var sales = list[i].sales;
				var goods = list[i].goods;

				str +="<tr><td>"+projectCode+"</td>";
                str +="<td>"+projectId+"</td>";
                str +="<td onclick ='javascript:goBoardDetail("+projectCode+");' style='cursor:Pointer'>"+projectName+"</td>";
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
			}
				
		}else{
			str +="<tr>";
			str +="<td colspan='13'>글이 등록되지 않았습니다.</td>";
			str +="</tr>";		
		}
		$("#tbody").html(str);
	}

	
</script>
</head>
<body>

<%-- ${getList} --%>

            <div class="container">
                <div class="row">
                    <div><%--class="col-md-12" --%>
                        <!-- <nav>
                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">프로젝트별</a>
                                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">팀별 </a>
                                <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">개인 별</a>
                            </div>
                        </nav> -->
                       
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" >
								<%--  <div class="pull-right" style="margin:10px;">
									 <label class="control-label" style="float:left;">프로젝트 명 :</label>
										<div class="pull-right" style="width:200px;float:right;" >
											<c:if test="${!empty listB}">
												<select id="selectBox" name='projectName' class="form-control">
													<c:forEach var ="list" items="${listB}" varStatus="i">
													<option value="${list.projectCode}">${list.projectName}</option>
													</c:forEach>
												</select>
											</c:if>
										</div> 
									<!-- /.select -->
								</div> --%>
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

                                    </tbody>
                                </table>
               					</form>
							<%--./pagination --%>
                        </div>
                    </div>
                    <div style="float:right;">
                    	<button id="input" type ="button" onclick="javascript:goBoardWrite();">작성하기</button>
                   	</div>
                </div>
            </div>
            </div>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>     
<script type="text/javascript">

</script>
   
</body>
</html>
