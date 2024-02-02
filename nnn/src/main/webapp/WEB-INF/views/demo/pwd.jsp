<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demofootercss.css?ver=240202A">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demopwdcss.css?ver=240202A">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css?ver=240202">
<title>비밀번호 변경</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
<form id="frm" action="${pageContext.request.contextPath}/demo/pwdAction/${info.idx}" method="post">
	<section>
	<div class="login">
		<div class="line"></div>
		<span class="bold">비밀번호 변경</span>
		<ul class="normal">
			<li><input type="text" name="id" id="id" placeholder="사번" title="사번" readonly="readonly" value="${info.id }"></li>
			<li><input type="text" name="name" id="name" placeholder="이름" title="이름" readonly="readonly" value="${info.name }"></li>
			<li><input type="password" name="pwd" id="pwd" placeholder="비밀번호" title="비밀번호"></li>
			<li><input type="password" name="pwd2" id="pwd2" placeholder="비밀번호확인" title="비밀번호확인"></li>
			<li><button class="bold" type="button" id="btn" value="">비밀번호 변경</button></li>			
		</ul>
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
</form>
</body>
<script>

const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const msg = document.querySelector('.menu_msg');

console.log("세션아이디 ${sessionScope.loginmember}");
console.log("model아이디 ${info.id}");
$(document).ready(function () {

	var btn = $("#btn");
	
	btn.click(function(){
		var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		var frm = $("#frm");
		console.log(pwd);
		console.log(pwd2);
		if(pwd == "" || pwd2 == ""){
			modal.classList.toggle('show');
		 	msg.style.top = '34%';
			msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>비밀번호를 입력해주세요.</p>'

			return false;
		}else if(pwd != pwd2){
			modal.classList.toggle('show');
		 	msg.style.top = '34%';
			msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>비밀번호가 일치하지 않습니다.</p>'

			return false;
		}else{
			frm.submit();
		}
	});
	
});

function closePopup(){
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}



</script>
</html>