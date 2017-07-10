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
<script type="text/javascript" src="../resources/include/js/common.js"></script>

<!-- DatePicker -->
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						//매출 일간 차트
						var date1 = "<c:out value='${chartList[0].chartDate}' />" == "" ? "x"
								: "<c:out value='${chartList[0].chartDate}' />";
						$("#date1").val(date1);

						var date2 = "<c:out value='${chartList[1].chartDate}' />" == "" ? "x"
								: "<c:out value='${chartList[1].chartDate}' />";
						$("#date2").val(date2);

						var date3 = "<c:out value='${chartList[2].chartDate}' />" == "" ? "x"
								: "<c:out value='${chartList[2].chartDate}' />";
						$("#date3").val(date3);

						var date4 = "<c:out value='${chartList[3].chartDate}' />" == "" ? "x"
								: "<c:out value='${chartList[3].chartDate}' />";
						$("#date4").val(date4);

						var sales1 = "<c:out value='${chartList[0].chartSales}' />" == "" ? 0
								: "<c:out value='${chartList[0].chartSales}' />";
						/* sales1 *= 1; */
						$("#sales1").val(sales1);

						var sales2 = "<c:out value='${chartList[1].chartSales}' />" == "" ? 0
								: "<c:out value='${chartList[1].chartSales}' />";
						$("#sales2").val(sales2);

						var sales3 = "<c:out value='${chartList[2].chartSales}' />" == "" ? 0
								: "<c:out value='${chartList[2].chartSales}' />";
						$("#sales3").val(sales3);

						var sales4 = "<c:out value='${chartList[3].chartSales}' />" == "" ? 0
								: "<c:out value='${chartList[3].chartSales}' />";
						$("#sales4").val(sales4);

						var refund1 = "<c:out value='${chartList[0].chartRefund}' />" == "" ? 0
								: "<c:out value='${chartList[0].chartRefund}' />";
						$("#refund1").val(refund1);

						var refund2 = "<c:out value='${chartList[1].chartRefund}' />" == "" ? 0
								: "<c:out value='${chartList[1].chartRefund}' />";
						$("#refund2").val(refund2);

						var refund3 = "<c:out value='${chartList[2].chartRefund}' />" == "" ? 0
								: "<c:out value='${chartList[2].chartRefund}' />";
						$("#refund3").val(refund3);

						var refund4 = "<c:out value='${chartList[3].chartRefund}' />" == "" ? 0
								: "<c:out value='${chartList[3].chartRefund}' />";
						$("#refund4").val(refund4);

						/* alert($("#date1").val()); */

						//매출 월간 차트
						var monthDate1 = "<c:out value='${chartMonth[0].chartDate}' />" == "" ? "x"
								: "<c:out value='${chartMonth[0].chartDate}' />";
						$("#monthDate1").val(monthDate1);

						var monthDate2 = "<c:out value='${chartMonth[1].chartDate}' />" == "" ? "x"
								: "<c:out value='${chartMonth[1].chartDate}' />";
						$("#monthDate2").val(monthDate2);

						var monthDate3 = "<c:out value='${chartMonth[2].chartDate}' />" == "" ? "x"
								: "<c:out value='${chartMonth[2].chartDate}' />";
						$("#monthDate3").val(monthDate3);

						var monthDate4 = "<c:out value='${chartMonth[3].chartDate}' />" == "" ? "x"
								: "<c:out value='${chartMonth[3].chartDate}' />";
						$("#monthDate4").val(monthDate4);

						var monthSales1 = "<c:out value='${chartMonth[0].chartSales}' />" == "" ? 0
								: "<c:out value='${chartMonth[0].chartSales}' />";
						$("#monthSales1").val(monthSales1);

						var monthSales2 = "<c:out value='${chartMonth[1].chartSales}' />" == "" ? 0
								: "<c:out value='${chartMonth[1].chartSales}' />";
						$("#monthSales2").val(monthSales2);

						var monthSales3 = "<c:out value='${chartMonth[2].chartSales}' />" == "" ? 0
								: "<c:out value='${chartMonth[2].chartSales}' />";
						$("#monthSales3").val(monthSales3);

						var monthSales4 = "<c:out value='${chartMonth[3].chartSales}' />" == "" ? 0
								: "<c:out value='${chartMonth[3].chartSales}' />";
						$("#monthSales4").val(monthSales4);

						var monthRefund1 = "<c:out value='${chartMonth[0].chartRefund}' />" == "" ? 0
								: "<c:out value='${chartMonth[0].chartRefund}' />";
						$("#monthRefund1").val(monthRefund1);

						var monthRefund2 = "<c:out value='${chartMonth[1].chartRefund}' />" == "" ? 0
								: "<c:out value='${chartMonth[1].chartRefund}' />";
						$("#monthRefund2").val(monthRefund2);

						var monthRefund3 = "<c:out value='${chartMonth[2].chartRefund}' />" == "" ? 0
								: "<c:out value='${chartMonth[2].chartRefund}' />";
						$("#monthRefund3").val(monthRefund3);

						var monthRefund4 = "<c:out value='${chartMonth[3].chartRefund}' />" == "" ? 0
								: "<c:out value='${chartMonth[3].chartRefund}' />";
						$("#monthRefund4").val(monthRefund4);

						//검색어와 search값 초기화
						if ("<c:out value='${data.keyword}' />" != "") {
							$("#keyword").val(
									"<c:out value='${data.keyword}' />");
							$("#search")
									.val("<c:out value='${data.search}' />");
						}

						//한페이지에 보여줄 레코드 수 조회후 값 유지
						if ("<c:out value='${data.pageSize}' />" != "") {
							$("#pageSize").val(
									"<c:out value = '${data.pageSize}' />");
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
							/* alert($("#s_startDate").val().substring(1, 5)); */

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
	/* var refund = "<c:out value='${chartList[3].chartRefund}' />" ? "<c:out value='${chartList[3].chartRefund}' />"
			: 0;
	alert(refund); */

	function drawChartDay() {
		var data = google.visualization.arrayToDataTable([
				[ 'day', '매출금액', '환불금액' ],
				[ $("#date1").val(), Number($("#sales1").val()),
						Number($("#refund1").val()) ],
				[ $("#date2").val(), Number($("#sales2").val()),
						Number($("#refund2").val()) ],
				[ $("#date3").val(), Number($("#sales3").val()),
						Number($("#refund3").val()) ],
				[ $("#date4").val(), Number($("#sales4").val()),
						Number($("#refund4").val()) ] ]);

		var options = {
			title : 'Nike Shoes Shop (최근 4일간 거래내역)',
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
				[ $("#monthDate1").val(), Number($("#monthSales1").val()),
						Number($("#monthRefund1").val()) ],
				[ $("#monthDate2").val(), Number($("#monthSales2").val()),
						Number($("#monthRefund2").val()) ],
				[ $("#monthDate3").val(), Number($("#monthSales3").val()),
						Number($("#monthRefund3").val()) ],
				[ $("#monthDate4").val(), Number($("#monthSales4").val()),
						Number($("#monthRefund4").val()) ] ]);

		var options = {
			title : 'Nike Shoes Shop (월별 거래내역)',
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
			showOn : "both",
			buttonImage : "../resources/images/calendar-symbol.png",
			buttonImageOnly : true,
			showButtonPanel : true,
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd",
		});
	});
