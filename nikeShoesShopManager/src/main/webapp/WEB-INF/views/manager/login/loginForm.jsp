<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:if test="${!empty sessionScope.managerid }">
 <script>
 location.href="/manager/order/orderList.do";
 </script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 입력화면</title>
<!-- 이 페이지가 로그인 안했을 때 모두가 보는 창 -->

  <!-- 부트스트랩 -->
<script src="../resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="../resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="../resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<!-- 부트스트랩 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	/* [로그인] 버튼 눌렀을때 처리 이벤트 */
	$(document).ready(function() {

		$("#loginInsert").click(function() {

			$("#loginForm").attr({
				"method" : "POST",
				"action" : "/manager/order/orderList.do" 
			});

			$("#loginForm").submit();
		});
		
		$("#home").click(function() {

			location.href = '/customer';
		});
	});
</script>
<style type="text/css">
#contents h1 {
    padding-left: 1%;
    font-size: 100%;
    }
.statusbox {
    margin-top: 10px;
    height: 1px;
    background: #777;
    border: 1px solid #777;
    text-align: center;
}
#contents {
    width: 60%;
    margin: 0 auto;
    padding: 71px 0 130px;
}
.location {
    padding: 8px 0 0 12px;
    font-size: 11px;
    color: #888;
}
.login-cont {
    overflow: hidden;
    width: 100%;
    margin-top: 20px;
    padding-bottom: 29px;
    border-bottom: 1px solid #b3b3b3;
}
.login-cont .login {
    width: 50%;
    margin-left: 25%;
}
.login-cont .login h2 {
    height: 32px;
    padding: 0 0 0 10px;
    border-bottom: 1px solid #ebebeb;
    }
