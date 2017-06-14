<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기 화면</title>
<link rel="stylesheet" type="text/css"
	href="../resources/include/css/common.css">
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#noticeInsertBtn").click(function() {
			if (!chkSubmit($('#noticeWriter'), "작성자를 ")) {
				return;
			} else if (!chkSubmit($('#noticeTitle'), "제목을 ")) {
				return;
			} else if (!chkSubmit($('#noticeContents'), "작성할 내용을 ")) {
				return;
				/* else if (!chkSubmit($('#file'),
						"첨부파일을 "))
					return; */
			} else {
				//배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1반환)
				//jQuery.inArray(찾을 값, 검색 대상의 배열)
				/* var ext = $('#file').val()
						.split('.').pop()
						.toLowerCase();
				if (jQuery.inArray(ext, [
						'gif', 'png', 'jpg',
						'jpeg' ]) == -1) {
					alert('gif, png, jpg, jpeg 파일만 업로드 할 수 있습니다.');
					return;
				} */
				if ($('#noticeWriter').val() == "관리자") {
					$('#managerNo').val(1);
				} else {
					$('#managerNo').val(2);
				}
				$("#f_writeForm").attr({
					"method" : "post",
					"action" : "/manager/notice/noticeInsert.do"
				});
				$("#f_writeForm").submit();

			}
			;
		});

		/* 목록 버튼 클릭시 */
		$("#noticeListBtn").click(function() {
			location.href = "/manager/notice/noticeList.do";
		});
	});
</script>
</head>
<body>

	<!-- 상단 헤더 -->
	<%@ include file="../header.jsp"%>

	<div class="contentContainer">
		<div id="contentTit">
			<h3>공지사항 글작성</h3>
		</div>

		<div class="contentTB">
			<form id="f_writeForm" name="f_writeForm"
				enctype="multipart/form-data">
				<input type="hidden" name="csrf" value="${csrf_token}"> <input
					type="hidden" name="managerNo" id="managerNo">
				<table id="boardWrite">
					<colgroup>
						<col width="17%" />
						<col width="83%" />
					</colgroup>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="noticeWriter" id="noticeWriter"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="noticeTitle" id="noticeTitle"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="noticeContents" id="noticeContents"></textarea></td>
					</tr>
					<tr>
						<td class="ac">첨부파일</td>
						<td><input type="file" name="file" id="file"></td>
					</tr>
				</table>
				<%-- <c:if test="noticeWriter == '관리자'">
					<input type="hidden" name="managerNo" value="1">
				</c:if> --%>
			</form>
		</div>

		<div id="contentBut">
			<input type="button" value="저장" class="but" id="noticeInsertBtn">
			<input type="button" value="목록" class="but" id="noticeListBtn">
		</div>
	</div>
</body>
</html>