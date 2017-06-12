<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#productInsert").click(function() {
			location.href = "/manager/product/insertForm.do";

		});

		$(".goDetail").click(function() {
			var productNo = $(this).parents("tr").attr("data-num");
			$("#productNo").val(productNo);

			$("#detailForm").attr({
				"method" : "get",
				"action" : "/manager/product/productDetail.do"
			});
			$("#detailForm").submit();
		});

		$("#searchData").click(function() {
			goPage(1);

		});

	});

	function goPage(page) {

		$("#page").val(page);

		$("#searchForm").attr("method", "get");
		$("#searchForm").attr("action", "/manager/product/productList.do");
		$("#searchForm").submit();

	}
</script>
<style type="text/css">

input[type="button"] {
	background-color: #555555; /* Black */
	border: none;
	color: white;
	/* padding: 15px 32px; */
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 1em;
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- 상단 헤더 -->
	<div id="header">
		<nav>
			<ul>
				<li>주문관리</li>
				<li>매출관리</li>
				<li>상품관리</li>
				<li>고객관리</li>
				<li>고객센터관리</li>
				<li>쇼핑몰이동</li>
			</ul>
		</nav>
	</div>
	<div style="width: 100%; height: 100px; border: 1px solid black;">

		<form id="searchForm" style="margin: 5%">
			<input type="hidden" name="page" id="page" value="${data.page }">
			<input type="hidden" name="pageSize" id="pageSize"
				value="${data.pageSize }"> <label for="searchName">검색어</label>
			<select id="search" name="search">
				<option value="all">전체</option>
				<option value="productName">상품명</option>

			</select> <input type="text" id="keyword" name="keyword"
				placeholder="검색어를 입력하세요"> <input type="button" value="검색"
				id="searchData">

		</form>
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="productNo" id="productNo"> <input
				type="hidden" name="page" id="page" value="${data.page }"> <input
				type="hidden" name="pageSize" value="${data.pageSize }">

		</form>
	</div>
	<table style="height: 100%;" width="100%" cellspacing="0"
		cellpadding="0">
		<tbody>
			<tr>
				<td>상품번호</td>
				<td>이미지</td>
				<td>상품코드</td>
				<td>상품명</td>
				<td>색상</td>
				<td>분류</td>

				<td>상품가격</td>


			</tr>
			<c:choose>
				<c:when test="${not empty productList }">
					<c:forEach var="product" items="${productList }" varStatus="status">
						<tr data-num="${product.productNo }">
							<td>${count-(status.count-1) }</td>
							<td width="20%"><img width="40%" id="mainImage"
								src="/manager/uploadStorage/${product.productMainImage}"></td>

							<td>${product.productCode }</td>
							<td><span class="goDetail" style="cursor: pointer;">${product.productName }</span></td>
							<td>${product.productColor }</td>
							<td>${product.productCategory }</td>
							<td>${product.productPrice }</td>





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
	<div style="float: right;">
		<input type="button" value="상품등록" id="productInsert">
	</div>
	<div id="productPage" style="margin-left: 50%">
		<tag:paging page="${param.page }" total="${total }"
			list_size="${data.pageSize }"></tag:paging>
	</div>
</body>
</html>