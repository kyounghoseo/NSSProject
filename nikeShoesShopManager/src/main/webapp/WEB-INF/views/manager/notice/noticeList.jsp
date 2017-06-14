<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<link rel="stylesheet" type="text/css"
	href="../resources/include/css/common.css">
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if ("<c:out value='${data.keyword}' />" != "") {
			$("#keyword").val("<c:out value='${data.keyword}' />");
			$("#search").val("<c:out value='${data.search}' />");
		}

		//한페이지에 보여줄 레코드 수 조회후 값 유지
		if ("<c:out value='${data.pageSize}' />" != "") {
			$("#pageSize").val("<c:out value = '${data.pageSize}' />");
		}

		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("공지사항 목록 전체");
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

		//제목 클릭시 상세페이지 이동
		$(".goDetail").click(function() {
			var noticeNo = $(this).parents("tr").attr("data-num");
			$("#noticeNo").val(noticeNo);
			console.log("글번호 : " + noticeNo);
			//상세페이지로 이동하기위해 form 추가 (id : detailForm)
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/manager/notice/noticeDetail.do"
			});
			$("#detailForm").submit();
		});

		$("#insertButton").click(function() {
			location.href = "/manager/notice/insertForm.do";
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
			"action" : "/manager/notice/noticeList.do"
		});
		$("#f_search").submit();

	}
</script>
</head>
<body>
	<%-- <%
String id="";
session.setAttribute("id", id);
%> --%>

	<!-- 상단 헤더 -->
	<%@ include file="../header.jsp"%>


	<!-- 상세페이지 이동을 위한 form -->
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="noticeNo" id="noticeNo"> <input
			type="hidden" name="page" value="${data.page }"> <input
			type="hidden" name="pageSize" value="${data.pageSize }">
	</form>

	<div id="noticeSearch">
		<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}" /> <label
				for="keyword">검색어</label> <select id="search" name="search">
				<option value="all">전체</option>
				<option value="title">제목</option>
			</select> <input type="text" name="keyword" id="keyword"
				placeholder="제목을 입력하세요."> <input type="button" value="검색"
				id="searchButton">
		</form>
	</div>
	<p>

		<!-- 리스트 시작 -->
	<div id="noticeList">
		<table id="list_tb" cellspacing="0" cellpadding="0" summary="공지사항 목록">
			<thead>
				<tr>
					<th><marquee>공지번호</marquee></th>
					<th>작성자</th>
					<th>제목</th>
					<th class="borcle">등록날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty noticeList}">
						<c:forEach var="notice" items="${noticeList}" varStatus="status">
							<tr data-num="${notice.noticeNo}">
								<td>${notice.noticeNo}</td>
								<td>${notice.noticeWriter}</td>
								<td><span class="goDetail">${notice.noticeTitle}</span></td>
								<td>${notice.noticeDate}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<p>
	<form id="insert">
		<input type="button" id="insertButton" value="공지등록">
	</form>

	<!-- 페이지 네비게이션 -->
	<div id="boardPage">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}"></tag:paging>
	</div>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<link rel="stylesheet" type="text/css"
	href="../resources/include/css/common.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<%-- <%
String id="";
session.setAttribute("id", id);
%> --%>
	<!-- 상단 헤더 -->
	<div id="header">
		<nav>
			<ul>
				<img id="banner" src="../resources/images/nss_banner.jpg">
				<li><a href="/manager/order/orderList.do">주문관리</a></li>
				<li><a href="#">매출관리</a></li>
				<li><a href="/manager/product/productList.do">상품관리</a></li>
				<li><a href="/manager/customer/customerList.do">고객관리</a></li>
				<li><a href="/manager/notice/noticeList.do">공지사항</a></li>
				<li><a href="#">QnA</a></li>
				<li><a href="#">쇼핑몰이동</a></li>
			</ul>
		</nav>
	</div>

	<!-- 상세페이지 이동을 위한 form -->
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="noticeNo" id="noticeNo">
		<%-- <input type="hidden" name="page" value="${data.page }">
		<input type="hidden" name="pageSize" value="${data.pageSize }"> --%>
	</form>

	<div id="noticeSearch">
		<form id="f_search" name="f_search">
			<%-- <input type="hidden" id="page" name="page" value="${data.page}" /> --%>
			<label for="keyword">검색어</label> <select id="search" name="search">
				<option value="all">전체</option>
				<option value="name">이름</option>
			</select> <input type="text" name="keyword" id="keyword"
				placeholder="제목을 입력하세요."> <input type="button" value="검색"
				id="searchButton">
		</form>
	</div>
	<p>

		<!-- 리스트 시작 -->
	<div id="noticeList">
		<table id="list_tb" cellspacing="0" cellpadding="0" summary="공지사항 목록">
			<thead>
				<tr>
					<th><marquee>공지번호</marquee></th>
					<th>작성자</th>
					<th>제목</th>
					<th class="borcle">등록날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty noticeList}">
						<c:forEach var="notice" items="${noticeList}" varStatus="status">
							<tr data-num="${notice.noticeNo}">
								<td>${notice.noticeNo}</td>
								<td>${notice.noticeWriter}</td>
								<td>${notice.noticeTitle}</td>
								<td>${notice.noticeDate}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<p>
	<form id="insert">
		<input type="button" id="insertButton" value="공지등록">
	</form>
</body>
>>>>>>> branch 'master' of https://github.com/kyounghoseo/NSSProject
</html>