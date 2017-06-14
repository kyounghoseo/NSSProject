<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/*메인 상단로고*/
.main_logo {
	display: inline-block;
	width: 25%;
	vertical-align: middle;
}

/*우측 상단메뉴 로그인_회원가입_고객센터_장바구니*/
.top_right_nav {
	float: right; /*우측 상단으로 흐르게*/
}

/*메인메뉴*/
.menubar {
	border: none;
	border: 0px;
	margin: 0px;
	padding: 0px;
	font-size: 11px;
	font-weight: bold;
}

.menubar ul {
	background: rgb(109, 109, 109);
	height: 50px;
	list-style: none;
	margin: 0;
	padding: 0;
}

.menubar li {
	float: left;
	padding: 0px;
}

.menubar li a {
	background: rgb(109, 109, 109);
	color: white;
	display: block;
	font-weight: normal;
	line-height: 50px;
	margin: 0px;
	padding: 0px 25px;
	text-align: center;
	text-decoration: none;
}

.menubar li a:hover, .menubar ul li:hover a {
	background: rgb(71, 71, 71);
	color: #FFFFFF;
	text-decoration: none;
}

.menubar li ul {
	background: rgb(109, 109, 109);
	display: none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
	position: absolute;
	width: 200px;
	z-index: 200;
	/*top:1em;
/*left:0;*/
}

.menubar li:hover ul {
	display: block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}

.menubar li li {
	background: rgb(109, 109, 109);
	display: block;
	float: none;
	margin: 0px;
	padding: 0px;
	width: 200px;
}

.menubar li:hover li a {
	background: none;
}

.menubar li ul a {
	display: block;
	height: 50px;
	font-size: 12px;
	font-style: normal;
	margin: 0px;
	padding: 0px 10px 0px 15px;
	text-align: left;
}

.menubar li ul a:hover, .menubar li ul li:hover a {
	background: rgb(71, 71, 71);
	border: 0px;
	color: #ffffff;
	text-decoration: none;
}

.menubar p {
	clear: left;
}

/*메인메뉴 끝*/

/*상단 검색창*/
.nav_search {
	position: relative;
	width: 224px;
	float: right;
	padding: -40px 10px;
	margin: -16px;
	width: 224px;
}

/*상단 검색 끝*/
* /
	/*메인배너 css */              
.main_banner {
	width: 100%;
	height: 20%;
	position: absolute;
	visibility: hidden;
}
/*푸터 css*/
.footer {
	width: 1250px;
	margin: 0 auto;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
}

a {
	text-decoration: none
} /* a링크 밑줄 제거 */
.footer_top {
	text-decoration: none;
	width: 100%;
	height: 35px;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	border-bottom: 2px solid #000;
	border-bottom-width: 2px;
	border-bottom-style: solid;
	border-bottom-color: rgb(0, 0, 0);
}

.address span {
	padding: 0 25px 0 0;
	padding-top: 0px;
	padding-right: 25px;
	padding-bottom: 0px;
	padding-top: 0px;
	padding-right: 22px;
	padding-bottom: 0px;
	padding-left: 0;
}

.copyright {
	text-align: center;
}

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

#detailFile {
	margin-left: 18%;
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

.selectbox {
	position: relative;
	width: 150px; /* 너비설정 */
	border: 1px solid #999; /* 테두리 설정 */
	z-index: 1;
	/* focus 효과*/
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

/* focus 효과 */
.selectbox.focus {
	border-color: #66afe9;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6);
}

/* 가상 선택자를 활용 화살표 대체 */
.selectbox:before {
	content: "";
	position: absolute;
	top: 50%;
	right: 15px;
	width: 0;
	height: 0;
	margin-top: -1px;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	border-top: 5px solid #313131;
}

.selectbox label {
	position: absolute;
	top: 1px; /* 위치정렬 */
	left: 5px; /* 위치정렬 */
	padding: .5em .5em; /* select의 여백 크기 만큼 */
	color: #333;
	z-index: -1; /* IE8에서 label이 위치한 곳이 클릭되지 않는 것 해결 */
}

.selectbox select {
	width: 100%;
	height: auto; /* 높이 초기화 */
	line-height: normal; /* line-height 초기화 */
	font-family: inherit; /* 폰트 상속 */
	padding: .8em .5em; /* 여백과 높이 결정 */
	border: 0;
	opacity: 0; /* 숨기기 */
	filter: alpha(opacity = 0); /* IE8 숨기기 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
	cursor: pointer;
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

</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var selectTarget = $('.selectbox select');

		// focus 가 되었을 때와 focus 를 잃었을 때
		selectTarget.on({
			'focus' : function() {
				$(this).parent().addClass('focus');
			},
			'blur' : function() {
				$(this).parent().removeClass('focus');
			}
		});
		
		selectTarget.change(function() {
			var select_name = $(this).children('option:selected').text();
			$(this).siblings('label').text(select_name);
			$(this).parent().removeClass('focus');
		});
		
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
			
	
		/*$(‘#my_image’).on({ 
		    ‘click’: function(){ 
		        $(‘#my_image’).attr(‘src’,‘second.jpg’); 
		    } 
		}); */
	});

	function add() {
		var value = $("#count").text();
		$("#count").text(++value);
		setCount(value);
	}

	function subtract() {
		var value = $("#count").text();

		if (value == 1)
			return false;
		else
			$("#count").text(--value);

		setCount(value);
	}

	function setCount(cnt) {
		$("#cnt").val(cnt);
	}
	
