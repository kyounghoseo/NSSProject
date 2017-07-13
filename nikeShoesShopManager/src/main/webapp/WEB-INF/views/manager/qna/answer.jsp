<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>comment</title>

<link rel="stylesheet" type="text/css" href="../resources/include/css/answer.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="../resources/include/js/common.js"></script>
<script type="text/javascript">

$(function() {
	if(${not empty sessionScope.managerid}){
		$("#answerWriter").val('관리자');
		$("#answerWriter").attr("disabled",true);
	}
	var qnaNO = "<c:out value='${detail.qnaNO}' />";
	var qnaAnswer ="<c:out value='답변완료' />";
	listAll(qnaNO);
	
	if($("#answerWriter").val()=='관리자'){
		var managerNO = "<c:out value='1' />"
	}
	
	$("#answerInsert").click(function() {
		if(!chkSubmit($("#answerWriter"),"작성자"))
			return;
		else if(!chkSubmit($("#answerContents"),"내용을"))
			return;
		else{
			var insertUrl = "/manager/answer/answerInsert.do";
			
			
			$.ajax({
				url : insertUrl,
				type : "post",
				headers : {
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"POST"
				},
				dataType:"text",
				data : JSON.stringify({
					
					qnaNO:qnaNO,
					managerNO:managerNO,
					answerWriter:$("#answerWriter").val(),
					answerContents:$("#answerContents").val(),
					r_cont:$("#r_content").val()
				}),
				error : function() {
					
					alert('시스템 오류 입니다. 관리자에게 문의 하세요.');
					
				},
				success : function(resultData) {
					if(resultData=="SUCCESS"){
						alert("댓글 등록이 완료되었습니다.");
						var comment_list = $("#comment_list").children('li').attr('data-num');
						if(comment_list==null){
							var insertUrl = "/manager/answer/qnaUpdate.do";
						$.ajax({
							url : insertUrl,
							type : "put",
							headers : {
								"Content-Type":"application/json",
								"X-HTTP-Method-Override":"PUT"
							},
							dataType:"text",
							data : JSON.stringify({
								
								qnaNO:qnaNO,
								qnaAnswer:qnaAnswer
							}),
							error : function() {
								
								alert('시스템 오류 입니다. 관리자에게 문의 하세요.');
								
							},
							success : function(resultData) {
								if(resultData=="SUCCESS"){
									console.log('답변완료 텍스트추가');
								}
								
							}
							
							
						});
						}
						dataReset();
						listAll(qnaNO);
						if(${not empty sessionScope.managerid}){
							$("#answerWriter").val('관리자');
							$("#answerWriter").attr("disabled",true);
						}
					}
					
				}
				
				
			});
		}
		
		
	});
	
	$(document).on("click",".update_form", function() {
		$(".reset_btn").click();
		var conText = $(this).parents("tr").children().eq(1).html();
		console.log("context:"+conText);
		$(this).parents("tr").find("input[type='button']").hide();
		$(this).parents("tr").children().eq(0).html();
		var conArea = $(this).parents("tr").children().eq(1);
		
		conArea.html("");
		var data= "<textarea name='content' id='content'>"+conText+"</textarea>";
		data += "<input type='button' class='update_btn' value='수정완료'>";
		data +="<input type='button' class='reset_btn' value='수정취소'>";
		conArea.html(data);
		
	});
	
	$(document).on("click",".reset_btn", function() {
		listAll(qnaNO);
	});
	
	$(document).on("click",".update_btn", function() {
		
		var answerNO = $(this).parents("tr").attr("data-num");
		var answerContents = $("#content").val();
		if(!chkSubmit($("#content"),"댓글 내용을"))
			return;
		else{
			$.ajax({
				url :'/manager/answer/'+answerNO+".do",
				type:'put',
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"PUT"
				},
				data:JSON.stringify({
					answerContents:answerContents
				}),
				dataType:'text',
				success: function(result) {
					console.log("result:"+result);
					if(result =='SUCCESS'){
						alert("수정 되었습니다.");
						listAll(qnaNO);
					}
					
				}
				
				
				
			});
		}
		
		
	});
	
	$(document).on("click",".delete_btn", function() {
		
		var answerNO = $(this).parents("tr").attr("data-num");
		console.log("answerNO:"+answerNO);
		
		if(confirm("선택하신 답변을 삭제하시겠습니까?")){
			$.ajax({
				type :'delete',
				url :'/manager/answer/'+answerNO+".do",
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"DELETE"
				},
				dataType:'text',
				success: function(result) {
					console.log("result:"+result);
					if(result=='SUCCESS'){
						alert("삭제 되었습니다.");
						listAll(qnaNO);
					}
					
				}
				
				
			});
		}
		
	
	});
	
	
});

function listAll(qnaNO) {
	$("#comment_list").html("");
	var url = "/manager/answer/all/"+qnaNO+".do";
	$.getJSON(url, function(data) {
		console.log(data.length);
		$(data).each(function() {
			var answerNO = this.answerNO;
			var answerWriter = this.answerWriter;
			var answerContents = this.answerContents;
			var answerDate = this.answerDate;
			addNewItem(answerNO,answerWriter,answerContents,answerDate);
			
		});
		var url = "/manager/qna/qnaUpdate.do";
	}).fail(function() {
			alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
		});
	
	
	
	
	
	
}

function addNewItem(answerNO,answerWriter,answerContents,answerDate) {
	var new_li = $("<tr>");
	
	
	
	var new_td = $("<td>");
	new_td.html("작성자");
	
	var new_td1 = $("<td>");
	new_td1.html(answerWriter+"님");
	
	var new_tr2= $("<tr>");
	
	var new_td2 = $("<td>");
	new_td2.html("등록일");
	
	var new_td3 = $("<td>");
	new_td3.html(answerDate);
	
	
	var new_tr = $("<tr>");
	new_tr.attr("data-num",answerNO);
	new_tr.addClass("comment_item");

	var add_td = $("<td>");
	add_td.html("답변내용");
	
	var add_td1 = $("<td>");
	add_td1.html(answerContents);
	
	
	var up_input=$("<input>");
	up_input.attr({"type":"button","value":"수정"});
	up_input.addClass("update_form");
	
	var del_input = $("<input>");
	del_input.attr({"type":"button","value":"삭제"});
	del_input.addClass("delete_btn");
	
	new_tr.append(add_td).append(add_td1).append(up_input).append(del_input);
	new_li.append(new_td).append(new_td1)
	new_tr2.append(new_td2).append(new_td3)
	$("#comment_list").append(new_li).append(new_tr2).append(new_tr);
		
}
function dataReset() {
	$("#answerWriter").val("");
	$("#answerContents").val("");
	
}

</script>
</head>
<body>

<div id="replyContainer">

<h1></h1>
<div id="comment_write">
<form id="comment_form">
<div>
<table class="table table-hover">
						
					
						<tbody>
									<tr>
										<td class="ac">작성자</td>
										<td colspan="3"><input type="text" name="answerWriter" id="answerWriter" style="float: left;">
										
										</td>
									</tr>
									<tr>
										<td class="ac">작성일</td>
										<td><span style="float: left;"><fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" /></span></td>
									</tr>
									<tr style="height: 100px;">
										<td class="ac vm" >답변 내용</td>
										<td colspan="3"><textarea  style="float: left; height: 150px !important;" name="answerContents" id="answerContents"></textarea></td>
									</tr>
						</tbody>
						
					</table>
<input type="button" id="answerInsert" value="저장하기" style="margin-left: 38%;">

</div>


</form>

</div>
<table id="comment_list" class="table table-hover"></table>

</div>


</body>
</html>

