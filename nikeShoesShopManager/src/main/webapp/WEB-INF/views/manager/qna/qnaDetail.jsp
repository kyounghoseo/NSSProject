<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 상세페이지</title>
<link rel="stylesheet" type="text/css"
	href="../resources/include/css/common.css">
	<!-- 부트스트랩 -->
<script src="../resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="../resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="../resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<!-- 부트스트랩 -->
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
	
	
	
	<div class="row content" style=" margin-left: 7%; margin-top: 3%;">
		


		<div class="col-sm-11 text-left" >
			
			<div >

				<div id="qnaInsertForm">
					<form id="f_qnaForm" name="f_qnaForm">
						<input type="hidden" id="customerNO" name="customerNO"
							value="${sessionScope.loginSession.customerNO }"> <input
							type="hidden" id="qnaCsid" name="qnaCsid"
							value="${sessionScope.loginSession.customerID }">
						<div>
							<table class="table table-hover" >
								<colgroup>
									<col width="17%" />
									<col width="20%" />
									<col width="17%" />
									<col width="46%" />
								</colgroup>
								<tbody>
									<tr>
										<td class="ac">QnA번호</td>
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
									<tr style="height: 200px;">
										<td class="ac vm" >내용</td>
										<td colspan="3">${detail.qnaContents}</td>
									</tr>
								

								</tbody>
							</table>
						</div>

					</form>


				</div>
				<div id="button">

					<input type="button" value="삭제" id="qnaDeleteBtn" class="btn-xs">
					<input type="button" value="목록" id="qnaListBtn" class="btn-xs">

				</div>
			
	<!-- 상세 정보 보여주기 -->
	<div id="contentTB">

		 <jsp:include page="answer.jsp"></jsp:include> 
	</div>
	
			
			
			</div>

		</div>

	</div>
	

</body>
</html>