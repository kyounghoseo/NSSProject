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
</html>