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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demologincss.css?ver=240213_01">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demofootercss.css?ver=240213_01">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css?ver=240213_01">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/loginmediacss.css?ver=240213_01">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
<form action="${pageContext.request.contextPath}/demo/loginAction" method="post">
	<section>
		<%-- <div class="login-bg">
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
									<input class="input-text id" type="text" name="id" id="id" placeholder="사번" title="사번입력" >
								</div>
								<div class="pwd-area">
									<input class="input-text name" type="text" name="name" id="pwd" placeholder="이름" title="비밀번호입력">
								</div>
								<div class="login-text">
									<span class="bold" style="">개인 비밀번호를 설정 하신 후 로그인 시 아래의 사번/비밀번호 체크 후 사번과 비밀번호를 입력부탁드립니다.</span>
								</div>
								<div class="chk-area" style="">
									<label class="label">
										<span class="alignBox">
											<input class="radio" type="radio" id="chk_name" name="radio" checked />
											<span class="radioimg"></span>
											<span class="inputTxt normal">사번 / 이름 <span class="bold">(비밀번호 설정 전)</span></span>
										</span>
									</label>
									<label class="label">
										<span class="alignBox">
											<input type="radio" class="radio" id="chk_no" name="radio" />
											<span class="radioimg"></span>
											<span class="inputTxt normal">사번 / 비밀번호 <span class="bold">(비밀번호 설정 후)</span></span>
										</span>
									</label>
								</div>
								<!-- <div style="text-align: left; font-size: 10pt; color: #000000; margin-bottom: 26px; font-size: 1.4rem;">
									
								</div> -->
								<div class="pw-find">
									<span class="bold" onclick="location.href='${pageContext.request.contextPath}/demo/Findpwd'">비밀번호 찾기 ></span>
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
									<div style="">
										<div class="notice-header bold">
											<span>직원 평가완료 후 재평가(수정)이 안되오니 신중하게 평가해 주시기 바랍니다</span>
										</div>
										<div class="notice-text normal">
											<div>
												<div>
													<c:forEach items="${notice }" var="n">
													<div class="notice-inner">
														<div class="inner-text">
															<c:if test="${not empty n.d2}"><img src="${pageContext.request.contextPath}/resources/icon/ev/dotted.png"></c:if>
															<span>${n.d2 }</span>
														</div>
														<div><span class="inner-span">${n.d3 }</span></div>
													</div>
													</c:forEach>
												</div>
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
					<div class="flex flex-center">
						<img src="${pageContext.request.contextPath}/resources/img/core_logo.png">
					</div>
				</div>
			</div>
			
		</div> --%>
		<div class="text-wrap">
			<div class="text-img" style="color: #222222;">
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
									<input class="input-text id" type="text" name="id" id="id" placeholder="사번" title="사번입력" >
								</div>
								<div class="pwd-area">
									<input class="input-text name" type="text" name="name" id="pwd" placeholder="이름" title="비밀번호입력">
								</div>
								<div class="login-text">
									<span class="bold" style="">개인 비밀번호를 설정 하신 후 로그인 시 아래의 사번/비밀번호 체크 후 사번과 비밀번호를 입력부탁드립니다.</span>
								</div>
								<div class="chk-area" style="">
									<label class="label label-name">
										<span class="alignBox">
											<input class="radio" type="radio" id="chk_name" name="radio" checked />
											<span class="radioimg"></span>
											<span class="inputTxt normal">사번 / 이름 <span class="bold">(비밀번호 설정 전)</span></span>
										</span>
									</label>
									<label class="label label-pwd">
										<span class="alignBox">
											<input type="radio" class="radio" id="chk_no" name="radio" />
											<span class="radioimg"></span>
											<span class="inputTxt normal">사번 / 비밀번호 <span class="bold">(비밀번호 설정 후)</span></span>
										</span>
									</label>
								</div>
								<!-- <div style="text-align: left; font-size: 10pt; color: #000000; margin-bottom: 26px; font-size: 1.4rem;">
									
								</div> -->
								<div class="pw-find">
									<span class="bold" onclick="location.href='${pageContext.request.contextPath}/demo/Findpwd'">비밀번호 찾기 ></span>
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
											<span>직원 평가완료 후 재평가(수정)이 안되오니 신중하게 평가해 주시기 바랍니다</span>
										</div>
										<div class="notice-text normal">
											<div>
												<div>
													<c:forEach items="${notice }" var="n">
													<div class="notice-inner">
														<div class="inner-text">
															<c:if test="${not empty n.d2}"><img src="${pageContext.request.contextPath}/resources/icon/ev/dotted.png"></c:if>
															<span>${n.d2 }</span>
														</div>
														<div><span class="inner-span">${n.d3 }</span></div>
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
	</section>
	<jsp:include page="../demo/footer.jsp"></jsp:include>
	<div class="modal normal">
		<div class="modal_body">
			<div>
				<div class="menu_msg">text</div>
				<div style="top: 40%" class="btn modal_btn" onclick="closePopup()">
				확인
				</div>
			</div>
		</div>
	</div>
	<div class="modal3 normal">
		<div class="modal_body3">
			<div>
				<div class="menu_msg3">text</div>
				<div class="modal_footer3">
					<div style="top: 40%" class="btn modal_btn2" onclick="modal_insert()">
						확인
					</div>
					<div style="top: 40%" class="btn pink_btn2" onclick="closePopup3()">
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
	var link = "${pageContext.request.contextPath}/demo/Info/${info.idx}"
	console.log("pwd : "+InputPwd);
	console.log("name : "+InputName);
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/demo/loginAction',
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
			 	msg.style.top = '34%';
				msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>2023년도 직원근무평가 대상직원이 아닙니다.</p>'

				console.log(0);
			} else if (res === "1") {
				// 비밀번호 불일치
				modal.classList.toggle('show');
			 	msg.style.top = '34%';
				msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>비밀번호가 일치하지 않습니다.</p>'

				
				console.log(1);
			} else if (res === "5") {
				// 아이디와 이름으로 로그인 성공 후 비밀번호가 설정되어 있지 않는 경우
				idx = response.idx;
				modal.classList.toggle('show');
			 	msg.style.top = '34%';
				msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>현재 비밀번호가 설정되어 있지 않습니다.</p><p>비밀번호 설정 페이지로 이동합니다.</p>';
				$(".btn").attr("onclick", "pwdlink()");
				console.log(5);
			} else if (res === "2") {
				// DB에 비밀번호가 있는데 이름으로 로그인 한 경우
				modal.classList.toggle('show');
			 	msg.style.top = '34%';
				msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>현재 비밀번호가 설정되어 있습니다. 비밀번호로 로그인을 해주세요.</p>'

				console.log(2);
			} else if (res === "4") {
				// 로그인 성공
				idx = response.idx;
				if (idx == 635) {
					location.href = "${pageContext.request.contextPath}/demo/admin";
				} else {
					location.href = "${pageContext.request.contextPath}/demo/Info/"+idx;
				}
				
				console.log(4);
			} else if (res === "3") {
				// 이름이 일치하지 않는 경우
				modal.classList.toggle('show');
			 	msg.style.top = '34%';
				msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>이름이 일치하지 않습니다.</p>'

				console.log(3);
				
			}
			
		},
		error : function(error) {
			console.error('Error fetching data :' ,error);
			modal.classList.toggle('show');
		 	msg.style.top = '34%';
			msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>로그인 처리 중 오류가 발생했습니다.</p><p>다시 시도해주세요.</p>';

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
	var link = "${pageContext.request.contextPath}/demo/Pwd/"+idx;
	location.href = link;
}

</script>
</html>