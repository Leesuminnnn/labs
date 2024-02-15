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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demofootercss.css?ver=0215">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demopwdcss.css?ver=0215">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css?ver=0215">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pwdmediacss.css?ver=0215">
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
				<img class="menu_icon" src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px; position: relative; top: 10%;">
				<div class="menu_msg">text</div>
				<div style="top: 45%" class="btn modal_btn" onclick="closePopup()">
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
const icon = document.querySelector('.menu_icon');
const btn = document.querySelector('.btn');

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
			icon.style.top = '20%';
		 	msg.style.top = '34%';
			msg.innerHTML = '<p>비밀번호를 입력해주세요.</p>'

			return false;
		}else if(pwd != pwd2){
			modal.classList.toggle('show');
			icon.style.top = '20%';
		 	msg.style.top = '34%';
			msg.innerHTML = '<p>비밀번호가 일치하지 않습니다.</p>'

			return false;
		}else{
// 			frm.submit();
			// Ajax 전송
			$.ajax({
				type: 'post',
				url: '${pageContext.request.contextPath}/demo/pwdAction/${info.idx}',
				datatype: 'json',
				data: {
					"pwd": pwd
				},
				success : function (response) {
					var res = response.result;
					
					if (res === "N") {
						// 전송실패
						modal.classList.toggle('show');
						icon.style.top = '15%';
					 	msg.style.top = '30%';
					 	btn.style.top = '40%';
						msg.innerHTML = '<p>비밀번호 변경 처리 중 오류가 발생했습니다.</p><p>다시 시도해주세요.</p>';

					} else if (res === "Y") {
						// 성공
						modal.classList.toggle('show');
						icon.style.top = '15%';
					 	msg.style.top = '30%';
					 	btn.style.top = '40%';
						msg.innerHTML = '<p>비밀번호 변경이 완료되었습니다.</p><p>사번/비밀번호로 체크 후 로그인해주세요.</p>';
						$(".btn").attr("onclick", "link()");
					}
				},
				error : function (error) {
					console.log('Error fetching data : ', error);
					modal.classList.toggle('show');
					icon.style.top = '15%';
				 	msg.style.top = '30%';
				 	btn.style.top = '40%';
					msg.innerHTML = '<p>비밀번호 변경 처리 중 오류가 발생했습니다.</p><p>다시 시도해주세요.</p>';

				}
			});
			
		}
	});
	
});

function closePopup(){
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}

function link() {
	var link = "${pageContext.request.contextPath}/demo/Login";
	location.href = link;
}


</script>
</html>