<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	<form role="form" method="post"action="/board/write">
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
						</td>
						<td data-name="projectId">
						    <input type="text" name='projectId'  class="form-control"/>
						</td>
						<td data-name="projectName">
						    <input type="text" name='projectName' class="form-control"/>
						</td>
					    <td data-name="projectManager">
						   <input type="text" name='projectManager' class="form-control"/>
						</td>
						<td data-name="projectContractor">
						   <input type="text" name='projectContractor'class="form-control"/>
						</td>
						<td data-name="projectArea">
						   <select name="sel0">
					        <option value="----">분야</option>
					     	<option value="민간">민간</option>
					        <option value="공공">공공</option>
					        <option value="통신">통신</option>
						   </select>
						</td>
						<td data-name="teamName">
						    <input type="text" name='teamName' class="form-control"/>
						</td>
						<td data-name="startDate">
						   <input type="text" name='startDate' class="form-control"/>
						</td>
						<td data-name="endDate">
						   <input type="text" name='endDate' class="form-control"/>
						</td>
						<td data-name="expense">
						   <input type="text" name='expense' class="form-control"/>
						</td>
						<td data-name="outsourcingCost">
						   <input type="text" name='outsourcingCost' class="form-control"/>
						</td>
						<td data-name="netSales">
						   <input type="text" name='netSales' class="form-control"/>
						</td>
						<td data-name="sales">
						  <input type="text" name='sales' class="form-control"/>
						</td>
						<td data-name="goods">
						   <input type="text" name='goods' class="form-control"/>
						</td>
                        <td data-name="del">
                            <button name="del0" class='btn btn-danger glyphicon glyphicon-remove row-remove'><span aria-hidden="true">×</span></button>
                        </td>
					</tr>
				</tbody>
			</table>
			</form>
		</div>
	</div>
	<!-- <a id="add_row" class="btn btn-primary float-right">Add Row</a> -->
</div>




</body>
<script>
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
        /*
        $("<td></td>").append(
            $("<button class='btn btn-danger glyphicon glyphicon-remove row-remove'></button>")
                .click(function() {
                    $(this).closest("tr").remove();
                })
        ).appendTo($(tr));
        */
        
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
});
</script>
</html>