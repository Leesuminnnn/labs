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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testlogincss.css">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
<form action="${pageContext.request.contextPath}/e/loginAction" method="post">
	<section>
	
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
	</div>
	</section>
		
</form>
</body>
<script>
var namechk = $('#chk_name').prop("checked");
var nochk = $('#chk_no').prop("checked");


console.log(namechk);
console.log(nochk);
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
	
	console.log(dbpwdok);
});

$("#manual").click(function(){
	var url = "https://docs.google.com/presentation/d/e/2PACX-1vSpjrgtqmbGU1w_ZaCkBMbIYB_t-CEOWK10c6muP81HiYiAbFMnymGslgVhu5e36WZ62n3GpCX6hR9A/pub?start=false&loop=false&delayms=3000";
	window.open(url);
})


</script>
</html>