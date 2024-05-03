<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demofootercss.css?ver=0222">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demologincss.css?ver=0222">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css?ver=0222">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/loginmediacss.css?ver=0222">
<title>코어솔루션 인사평가 시스템</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="icon" sizes="192x192" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
<form action="${pageContext.request.contextPath}/e/loginAction" method="post" id="login_form">
	<section>
	<div class="text-wrap">
			<div class="text-img">
				<img class="pc-img" src="${pageContext.request.contextPath}/resources/icon/ev/login_bg2.png">
				<img class="mob-img" src="${pageContext.request.contextPath}/resources/icon/ev/login_bg_m_3.png">
			</div>
			<div class="main">
				
				<div class="login-header">
					<span class="header-text">코어솔루션 인사평가 시스템</span>
				</div>
				<div class="login-area">
					<div class="login-content">
						<div class="container">
							<div class="content">
								<div class="login-header-top">
									<span>Login</span>
								</div>
								<div class="id-area">
									<input class="input-text id" type="text" name="id" id="id" placeholder="사번" title="사번입력" autofocus="autofocus">
								</div>
								<div class="pwd-area">
									<input class="input-text pwd" type="password" name="pwd" id="pwd" placeholder="비밀번호" title="비밀번호입력" value="">
								</div>
								<div class="login-text">
									<span class="bold" style="">개인 비밀번호를 설정 하신 후 로그인 시 아래의 사번/비밀번호 체크 후 사번과 비밀번호를 입력부탁드립니다.</span>
								</div>
								<div class="chk-area" style="">
									<label class="label label-name">
										<span class="alignBox">
											<input class="radio" type="radio" id="chk_name" name="radio"  />
											<span class="radioimg"></span>
											<span class="inputTxt normal">사번 / 이름 <span class="bold">(비밀번호 설정 전)</span></span>
										</span>
									</label>
									<label class="label label-pwd">
										<span class="alignBox">
											<input type="radio" class="radio" id="chk_no" name="radio" checked/>
											<span class="radioimg"></span>
											<span class="inputTxt normal">사번 / 비밀번호 <span class="bold">(비밀번호 설정 후)</span></span>
										</span>
									</label>
								</div>
								<!-- <div style="text-align: left; font-size: 10pt; color: #000000; margin-bottom: 26px; font-size: 1.4rem;">
									
								</div> -->
								<div class="pw-find">
									<span class="bold" onclick="location.href='${pageContext.request.contextPath}/e/Findpwd'">비밀번호 찾기 ></span>
								</div>
								<div class="login-btn">
									<button type="button" id="loginbtn" style="">로그인</button>
								</div>
							</div>
						</div>
					</div>
					<div class="center-line"></div>
					<div class="notice-content">
						<div class="container">
							<div class="content content2">
								<div class="notice-header-top">
									<span>Notice</span>
								</div>
								<div class="notice-bg">
									<img src="${pageContext.request.contextPath}/resources/icon/ev/memo.png">
								</div>
									<div class="notice-main">
										<div class="notice-header bold">
											<span>인사평가 일정을 확인해 주시기바랍니다.</span>
										</div>
										<div class="notice-text normal">
											<div>
												<div>
													<c:forEach items="${notice }" var="n">
													<div class="notice-inner">
														<div class="inner-text" style='display:<c:if test="${empty n.d3 }">block; width:100%; align-items: center;</c:if>'>
															<c:if test="${not empty n.d2}"><img src="${pageContext.request.contextPath}/resources/icon/ev/dotted.png" style='<c:if test="${not empty n.d3 }">line-heigh: 12px; margin: 0 9px 0 4px;</c:if>'></c:if>
															<span >${n.d2}</span>
														</div>
														<c:if test="${not empty n.d3 }">
															<div style="white-space:pre;"><span class="inner-span" style='<c:if test="${not empty n.d3}">margin:0</c:if>'>${n.d3 }</span></div>
														</c:if>
													</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								<div class="notice-btn">
									<div class="manual" id="manual" style="">인사평가 시스템 메뉴얼 보기</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="logo-area">
					<img src="${pageContext.request.contextPath}/resources/img/core_logo.png">
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
	<%-- 	
	<div class="login">
		<h2>2023 효사랑 & 가족사랑<br>직원근무평가</h2>
		<ul>
			<li><input type="text" name="id" id="id" placeholder="사번" title="사번입력"></li>
			<li><input type="password" name="pwd" id="pwd" placeholder="비밀번호" title="비밀번호입력"></li>
			<li style="color: red; font-size:12px;"><b>※ 개인 비밀번호를 설정 하신 후 로그인시 아래의 사번/비밀번호 체크후 사번과 비밀번호를 입력부탁드립니다.</b></li>
			<li style="display: flex; flex-wrap: wrap;"><input type="radio" name="radio" id="chk_name" >
				<input type="radio" name="radio" id="chk_no" checked><label style="cursor:pointer;" for="chk_no">사번/비밀번호<b style="color: red">(비밀번호 설정 후)</b></label>
			</li>
			<li><button>로그인</button></li>
			<li style="text-align: center;" onclick="location.href='${pageContext.request.contextPath}/e/Findpwd'"><p style="cursor:pointer; color: #000099; "><b style="border-bottom: 1px solid;">비밀번호를 잊으셨나요?</b></p></li>			
		</ul>
		<div style="display: none;">
			<ul>
				<li>회원가입</li>
			</ul>
		</div>
	</div>
	<div class="notice" style="">
		<p style="font-size: 18px;"><b>공지사항</b><p>
		<div class="area">
			<table style="width:100%; font-weight: bold">
			<c:forEach items="${notice}" var="n">
				<tr>
					<td <c:if test="${n.idx eq '1' }">colspan="2"</c:if>  style="<c:if test="${n.idx eq '1' }">color:red; font-size:15px; font-weight: bolder;</c:if>">
						${n.d2 }
					</td>
					<td style="<c:if test="${n.idx eq '3' or n.idx eq '12'}">color:red;</c:if>">
						${n.d3 }
					</td>
				</tr>
			</c:forEach>
			</table>
		</div>
		<div id="manual">근무평가 시스템 메뉴얼 보기</div>
		<p style="font-size: 18px;"><b>문의사항</b></p>
		<div style="color:blue;">
		<p>코어솔루션 유지명 팀장 063-250-4503
		<p>코어솔루션 이수민 사원 063-250-4505
		<p>비상연락처 (유지명) 010-9257-8497
		<p style="font-size:12px;">※ 문자로 내용(소속,부서,사원명 포함) 남겨주시면 확인 후 바로 조치하도록 하겠습니다.
		</div>
	</div>
	<div class="footer">
		<div class="nav">
			<img style="height: 35px;" src="${pageContext.request.contextPath}/resources/img/core_logo.png">
		</div>
	</div> --%>
	</section>
		<jsp:include page="../demo/footer.jsp"></jsp:include>
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
	
	console.log(dbpwdok);
});

