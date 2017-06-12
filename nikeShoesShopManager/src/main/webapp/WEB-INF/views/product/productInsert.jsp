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

		$("#productInsertBtn").click(function() {

			$("#f_productForm").attr("method", "POST");
			$("#f_productForm").attr("action", "/product/productInsert.do");
			$("#f_productForm").submit();
		});

		$("#productListBtn").click(function() {
			location.href = "/product/productList.do";

		});
	});
</script>
</head>
<body>
<!-- 	<form id="f_productForm" name="f_productForm" >
		<p>
			<label>상품명 :</label><input type="text" id="productName"
				name="productName" />
		</p>
		<p>
			<label>상품분류 :</label><input type="text" id="productCategory"
				name="productCategory" />
		</p>
		<p>
			<label>상품코드 :</label><input type="text" id="productCode"
				name="productCode" />
		</p>
		<p>
			<label>상품가격 :</label><input type="text" id="productPrice"
				name="productPrice" />
		</p>
		<p>
			<label>상품색상 :</label><input type="text" id="productColor"
				name="productColor" />
		</p>
		<p>
			<label>상품이미지 :</label><input type="text" id="productMainImage"
				name="productMainImage" />
		</p>
		<p>
			<label>상품상세이미지1 :</label><input type="text" id="productDetailImage1"
				name="productDetailImage1" />
		</p>
		<p>
			<label>상품상제이미지2 :</label><input type="text" id="productDetailImage2"
				name="productDetailImage2" />
		</p>
		<p>
			<label>상품정보 :</label><input type="text" id="productInfo"
				name="productInfo" />
		</p>
		<p>
			<label>상품파일 :</label><input type="text" id="productFile" name="productFile" />
		</p>

	</form>  -->
	<form id="f_productForm" name="f_productForm" enctype="multipart/form-data">
		<table style="height: 451px;" width="100%" border="1">

			<colgroup>
				<col width="17%" />
				<col width="82%" />
			</colgroup>
			<tbody>
				<tr>
					<td>상품명</td>
					<td><input type="text" id="productName" name="productName" /></td>
				</tr>
				<tr>
					<td>상품분류</td>
					<td><input type="text" id="productCategory"
						name="productCategory" /></td>
				</tr>
				<tr>
					<td>상품코드</td>
					<td><input type="text" id="productCode" name="productCode" /></td>
				</tr>
				<tr>
					<td>상품가격</td>
					<td><input type="text" id="productPrice" name="productPrice" /></td>
				</tr>
				<tr>
					<td>상품색상</td>
					<td><input type="text" id="productColor" name="productColor" /></td>
				</tr>
				<tr>
					<td>상품이미지</td>
					<td><input type="file" id="mainImage" name="mainImage" /></td>
				</tr>
				<tr>
					<td>상품상세이미지1</td>
					<td><input type="file" id="detailImage1" name="detailImage1" /></td>
				</tr>
				<tr>
					<td>상품상세이미지2</td>
					<td><input type="file" id="detailImage2" name="detailImage2" /></td>
				</tr>
				<tr>
					<td>상품파일</td>
					<td><input type="file" id="file" name="file" /></td>
				</tr>
				<tr>
					<td>상품정보</td>
					<td><input type="text" id="productInfo" name="productInfo" /></td>
				</tr>
			</tbody>
		</table>





	</form>

	<div>
		<input type="button" value="등록" class="but" id="productInsertBtn">
		<input type="button" value="목록" class="but" id="productListBtn">

	</div>
</body>
</html>