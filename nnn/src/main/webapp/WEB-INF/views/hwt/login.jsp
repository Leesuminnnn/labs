<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("replaceChar","\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hwt/demofootercss.css?ver=0307">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hwt/demologincss.css?ver=0307">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hwt/alertcss.css?ver=0307">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hwt/loginmediacss.css?ver=0307">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="icon" sizes="192x192" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<title>코어솔루션 전자문서 시스템</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<style>
section {
	padding:0px 45px;
	overflow:hidden; 
}
.text-wrap {
	position: relative;
	display: flex;
	padding-top: 100px;
}
.loginWrap {
	background:linear-gradient(to right, rgba(26, 44, 66, 1) 0%, rgba(29, 57, 93, 1) 100%);
	border-radius:30px;
	box-shadow:2px 2px 20px rgba(0,0,0,0.1);
	position:relative;
}
.loginWrap .loginBox {
	padding:30px 0 50px 0;
	margin-top:30px;
}
.logo-area{
	position:absolute; 
	display:block;
}
.login-area{
	padding-top:0;
}

/* 모바일 출력 */
@media screen and (max-width: 780px){
	.content{padding: 0px 80px;}
}
@media screen and (max-width: 600px){
	.content{padding: 0px 60px;}
	.login-btn > button {width:100%;}
	.logo-area {bottom:18px !important;}
	.input-text {height:50px;}
	.loginWrap .loginBox {padding: 0px 0 20px 0;}
	.login-header {padding: 12px 0 15px 0;}
	.header-text {font-size:3.5rem;}
}
@media screen and (max-width: 525px){
	.logo-area img {width: 120px;}
}
@media screen and (max-width: 450px){
	.content{padding: 0px 45px;}
	.logo-area {bottom:10px !important;}
	.logo-area img {width: 110px;}
}
@media screen and (max-width: 390px){
	.content{padding: 0px 30px;}
}
</style>

</head>
<body>
<form action="${pageContext.request.contextPath}/hwt/loginAction" method="post" id="login_form">
	<section>
		<div class="loginWrap">
			<div class="login-header">
				<h1 class="header-text">LOGIN</h1>
			</div>
			<div class="loginBox">
				<div class="login-area">
					<div class="login-content">
						<div class="container">
							<div class="content">
								<div class="id-area">
									<input class="input-text id" type="text" name="id" id="id" placeholder="사번" title="사번입력" autofocus="autofocus">
								</div>
								<div class="pwd-area">
									<input class="input-text pwd" type="password" name="pwd" id="pwd" placeholder="비밀번호" title="비밀번호입력" value="">
								</div>
								<div class="login-btn">
									<button type="button" id="loginbtn" style="">로그인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<img src="${pageContext.request.contextPath}/resources/icon/hwt/login_bg_bottom.png" style="width:100%; border-radius: 0 0px 30px 30px; display:block;"/>
			<div class="logo-area" style="bottom: 25px;left:50%;transform: translateX(-50%);">
				<img src="${pageContext.request.contextPath}/resources/img/core_logo.png">
			</div>
		</div>
	</section>
	
	<div class="modal normal">
		<div class="modal_body">
			<div>
				<img class="menu_icon" src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png">
				<div class="menu_msg">text</div>
				<div class="modal_footer">
					<div class="btn modal_btn" onclick="closePopup()">
						확인
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal2 normal">
		<div class="modal_body2">
			<div>
				<img class="menu_icon" src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png">
				<div class="menu_msg2">text</div>
				<div class="modal_footer2">
					<div class="btn modal_btn2" onclick="closePopup2()">
						확인
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal3 normal">
		<div class="modal_body3">
			<div>
				<img class="menu_icon" src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png">
				<div class="menu_msg3">text</div>
				<div class="modal_footer3">
					<div class="btn modal_btn2" onclick="modal_insert()">
						확인
					</div>
					<div class="btn pink_btn2" onclick="closePopup3()">
						취소
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal4 normal">
		<div class="modal_body4">
			<div>
				<img class="menu_icon" src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png">
				<div class="menu_msg4">text</div>
				<div class="modal_footer4">
					<div class="btn modal_btn2" onclick="modal_insert()">
						확인
					</div>
					<div class="btn pink_btn2" onclick="closePopup4()">
						취소
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</form>
</body>
<script>
let query = window.location.search;
console.log(query);
let param = new URLSearchParams(query);
console.log(param);
console.log(param.get('chk_no'));
if (param.get('chk_no') === 'checked') {

	$('#chk_no').prop('checked', true);
	$('#pwd').attr("placeholder", "비밀번호");
	$('#pwd').attr("type", "password");
	$('#pwd').attr("title", "비밀번호입력");
	$('#pwd').attr("name", "pwd");
	$('#pwd').attr("class", "input-text pwd");
};


var namechk = $('#chk_name').prop("checked");
var nochk = $('#chk_no').prop("checked");
const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const msg = document.querySelector('.menu_msg');
const icon = document.querySelector('.menu_icon');
const btn = document.querySelector('.btn');
const modal3 = document.querySelector('.modal3');
const msg3 = document.querySelector('.menu_msg3');
var idx = "";
// console.log(namechk);
// console.log(nochk);
var dbpwdok = "${dbpwdOk}"; 
$(document).ready(function () {
	
	$('#chk_name').click(function (){
		$('#pwd').attr("placeholder", "이름");
		$('#pwd').attr("type", "text");
		$('#pwd').attr("title", "이름입력");
		$('#pwd').attr("name", "name");
		$('#pwd').attr("class", "input-text name");
		console.log("1");
	});
	$('#chk_no').click(function () {
		$('#pwd').attr("placeholder", "비밀번호");
		$('#pwd').attr("type", "password");
		$('#pwd').attr("title", "비밀번호입력");
		$('#pwd').attr("name", "pwd");
		$('#pwd').attr("class", "input-text pwd");
		console.log("2");
	});
	
// 	console.log(dbpwdok);
});

$("#manual").click(function(){
	var url = "https://docs.google.com/presentation/d/e/2PACX-1vSpjrgtqmbGU1w_ZaCkBMbIYB_t-CEOWK10c6muP81HiYiAbFMnymGslgVhu5e36WZ62n3GpCX6hR9A/pub?start=false&loop=false&delayms=3000";
	window.open(url);
})

$("#loginbtn").click(function (){
	var InputId = $(".id").val();
	var InputPwd = $(".pwd").val();
	var InputName = $(".name").val();
	var link = "${pageContext.request.contextPath}/hwt/CounselList"
	console.log("pwd : "+InputPwd);
	console.log("name : "+InputName);
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/hwt/loginAction',
		datatype : 'json',
		data : {
			"id" : InputId,
			"pwd" : InputPwd,
			"name" : InputName,
		},
		success : function(response) {
			var res = response.result;
			
			if (res === "0") {
				// DB에 정보 없음
				modal.classList.toggle('show');
				msg.innerHTML = '<p>사번과 비밀번호를 확인해주세요.</p>'

				console.log(0);
			} else if (res === "1") {
				// 비밀번호 불일치
				modal.classList.toggle('show');
				msg.innerHTML = '<p>비밀번호가 일치하지 않습니다.</p>'
				$(".pwd").val("");
				$(".btn").attr("onclick", "reset()");
				console.log(1);
			} else if (res === "5") {
				// 아이디와 이름으로 로그인 성공 후 비밀번호가 설정되어 있지 않는 경우
				idx = response.idx;
				modal.classList.toggle('show');
				msg.innerHTML = '<p>현재 비밀번호가 설정되어 있지 않습니다.</p><p>비밀번호 설정 페이지로 이동합니다.</p>';
				$(".btn").attr("onclick", "pwdlink()");
				console.log(5);
			} else if (res === "2") {
				// DB에 비밀번호가 있는데 이름으로 로그인 한 경우
				modal.classList.toggle('show');
				msg.innerHTML = '<p>현재 비밀번호가 설정되어 있습니다.</p><p>비밀번호로 로그인을 해주세요.</p>'

				console.log(2);
			} else if (res === "4") {
				// 로그인 성공
				idx = response.idx;
				sub = response.subname;
				if (idx == 635) {
					location.href = "${pageContext.request.contextPath}/hwt/admin";
				} else if (sub == '원무부' ) {
					location.href = "${pageContext.request.contextPath}/hwt/CounselList";
				} else if (sub == '원무과') {
					location.href = "${pageContext.request.contextPath}/hwt/CounselList";
				} else {
					modal.classList.toggle('show');
					msg.innerHTML = '<p>권한이 없습니다. 관리자에게 문의하세요.</p>'

					console.log(2);
				}
				
				console.log(4);
			} else if (res === "3") {
				// 이름이 일치하지 않는 경우
				modal.classList.toggle('show');
				icon.style.top = '20%';
			 	msg.style.top = '33%';
			 	btn.style.top = '50%';
				msg.innerHTML = '<p>이름이 일치하지 않습니다.</p>'

				console.log(3);
				
			}
			
		},
		error : function(error) {
			console.error('Error fetching data :' ,error);
			modal.classList.toggle('show');
		 	msg.style.top = '30%';
			msg.innerHTML = '<p>로그인 처리 중 오류가 발생했습니다.</p><p>다시 시도해주세요.</p>';

		}
	});
	
});

function closePopup(){
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}
function closePopup2(){
	modal2.classList.toggle('show');
	if (!modal2.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}
function pwdlink() {
	var link = "${pageContext.request.contextPath}/hwt/Pwd/"+idx;
	location.href = link;
}
function reset() {
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
	$("#pwd").focus();
}
// 엔터키로 로그인 구현
$('#id').on('keypress', function (e) {
	if (e.keyCode === 13) {
		$('#loginbtn').click();
	}
});
$('#pwd').on('keypress', function (e) {
	if (e.keyCode === 13) {
		$('#loginbtn').click();
	}
});

</script>
</html>