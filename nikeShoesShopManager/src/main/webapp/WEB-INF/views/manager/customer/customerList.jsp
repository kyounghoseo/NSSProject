<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> --%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 목록</title>
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
				$("#keyword").val("고객 목록 전체");
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

		$("#customer_all").click(function() {
			if ($("#customer_all").val() == "전체") {
				goRadio(1);
			}
		});

		$("#customer_normal").click(function() {
			if ($("#customer_normal").val() == "일반회원") {
				goRadio(1);
			}
		});

		$("#customer_out").click(function() {
			if ($("#customer_out").val() == "탈퇴회원") {
				goRadio(1);
			}
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
			"action" : "/manager/customer/customerList.do"
		});
		$("#f_search").submit();

	}

	function goRadio(page) {

		$("#page").val(page);

		$("#f_radio").attr({
			"method" : "get",
			"action" : "/manager/customer/customerList.do"
		});
		$("#f_radio").submit();

	}
</script>
</head>
<body>

	<!-- 상단 헤더 -->
	<%@ include file="../header.jsp"%>

	<!-- 상세페이지 이동을 위한 form -->
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="customerNo" id="customerNo">
	</form>

	<div id="customerSearch">
		<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}" /> <label
				for="keyword">검색어</label> <select id="search" name="search">
				<option value="all">전체</option>
				<option value="name">이름</option>
			</select> <input type="text" name="keyword" id="keyword"
				placeholder="이름을 입력하세요."> <input type="button" value="검색"
				id="searchButton">
		</form>
	</div>
	<div>
		<table>
			<tbody>
				<tr>
					<td>전체 회원수</td>
					<td>[${totalCustomer}명]</td>
					<td>오늘 가입회원</td>
					<td>[${todayCustomer}명]</td>
				</tr>
			</tbody>
		</table>
		<form id="f_radio" name="f_radio">
			<input type="radio" id="customer_all" name="customer_check"
				value="전체">전체 <input type="radio" id="customer_normal"
				name="customer_check" value="일반회원">일반회원 <input type="radio"
				id="customer_out" name="customer_check" value="탈퇴회원">탈퇴회원
		</form>
	</div>
	<!-- 리스트 시작 -->
	<div id="customerList">
		<table id="list_tb" cellspacing="0" cellpadding="0" summary="고객 리스트">
			<thead>
				<tr>
					<th><marquee>회원번호</marquee></th>
					<th>이름</th>
					<th>아이디</th>
					<th>이메일</th>
					<th>휴대폰번호</th>
					<th>성별</th>
					<th>가입일시</th>
					<th class="borcle">회원여부</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty customerList}">
						<c:forEach var="customer" items="${customerList}"
							varStatus="status">
							<tr data-num="${customer.customerNo}">
								<td>${customer.customerNo}</td>
								<td>${customer.customerName}</td>
								<td>${customer.customerId}</td>
								<td>${customer.customerEmail}</td>
								<td>${customer.customerCellphone}</td>
								<td>${customer.customerGender}</td>
								<td>${customer.customerDate}</td>
								<td>${customer.customerCheck}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<p>

			<!-- 페이지 네비게이션 -->
		<div id="boardPage">
			<tag:paging page="${param.page}" total="${totalCustomer}"
				list_size="${data.pageSize}"></tag:paging>
		</div>

	</div>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 목록</title>
<link rel="stylesheet" type="text/css"
	href="../resources/include/css/common.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
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
				$("#keyword").val("고객 목록 전체");
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

		$("#customer_all").click(function() {
			if ($("#customer_all").val() == "전체") {
				goRadio(1);
			}
		});

		$("#customer_normal").click(function() {
			if ($("#customer_normal").val() == "일반회원") {
				goRadio(1);
			}
		});

		$("#customer_out").click(function() {
			if ($("#customer_out").val() == "탈퇴회원") {
				goRadio(1);
			}
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
			"action" : "/manager/customer/customerList.do"
		});
		$("#f_search").submit();

	}

	function goRadio(page) {

		$("#page").val(page);

		$("#f_radio").attr({
			"method" : "get",
			"action" : "/manager/customer/customerList.do"
		});
		$("#f_radio").submit();

	}
</script>
</head>
<body>

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
		<input type="hidden" name="customerNo" id="customerNo">
	</form>

	<div id="customerSearch">
		<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}" /> <label
				for="keyword">검색어</label> <select id="search" name="search">
				<option value="all">전체</option>
				<option value="name">이름</option>
			</select> <input type="text" name="keyword" id="keyword"
				placeholder="이름을 입력하세요."> <input type="button" value="검색"
				id="searchButton">
		</form>
	</div>
	<div>
		<table>
			<tbody>
				<tr>
					<td>전체 회원수</td>
					<td>[${totalCustomer}명]</td>
					<td>오늘 가입회원</td>
					<td>[${todayCustomer}명]</td>
				</tr>
			</tbody>
		</table>
		<form id="f_radio" name="f_radio">
			<input type="radio" id="customer_all" name="customer_check"
				value="전체">전체 <input type="radio" id="customer_normal"
				name="customer_check" value="일반회원">일반회원 <input type="radio"
				id="customer_out" name="customer_check" value="탈퇴회원">탈퇴회원
		</form>
	</div>
	<!-- 리스트 시작 -->
	<div id="customerList">
		<table id="list_tb" cellspacing="0" cellpadding="0" summary="고객 리스트">
			<thead>
				<tr>
					<th><marquee>회원번호</marquee></th>
					<th>이름</th>
					<th>아이디</th>
					<th>이메일</th>
					<th>휴대폰번호</th>
					<th>성별</th>
					<th>가입일시</th>
					<th class="borcle">회원여부</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty customerList}">
						<c:forEach var="customer" items="${customerList}"
							varStatus="status">
							<tr data-num="${customer.customerNo}">
								<td>${customer.customerNo}</td>
								<td>${customer.customerName}</td>
								<td>${customer.customerId}</td>
								<td>${customer.customerEmail}</td>
								<td>${customer.customerCellphone}</td>
								<td>${customer.customerGender}</td>
								<td>${customer.customerDate}</td>
								<td>${customer.customerCheck}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<!-- 페이지 네비게이션 -->
		<div id="boardPage">
			<tag:paging page="${param.page}" total="${totalCustomer}"
				list_size="${data.pageSize}"></tag:paging>
		</div>

	</div>
</body>
>>>>>>> branch 'master' of https://github.com/kyounghoseo/NSSProject
</html>