<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<title>입력창</title>
</head>
<body>


<div class="container">
    <div class="row clearfix">
    	<div class="col-md-12 table-responsive">
    	<form role="form" method="post" id="insertForm">
			<table  class="table table-bordered table-hover table-sortable" id="tab_logic">
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
						</td>
						<td data-name="projectId">
						    <input type="text" name='projectId' id='projectId'  class="form-control"/>
						</td>
						<td data-name="projectName">
						    <input type="text" name='projectName' id='projectName' class="form-control"/>
						</td>
					    <td data-name="projectManager">
						   <input type="text" name='projectManager' id='projectManager' class="form-control"/>
						</td>
						<td data-name="projectContractor">
						   <input type="text" name='projectContractor' id='projectContractor' class="form-control"/>
						</td>
						<td data-name="projectArea">
						   <select  id="projectArea"onchange ="projectArea(this.value)">
					        <option value="----">분야</option>
					     	<option value="민간">민간</option>
					        <option value="공공">공공</option>
					        <option value="통신">통신</option>
						   </select>
						</td>
						<td data-name="teamName">
						    <input type="text" name='teamName' id='teamName' class="form-control"/>
						</td>
						<td data-name="startDate">
						   <input type="text" name='startDate' id='startDate' class="form-control"/>
						</td>
						<td data-name="endDate">
						   <input type="text" id='endDate' class="form-control"/>
						</td>
						<td data-name="expense">
						   <input type="text" id='expense' class="form-control"/>
						</td>
						<td data-name="outsourcingCost">
						   <input type="text" id='outsourcingCost' class="form-control"/>
						</td>
						<td data-name="netSales">
						   <input type="text" id='netSales' class="form-control"/>
						</td>
						<td data-name="sales">
						  <input type="text" id='sales' class="form-control"/>
						</td>
						<td data-name="goods">
						   <input type="text" id='goods' class="form-control"/>
						</td>
                        <td data-name="del">
                            <button name="del0" class='btn btn-danger glyphicon glyphicon-remove row-remove'><span aria-hidden="true">×</span></button>
                        </td>
					</tr>
				</tbody>
			</table>
			<button type="submit" onclick = "insert()">저장</button>
			</form>
		</div>
	</div>
	<!-- <a id="add_row" class="btn btn-primary float-right">Add Row</a> -->
</div>


<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
<script>



function projectArea(str){
	var selectValue = document.getElementById('projectArea').value;

	if(!selectValue){
		console.log("분야를 선택해주세요")
	}else{
		console.log("분야가 선택되었습니다.")
	}
}
 
$(document).ready(function(){
 	var formObj = $("form[name='insertForm']");
	
	// 삭제
	 $(".insertBtn").on("click", function(){
		var result = confirm("새로운 프로젝트를 입력하시겠습니까?");
		if(result){
			formObj.attr("action", "/write");
			formObj.attr("method", "post");
			formObj.submit();
		}
	}) 
	 
	// 취소
	$(".listBtn").on("click", function(){
		location.href = "/board/";
	})

}) 



function insert(){
	
	var data =$("#insertForm")[0];
	var formData = new FormData(data);
	console.log(formData);
	
	$.ajax({
		contentType:"application/json",
		dataType:'json',
		data:JSON.stringify(formData),
		url:'/write',
		type:'POST',
		success:function(){
			alert("success");	
		},
		error:function(){
			alert("error");
		}
	});
}

/* 
	var sendData={
		"projectId":$('#projectId').val(),
		"projectName":$('#projectName').val(),
		"startDate":$('#startDate').val(),
		"endDate":$('#endDate').val(),
		"projectManager":$('#projectManagers').val(),
		"projectContractor":$('#projectContractor').val(),
		"projectArea":$('#projectArea').val(),
		"teamName":$('#teamName').val(),
		"expense":$('#expense').val(),
		"outsourcingCost":$('#outsourcingCost').val(),
		"netSales":$('#netSales').val(),
		"sales":$('#sales').val(),
		"goods":$('#goods').val()
	};

		
	) */

/*
 $(document).ready(function() {
    $("#add_row").on("click", function() {
        // Dynamic Rows Code
        
        // Get max row id and set new id
        var newid = 0;
        $.each($("#tab_logic tr"), function() {
            if (parseInt($(this).data("id")) > newid) {
                newid = parseInt($(this).data("id"));
            }
        });
        newid++;
        
        var tr = $("<tr></tr>", {
            id: "addr"+newid,
            "data-id": newid
        });
        
        // loop through each td and create new elements with name of newid
        $.each($("#tab_logic tbody tr:nth(0) td"), function() {
            var td;
            var cur_td = $(this);
            
            var children = cur_td.children();
            
            // add new td and element if it has a nane
            if ($(this).data("name") !== undefined) {
                td = $("<td></td>", {
                    "data-name": $(cur_td).data("name")
                });
                
                var c = $(cur_td).find($(children[0]).prop('tagName')).clone().val("");
                c.attr("name", $(cur_td).data("name") + newid);
                c.appendTo($(td));
                td.appendTo($(tr));
            } else {
                td = $("<td></td>", {
                    'text': $('#tab_logic tr').length
                }).appendTo($(tr));
            }
        });
        
        // add delete button and td
        
        $("<td></td>").append(
            $("<button class='btn btn-danger glyphicon glyphicon-remove row-remove'></button>")
                .click(function() {
                    $(this).closest("tr").remove();
                })
        ).appendTo($(tr));
        
        
        // add the new row
        $(tr).appendTo($('#tab_logic'));
        
        $(tr).find("td button.row-remove").on("click", function() {
             $(this).closest("tr").remove();
        });
});




    // Sortable Code
    var fixHelperModified = function(e, tr) {
        var $originals = tr.children();
        var $helper = tr.clone();
    
        $helper.children().each(function(index) {
            $(this).width($originals.eq(index).width())
        });
        
        return $helper;
    };
  
    $(".table-sortable tbody").sortable({
        helper: fixHelperModified      
    }).disableSelection();

    $(".table-sortable thead").disableSelection();



    $("#add_row").trigger("click");
}); */
</script>
</html>