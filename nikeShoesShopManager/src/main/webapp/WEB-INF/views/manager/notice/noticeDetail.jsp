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
<script type="text/javascript" src="../resources/include/js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 부트스트랩 -->
<script src="../resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="../resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="../resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<!-- 부트스트랩 -->
<script type="text/javascript">
	var butChk = 0;

	$(document)
			.ready(
					function() {

						//첨부파일 이미지 보여주기 위한 속성
						var file = "<c:out value='${detail.noticeFile}' />";
						if (file != "") {
							$("#fileImage")
									.attr(
											{
												src : "/manager/noticeStorage/${detail.noticeFile}",
												width : "450px",
												height : "200px"
											});
						}

						$("#updateFormBtn")
								.click(
										function() {
											if (confirm('수정을 진행할까요?')) {
												$("#f_data")
														.attr(
																{
																	"method" : "post",
																	"action" : "/manager/notice/updateForm.do?page=${param.page}&pageSize=${param.pageSize}"
																});
												$("#f_data").submit();
											}
										});

						$("#noticeDeleteBtn")
								.click(
										function() {
											if (confirm('삭제를 진행할까요?')) {
												$("#f_data")
														.attr(
																{
																	"method" : "post",
																	"action" : "/manager/notice/noticeDelete.do"
																});
												$("#f_data").submit();
											}
										});

						$("#noticeListBtn")
								.click(
										function() {
											location.href = "/manager/notice/noticeList.do?page=${param.page}&pageSize=${param.pageSize}";
										});

					});
</script>
<style type="text/css">
.contentContainer {
	width: 80%;
	margin-left: 10%;
}
</style>
</head>
<body>

	<!-- 상단 헤더 -->
	<%@ include file="../header.jsp"%>

	<div class="contentContainer">
		<div id="boardTit">
			<h2>공지사항 상세페이지</h2>
		</div>

		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="noticeNo" id="noticeNo"
				value="${detail.noticeNo}" /> <input type="hidden" name="page"
				id="page" value="${param.page}" /> <input type="hidden"
				name="pageSize" id="pageSize" value="${param.pageSize}" />
		</form>

		<!-- 상세 정보 보여주기 -->
		<div id="contentTB" style="margin-top: 3%;">
			<table class="table table-hover">
				<colgroup>
					<col width="17%" />
					<col width="33%" />
					<col width="17%" />
					<col width="33%" />
				</colgroup>
				<tbody>
					<tr>
						<td class="ac">공지번호</td>
						<td>${detail.noticeNo}</td>
						<td class="ac">작성일</td>
						<td>${detail.noticeDate}</td>
					</tr>
					<tr>
						<td class="ac">작성자</td>
						<td colspan="3">${detail.noticeWriter}</td>
					</tr>
					<tr>
						<td class="ac">제목</td>
						<td colspan="3">${detail.noticeTitle}</td>
					</tr>
					<tr>
						<td class="ac vm">내용</td>
						<td colspan="3">${detail.noticeContents}</td>
					</tr>
					<tr>
						<td class="ac vm"></td>
						<td colspan="3"><img id="fileImage"></td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 버튼 추가 -->
		<div>
			<input type="button" value="수정" id="updateFormBtn"> <input
				type="button" value="삭제" id="noticeDeleteBtn"> <input
				type="button" value="목록" id="noticeListBtn">
		</div>
	</div>
</body>
</html>