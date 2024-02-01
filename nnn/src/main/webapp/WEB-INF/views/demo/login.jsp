<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demologincss.css?ver=240201F">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demofootercss.css?ver=240201">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css?ver=240201">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
<form action="${pageContext.request.contextPath}/demo/loginAction" method="post">
	<section>
	<div class="login-bg">
		<div class="main">
			
			<div class="login-header">
				<span class="header-text">코어솔루션 인사평가 시스템</span>
			</div>
			
			<div class="login-area">
				<div class="login-content" style="position: relative; top: -11px;">
					<div class="container" style="position: relative; top: 3px;">
						<div class="content" style="">
							<div class="">
								<span>Login</span>
							</div>
							<div class="id-area">
								<input class="input-text" style="padding-left: 23px;" type="text" name="id" id="id" placeholder="사번" title="사번입력" >
							</div>
							<div class="pwd-area" style="">
								<input class="input-text" style="padding-left: 23px;" type="text" name="name" id="pwd" placeholder="이름" title="비밀번호입력">
							</div>
							<div class="" style="text-align: left; margin-bottom: 12px; margin-bottom: 20px;">
								<span class="bold" style="color: #ffa200; font-size: 1.3rem; letter-spacing: -1.2px;">개인 비밀번호를 설정 하신 후 로그인 시 아래의 사번/비밀번호 체크 후 사번과 비밀번호를 입력부탁드립니다.</span>
							</div>
							<div style="text-align: left; font-size: 10pt; color: #000000; margin-bottom: 3px; font-size: 1.2rem; margin-bottom: 5px;">
								<label class="label">
									<span class="alignBox">
										<input class="radio" type="radio" id="chk_name" name="radio" checked />
										<span class="radioimg"></span>
										<span class="inputTxt normal">사번 / 이름 <span style="color: #0e366c;">(비밀번호 설정 전)</span></span>
									</span>
								</label>
								<label class="label">
									<span class="alignBox">
										<input type="radio" class="radio" id="chk_no" name="radio" />
										<span class="radioimg"></span>
										<span class="inputTxt normal">사번 / 비밀번호 <span style="color: #0e366c;">(비밀번호 설정 후)</span></span>
									</span>
								</label>
							</div>
							<!-- <div style="text-align: left; font-size: 10pt; color: #000000; margin-bottom: 26px; font-size: 1.4rem;">
								
							</div> -->
							<div style="text-align: left; margin-bottom: 3px;">
								<span class="normal" style="color: #444444; font-size: 1.2rem; cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/demo/Findpwd'">비밀번호 찾기</span>
							</div>
							<div style="position: relative; bottom: -7px;">
								<button type="button" id="loginbtn" style="height: 50px; display: flex; justify-content: center; align-items: center; background-color: #f5a418; border-radius: 7px; color: #f5f5f5; width: 100%; border:none; cursor:pointer; font-size: 1.4rem;">로그인</button>
							</div>
						</div>
					</div>
				</div>
				<div style="border-right: 1px solid #d8d8d8; height: 100%;"></div>
				<div class="notice-content" style="position: relative; top: -7px;">
					<div class="container">
						<div class="content content2">
							<div class="" style="margin-bottom: -10px;">
								<span>Notice</span>
							</div>
							<div class="notice-bg">
								<div style="height: 100%; padding: 20px 20px 0px 20px;">
									<div class="notice-header bold">
										<span>직원 평가완료 후 재평가(수정)이 안되오니 신중하게 평가해 주시기 바랍니다</span>
									</div>
									<div class="notice-text normal" style="font-size:1rem;">
										<div style="margin-top: 8px; width: 100%; height: 146px; overflow: auto;">
											<div>
												<c:forEach items="${notice }" var="n">
												<div style="display: flex;margin-bottom: 7px; margin-left: 7px;">
													<div style="width: 143px; display: flex; align-items: center;"><c:if test="${not empty n.d2}"><img style="margin-right: 5px;" src="${pageContext.request.contextPath}/resources/icon/ev/dotted.png"></c:if> <span>${n.d2 }</span></div>
													<div><span style="letter-spacing: -0.5px;">${n.d3 }</span></div>
												</div>
												</c:forEach>
											</div>
										</div><%-- 
										<table style="margin-top: 13px; width: 100%;">
											<tbody style="">
												<c:forEach items="${notice}" var="n">
													<tr <c:if test="${n.idx eq '1' }">colspan="2"</c:if> style="height: 22px; <c:if test="${n.idx eq 1 }">color:red; font-size:15px; font-weight: bolder;</c:if>">
														<td style="width: 135px; display: flex; align-items: center;"><c:if test="${not empty n.d2}"><img src="${pageContext.request.contextPath}/resources/icon/ev/dotted.png"></c:if> <span>${n.d2 }</span></td>
														<td><span>${n.d3 }</span></td>
													</tr>
												</c:forEach>
											</tbody>
										</table> --%>
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
					<img style="width: 137px;" src="${pageContext.request.contextPath}/resources/img/core_logo.png">
				</div>
			</div>
		</div>
		
	</div>
	
	
	<!-- 
	<div class="login">
		<h2>코어솔루션 인사평가 시스템</h2>
		<ul>
			<li><input type="text" name="id" id="id" placeholder="사번" title="사번입력"></li>
			<li><input type="text" name="name" id="pwd" placeholder="이름" title="이름입력"></li>
			<li style="color: red; font-size:12px;"><b>※ 개인 비밀번호를 설정 하신 후 로그인시 아래의 사번/비밀번호 체크후 사번과 비밀번호를 입력부탁드립니다.</b></li>
			<li style="display: flex; flex-wrap: wrap;">
				<input type="radio" name="radio" id="chk_name" checked>
				<label style="cursor:pointer;" for="chk_name">사번/이름
					<b style="color: red">(비밀번호 설정 전)&nbsp;&nbsp;</b>
				</label>
				<input type="radio" name="radio" id="chk_no" >
				<label style="cursor:pointer;" for="chk_no">사번/비밀번호
					<b style="color: red">(비밀번호 설정 후)</b>
				</label>
			</li>
			<li><button>로그인</button></li>
			<li style="text-align: center;" onclick="location.href='${pageContext.request.contextPath}/demo/Findpwd'">
			<p style="cursor:pointer; color: #000099; "><b style="border-bottom: 1px solid;">비밀번호를 잊으셨나요?</b></p></li>			
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
					<td style="<c:if test="${n.idx eq '4'}">color:red;</c:if>">
						${n.d3 }
					</td>
				</tr>
			</c:forEach>
			</table>
		</div>
		<div id="manual">근무평가 시스템 메뉴얼 보기</div>
		<p style="font-size: 18px;"><b>문의사항</b></p>
		<div style="color:blue;">
		<p>코어솔루션 063-250-4503</div>
	</div>
	<div class="footer">
		<div class="nav">
			<img style="height: 35px;" src="${pageContext.request.contextPath}/resources/img/core_logo.png">
		</div>
	</div> 
	
	
	
	
	
	<!--  -->
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
// console.log(namechk);
// console.log(nochk);
var dbpwdok = "${dbpwdOk}"; 
$(document).ready(function () {
	
	$('#chk_name').click(function (){
		$('#pwd').attr("placeholder", "이름");
		$('#pwd').attr("type", "text");
		$('#pwd').attr("title", "이름입력");
		$('#pwd').attr("name", "name")
		console.log("1");
	});
	$('#chk_no').click(function () {
		$('#pwd').attr("placeholder", "비밀번호");
		$('#pwd').attr("type", "password");
		$('#pwd').attr("title", "비밀번호입력");
		$('#pwd').attr("name", "pwd")
		console.log("2");
	});
	
// 	console.log(dbpwdok);
});

