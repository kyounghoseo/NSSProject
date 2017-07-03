<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>매출 목록</title>
<link rel="stylesheet" type="text/css"
	href="../resources/include/css/common.css">
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<!-- DatePicker -->
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//검색어와 search값 초기화
		if ("<c:out value='${data.keyword}' />" != "") {
			$("#keyword").val("<c:out value='${data.keyword}' />");
			$("#search").val("<c:out value='${data.search}' />");
		}

		//한페이지에 보여줄 레코드 수 조회후 값 유지
		if ("<c:out value='${data.pageSize}' />" != "") {
			$("#pageSize").val("<c:out value = '${data.pageSize}' />");
		}

		// 검색버튼 클릭시 
		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("매출 목록 전체");
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

		//기본 월별 체크, 일자별은 숨겨놓음
		$("#sales_month").attr("checked", true);
		$("#curve_chart_day").hide();

		//월별, 일자별 라디오버튼
		$("#sales_month").click(function() {
			if ($("#sales_month").val() == "월별") {
				alert('월별로 확인합니다.');
				$("#curve_chart_day").hide();
				$("#curve_chart_month").show();
			}
		});

		$("#sales_day").click(function() {
			if ($("#sales_day").val() == "일자별") {
				alert('일자별로 확인합니다.');
				$("#curve_chart_month").hide();
				$("#curve_chart_day").show();
			}
		});

		//날짜 초기화버튼
		$("#resetButton").click(function() {
			$("#s_startDate").val("");
			$("#s_endDate").val("");
		});

		// 엑셀 파일 다운로드 처리
		$("#excelButton").click(function() {
			$("#f_search").attr({
				"method" : "get",
				"action" : "/manager/sales/salesExcel.do"
			});
			$("#f_search").submit();
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
			"action" : "/manager/sales/salesList.do"
		});
		$("#f_search").submit();
	}
</script>

<script type="text/javascript">
	//구글차트
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChartDay);

	var date = new Date;
	var refund = "<c:out value='${chartList[3].chartRefund}' />" ? "<c:out value='${chartList[3].chartRefund}' />"
			: 0;

	function drawChartDay() {
		var data = google.visualization
				.arrayToDataTable([
						[ 'day', '매출금액', '환불금액' ],
						[ "<c:out value='${chartList[0].chartDate}' />",
								<c:out value='${chartList[0].chartSales}' />,
								<c:out value='${chartList[0].chartRefund}' /> ],
						[ "<c:out value='${chartList[1].chartDate}' />",
								<c:out value='${chartList[1].chartSales}' />,
								<c:out value='${chartList[1].chartRefund}' /> ],
						[ "<c:out value='${chartList[2].chartDate}' />",
								<c:out value='${chartList[2].chartSales}' />,
								<c:out value='${chartList[2].chartRefund}' /> ],
						[ "<c:out value='${chartList[3].chartDate}' />",
								<c:out value='${chartList[3].chartSales}' />,
								refund ] ]);

		var options = {
			title : 'Nike Shoes Shop Performance',
			curveType : 'function',
			legend : {
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart_day'));

		chart.draw(data, options);
	}
</script>

<script type="text/javascript">
	//구글차트
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChartMonth);

	var date = new Date;

	function drawChartMonth() {
		var data = google.visualization.arrayToDataTable([
				[ 'month', '매출금액', '환불금액' ],
				[ (date.getUTCMonth() - 2) + '월', 100000, 40000 ],
				[ (date.getUTCMonth() - 1) + '월', 117000, 46000 ],
				[ date.getUTCMonth() + '월', 66000, 112000 ],
				[ (date.getUTCMonth() + 1) + '월', 103000, 54000 ] ]);

		var options = {
			title : 'Nike Shoes Shop Performance',
			curveType : 'function',
			legend : {
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart_month'));

		chart.draw(data, options);
	}
</script>

<script type="text/javascript">
	//DatePicker
	$(function() {
		$("#s_startDate,#s_endDate").datepicker({
			dateFormat : "yy-mm-dd"
		});
	});
</script>
</head>
<body>
	<!-- 상단 헤더 -->
	<%@ include file="../header.jsp"%>

	${chartList[0].chartRefund} ${chartList[1].chartSales}
	${chartList[2].chartSales} ${chartList[3].chartSales}

	<%
		Date date = new Date();
		String chartDate = "${chartList[3].chartDate}";
		if (chartDate == null) {
			chartDate = date.getDate() + "";
		}

		int chartSales;
		String sales = "${chartList[3].chartSales}";
		if (sales == null) {
			sales = "0";
			chartSales = Integer.parseInt(sales);
		}

		int chartRefund;
		String refund = "${chartList[3].chartRefund}";
		if (refund == null) {
			refund = "0";
			chartRefund = Integer.parseInt(refund);
		}
	%>

	<c:choose>
		<c:when test="${not empty chartList}">
			<c:forEach var="chart" items="${chartList}" varStatus="status">
				<table>
					<tr>
						<td>${chart.chartDate}</td>
						<td>${chart.chartSales}</td>
						<td>${chart.chartRefund}</td>
						<td>${status.count}</td>
					</tr>
				</table>
			</c:forEach>
		</c:when>
	</c:choose>

	<c:if test="${status.count} != 1">
		<input type="hidden" id="status1" value="0">
	</c:if>

	<c:if test="${status.count} != 2">
		<input type="hidden" id="status2" value="0">
	</c:if>

	<c:if test="${status.count} != 3">
		<input type="hidden" id="status3" value="0">
	</c:if>

	<c:if test="${status.count} != 4">
		<input type="hidden" id="status4" value="0">
	</c:if>


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
			<p>
				<input type="text" name="s_startDate" id="s_startDate"
					value="${data.s_startDate}"> - <input type="text"
					name="s_endDate" id="s_endDate" value="${data.s_endDate}">
				<input type="button" value="초기화" id="resetButton">
		</form>
	</div>
	<p>
	<div>
		<table>
			<tbody>
				<tr>
					<td>매출현황</td>
					<td><input type="button" id="excelButton" value="엑셀다운로드"></td>
					<td>&nbsp;총 매출금액</td>
					<td style="color: blue;">[<fmt:formatNumber
							value="${totalMoney}" pattern="\#,###.##"></fmt:formatNumber>원]
					</td>
					<td>총 환불금액</td>
					<td style="color: red;">[<fmt:formatNumber
							value="${refundMoney}" pattern="\#,###.##"></fmt:formatNumber>원]
					</td>
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
									<td>${fn:substring(sales.orderShipdate,0,10)}</td>
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

		<div id="curve_chart_day"
			style="width: 30%; float: right; margin-bottom: 30%;"></div>
		<div id="curve_chart_month"
			style="width: 30%; float: right; margin-bottom: 30%;"></div>

	</div>

	<div id="boardPage">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}"></tag:paging>
	</div>
</body>
</html>