/* 	function detailMain() {
		alert("디테일~~");
		/* var img = document.getElementById('mainImage');
		img.src= "/uploadStorage/${detail.productMainImage }";
		alert(img.src); 
	}
	function detailImg1() {
		alert("디테일1~~");
		var img = document.getElementById('mainImage');
		img.src= "/uploadStorage/${detail.productDetailImage1 }";
		
		alert(img.src);
	}
	function detailImg2() {
		alert("디테일2~~");
		var img = document.getElementById('mainImage');
		img.src= "/uploadStorage/${detail.productDetailImage2 }";
		alert(img.src);
	} */
</script>
</head>
<body>
	<header class="main_header" id="main_header">
		<div class="main_logo">
			<h1>
				<a href="#"><img src="../resources/images/logo.jpg" alt="NSS"></a>
			</h1>
			<!-- <h2 class="main_title">나이키 슈즈 샵</h2> -->
		</div>

		<div class="top_right_nav">
			<input type="button" value="목록" id="productListBtn"> <input
				type="button" value="수정" id="productUpdateBtn"> <input
				type="button" value="삭제" id="productDeleteBtn"> <a
				class="account_register" href="#">로그인/회원가입</a> <a
				class="customercenter" href="#">고객센터</a> <a class="cart" href="#"><img
				src="../resources/images/cart.jpg" width="25px" height="20px"
				alt="장바구니"></a>
		</div>

		<div class="nav_search">
			<div class="search_form_container">
				<form class="search_form" action="#" method="get" name="search"
					id="search">
					<p>
						<input type="text" name="keyword" id="keyword" title="검색어입력"
							placeholder="상품을 입력하세요" /> <input type="image"
							src="../resources/images/search_icon.jpg" width="20px"
							height="20px" alt="검색" />
					</p>
				</form>
			</div>
		</div>
		<!-- 상단 메뉴 시작 -->
		<div class="menubar">
			<ul>
				<h1>
					<li><a href="#">MEN</a>
						<ul>
							<li><a href="#">런닝</a></li>
							<li><a href="#">라이프 스타일</a></li>
							<li><a href="#">농구</a></li>
							<li><a href="#">축구</a></li>
						</ul></li>
				</h1>
				<h1>
					<li><a href="#" id="current">WOMEN</a>
						<ul>
							<li><a href="#">런닝</a></li>
							<li><a href="#">라이프 스타일</a></li>
						</ul></li>
				</h1>
			</ul>
		</div>
		<!-- 상단메뉴 끝 -->
	</header>
	<section id="sectionContainer">
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

						<li><h1>${detail.productName }</h1></li>
						<li><strong> ${detail.productCategory }</strong></li>
						<li><strong> ${detail.productPrice }원</strong></li>
						<hr>


						<li id="liColor">${detail.productColor }</li>
						<li id="liCode"><small>스타일-컬러</small> #${detail.productCode
							}-${color}</li>
						<li id="detailImg">
						<img id="detailMain"  src="/manager/uploadStorage/${detail.productMainImage }" >
						<img id="detailImg1" src="/manager/uploadStorage/${detail.productDetailImage1 }" >
						<img id="detailImg2" src="/manager/uploadStorage/${detail.productDetailImage2 }" >
						 </li>
				
						<br>
						<br>
						<br>
						<li class="selectbox" id="liSize"><label for="select">사이즈
								선택</label> <select id="select" name="orderSize">
								<option selected="selected">사이즈 선택</option>
								<option value="250">250</option>
								<option value="260">260</option>
								<option value="270">270</option>
								<option value="280">280</option>
								<option value="290">290</option>
								<option value="300">300</option>
						</select></li>

						<li id="liCount"><input type="button" value="-"
							onclick="subtract()">&nbsp;수량( <span id="count">1</span>
							)&nbsp; <input type="button" value="+" onclick="add()"> <input
							type="hidden" id="cnt" name="orderCount" value="1"></li>
					</ul>
					<div id="button">

						<input type="button" value="장바구니" id="cart" name="cart"> <input
							type="button" value="구매하기" id="buy" name="buy">




					</div>



				</div>
				<!-- 상품기본정보 div 끝 -->

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
	<div class="footer">
		<div class="footer_top">
			<span> <a href="#">홈</a></span> <span> <a href="#">회사소개</a></span> <span>
				<a href="#">이용약관</a>
			</span> <span> <a href="#">개인정보약관</a></span>
		</div>

		<p class="address">
			<span>상호명 : ㈜ NSS</span> <span>대표자 : 서경호</span> <span>사업자 등록
				번호 :123-45-31955</span> <span>통신판매업 신고 : 2017-서울성동-02398 </span> <span>고객센터
				: 070-123-4567</span><span>개인정보책임자:김인선</span><br> <span>주소 :
				서울특별시 성동구 무학로2길 54 신방빌딩 5층 7호 </span> <span>예금주 : ㈜ NSS </span> <span>미래은행
				: 12-345-6789-12</span>
		</p>
		<br> <br>
		<p class="copyright">
			Copyright &copy; 2017 <strong>㈜ NSS</strong> All Rights Reserved.
		</p>
	</div>
</body>
</html>