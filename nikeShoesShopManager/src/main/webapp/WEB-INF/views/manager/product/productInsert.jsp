<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="/manager/resources/include/js/common.js"></script>
<!-- 부트스트랩 -->
 <script src="../resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="../resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="../resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" /> 
<!-- 부트스트랩 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#productInsertBtn").click(function() {
			if(!chkSubmit($('#productName'),"상품명을"))
				return;
			else if(!chkCategory($('#productCategory'),"상품 분류를"))
				return;
			else if(!chkSubmit($('#productCode'),"상품 코드를"))
				return;
			else if(!chkSubmit($('#productPrice'),"상품 가격을"))
				return;
			else if(!chkSubmit($('#productColor'),"상품 색상을"))
				return;
			else if(!chkSubmit($('#productInfo'),"상품 정보를"))
				return;
			else{
			$("#f_productForm").attr("method", "POST");
			$("#f_productForm").attr("action", "/manager/product/productInsert.do");
			$("#f_productForm").submit();
			 } 
		});

		$("#productListBtn").click(function() {
			location.href = "/manager/product/productList.do";

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
</style>
</head>
<body>
<!-- 상단 헤더 -->
	<%@ include file="../header.jsp"%>
	<div id="wrap">
		<div id="title">
	
	<h2>상품등록</h2>

	
	</div>
	<div id="d_productForm" style="margin-top: 2%;" >
	<form id="f_productForm" name="f_productForm" enctype="multipart/form-data">
		<table class="table table-bordered" style="height: 200px;" width="100%" border="1">

			
			<tbody>
				<tr>
					<td  class="ac"><label>상품명</label></td>
					<td ><input type="text" id="productName" name="productName" /></td>
					<td  class="ac"><label>상품분류</label></td>
							<td ><select name="productCategory" id="productCategory" style="float: left;">
									<option>- 카테고리선택 -</option>
									
									<option value="런닝화M">런닝화M</option>
									<option value="농구화M">농구화M</option>
									<option value="축구화M">축구화M</option>
									<option value="라이프스타일M">라이프스타일M</option>
									<option value="런닝화W">런닝화W</option>
									<option value="라이프스타일M">라이프스타일W</option>
							
									
							</select></td>
				</tr>
						
			
				<tr>
					<td class="ac"><label>상품코드</label></td>
					<td ><input type="text" id="productCode" name="productCode" /></td>
					<td class="ac"><label>상품가격</label></td>
					<td ><input type="text" id="productPrice" name="productPrice" /></td>
				</tr>
				
				<tr>
					<td  class="ac"><label>상품색상</label></td>
					<td ><input type="text" id="productColor" name="productColor" /></td>
						<td  class="ac"><label>상품정보</label></td>
					<td ><input type="text" id="productInfo" name="productInfo" /></td>
					
				</tr>
				<tr class="tr_img">
				<td class="ac"><label>상품이미지</label></td>
					<td>
					<div style="float: left;">
					<div style="width: 100px; height:100px; border: 1px solid #b7b4b4;"  id="mainImg">
					<p id="aa"></p></div>
					</div>
					<input type="file" class="mainImage" id="mainImage" name="mainImage" /></td>
					<td class="ac"><label>상품상세이미지1</label></td>
					<td >
					<div style="float: left;">
					<div style="width: 100px; height:100px; border: 1px solid #b7b4b4;"  id="detailImg1">
					<p id="aa1"></p></div>
					</div>
					<input type="file" class="detailImage1" id="detailImage1" name="detailImage1" /></td>
					
			</tr>
				<tr class="tr_img"><td class="ac"><label>상품상세이미지2</label></td>
					<td >
					<div style="float: left;">
					<div style="width: 100px; height:100px; border: 1px solid #b7b4b4;"  id="detailImg2">
					<p id="aa2"></p></div>
					</div>
					
					<input type="file" class="detailImage2" id="detailImage2" name="detailImage2" /></td>
						<td class="ac"><label>상품파일</label></td>
					<td >
					<div style="float: left;">
					<div style="width: 100px; height:100px; border: 1px solid #b7b4b4;"  id="fileImg">
					<p id="aa3"></p></div>
					</div>
					<input type="file" class="file" id="file" name="file" /></td></tr>
			</tbody>
		</table>





	</form>
	</div>

	<div id="btnForm">
		<input type="button" value="등록" class="but" id="productInsertBtn">
		<input type="button" value="목록" class="but" id="productListBtn">

	</div>
	</div>
</body>

<script>
var upload = document.getElementsByClassName('mainImage')[0],
    holder = document.getElementById('mainImg'),
    state = document.getElementById('aa');
    
var upload1 = document.getElementsByClassName('detailImage1')[0],
	holder1 = document.getElementById('detailImg1'),
	state1 = document.getElementById('aa1');

var upload2 = document.getElementsByClassName('detailImage2')[0],
	holder2 = document.getElementById('detailImg2'),
	state2 = document.getElementById('aa2');

var upload3 = document.getElementsByClassName('file')[0],
	holder3 = document.getElementById('fileImg'),
	state3 = document.getElementById('aa3');


if (typeof window.FileReader === 'undefined') {
  state.className = 'fail';
} else {
  state.className = '';
  state.innerHTML = '';
}
 
upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    // note: no onload required since we've got the dataurl...I think! :)
    if (img.width > 560) { // holder width
      img.width = 560;
    }
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};



if (typeof window.FileReader === 'undefined') {
  state1.className = 'fail';
} else {
  state1.className = '';
  state1.innerHTML = '';
}
 
upload1.onchange = function (e) {
  e.preventDefault();

  var file = upload1.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    // note: no onload required since we've got the dataurl...I think! :)
    if (img.width > 560) { // holder width
      img.width = 560;
    }
    holder1.innerHTML = '';
    holder1.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};



if (typeof window.FileReader === 'undefined') {
  state2.className = 'fail';
} else {
  state2.className = '';
  state2.innerHTML = '';
}
 
upload2.onchange = function (e) {
  e.preventDefault();

  var file = upload2.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    // note: no onload required since we've got the dataurl...I think! :)
    if (img.width > 560) { // holder width
      img.width = 560;
    }
    holder2.innerHTML = '';
    holder2.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};



if (typeof window.FileReader === 'undefined') {
  state3.className = 'fail';
} else {
  state3.className = '';
  state3.innerHTML = '';
}
 
upload3.onchange = function (e) {
  e.preventDefault();

  var file = upload3.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    // note: no onload required since we've got the dataurl...I think! :)
    if (img.width > 560) { // holder width
      img.width = 560;
    }
    holder3.innerHTML = '';
    holder3.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};

</script>
</html>