</script>
<style type="text/css">
.ui-datepicker-trigger {
	width: 1.7%;
}
</style>
</head>
<body>
	<!-- 상단 헤더 -->
	<%@ include file="../header.jsp"%>

	<%-- ${chartMonth[0].chartSales} ${chartMonth[1].chartSales}
	${chartMonth[2].chartSales} ${chartMonth[3].chartSales}
	${chartMonth[0].chartRefund} ${chartMonth[1].chartRefund}
	${chartMonth[2].chartRefund} ${chartMonth[3].chartRefund} --%>

	<!-- 매출 일간 -->
	<input type="hidden" name="date1" id="date1">
	<input type="hidden" name="date2" id="date2">
	<input type="hidden" name="date3" id="date3">
	<input type="hidden" name="date4" id="date4">

	<input type="hidden" name="sales1" id="sales1">
	<input type="hidden" name="sales2" id="sales2">
	<input type="hidden" name="sales3" id="sales3">
	<input type="hidden" name="sales4" id="sales4">

	<input type="hidden" name="refund1" id="refund1">
	<input type="hidden" name="refund2" id="refund2">
	<input type="hidden" name="refund3" id="refund3">
	<input type="hidden" name="refund4" id="refund4">

	<!-- 매출 월간 -->
	<input type="hidden" name="monthDate1" id="monthDate1">
	<input type="hidden" name="monthDate2" id="monthDate2">
	<input type="hidden" name="monthDate3" id="monthDate3">
	<input type="hidden" name="monthDate4" id="monthDate4">

	<input type="hidden" name="monthSales1" id="monthSales1">
	<input type="hidden" name="monthSales2" id="monthSales2">
	<input type="hidden" name="monthSales3" id="monthSales3">
	<input type="hidden" name="monthSales4" id="monthSales4">

	<input type="hidden" name="monthRefund1" id="monthRefund1">
	<input type="hidden" name="monthRefund2" id="monthRefund2">
	<input type="hidden" name="monthRefund3" id="monthRefund3">
	<input type="hidden" name="monthRefund4" id="monthRefund4">


	<%-- <%
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
	%> --%>

	<%-- <c:choose>
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
	</c:if> --%>


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
					value="${data.s_startDate}"> ~ <input type="text"
					name="s_endDate" id="s_endDate" value="${data.s_endDate}">
				<input type="button" value="초기화" id="resetButton">
		</form>
	</div>
	<br>
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