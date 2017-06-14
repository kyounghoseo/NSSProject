<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#productUpdateBtn").click(function() {

			$("#f_productForm").attr("method", "POST");
			$("#f_productForm").attr("action", "/manager/product/productUpdate.do");
			$("#f_productForm").submit();
		});

		$("#productListBtn").click(function() {
			location.href = "/manager/product/productList.do";

		});
		
		
	});
</script>
</head>
<body>
	<form id="f_productForm" name="f_productForm" enctype="multipart/form-data">
	<input type="hidden" name="productNo" id="productNo" value="${updateData.productNo }">
	<input type="hidden" name="productMainImage" id="productMainImage" value="${updateData.productMainImage }" >
	<input type="hidden" name="productDetailImage1" id="productDetailImage1" value="${updateData.productDetailImage1 }" >
	<input type="hidden" name="productDetailImage2" id="productDetailImage2" value="${updateData.productDetailImage2 }" >
	<input type="hidden" name="productFile" id="productFile" value="${updateData.productFile }" >
	
		<p>
			<label>상품명 :</label><input type="text" id="productName"
				name="productName" value="${updateData.productName }" />
		</p>
		<p>
			<label>상품분류 :</label><input type="text" id="productCategory"
				name="productCategory" value="${updateData.productCategory }" />
		</p>
		<p>
			<label>상품코드 :</label><input type="text" id="productCode"
				name="productCode" value="${updateData.productCode }" />
		</p>
		<p>
			<label>상품가격 :</label><input type="text" id="productPrice"
				name="productPrice" value="${updateData.productPrice }" />
		</p>
		<p>
			<label>상품색상 :</label><input type="text" id="productColor"
				name="productColor" value="${updateData.productColor }" />
		</p>
		<p>
			<label>상품이미지 :</label><input type="file" id="mainImage"
				name="mainImage"  /><small><label>기존 이미지 파일명 : ${updateData.productMainImage }</label></small>
		</p>
		<p>
			<label>상품상세이미지1 :</label><input type="file" id="detailImage1"
				name="detailImage1"  /><small><label>기존 이미지 파일명 : ${updateData.productDetailImage1 }</label></small>
		</p>
		<p>
			<label>상품상제이미지2 :</label><input type="file" id="detailImage2"
				name="detailImage2" /><small><label>기존 이미지 파일명 : ${updateData.productDetailImage2 }</label></small>
		</p>
		<p>
			<label>상품정보 :</label><input type="text" id="productInfo"
				name="productInfo" value="${updateData.productInfo }" />
		</p>
		<p>
			<label>상품파일 :</label><input type="file" id="file"
				name="file" /><small><label>기존 이미지 파일명 : ${updateData.productFile }</label></small>
		</p>

	</form>

	<div>
		<input type="button" value="수정" class="but" id="productUpdateBtn">
		<input type="button" value="목록" class="but" id="productListBtn">

	</div>
</body>
</html>