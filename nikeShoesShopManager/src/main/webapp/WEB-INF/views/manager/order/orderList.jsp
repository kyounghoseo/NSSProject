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
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#dialog').dialog({
		    autoOpen: false,
		    resizable: false,
		  });
		if($("#order_check").val()){
		var check = $("#order_check").val();
		
	 	$('input:radio[name=order]:input[value=' + check + ']').attr("checked", true); 
		}
		
		
		$("input[type='radio']").click(function() {

			  var check = $("input:radio[name=order]:checked").val();
			  $("#order_check").val(check);
			$("#f_check").attr({
				"method" : "get",
				"action" : "/manager/order/orderList.do"
			});
			$("#f_check").submit();



		}); 
		
		$("#cancle").click(function() {
			var orderNO = $(this).parents("tr").attr("data-num");
			$('#dialog').dialog('close');



		});
		$(".shipbtn").click(function() {
			var orderNO = $(this).parents("tr").attr("data-num");
			$('#dialog').dialog('open');

			$("#shipInsert").click(function() {
				

				if ($("#orderShipno").val()) {
					$("#orderNO").val(orderNO);
					alert($("#orderNO").val());
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/manager/order/orderInfo.do"
					});
					$("#detailForm").submit();
				}
			});

		});

	});
</script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="../resources/include/css/common.css">
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
	<form id="f_check" name="f_check">
		<input type="hidden" name="order_check" id="order_check" value="${check }">
	</form>
	<!-- 상단 헤더 -->
<%@ include file="../header.jsp"%>
	<div>

		<%--	< form id="searchForm" >
			<input type="hidden" name="page" id="page" value="${data.page }">
			<input type="hidden" name="pageSize" id="pageSize"
				value="${data.pageSize }"> <label for="searchName">검색어</label>
			<select id="search" name="search">
				<option value="all">전체</option>
				<option value="productName">상품명</option>

			</select> <input type="text" id="keyword" name="keyword"
				placeholder="검색어를 입력하세요"> <input type="button" value="검색"
				id="searchData">

		</form> --%>

	</div>
		<table id="list_tb" style="height: 100%;" width="100%" cellspacing="0"
		cellpadding="0">
		<tbody>
			<tr>
				<th>주문결제</th>
				<th>배송중/완료</th>
		
				<th class="borcle">취소/반품</th>
			</tr>
			
						<tr style="text-align: center;">
							<td>${orderCount }건</td>
							<td>${shipCount }건</td>

							<td>${cancleCount }건</td>
							

						</tr>


		</tbody>
	</table>
	<Br><Br><br>
			<form id="f_radio" name="f_radio">
			<input type="radio" id="order_all" name="order" value="전체">전체 
			<input type="radio" id="order_desposit" name="order" value="입금완료">입금완료
		    <input type="radio"	id="order_ship" name="order" value="배송중">배송중
		    <input type="radio"	id="order_shipcomple" name="order" value="배송완료">배송완료
		    <input type="radio"	id="order_cancle" name="order" value="주문취소">주문취소
		    <input type="radio"	id="order_return" name="order" value="주문반품">주문반품
		    
		</form>
	<table id="list_tb" style="height: 100%;" width="100%" cellspacing="0"
		cellpadding="0">
		<tbody>
			<tr>
				<th>주문번호</th>
				<th>주문날짜</th>
				<th>운송장번호</th>
				<th>구매자아이디</th>
				<th>상품명</th>
				<th>색상</th>
				<th>사이즈</th>
				<th>수량</th>
				<th>총상품가격</th>
				<th>주소</th>
				<th>주문상태</th>
				<th class="borcle">배송날짜</th>
			</tr>
			<c:choose>
				<c:when test="${not empty orderList }">
					<c:forEach var="order" items="${orderList }" varStatus="status">
						<tr data-num="${order.orderNO }">
							<td>${order.orderNO }</td>
							<td>${order.orderDate }</td>

							<td>${order.orderShipno }</td>
							<td>${order.orderCsid }</td>
							<td>${order.orderPrname }</td>
							<td>${order.orderColor }</td>
							<td>${order.orderSize }</td>
							<td>${order.orderCount }</td>
							<td>${order.orderPayment }</td>
							<td>${order.orderAddress }</td>
							<td>${order.orderStatus }</td>
							<td>${order.orderShipdate }
							<c:if test="${order.orderStatus eq '입금완료'}">
								<input type="button" class="shipbtn" id="shipbtn" name="shipbtn" value="배송">
							</c:if>
							</td>






						</tr>

					</c:forEach>

				</c:when>

				<c:otherwise>

					<tr>
						<td colspan="4" class="tac">등록된 주문건이 존재하지 않습니다.</td>
					</tr>

				</c:otherwise>

			</c:choose>


		</tbody>
	</table>
	<div id="dialog" title="보내시는 운송장 번호를 입력해주세요.">
		<form name="detailForm" id="detailForm">
		
			<input type="hidden" name="orderNO" id="orderNO"> 
			<input type="hidden" name="order_check" id="order_check" value="${check }">
			<%-- <input type="hidden" name="page" id="page" value="${data.page }"> 
			<input type="hidden" name="pageSize" value="${data.pageSize }">  --%>
			<input type="text" id="orderShipno" name="orderShipno"> 
			<input type="button" id="shipInsert" name="shipInsert" value="확인"> 
			<input type="button" id="cancle" value="취소">

		</form>

	</div>
	<div id="productPage">
		<tag:paging page="${param.page }" total="${total }"
			list_size="${data.pageSize }"></tag:paging>
	</div>
</body>
</html>