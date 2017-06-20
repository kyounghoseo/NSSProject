<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
<link rel="stylesheet" type="text/css"
	href="../resources/include/css/common.css">
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {


		$("#qnaListBtn").click(function() {
			location.href = "/manager/qna/qnaList.do";

		});

		$("#qnaDeleteBtn").click(function() {
			if(confirm("QnA를 삭제하시겠습니까?")){
			
			$("#updateForm").attr("method", "POST");
			$("#updateForm").attr("action", "/manager/qna/qnaDelete.do");
			$("#updateForm").submit();
			}else{
				return false;
			}

		});
		
	
	});

</script>

</head>
<body>
	<form id="updateForm">
	<input type="hidden" name="qnaNO" value="${detail.qnaNO }">
	</form>
	<!-- 상단 헤더 -->
	<%@ include file="../header.jsp"%>




	<!-- 버튼 추가 -->
	<table id="boardBut">
		<tr>
			<td id="btd2">
				<input type="button" value="삭제" id="qnaDeleteBtn"> 
				<input type="button" value="목록" id="qnaListBtn"></td>
		</tr>
	</table>

	<!-- 상세 정보 보여주기 -->
	<div id="contentTB">
		<table>
			<colgroup>
				<col width="17%" />
				<col width="20%" />
				<col width="17%" />
				<col width="46%" />
			</colgroup>
			<tbody>
				<tr>
					<td class="ac">공지번호</td>
					<td>${detail.qnaNO}</td>
					<td class="ac">작성일</td>
					<td>${detail.qnaDate}</td>
				</tr>
				<tr>
					<td class="ac">작성자</td>
					<td colspan="3">${detail.qnaWriter}</td>
				</tr>
				<tr>
					<td class="ac">제목</td>
					<td colspan="3">${detail.qnaTitle}</td>
				</tr>
				<tr>
					<td class="ac vm">내용</td>
					<td colspan="3">${detail.qnaContents}</td>
				</tr>
				
			</tbody>
		</table>
		 <jsp:include page="answer.jsp"></jsp:include> 
	</div>
</body>
</html>