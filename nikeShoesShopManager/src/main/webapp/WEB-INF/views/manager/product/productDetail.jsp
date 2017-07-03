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

<style type="text/css">

#sectionContainer {
	width: 100%;
}

#productImage {
	float: left;
	width: 40%;
	margin-left: 5%
}

#mainImage {
	width: 100%;
}

#detailImage {
	clear: both;
}

#product {
	float: left;
	width: 50%;
	height: 50%;
	margin-top: 5%;
	margin-left: 5%;
}

.productData {
	height: 100%;
}

#product ul li {
	list-style: none;
	margin-top: 3%;
}

#liCode {
	float: right;
	margin-right: 20%;
}

#liColor {
	float: left;
}



#button {
	margin-top: 15%;
	margin-left: 3%;
}

#button input {
	margin-left: 2%;
}

#liCount {
	float: right;
	margin-right: 20%;
	padding-top: 1%;
}

#liCount input {
	outline: none;
	background-color: white;
	border: none;
	cursor: pointer;
	font-size: 12px;
}

#liSize {
	float: left;
}



#button input {
	background-color: #555555; /* Black */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

input#buy {
	background-color: red;
}
#detailImg{
clear: both;
}
#detailMain, #detailImg1, #detailImg2{
width: 15%;
cursor: pointer;

}
div#product{
text-align: left;
}

</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		
		$("#productUpdateBtn").click(function() {

			$("#updateForm").attr("method", "POST");
			$("#updateForm").attr("action", "/manager/product/updateForm.do");
			$("#updateForm").submit();
		});

		$("#productListBtn").click(function() {
			location.href = "/manager/product/productList.do";

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
		
	 	$("#detailMain").on({
	 		"click" : function() {
	 			$("#mainImage").attr("src","/manager/uploadStorage/${detail.productMainImage }");
				
			}
	 		
	 		
	 	});
	 	$("#detailImg1").on({
	 		"click" : function() {
	 			$("#mainImage").attr("src","/manager/uploadStorage/${detail.productDetailImage1 }");
				
			}
	 
	 	});
	 	$("#detailImg2").on({
	 		"click" : function() {
	 			$("#mainImage").attr("src","/manager/uploadStorage/${detail.productDetailImage2 }");
				
			}
	 		
	 		
	 	});
			

	});

	
	

</script>
</head>
<body>
	<!-- 상단 헤더 -->
	<%@ include file="../header.jsp"%>
	<section id="sectionContainer">
	<h1>상품 상세정보 페이지</h1>
		<form name="updateForm" id="updateForm">
			<input type="hidden" value="${detail.productNo }" id="productNo"
				name="productNo">

		</form>

		<article>
			<div>
				<!-- 상품이미지 , 기본정보 상단 전체 div -->

				<div id="productImage">
					<!-- 상품이미지  -->

					<img id="mainImage"
						src="/manager/uploadStorage/${detail.productMainImage }">


				</div>
				<!-- 상품이미지  끝-->

				<div id="product">
					<!-- 상품기본정보 div  -->
					<ul>

						<li><h1>상품명 : ${detail.productName }</h1></li>
						<li><strong>상품분류 : ${detail.productCategory }</strong></li>
						<li><strong>상품가격 : <fmt:formatNumber value="${detail.productPrice }" pattern="\#,###.##"/>원</strong></li>
						<hr>


						<li id="liColor">상품색상 : ${detail.productColor }</li>
						<li id="liCode">상품번호 : #${detail.productCode}</li>
						<li id="detailImg">
						<img id="detailMain"  src="/manager/uploadStorage/${detail.productMainImage }" >
						<img id="detailImg1" src="/manager/uploadStorage/${detail.productDetailImage1 }" >
						<img id="detailImg2" src="/manager/uploadStorage/${detail.productDetailImage2 }" >
						 </li>
				
				

						
					</ul>
				



				</div>
				<!-- 상품기본정보 div 끝 -->
				<div id="btn">
				<input type="button" value="목록" id="productListBtn"> 
				<input type="button" value="수정" id="productUpdateBtn"> 
				<input type="button" value="삭제" id="productDeleteBtn">
				</div>
			</div>
			<!-- 상품이미지 , 기본정보 상단 전체 div 끝-->
		</article>

		<article id="detailImage">
			<div>
				<h3>상품 정보</h3>
				<p>${detail.productInfo }</p>
				<h3>상세이미지</h3>
				<img id="detailFile" src="/manager/uploadStorage/${detail.productFile }">
			</div>



		</article>



	</section>
	
</body>
</html>