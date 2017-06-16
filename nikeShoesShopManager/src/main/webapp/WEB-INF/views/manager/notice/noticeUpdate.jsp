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
	$(document)
			.ready(
					function() {
						//이미지 호버 이벤트
						var img = $("<img>");
						$('#imgView')
								.hover(
										function() {
											img
													.attr({
														src : "/manager/noticeStorage/${updateData.noticeFile}",
														width : "450px",
														height : "200px"
													});
											img.addClass("imgViewData");
											$('#imgArea').append(img);
										}, function() {
											img.remove();
										});

						//수정버튼 클릭
						$("#noticeUpdateBtn")
								.click(
										function() {

											if (!chkSubmit($('#noticeTitle'),
													"제목을"))
												return;
											else if (!chkSubmit(
													$('#noticeContents'),
													"작성할 내용을"))
												return;
											else {
												/* if ($('#file').val().indexOf(
														".") > -1) {
													var ext = $('#file').val()
															.split('.').pop()
															.toLowerCase();
													if (jQuery.inArray(ext, [
															'gif', 'png',
															'jpg', 'jpeg' ]) == -1) {
														alert('gif, png, jpg, jpeg 파일만 업로드 할 수 있습니다.');
														return;
													}
												} */

												$("#f_writeForm")
														.attr(
																{
																	"method" : "post",
																	"action" : "/manager/notice/noticeUpdate.do"
																});
												$("#f_writeForm").submit();

											}
										});

						$("#noticeListBtn")
								.click(
										function() {
											location.href = "/manager/notice/noticeList.do?page=${param.page}&pageSize=${param.pageSize}";
										});
					});
</script>
</head>
<body>

	<!-- 상단 헤더 -->
	<%@ include file="../header.jsp"%>


	<div class="contentContainer">
		<div id="contentTit">
			<h3>공지사항 글수정</h3>
		</div>

		<div class="contentTB">
			<form id="f_writeForm" name="f_writeForm"
				enctype="multipart/form-data">
				<input type="hidden" id="noticeNo" name="noticeNo"
					value="${updateData.noticeNo}" /> <input type="hidden" id="page"
					name="page" value="${param.page}" /> <input type="hidden"
					id="pageSize" name="pageSize" value="${param.pageSize}" /> <input
					type="hidden" id="noticeFile" name="noticeFile"
					value="${updateData.noticeFile}" />


				<table>
					<colgroup>
						<col width="17%" />
						<col width="33%" />
						<col width="17%" />
						<col width="33%" />
					</colgroup>
					<tbody>
						<tr>
							<td class="ac">공지번호</td>
							<td>${updateData.noticeNo}</td>
							<td class="ac">작성일</td>
							<td>${updateData.noticeDate}</td>
						</tr>
						<tr>
							<td class="ac">작성자</td>
							<td colspan="3">${updateData.noticeWriter}</td>
						</tr>
						<tr>
							<td class="ac">제목</td>
							<td colspan="3"><input type="text" name="noticeTitle"
								id="noticeTitle" value="${updateData.noticeTitle}" /></td>
						</tr>
						<tr>
							<td class="ac vm">내용</td>
							<td colspan="3"><textarea name="noticeContents"
									id="noticeContents">${updateData.noticeContents}</textarea></td>
						</tr>
						<tr>
							<td class="ac">이미지</td>
							<td colspan="3"><input type="file" name="file" id="file">
								<label id="imgView">기존 이미지 파일명 :
									${updateData.noticeFile}<span id="imgArea"></span>
							</label></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>

		<div id="contentBtn">
			<input type="button" value="수정" id="noticeUpdateBtn" /> <input
				type="button" value="목록" class="but" id="noticeListBtn" />
		</div>
	</div>
</body>
</html>