$("#manual").click(function(){
	var url = "https://docs.google.com/presentation/d/e/2PACX-1vSpjrgtqmbGU1w_ZaCkBMbIYB_t-CEOWK10c6muP81HiYiAbFMnymGslgVhu5e36WZ62n3GpCX6hR9A/pub?start=false&loop=false&delayms=3000";
	window.open(url);
})


$("#loginbtn").click(function (){
	var InputId = $(".id").val();
	var InputPwd = $(".pwd").val();
	var InputName = $(".name").val();
	var link = "${pageContext.request.contextPath}/e/Info/${info.idx}"
	console.log("pwd : "+InputPwd);
	console.log("name : "+InputName);
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/e/loginAction',
		datatype : 'json',
		data : {
			"id" : InputId,
			"pwd" : InputPwd,
			"name" : InputName,
		},
		success : function(response) {
			var res = response.result;
			console.log(res);
			if (res === "0") {
				// DB에 정보 없음
				modal.classList.toggle('show');
				msg.innerHTML = '<p>2023년도 직원근무평가 대상직원이 아닙니다.</p>'

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
				if (idx == 635) {
					location.href = "${pageContext.request.contextPath}/e/admin";
				} else {
					location.href = "${pageContext.request.contextPath}/e/Info/"+idx;
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
	var link = "${pageContext.request.contextPath}/e/Pwd/"+idx;
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