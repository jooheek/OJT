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
<style>


	th{
		text-align:center;
		font-size: 13px;
		/* width:20%; */
		
	}
  td{
    	text-align:center;
    }
    #date{
    	width:15%;
    }
     #num{
   		text-align:right;
    }
</style>
	<title>게시글 목록</title>
<script type="text/javascript">

	$(document).ready(function(){
		getBoardList();
	});

	
	//게시판 상세페이지로 이동
	function goBoardDetail(projectCode){
		location.href="/board/boardDetail?projectCode="+projectCode;
	}	

	//게시판 작성페이지로 이동
	function goBoardWrite(){
		location.href="/board/boardWrite";
	}
	//게시판 목록 조회
	function getBoardList(){
		$.ajax({
			
			url		:"/board/getBoardList",
			data	:$("#boardForm").serialize(),
			async	:true,
			type	:"POST",
			dataType:"JSON",
			success :function(obj){
				getBoardListCallback(obj);
			},
			error	:function(xhr,status,error){
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
				var projectManager = list[i].projectManager;
				var projectContractor = list[i].projectContractor;
				var teamName = list[i].teamName;
				var projectArea = list[i].projectArea;
				var startDate = list[i].startDate;
				var endDate = list[i].endDate;
				var expense = list[i].expense.toLocaleString();
				var outsourcingCost = list[i].outsourcingCost.toLocaleString();
				var netSales = list[i].netSales.toLocaleString();
				var sales = list[i].sales.toLocaleString();
				var goods = list[i].goods.toLocaleString();



				str +="<tr><td>"+projectCode+"</td>";
				str +="<td>"+projectCode+"</td>";
                str +="<td>"+projectId+"</td>";
                str +="<td onclick ='javascript:goBoardDetail("+projectCode+");' style='cursor:Pointer'>"+projectName+"</td>";
                str +="<td >"+projectManager+"</td>";
                str +="<td >"+projectContractor+"</td>";
                str +="<td>"+teamName+"</td>";
                str +="<td>"+projectArea+"</td>";
                str +="<td id='date'>"+startDate+"</td>";
                str +="<td id='date'>"+endDate+"</td>";
                str +="<td id='num'>"+expense+"</td>";
                str +="<td id='num'>"+outsourcingCost+"</td>";
                str +="<td id='num'>"+netSales+"</td>";
                str +="<td id='num'>"+sales+"</td>";
                str +="<td id='num'>"+goods+"</td>";
                str +="</tr>";				
			}
				
		}else{
			str +="<tr>";
			str +="<td colspan='13'>글이 등록되지 않았습니다.</td>";
			str +="</tr>";		
		}
		$("#tbody").html(str);
	}



    /*
		divId :페이징 태그가 그려질 div
		pageIndex: 현재 페이지 위치가 저장될 input 태그id
		recordCount: 페이지당 레코드의 수
		totalCount: 전체 레코드의 수
		eventName: 페이징 하단의 숫자 버튼이 클릭될때 호출될 함수의 이름
	*/

    function renderPaging(params){

        var divId = params.divId; 		//페이징이 그려질 div id
        gfv_pageIndex = params.gfv_pageIndex;			//현재 위치가 저장될 input 태그
        var totalCount = params.totalCount;		//현재 조회 건수
        var currentIndex = $("#"+ params.pageIndex).val();		//현재 위치

        if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex) ){
            currentIndex =1;
        }

        var recordCount = params.recordCount;//페이지 당 레코드의 수

        if( gfn_isNull(currentIndex) == true){
            recordCount=20;
        }

        var totalIndexCount = Math.ceil(totalCount/recordCount);//전체 페이지의 수

        gfv_eventName = params.eventName;

        $("#"+divId).empty();

        var preStr = ""; //앞에 붙을 str
        var postStr= "";//뒤에 붙을 str
        var str=""//가운데 붙을 str


        var first = (parseInt((currentIndex -1)/10)*10)+1; //페이징이 10이하일떄 첫번째 페이지
        var last = (parseInt(totalIndexCount/10) == parseInt(currentIndex/10))?totalIndexCount%10 :10; //페이징이 10이하일때 마지막 페이지
        var prev = (parseInt((currentIndex -1)/10)*10) -9 >0?(parseInt((currentIndex -1)/10)*10) -9:1; //페이징이 10 초과일때 첫번째 페이지
        var next = (parseInt((currentIndex -1)/10)+1)*10 +1<totalIndexCount ? (parseInt((currentIndex -1)/10+1))*10 +1 :totalIndexCount;//페이징이 10 초과일때 마지막 페이지

        if(totalIndexCount >10){
            //전체 인덱스가 10보다 클 경우 맨앞, 앞의 태그 작성
            preStr += "<a href='#this' class='pad_5' onclick='movePage(1)'> << </a>"+"<a href='#this' class='pad_5' onclick ='movePage("+prev+")'> < </a>";
        }else if(totalIndexCount <= 10 && totalIndexCount >1){
            //전체 인덱스가 10보다 작을 경우 맨앞 태그 작성
            preStr += "<a href='#this' class='pad_5' onclick='movePage(1)'> << </a>"
        }

        if(totalIndexCount>10){
            //전체 인덱스가 10보다 클경우 맨앞, 앞의 태그 작성
            postStr += "<a href='#this' class='pad_5' onclick ='movePage("+next+")'> > </a>"+"<a href='#this' class='pad_5' onclick='movePage("+totalIndexCount+")'> >> </a>"
        }else if(totalIndexCount <=10 && totalIndexCount >1){
            //전체 인덱스1가 10보다 작을 경우 맨 뒤 태그 작성
            postStr +="<a href='#this' class ='pad_5' onclick='movePage("+totalIndexCount+")'></a>"
        }

        for(var i = first; i < (last+first) ; i++ ){
            if(i != currentIndex){
                str += "<a href='#this' class='pad_5' onclick='movePage("+i+")'>"+i+"</a>";
            }else{
                str += "<b><a href='#this' class='pad_5' onclick='movePage("+i+")'>"+i+"</a></b>";
            }
        }
        $("#"+divId).append(preStr+str+postStr);
    }

    function movePage(value){
        $("#"+gfv_pageIndex).val(value);
        if(typeof (gfv_eventName) == "function"){
            gfv_eventName(value);
        }else{
            eval(gfv_eventName+"(value);");
        }
    }


</script>
</head>
<body>

<%-- ${getList} --%>

            <div class="col-md-12">
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
                                <table class="table table-striped table-hover">
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
                    	<button id="input" class="btn btn-secondary btn-sm" type ="button" onclick="javascript:goBoardWrite();">작성하기</button>
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
