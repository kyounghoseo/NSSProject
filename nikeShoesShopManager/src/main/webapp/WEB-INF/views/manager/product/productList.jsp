<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
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
<title>상품 관리</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
		<!-- 부트스트랩 -->
<script src="../resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="../resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="../resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<!-- 부트스트랩 -->
<script type="text/javascript">
	$(document).ready(function() {
		if(!$("#category_check").val()){
			$("#category_check").val('전체');
			$(".category_check").val('전체');
		}
		if($("#category_check").val()){
			var check = $("#category_check").val();
			
		 	$('input:radio[name=category]:input[value=' + check + ']').attr("checked", true); 
		}
		
		
		
		
		if ("<c:out value='${data.keyword}' />" != "") {
			$("#keyword").val("<c:out value='${data.keyword}' />");
			$("#search").val("<c:out value='${data.search}' />");
		}

		$("#productInsert").click(function() {
			location.href = "/manager/product/insertForm.do";

		});

		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("전체 상품");
			} else if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		$(".goDetail").click(function() {
			var productNo = $(this).attr("data-num");
			$("#productNo").val(productNo);

			$("#detailForm").attr({
				"method" : "get",
				"action" : "/manager/product/productDetail.do"
			});
			$("#detailForm").submit(); 
		});

		$("#searchData").click(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("전체 상품");
			}
			goPage(1);

		});
		
		$("input[type='radio']").click(function() {

			  var check = $("input:radio[name=category]:checked").val();
			  $("#category_check").val(check);
			

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
#wrap{
width: 80%;
margin-left: 10%;
}
th{
text-align: center;
}
td{
vertical-align: inherit;
}
#d_radio{
clear: both;
}

</style>
</head>
<body>
	<!-- 상단 헤더 -->
	<%@ include file="../header.jsp"%>
	<div id="wrap">
	<div id="title">
	
	<h2>상품관리</h2>

	
	</div>
	<div style="margin-top: 3%; clear: both;">

		<form id="searchForm" style="float: left;" >
		<input type="hidden" name="category_check" id="category_check" value="${data.category_check }">
			<input type="hidden" name="page" id="page" value="${data.page }">
			<input type="hidden" name="pageSize" id="pageSize"
				value="${data.pageSize }"> <label for="keyword">검색어</label>
			<select id="search" name="search">
				<option value="all">전체</option>
				<option value="productName">상품명</option>

			</select> <input type="text" id="keyword" name="keyword"
				placeholder="검색어를 입력하세요"> <input type="button" value="검색"
				id="searchData">
				

		</form>
		<div style="float: right;">
		<input type="button" value="상품등록" id="productInsert">
	</div>
	
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="productNo" id="productNo"> <input
				type="hidden" name="page" id="page" value="${data.page }"> <input
				type="hidden" name="pageSize" value="${data.pageSize }">
				<input type="hidden" name="category_check" class="category_check" value="${data.category_check}">

		</form>
	</div>
	<div id="d_radio">
			<form id="f_radio" name="f_radio">
			<input type="radio" id="category_all" name="category" value="전체">전체 
			<input type="radio" id="category_menAll" name="category" value="전체M">전체M
			 <input type="radio" id="category_womenAll" name="category" value="전체W">전체W
		    <input type="radio"	id="category_menRunning" name="category" value="런닝화M">런닝화M
		    <input type="radio"	id="category_menLiftStyle" name="category" value="라이프스타일M">라이프스타일M
		    <input type="radio"	id="category_menBasketBall" name="category" value="농구화M">농구화M
		    <input type="radio"	id="category_menScoccer" name="category" value="축구화M">축구화M
		    <input type="radio"	id="category_womenRunning" name="category" value="런닝화W">런닝화W
		    <input type="radio"	id="category_womenLiftStyle" name="category" value="라이프스타일W">라이프스타일W
		    
		</form>
	</div>
	<table class="table table-hover" style="margin-top: 2%;">
		<tbody>
			<tr>
				<th>상품번호</th>
				<th>이미지</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>색상</th>
				<th>분류</th>
				<th class="borcle">상품가격</th>
			</tr>
			<c:choose>
				<c:when test="${not empty productList }">
					<c:forEach var="product" items="${productList }" varStatus="status">
						<tr data-num="${product.productNo }"  class="goDetail" style="cursor: pointer;">
							<td style="vertical-align: inherit;">${count-(status.count-1) }</td>
							<td width="20%"><img width="40%" id="mainImage"
								src="/manager/uploadStorage/${product.productMainImage}"></td>

							<td style="vertical-align: inherit;">${product.productCode }</td>
							<td style="vertical-align: inherit;"><span>${product.productName }</span></td>
							<td style="vertical-align: inherit;">${product.productColor }</td>
							<td style="vertical-align: inherit;">${product.productCategory }</td>
							<td style="vertical-align: inherit;"><fmt:formatNumber value="${product.productPrice }" pattern="#,###.##" />원</td>



						</tr>

					</c:forEach>

				</c:when>

				<c:otherwise>

					<tr>
						<td colspan="7" class="tac">등록된 게시물이 존재하지 않습니다.</td>
					</tr>

				</c:otherwise>

			</c:choose>


		</tbody>
	</table>
	
	<div id="productPage">
		<tag:paging page="${param.page }" total="${total }"
			list_size="${data.pageSize }"></tag:paging>
	</div>
	</div>
</body>
</html>