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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demologincss.css?ver=240130">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
<form action="${pageContext.request.contextPath}/demo/loginAction" method="post">
	<section>
	<div class="login-bg">
		<div class="main">
			
			<div class="login-header">
				<span class="header-text bold">코어솔루션 인사평가 시스템</span>
			</div>
			
			<div class="login-area">
				<div class="login-content">
					<div class="container">
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
								<span class="bold" style="color: #ffa200; font-size: 8pt;">개인 비밀번호를 설정 하신 후 로그인 시 아래의 사번/비밀번호 체크 후 사번과 비밀번호를 입력부탁드립니다.</span>
							</div>
							<div style="text-align: left; font-size: 10pt; color: #000000; margin-bottom: 3px;">
								<input type="radio" name="radio" id="chk_name" checked />
								<label style="cursor:pointer;" for="chk_name"><span class="normal">사번/이름 <span style="color: #0e366c">(비밀번호 설정 전)</span></span></label>
							</div>
							<div style="text-align: left; font-size: 10pt; color: #000000; margin-bottom: 26px;">
								<input type="radio" name="radio" id="chk_no" />
								<span>
								<label style="cursor:pointer;" for="chk_no"><span class="normal">사번/비밀번호 <span style="color: #0e366c">(비밀번호 설정 후)</span></span>
								</label>
								</span>
							</div>
							<div style="text-align: left; margin-bottom: 3px;">
								<span class="normal" style="color: #444444; font-size: 10pt; cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/demo/Findpwd'">비밀번호 찾기</span>
							</div>
							<div>
								<button style="height: 50px; display: flex; justify-content: center; align-items: center; background-color: #f5a418; border-radius: 7px; color: #f5f5f5; width: 100%; border:none; cursor:pointer;">로그인</button>
							</div>
						</div>
					</div>
				</div>
				<div class="notice-content">
					<div class="container">
						<div class="content content2">
							<div class="">
								<span>Notice</span>
							</div>
							<div class="notice-bg">
								<div class="notice-header bold">
									<span>직원 평가완료 후 재평가(수정)이 안되오니 신중하게 평가해 주시기 바랍니다</span>
								</div>
								<div class="notice-text normal">
									<table style="margin-top: 13px; width: 100%;">
										<c:forEach items="${notice}" var="n">
											<tr <c:if test="${n.idx eq '1' }">colspan="2"</c:if> style="height: 22px; <c:if test="${n.idx eq '1' }">color:red; font-size:15px; font-weight: bolder;</c:if>">
												<td style="<c:if test="${n.idx eq 6 }">align-items: start; display: flex;</c:if>width: 135px;">${n.d2 }</td>
												<td><span>${n.d3 }</span></td>
											</tr>
										</c:forEach>
									</table>
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
	<footer class="footer">
		<div class="flex flex-between"style="width: 886px; margin: 0 auto; height: 100%; ">
			<div>
				<div style="display: flex; flex-direction: column; flex-wrap: nowrap; height: 78px;">
					<div style="margin-bottom: 17px;">
						<img style="width: 137px;" src="${pageContext.request.contextPath}/resources/img/core_logo.png">
					</div>
					<div class="light" style="display: flex; flex-direction: column; flex-wrap: wrap; color: #d6d6d6; font-size: 9pt;">
						<span style=" margin-bottom: 2px;">서울사무소 : 서울특별시 마포구 마포대로 15 현대빌딩 710호</span>
						<span>본사연구소 : 전북특별자치도 전주시 완산구 용머리로 80 3F</span>
					</div>
				</div>
				
			</div>
			<div class="normal" style="text-align: center; padding: 15px 15px 13px 15px; border: 1px dashed #b4b4b4; height: 89px; display: flex; flex-direction: column; justify-content: center; width: 316px;">
				<div style="display: flex; flex-wrap: wrap; flex-direction: column;">
					<span style="font-size: 9pt; color: #f5a418; display: flex; justify-content: space-evenly;">문의사항은 코어솔루션으로 연락주시기 바랍니다.</span>
					<span style="font-size: 16pt; color: #e7e7e7; display: flex; justify-content: center; flex-wrap: wrap; align-items: center;">1522-4030 / 063-250-4503</span>
				</div>
			</div>
		</div>
	</footer>
</form>
</body>
<script>
var namechk = $('#chk_name').prop("checked");
var nochk = $('#chk_no').prop("checked");


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


</script>
</html>