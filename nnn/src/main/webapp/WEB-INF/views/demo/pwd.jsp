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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demofootercss.css?ver=0226">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demopwdcss.css?ver=0226">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css?ver=0226">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pwdmediacss.css?ver=0226">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mobileheadercss.css?ver=0227">
<title>코어솔루션 인사평가 시스템</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
<form id="frm" action="${pageContext.request.contextPath}/demo/pwdAction/${info.idx}" method="post">
	<jsp:include page="../demo/header2.jsp"></jsp:include>
	<section>
	<div class="login">
		<div class="line"></div>
		<div class="login-head">
			<div class="head-img-area" onclick="homego()">
				<img src="${pageContext.request.contextPath}/resources/icon/arrow2.png">
			</div>
			<div class="head-span-area">
				<span class="bold">비밀번호 설정</span>
			</div>
		</div>
		
		<ul class="normal">
			<li><input type="text" name="id" id="id" placeholder="사번" title="사번" readonly="readonly" value="${info.id }"></li>
			<li><input type="text" name="name" id="name" placeholder="이름" title="이름" readonly="readonly" value="${info.name }"></li>
			<li><input type="password" name="pwd" id="pwd" placeholder="비밀번호" title="비밀번호" autofocus="autofocus"></li>
			<li><input type="password" name="pwd2" id="pwd2" placeholder="비밀번호확인" title="비밀번호확인"></li>
			<li><button class="bold" type="button" id="btn" value="">비밀번호 설정</button></li>			
		</ul>
	</div>
		
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

const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const msg = document.querySelector('.menu_msg');
const icon = document.querySelector('.menu_icon');
const btn1 = document.querySelector('.btn');

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
					 	btn1.style.top = '40%';
						msg.innerHTML = '<p>비밀번호 변경 처리 중 오류가 발생했습니다.</p><p>다시 시도해주세요.</p>';

					} else if (res === "Y") {
						// 성공
						modal.classList.toggle('show');
						icon.style.top = '15%';
					 	msg.style.top = '30%';
					 	btn1.style.top = '40%';
						msg.innerHTML = '<p>비밀번호 설정이 완료되었습니다.</p><p>설정한 비밀번호로 로그인 해주세요.</p>';
						$(".btn").attr("onclick", "link()");
					}
				},
				error : function (error) {
					console.log('Error fetching data : ', error);
					modal.classList.toggle('show');
					icon.style.top = '15%';
				 	msg.style.top = '30%';
				 	btn1.style.top = '40%';
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
	var link = "${pageContext.request.contextPath}/demo/Login?chk_no=checked";
	location.href = link;
}

function homego() {
	location.href='${pageContext.request.contextPath}/demo/Login';
}

</script>
</html>