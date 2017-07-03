<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<c:if test="${empty sessionScope.managerid }">
	<script>
		alert("잘못된 접근경로입니다. 관리자 로그인페이지로 이동합니다.");
		location.href = "/manager/login/loginForm.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<link rel="stylesheet" type="text/css"
	href="../resources/include/css/common.css">
<script type="text/javascript" src="../resources/include/js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						if (!$("#qna_check").val()) {
							$("#qna_check").val('전체');
						}
						if ($("#qna_check").val()) {
							var check = $("#qna_check").val();
							$(
									'input:radio[name=qna]:input[value='
											+ check + ']')
									.attr("checked", true);
						}

						if ("<c:out value='${data.keyword}' />" != "") {
							$("#keyword").val(
									"<c:out value='${data.keyword}' />");
							$("#search")
									.val("<c:out value='${data.search}' />");
						}

						//한페이지에 보여줄 레코드 수 조회후 값 유지
						if ("<c:out value='${datad.pageSize}' />" != "") {
							$("#pageSize").val(
									"<c:out value = '${datad.pageSize}' />");
						}

						$("#search").change(function() {
							if ($("#search").val() == "all") {
								$("#keyword").val("QnA 목록 전체");
							} else if ($("#search").val() != "all") {
								$("#keyword").val("");
								$("#keyword").focus();
							}
						});

						$("#searchButton").click(function() {
							if ($("#search").val() != "all") {

								if (!chkSubmit($("#keyword"), "검색어를 "))
									return;
							}
							goPage(1);
						});

						$("input[type='radio']").click(
								function() {

									var check = $(
											"input:radio[name=qna]:checked")
											.val();
									$("#qna_check").val(check);

									goPage(1);

								});

						//제목 클릭시 상세페이지 이동
						$(".goDetail").click(function() {
							var qnaNO = $(this).parents("tr").attr("data-num");
							$("#qnaNO").val(qnaNO);
							console.log("글번호 : " + qnaNO);
							//상세페이지로 이동하기위해 form 추가 (id : detailForm)
							$("#detailForm").attr({
								"method" : "get",
								"action" : "/manager/qna/qnaDetail.do"
							});
							$("#detailForm").submit();
						});

					});

	//검색과 한페이지에 보여줄 레코드수 처리 및 페이징을 위한 실질적인 처리함수
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}

		$("#page").val(page);

		$("#f_search").attr({
			"method" : "get",
			"action" : "/manager/qna/qnaList.do"
		});
		$("#f_search").submit();

	}
</script>
</head>
<body>

	<!-- 상단 헤더 -->
	<%@ include file="../header.jsp"%>


	<!-- 상세페이지 이동을 위한 form -->
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="qnaNO" id="qnaNO"> <input
			type="hidden" name="page" value="${datad.page }"> <input
			type="hidden" name="pageSize" value="${datad.pageSize }">
	</form>

	<div id="qnaSearch">
		<form id="f_search" name="f_search">
			<input type="hidden" id="qna_check" name="qna_check"
				value="${data.qna_check }"> <input type="hidden" id="page"
				name="page" value="${datsa.page}" /> <label for="keyword">검색어</label>
			<select id="search" name="search">
				<option value="all">전체</option>
				<option value="title">제목</option>
				<option value="id">아이디</option>
			</select> <input type="text" name="keyword" id="keyword"
				placeholder="검색어를 입력하세요."> <input type="button" value="검색"
				id="searchButton">
		</form>
	</div>
	<form id="f_radio" name="f_radio">
		<input type="radio" id="qna_all" name="qna" value="전체">전체 <input
			type="radio" id="qna_noanswer" name="qna" value="미답변">미답변 <input
			type="radio" id="qna_answer" name="qna" value="답변완료">답변완료

	</form>

	<!-- 리스트 시작 -->
	<div id="qnaList">
		<table id="list_tb" cellspacing="0" cellpadding="0" summary="공지사항 목록">
			<colgroup>
				<col width="10%" />
				<col width="15%" />
				<col width="15%" />
				<col width="40%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th><marquee>QnA번호</marquee></th>
					<th>작성자</th>
					<th>아이디</th>
					<th>제목</th>
					<th class="borcle">등록날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty qnaList}">
						<c:forEach var="qna" items="${qnaList}" varStatus="status">
							<tr data-num="${qna.qnaNO}">
								<td>${qna.qnaNO }</td>

								<td>${qna.qnaWriter}</td>
								<td>${qna.qnaCsid}</td>
								<td><span class="goDetail">${qna.qnaTitle} <c:if
											test="${qna.qnaAnswer eq '답변완료'}">
											<span style="color: red;"><small> [답변완료]</small></span>
										</c:if></span></td>
								<td>${qna.qnaDate}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<p>


		<!-- 페이지 네비게이션 -->
	<div id="qnaPage">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}"></tag:paging>
	</div>
</body>
</html>