<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		var conText = $(this).parents("li").children().eq(1).html();
		console.log("context:"+conText);
		$(this).parents("li").find("input[type='button']").hide();
		$(this).parents("li").children().eq(0).html();
		var conArea = $(this).parents("li").children().eq(1);
		
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
		
		var answerNO = $(this).parents("li").attr("data-num");
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
		
		var answerNO = $(this).parents("li").attr("data-num");
		console.log("answerNO:"+answerNO);
		
		if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
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
	var new_li = $("<li>");
	new_li.attr("data-num",answerNO);
	new_li.addClass("comment_item");
	
	var writer_p = $("<p>");
	writer_p.addClass("writer");
	
	var name_span = $("<span>");
	name_span.addClass("name");
	name_span.html("작성자  "+answerWriter+"님");
	
	var date_span = $("<span>");
	date_span.html("<br>등록일  "+answerDate+" ");
	
	
	
	var content_p =$("<p>");
	content_p.addClass("con");
	content_p.html(answerContents);
	
	var up_input=$("<input>");
	up_input.attr({"type":"button","value":"수정"});
	up_input.addClass("update_form");
	
	var del_input = $("<input>");
	del_input.attr({"type":"button","value":"삭제"});
	del_input.addClass("delete_btn");
	
	writer_p.append(name_span).append(date_span)
	new_li.append(writer_p).append(content_p).append(up_input).append(del_input);
	$("#comment_list").append(new_li);
		
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
<label for="answerWriter">작성자</label>
<input type="text" name="answerWriter" id="answerWriter">

<input type="button" id="answerInsert" value="저장하기">

</div>
<div>
<label for="answerContents">덧글 내용</label>
<textarea name="answerContents" id="answerContents"></textarea>
</div>

</form>

</div>
<ul id="comment_list"></ul>

</div>


</body>
</html>

