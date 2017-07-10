<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${empty sessionScope.managerid }">
 <script>
 alert("잘못된 접근경로입니다. 관리자 로그인페이지로 이동합니다.");
 location.href="/manager/login/loginForm.do";
 </script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리</title>
<script src="//code.jquery.com/jquery.min.js"></script>
	<!-- 부트스트랩 -->
<script src="../resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="../resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
   href="../resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<!-- 부트스트랩 -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
	

		
		
		if(!$("#order_check").val()){
			$("#order_check").val('전체');
		}
		if($("#order_check").val()){
			var check = $("#order_check").val();
			
		 	$('input:radio[name=order]:input[value=' + check + ']').attr("checked", true); 
		}
		
		 $("#s_startDate,#s_endDate").datepicker({
			 showOn: "both", 
		     buttonImage: "../resources/images/calendar-symbol.png", 
		     buttonImageOnly: true,  
			 changeMonth: true,
			 changeYear:true,
			 showButtonPanel: true, 
			 closeText: '닫기',
	         currentText: '오늘 날짜', 
	         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         dateFormat : "yy-mm-dd",

	      });
		
		$('#dialog').dialog({
		    autoOpen: false,
		    resizable: false,
		  });
		
		
		
		
		$("input[type='radio']").click(function() {

			  var check = $("input:radio[name=order]:checked").val();
			  $(".order_check").val(check);
			

			goPage(1);

		}); 
		
		$("#cancle").click(function() {
			var orderNO = $(this).parents("tr").attr("data-num");
			$('#dialog').dialog('close');



		});
		
		$("#search").click(function() {
			if(!$(".order_check").val()){
				$(".order_check").val($("#order_check").val());
				}
			$("#f_search").attr({
				"method" : "get",
				"action" : "/manager/order/orderList.do"
			});
			$("#f_search").submit();
			$("#page").val(1);
			
		});
		
		
		

		
		
		
		
		
		$(".shipbtn").click(function() {
			var orderGroup = $(this).parents("tr").attr("data-Group");
			$('#dialog').dialog('open');

			$("#shipInsert").click(function() {

				if ($("#orderShipno").val()) {
					alert($("#orderShipno").val());
					$("#orderGroup").val(orderGroup);
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/manager/order/orderInfo.do"
					});
					$("#detailForm").submit();
				}
			});
		});

		
		
		$(".list").rowspan(1); 
	
		
		

	});
	function goPage(page) {

		$("#page").val(page);
		if(!$(".order_check").val()){
		$(".order_check").val($("#order_check").val());
		}
		
		$("#f_check").attr({
			"method" : "get",
			"action" : "/manager/order/orderList.do"
		});
		$("#f_check").submit();

	}
	
	jQuery.fn.rowspan  = function(colIdx) {
		 return this.each(function(){
		  var that;
		  var that2;
		  var that3;
		  var that4;
		  var that10;
		  var that11;
		  var that12;
		  $('tr', this).each(function(row) {
			  this2= $('td:eq(2)', this);
			  this3= $('td:eq(3)', this);
			  this4= $('td:eq(4)', this);
			  this10= $('td:eq(10)', this);
			  this11= $('td:eq(11)', this);
			  this12= $('td:eq(12)', this);
			  $('td:eq('+colIdx+')', this).each(function(col) {
				 
				  
			  if ($(this).html() == $(that).html()) {
		        rowspan = $(that).attr("rowSpan");
		        if (rowspan == undefined) {
		  
		          $(that).attr("rowSpan",1);
		          rowspan = $(that).attr("rowSpan");
		        }
		    
		    	
		        rowspan = Number(rowspan)+1;
		        $(that).attr("rowSpan",rowspan); 
		        $(that2).attr("rowSpan",rowspan);
		        $(that3).attr("rowSpan",rowspan);
		        $(that4).attr("rowSpan",rowspan); 
		        $(that10).attr("rowSpan",rowspan);
		        $(that11).attr("rowSpan",rowspan);
		        $(that12).attr("rowSpan",rowspan);
		        $(this).remove(); 
		        $(this2).remove();
		        $(this3).remove();
		        $(this4).remove();
		        $(this10).remove();
		        $(this11).remove();
		        $(this12).remove();
		      } else {
		        that = this;
				that2 = this2;
				that3 = this3;
				that4 = this4;
				that10 = this10;
				that11 = this11;
				that12 = this12;
		      }
		      that = (that == null) ? this : that;
		  });
		 });
		    
		
		  
		 });
		}


</script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="**/../resources/css/main.css">
<link rel="stylesheet" type="text/css"
	href="../resources/include/css/common.css">
<style type="text/css">
#d_search{
float: left;
width: 51%;
}
.ui-datepicker-trigger {
 width: 7%;
 padding-bottom: 0;
 }
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
table.list {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
}
table.list th {
    width: 155px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #000000 ;
   
}
table.list td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
     vertical-align: inherit;
}
th{
text-align: center;
}