.login-cont .login h2 span.title_login {
    overflow: hidden;
    display: block;
    width: 50%;
    height: 23px;
    font-family: -webkit-body;
    font-size: 20px;
}
.login-cont .login-input {
    position: relative;
    z-index: 1;
    margin-top: 15px;
    width: 100%;
    height: 110px;
}
.login-cont .login-input .user-input {
    position: absolute;
    top: 0;
    left: 8%;
    width: 100%;
}
.login-cont .login-input .user-input label {
    display: block;
    overflow: hidden;
    width: 100%;
    margin-bottom: 8px;
}
label {
    cursor: pointer;
}
.login-cont .login-input .user-input label .txt {
    float: left;
    width: 63px;
    padding-top: 11px;
}
.login-cont .login-input .user-input label .input {
    float: left;
    height: 31px;
    background: url(//pics.gmkt.kr/pc/ko/expire/challenge/neo_image/login_img/201112/input_off_right.gif) no-repeat 100% 0;
}
.login-cont .login-input .user-input label .input input {
    display: block;
    float: left;
    height: 31px;
    padding: 0 13px;
    background: url(//pics.gmkt.kr/pc/ko/expire/challenge/neo_image/login_img/201112/input_off_left.gif) no-repeat;
    border: 0;
    font-size: 12px;
    font-weight: bold;
    color: #0075d4;
    line-height: 31px;
}
.login-cont .login-input .user-input label {
    display: block;
    overflow: hidden;
    width: 100%;
    margin-bottom: 8px;
}
.login-cont .option {
    position: absolute;
    top: 84px;
    left: 80px;
    width: 263px;
    font-size: 11px;
    color: #888;
}
.login-cont .login-input .btn-login {
    position: absolute;
    top: 0;
    left: 66%;
    width: 96px;
}
.login-cont .option label {
    margin-left: 3px;
    letter-spacing: -1px;
    vertical-align: top;
}
.login-cont .login-input .btn-login a {
    display: inline-block;
    margin-bottom: 7px;
}
input {
    color: #676767;
    font-family: dotum,"돋움";
}
.login-cont .login .links {
    padding: 5% 4% 0 6%;
}
.login-cont .login .links .member {
    padding-left: 17%;
}
.login-cont .login .links .member a {
    display: inline-block;
    height: 13px;
    margin: 0;
    padding: 0 15px;
    border-right: 1px solid #999999;
    font-weight: bold;
}

.login-cont .login .links .member a.join {
    border: none;
    color: #0e6ad3;
}
a:link, a:visited, a:active {
    color: #676767;
    text-decoration: none;
}
.login-cont .login .links .member a:first-child {
    padding-left: 0;
}
.login-cont .banner {
    float: right;
    width: 47%;
    margin-top: 42px;
    border: 1px solid #f1f1f1;
}
.ad_bnr_wrap {
    position: relative;
}
.blind, legend {
    display: block;
    overflow: hidden;
    position: absolute;
    top: -999em;
    left: 0;
    font-size: 0;
    line-height: 0;
    text-indent: -999em;
}
.ad_bnr_wrap.type2 .ad_bnr_btn {
    top: 0;
    left: inherit !important;
    margin-left: 0;
}
.ad_bnr_wrap .ad_bnr_btn {
    position: absolute;
    right: 0;
    display: block;
    overflow: hidden;
    width: 22px;
    height: 22px;
    line-height: 100px;
    background: url(//pics.gmkt.kr/pc/ko/common/sprite_ico_ad.png) no-repeat;
}
.login-cont .login .txt1 {
    padding: 5% 0 0 22%;
    font-size: 11px;
    color: #444;
}
img { max-width: 100%; width: auto !important; height: auto: !important; }
input[type=button] {
	background-color: #6f6f6f;
	border: none;
	color: white;
	padding: 50% 85%;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	font-family: initial;
	cursor: pointer;
	font-weight: bold;
	border-radius: 5px;
}

</style>

</head>

<body>

<div id="contents">
<form id="loginForm"> 
	
	<h1><a href="/customer/home.do"><img src="/customer/resources/images/logo.jpg" alt="NSS" border="0"></a>
	</h1>
    <div class="statusbox"></div>
	<div class="location">
		<a href="/customer/home.do" style="color:#888888;">홈</a> &gt; <strong>관리자 로그인</strong>
	</div>
        <!--  로그인 영역과 광고 영역을 분리함 -->
        <div class="login-cont" id="loginArea">
    	    
           
        <div class="login">
		    <h2>
                <span id="title_member" class="title_login" style="display:block;">관리자 로그인</span>
            </h2>
		   
		    <!-- 회원일때의 로직 -->
			<div id="mem_login" style="display:block;" >
			    <!-- 회원여부선택 -->
				<!-- 회원로그인폼 -->
				<p class="txt1">로그인에 실패했습니다.<br><strong style="color: #0075d4;">아이디(ID)와 비밀번호</strong>를 <em style="color: red; ">확인</em>하고 다시 로그인해주세요.</p>
				
				<div class="login-input">
				    <div class="user-input">
				    
					    <label for="id" title="회원 아이디 입력">
						    <span class="txt"><img src="/customer/resources/images/id.gif" alt="아이디"></span>
						    <span id="id_span" class="input"><input type="text" id="loginManagerID"
						name="loginManagerID"  value="" maxlength="10" style="width:174px;"></span>
						</label>
					    <label for="pwd" title="비밀번호 입력">
						    <span class="txt"><img src="/customer/resources/images/pw.gif" alt="비밀번호"></span>
					    	<span id="password_span" class="input"><input type="password" id="loginManagerPW"
						name="loginManagerPW"  value="" maxlength="15" style="width:174px;"></span>
					    </label>
					    
					</div>
				   
					<div class="btn-login">
					    <a><input type="button" id="loginInsert" alt="LOGIN" title="로그인" value="LOGIN"></a>
					</div>
				</div>
				<!-- 회원로그인폼 -->
				<div class="links">
                    <p class="member"><a id="goFindID" href="/customer/login/login.do">회원 로그인</a><a id="goDefault" href="/customer/home.do" class="join">홈으로</a></p>
				</div>
			</div><!--//.mem_login-->
			<!-- //회원일때의 로직 -->
   
	    </div><!--//.login -->
        <!--div class="banner"-->
		<!--/div--><!--//.banner-->
    <!--/div--><!--//.login-cont -->
            <div class="banner">

		    </div><!--//.banner-->
        </div><!--//.login-cont -->
</form>
</div>
	

	
	<!-- 로그인/회원가입/아이디&비밀번호찾기/상품목록/상세페이지 삽입 -->
	<!-- <form id="loginForm">
		<p>로그인</p>
		<table>
			<tbody>
				<tr>
					<td><input type="text" id="loginManagerID"
						name="loginManagerID" placeholder="아이디"></td>
				</tr>

				<tr>
					<td><input type="password" id="loginManagerPW"
						name="loginManagerPW" placeholder="비밀번호"></td>
				</tr>

				<tr>
					<td><input type="button" value="로그인" name="loginInsert"
						id="loginInsert"></td>
						<td><input type="button" value="홈" name="home"
						id="home"></td>
						
				</tr>
			</tbody>
		</table>
	</form> -->

	




</body>
</html>