<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
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

		
		$("#productUpdateBtn").click(function() {

			$("#updateForm").attr("method", "GET");
			$("#updateForm").attr("action", "/manager/product/updateForm.do");
			$("#updateForm").submit();
		});

		$("#productListBtn").click(function() {
			location.href = "/manager/product/productList.do?category_check=${data.category_check}&page=${data.page}&pageSize=${data.pageSize}";

		});

		$("#productDeleteBtn").click(function() {
			if(confirm("상품을 삭제하시겠습니까?")){
			
			$("#updateForm").attr("method", "POST");
			$("#updateForm").attr("action", "/manager/product/productDelete.do");
			$("#updateForm").submit();
			}else{
				return false;
			}

		});
		

			

	});

	
	

</script>
<style type="text/css">
#btnForm{
clear: both;
}
.ac{
background-color: #eeeeee;

}
#wrap{
width: 80%;
margin-left: 10%;
}
img{
width: 100%;
}
.tr_img{
height: 100px;
}
input[type="file"]{
    margin-top: 17%;
    margin-left: 30%;
}
input[type="text"]{
    float: left;
}
.ac{
width: 15%;
}

</style>
</head>
<body>
<!-- 상단 헤더 -->
	<%@ include file="../header.jsp"%>
	

	
	<div id="wrap">
		<div id="title">
	
	<h2>상품상세 페이지</h2>

	
	</div>
	<div id="d_productForm" style="margin-top: 2%;" >
	<form name="updateForm" id="updateForm">
			<input type="hidden" value="${detail.productNo }" id="productNo"
				name="productNo">
				<input
				type="hidden" name="page" id="page" value="${data.page }"> <input
				type="hidden" name="pageSize" value="${data.pageSize }">
				<input type="hidden" name="category_check" value="${data.category_check}">


		</form>
	
		<table class="table table-bordered" style="height: 200px;" width="100%" border="1">

			
			<tbody>
				<tr>
					<td  class="ac"><label>상품명</label></td>
					<td >${detail.productName }</td>
					<td  class="ac"><label>상품분류</label></td>
							<td >${detail.productCategory }</td>
				</tr>
						
			
				<tr>
					<td class="ac"><label>상품코드</label></td>
					<td >${detail.productCode }</td>
					<td class="ac"><label>상품가격</label></td>
					<td ><fmt:formatNumber value="${detail.productPrice }" pattern="\#,###.##"/>원</td>
				</tr>
				
				<tr>
					<td  class="ac"><label>상품색상</label></td>
					<td >${detail.productColor }</td>
						<td  class="ac"><label>상품정보</label></td>
					<td >${detail.productInfo }</td>
					
				</tr>
				<tr class="tr_img">
				<td class="ac"><label>상품이미지</label></td>
					<td>
					<div  style="margin-left: 35%;">
					<div style="width: 100px; height:100px; border: 1px solid #b7b4b4;"  id="mainImg">
					<img  src="/manager/uploadStorage/${detail.productMainImage }">
					<p id="aa"></p></div>
					</div>
					<td class="ac"><label>상품상세이미지1</label></td>
					<td >
					<div style="margin-left: 35%;">
					<div style="width: 100px; height:100px; border: 1px solid #b7b4b4;"  id="detailImg1">
					<img src="/manager/uploadStorage/${detail.productDetailImage1 }">
					<p id="aa1"></p></div>
					</div>
					
			</tr>
				<tr class="tr_img"><td class="ac"><label>상품상세이미지2</label></td>
					<td >
					<div  style="margin-left: 35%;">
					<div style="width: 100px; height:100px; border: 1px solid #b7b4b4;"  id="detailImg2">
					<img src="/manager/uploadStorage/${detail.productDetailImage2 }">
					<p id="aa2"></p></div>
					</div>
					
						<td class="ac"><label>상품파일</label></td>
					<td >
					<div  style="margin-left: 35%;">
					<div style="width: 100px; height:100px; border: 1px solid #b7b4b4;"  id="fileImg">
					<img src="/manager/uploadStorage/${detail.productFile }">
					<p id="aa3"></p></div>
					</div>
			</tbody>
		</table>






	<div id="btn">
				<input type="button" value="목록" id="productListBtn"> 
				<input type="button" value="수정" id="productUpdateBtn"> 
				<input type="button" value="삭제" id="productDeleteBtn">
				</div>
	</div>
	</div>
	
</body>
</html>