#wrap{
width: 80%;
margin-left: 10%;
margin-top: 3%;
}

#d_radio{
clear: both;
}
#d_control{
margin-top: 3%;
}
</style>

</head>
<body>
	<form id="f_check" name="f_check">
		 <input type="hidden" name="order_check" class="order_check" value="${data.order_check }"> 
		<input type="hidden" name="page" id="page" value="${data.page }"> 
			<input type="hidden" name="pageSize" id="pageSize" value="${data.pageSize }">
			<input type="hidden" name="s_startDate" value="${data.s_startDate }"> 
			<input type="hidden"  name="s_endDate" value="${data.s_endDate }">
			
	</form>
	<!-- 상단 헤더 -->
<%@ include file="../header.jsp"%>
	<div id="wrap">
	<div id="title">
	
	<h2>주문관리</h2>

	
	</div>
 	
		<table class="table table-bordered" style="height: 100%; margin-top: 3%; "  cellspacing="0" cellpadding="0">
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
	<div id="d_control">
	<div id="d_search" >
		<form id="f_search">
	<p style="float: left; font-family: initial; font-weight: bold;">날짜별 조회</p>
		<div style="clear: both; float: left;  width: 80%;">
		<input type="text" id="s_startDate" name="s_startDate" value="${data.s_startDate }"> ~
			<input type="text" id="s_endDate" name="s_endDate" value="${data.s_endDate }">
			<input type="button" id="search" value="조회">
		<input type="hidden" name="page" id="page" value="${data.page }"> 
			<input type="hidden" name="pageSize" id="pageSize" value="${data.pageSize }">
		<input type="hidden" name="order_check" class="order_check" value="${data.order_check }" >  
			</div>
			</form>
		</div> 
	<div id="d_radio">
			<form id="f_radio" name="f_radio">
			<input type="radio" id="order_all" name="order" value="전체">전체 
			<input type="radio" id="order_desposit" name="order" value="입금완료">입금완료
		    <input type="radio"	id="order_ship" name="order" value="배송중">배송중
		    <input type="radio"	id="order_shipcomple" name="order" value="배송완료">배송완료
		    <input type="radio"	id="order_cancle" name="order" value="주문취소">주문취소
		    <input type="radio"	id="order_return" name="order" value="주문반품">주문반품
		    
		</form>
	</div>
	</div>
	<table class="list"  cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<th>번호</th>
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
						<tr data-num="${order.orderNO }" data-group="${order.orderGroup }" >
							<td>${order.orderNO }</td>
							<td class="group">${order.orderGroup }</td>
							<td class="date">${fn:substring(order.orderDate,0,10) }</td>
 
							<td>
							<c:if test="${order.orderShipno != null}">
							우체국 택배 <br>
							</c:if>
							${order.orderShipno }</td>
							<td class="id">${order.orderCsid }</td>
							<td>${order.orderPrname }</td>
							<td>${order.orderColor }</td>
							<td>${order.orderSize }</td>
							<td>${order.orderCount }</td>
							<td><fmt:formatNumber value="${order.orderPrice }" pattern="#,###.##" />원</td>
							<td class="ad">${order.orderAddress }</td>
							<td>${order.orderStatus }</td>
							<td>${fn:substring(order.orderShipdate,0,10) }
							<c:if test="${order.orderStatus eq '입금완료'}">
								<input type="button" class="shipbtn" id="shipbtn" name="shipbtn" value="배송">
							</c:if>
							</td>






						</tr>

					</c:forEach>

				</c:when>

				<c:otherwise>

					<tr>
						<td colspan="13" class="tac">등록된 주문건이 존재하지 않습니다.</td>
					</tr>

				</c:otherwise>

			</c:choose>


		</tbody>
		
	</table>
	<div id="orderPage">
		<tag:paging page="${param.page }" total="${total }"	list_size="${data.pageSize }"></tag:paging>
	</div>
	</div>
	<div id="dialog" title="보내시는 운송장 번호를 입력해주세요.">
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="orderGroup" id="orderGroup">
			<input type="hidden" name="s_startDate" value="${data.s_startDate }">
			<input type="hidden" name="s_endDate" value="${data.s_endDate }">
			<input type="hidden" name="order_check" id="order_check" value="${data.order_check }" >
			<input type="hidden" name="page" id="page" value="${data.page }"> 
			<input type="hidden" name="pageSize" value="${data.pageSize }">
			<label>택배회사</label>
							<select name="ship" id="ship">
									<option>- 택배사선택 -</option>
									<option value="우체국택배">우체국택배</option>
									
							</select>
			<input type="text" id="orderShipno" name="orderShipno"> 
			<div>
			<input type="button" id="shipInsert" name="shipInsert" value="확인"> 
			<input type="button" id="cancle" value="취소">
			</div>
		</form>

	</div>
	
</body>
</html>