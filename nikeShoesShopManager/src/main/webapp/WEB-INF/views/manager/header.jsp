<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" type="text/css"
	href="../resources/include/css/common.css">
<script type="text/javascript">
$(document).ready(function() {
	$("#sessionOut").click(function() {
		
		location.href = "/manager/login/logOut.do";
		
	});
});

</script>
</head>
<body>
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
				<li><a href="/manager/qna/qnaList.do">QnA</a></li>
				<li><a href="/customer">쇼핑몰이동</a></li>
			</ul>
		</nav>
	</div>
	<input type="button" value="로그아웃" id="sessionOut">
</body>
</html>