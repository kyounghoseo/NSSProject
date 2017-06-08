<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
div {
	text-align: center;
}

#customer_tb{
border: 1px solid black;
}

#customer_tb th{
border-right: 1px solid black;
border-bottom: 1px solid black;
}


</style>
<meta charset="UTF-8">
<title>고객 목록</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<!-- 상세페이지 이동을 위한 form -->
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="customerNo" id="customerNo">
	</form>

	<div id="customerSearch">
		<form>
			<label for="keyword">검색어</label> <select>
				<option>전체</option>
				<option>이름</option>
			</select> <input type="text" name="keyword" id="keyword"
				placeholder="이름을 입력하세요."> <input type="button" value="검색"
				id="searchData">
		</form>
	</div>
	<div>
		<table>
			<tbody>
				<tr>
					<td>전체 회원수</td>
					<td>1명</td>
					<td>오늘 가입회원</td>
					<td>1명</td>
				</tr>
			</tbody>
		</table>
		<input type="radio" name="customer_check" value="전체">전체 <input
			type="radio" name="customer_check" value="일반회원">일반회원 <input
			type="radio" name="customer_check" value="탈퇴회원">탈퇴회원
	</div>
	<!-- 리스트 시작 -->
	<div id="customerList">
		<table id="customer_tb" cellspacing="5" cellpadding="5" summary="고객 리스트">
			<thead>
				<tr>
					<th><marquee>회원번호</marquee></th>
					<th>이름</th>
					<th>아이디</th>
					<th>이메일</th>
					<th>휴대폰번호</th>
					<th>성별</th>
					<th>가입일시</th>
					<th>회원여부</th>
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
							<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>