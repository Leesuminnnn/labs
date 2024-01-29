<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css">
<title></title>
</head>
<body>
<form id="id">

</form>
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
<div class="modal2 normal">
	<div class="modal_body2">
		<div>
			<div class="menu_msg2">text</div>
			<div class="modal_footer2">
				<div style="top: 40%" class="btn modal_btn2" id="modal_insert">
					확인
				</div>
				<div style="top: 40%" class="btn pink_btn2" onclick="closePopup2()">
					취소
				</div>
			</div>
			
		</div>
	</div>
</div>
	<input type="hidden" name="midx" value="${sessionScope.midx }">
	
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
	var form = document.getElementById("frm");
	var scoreInput = document.getElementById("score");
	const body = document.querySelector('body');
	const modal = document.querySelector('.modal');
	const modal2 = document.querySelector('.modal2');
	const msg = document.querySelector('.menu_msg');
	const msg2 = document.querySelector('.menu_msg2');
	const modal_submit = document.getElementById("modal_insert");
	var infoidx = "${infoidx}";
	var targetidx = "${targetidx}";
	var requestmsg = "${msg}";
	var requesturl = "${url}";
	$(function(){
	
	
	modal.classList.toggle('show');
 	msg.style.top = '34%';
	msg.innerHTML = '<p><img src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png" style="width: 46px;"></p><p>'+requestmsg+'</p>'
	if (modal.classList.contains('show')) {
		body.style.overflow = 'hidden';
	}
	
	
	
	});
	function closePopup(){
		modal.classList.toggle('show');
		if (!modal.classList.contains('show')) {
			body.style.overflow = 'auto';
		}
		location.href="${pageContext.request.contextPath}/"+requesturl;
	}
	function closePopup2(){
		modal2.classList.toggle('show');
		if (!modal2.classList.contains('show')) {
			body.style.overflow = 'auto';
		}
	}
	/* 
	$(function(){
		var msg = "${msg}";
		var url = "${url}";
		
		history.pushState(null, null, location.href);
		window.onpopstate = function(event) {
		    history.go(1);
		};
		alert(msg);
		location.href = "${pageContext.request.contextPath}/"+url;
	}); */
		
	</script>
</body>
</html>