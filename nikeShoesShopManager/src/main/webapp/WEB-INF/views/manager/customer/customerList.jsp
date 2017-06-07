<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 목록</title>
</head>
<body>
	<!-- 상세페이지 이동을 위한 form -->
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="customerNo" id="customerNo">
	</form>


	<!-- 리스트 시작 -->
	<div id="customerList">
		<table cellspacing="0" cellpadding="0" summary="고객 리스트">
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