$("#manual").click(function(){
	var url = "https://docs.google.com/presentation/d/e/2PACX-1vSpjrgtqmbGU1w_ZaCkBMbIYB_t-CEOWK10c6muP81HiYiAbFMnymGslgVhu5e36WZ62n3GpCX6hR9A/pub?start=false&loop=false&delayms=3000";
	window.open(url);
})

$("#loginbtn").click(function (){
	var InputId = $("#id").val();
	var InputPwd = $("#pwd").val();
	var InputName = $("#name").val();
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
				modal.classList.toggle('show');
			 	msg.style.top = '34%';
				msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>2023년도 직원근무평가 대상직원이 아닙니다.</p>'

				console.log(0);
			} else if (res === "1") {
				modal.classList.toggle('show');
			 	msg.style.top = '34%';
				msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>사번/비밀번호로 체크 후 로그인 해주세요.</p><p>아이디 혹은 비밀번호를 확인해 주세요.</p>'

				
				console.log(1);
			} else if (res === "2") {
				// 아이디와 이름으로 로그인 성공 후 비밀번호가 설정되어 있지 않는 경우
				modal.classList.toggle('show');
			 	msg.style.top = '34%';
				msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>현재 비밀번호가 설정되어 있지 않습니다.</p><p>비밀번호 설정 페이지로 이동합니다.</p>'

				console.log(2);
			} else if (res === "3") {
				// DB에 비밀번호가 있는데 이름으로 로그인 한 경우
				modal.classList.toggle('show');
			 	msg.style.top = '34%';
				msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>현재 비밀번호가 설정되어 있습니다. 비밀번호로 로그인을 해주세요.</p>'

				console.log(3);
			} else if (res === "4") {
				var idx = response.idx;
				location.href = "${pageContext.request.contextPath}/mediplat/Main/"+idx;
				
			}
			
		},
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

</script>
</html>