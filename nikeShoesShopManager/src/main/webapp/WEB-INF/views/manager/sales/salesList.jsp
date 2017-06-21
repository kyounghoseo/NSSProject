<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 목록</title>
<link rel="stylesheet" type="text/css"
	href="../resources/include/css/common.css">
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		//한페이지에 보여줄 레코드 수 조회후 값 유지
		if ("<c:out value='${data.pageSize}' />" != "") {
			$("#pageSize").val("<c:out value = '${data.pageSize}' />");
		}
	});

	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	var date = new Date;

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'day', '매출금액', '환불금액' ],
				[
						'0' + (date.getUTCMonth() + 1) + '/'
								+ (date.getUTCDate() - 3), 100000, 40000 ],
				[
						'0' + (date.getUTCMonth() + 1) + '/'
								+ (date.getUTCDate() - 2), 117000, 46000 ],
				[
						'0' + (date.getUTCMonth() + 1) + '/'
								+ (date.getUTCDate() - 1), 66000, 112000 ],
				[ '0' + (date.getUTCMonth() + 1) + '/' + date.getUTCDate(),
						103000, 54000 ] ]);

		var options = {
			title : 'Nike Shoes Shop Performance',
			curveType : 'function',
			legend : {
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart'));

		chart.draw(data, options);
	}

	//검색과 한페이지에 보여줄 레코드수 처리 및 페이징을 위한 실질적인 처리함수
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}

		$("#page").val(page);

		$("#f_search").attr({
			"method" : "get",
			"action" : "/manager/sales/salesList.do"
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
		<input type="hidden" name="productNo" id="productNo"> <input
			type="hidden" name="page" value="${data.page }"> <input
			type="hidden" name="pageSize" value="${data.pageSize }">
	</form>

	<div id="salesSearch">
		<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}" /> <label
				for="keyword">검색어</label> <select id="search" name="search">
				<option value="all">전체</option>
				<option value="productName">상품명</option>
			</select> <input type="text" name="keyword" id="keyword"
				placeholder="상품명을 입력하세요."> <input type="button" value="검색"
				id="searchButton">
		</form>
	</div>
	<p>
	<div>
		<table>
			<tbody>
				<tr>
					<td>매출현황</td>
					<td><input type="button" value="엑셀다운로드"></td>
					<td>&nbsp;총 매출금액</td>
					<td>[550,000원]</td>
					<td>총 환불금액</td>
					<td>[100,000원]</td>
				</tr>
			</tbody>
		</table>
		<form id="f_radio" name="f_radio">
			<input type="radio" id="sales_month" name="sales_check" value="월별">월별
			<input type="radio" id="sales_day" name="sales_check" value="일자별">일자별
		</form>
	</div>


	<div id="slaesList">
		<div style="width: 70%; float: left;">
			<table id="list_tb" cellspacing="0" cellpadding="0" summary="매출 목록">
				<thead>
					<tr>
						<th><marquee>주문번호</marquee></th>
						<th>상품명</th>
						<th>수량</th>
						<th>총 판매금액</th>
						<th>주문상태</th>
						<th class="borcle">배송날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty salesList}">
							<c:forEach var="sales" items="${salesList}" varStatus="status">
								<tr data-num="${sales.orderNO}">
									<td>${sales.orderNO}</td>
									<td>${sales.orderPrname}</td>
									<td>${sales.orderCount}</td>
									<td>${sales.orderPrice}</td>
									<td>${sales.orderStatus}</td>
									<td>${sales.orderShipdate}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" class="tac">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<div id="curve_chart"
			style="width: 30%; float: right; margin-bottom: 30%;"></div>

	</div>

	<div id="boardPage">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}"></tag:paging>
	</div>
</body>
</html>