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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demofootercss.css?ver=0213">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demopwdfindcss.css?ver=0213">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css?ver=0213">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demofootercss.css?ver=0213">
<title>비밀번호 변경</title><!-- 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.modal_body {
	height: 277px;
}
</style>
</head>
<body>
<form action="${pageContext.request.contextPath}/demo/findpwdAction" method="post">
	<div class="wrap">
	<section id="section">
	
	<div class="login">
		<div class="line" id="line"></div>
		<div class="main">
			<div class="login-head">
				<span class="bold" id="head">비밀번호 변경</span>
			</div>
			<ul id="ul" class="normal">
				<li><input type="text" name="id" id="id" placeholder="사번" title="사번입력"></li>
				<li id="result2"><input type="text" name="ph" id="ph" placeholder="휴대폰번호" title="휴대폰번호입력"></li>
				<li id="findBtn"><button class="bold" type="button" id="find">정보확인</button></li>
				<li ><div id="resultDiv""><span id="result"></span></div></li>
			</ul>
		</div>
		
		
	</div>
	
	</section>
	
	</div>
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
var link = "${pageContext.request.contextPath}/demo/Login";

$(document).ready(function () {
	$("#id").focus(function(){
		$(this).css({
			color: '#333333'
		});
		$("#ph").css({
			color: '#333333'
		});
		$("#result").html('');
	});
	$("#ph").focus(function(){
		$(this).css({
			color: '#333333'
		});
		$("#id").css({
			color: '#333333'
		});
		$("#result").html('');
	});
	
	var $div = $('<li><input type="password" placeholder="비밀번호" name="pwd" id="pwd"/></li><li><input type="password" placeholder="비밀번호확인" name="pwd2" id="pwd2"/></li><li id="pwdActBtn"><button class="bold" type="button" id="pwdAct">비밀번호 변경</button></li>');
	var div = document.createElement('div');
	var $div2 = $('<div calss="result2"></div>');
	var div2 = document.createElement('div');
	$div.find('ul li').css({
	    padding: '0 0 12px'
	});

	$div.find('ul li input').css({
	    width: '100%',
	    height: '46px',
	    'box-sizing': 'border-box',
	    'text-indent': '16px'
	});
	
	$div.find('ul li button').css({
		width: '100%',
		height: '56px',
		background: '#08254c',
		'font-size': '18px',
		color: '#fff',
		border: '2px solid #08254c',
		'font-weight': 'bolder',
		cursor: 'pointer'
	});
	
	// 필터를 사용하여 특정 요소를 대상으로 지정하고 스타일 적용
	$div.find('ul li input').filter(function() {
	    return window.getComputedStyle(this, '::placeholder').content === '"Password"';
	}).css({
	    'font-size': '16px',
	    color: '#9fa19f'
	});
	$('#find').click(function (){
		var id = $("#id").val();
		var ph = $("#ph").val();
		
//		console.log(id);
//		console.log(ph);
//		console.log(ph.length);
		if(ph.length == 11) {
			var ph1 = ph.substring(0, 3);
//			console.log(ph1);
			var ph2 = ph.substring(3, 7);
//			console.log(ph2);
			var ph3 = ph.substring(7);
//			console.log(ph3);
			ph = ph1+"-"+ph2+"-"+ph3;
//			console.log(ph);
		}
		$.ajax({
			url: '${pageContext.request.contextPath}/demo/FindpwdAjax',
			type: 'post',
			dataType: 'json',
			data: {
				"id" : id,
				"ph" : ph
			},
			success : function(response) {
				console.log(response.result);
				if(response.result === 'Y'){
					// 아이디와 비밀번호가 일치함
					$("#result").html('');
					$("#findBtn").css({
						'margin-top' : '0px'
					});
					$("#ul").css({
						'margin-top': '24px'
					});
					$("#ul").append($div);
					$("#section").css({
						height: '600px',
						top : '42%'
					});
					$("#line").css({
						top : '-35px'
					});
					$("#head").css({
						top : '-6px'
					});
					$("#resultDiv").css({
						height: '',
						'font-size': '1.8rem',
				    	'font-weight': '700',
				    	color: '#ffa200',
				    	'margin-top': '27px',
				    	'margin-bottom': '17px',
				    	'letter-spacing': '-1px'
					});
					$("#resultDiv").html('새로운 비밀번호를 입력 후 비밀번호를 변경하세요.');
				} else {
					$("#result").css({
						color : '#f30000'
					});
					$("#result").html('검색된 정보가 없습니다. 사번과 휴대폰번호를 확인해주세요.');
					$("#id").css({
						color : '#f20000' 
					});
					
					$("#ph").css({
						color : '#f20000'
					});
				}
				
			}
		});
	});
	$div.find("#pwdAct").click(function() {

		var id = $("#id").val();
		$div.on('focus', '#pwd', function() {
			$(this).css({
				border : '1px solid #efefef'
			});
			$div.find("#pwd2").css({
				border : '1px solid #efefef'
			});
			$("#result").html('');
		});
		$div.on('focus', '#pwd2', function() {
			$(this).css({
				border: '1px solid #efefef'
			});
			$div.find("#pwd").css({
				border: '1px solid #efefef'
			});
			$("#result").html('');
		});
		
		
		var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		if(pwd == "") {
			modal.classList.toggle('show');
		 	msg.style.top = '34%';
			msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>비밀번호를 입력해주세요.</p>'

			$("#pwd").focus();
			return false;
		}
		if(pwd2 == "") {
			modal.classList.toggle('show');
		 	msg.style.top = '34%';
			msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>비밀번호를 입력해주세요.</p>'

			$("#pwd2").focus();
			return false;
		}
		if(pwd != pwd2) {
			modal.classList.toggle('show');
		 	msg.style.top = '34%';
			msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>비밀번호가 일치하지않습니다.</p>'

			$("#pwd2").focus();
			return false;
		}
		$.ajax({
			url: '${pageContext.request.contextPath}/demo/PwdActAjax/'+id,
			type: 'post',
			dataType: 'json',
			data: {
				'id': id,
				'pwd': pwd
			},
			success: function(response) {
				
				
				// 링크 이동
				if(response.result === "Y") {
					modal.classList.toggle('show');
				 	msg.style.top = '34%';
					msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>비밀번호를 변경했습니다.</p><p>변경된 비밀번호로 로그인 해주세요.</p>'
					$(".btn").attr("onclick", "pwdlink()");
					
				} else {
					modal.classList.toggle('show');
				 	msg.style.top = '34%';
					msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>비밀번호 변경 중 오류가 발생했습니다.</p><p>관리자에게 문의하세요.</p>'
					$(".btn").attr("onclick", "pwdlink()");
					
				}
			},
			error: function(error) {
	            console.error('Error fetching data:', error);
	         }
		});
	});
	
});


function closePopup(){
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}
function pwdlink() {
	location.href = link;
}

</script>
</html>