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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/findpwdcss.css">
<title>비밀번호 변경</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
<form action="${pageContext.request.contextPath}/e/findpwdAction" method="post">
	<section>
	
	<div class="login">
		<div>
			<img style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/'" src="${pageContext.request.contextPath}/resources/icon/arrow2.png">
			<h2>비밀번호 변경</h2>
		</div>
		<ul>
			<li><p style="text-align: center;">사번과 본인휴대폰번호를 입력 후 정보확인을 눌러주세요.</p></li>
			<li><input type="text" name="id" id="id" placeholder="사번" title="사번입력"></li>
			<li><input type="text" name="ph" id="ph" placeholder="휴대폰번호" title="휴대폰번호입력"></li>
			<li><button type="button" id="find">정보확인</button></li>
		</ul>
	</div>
	<div id="result"></div>
	<div class="notice" >
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

$(document).ready(function () {
	$("#id").focus(function(){
		$(this).css('border', '1px solid #000');
		$("#ph").css('border', '1px solid #000');
		$("#result").val('');
	});
	$("#ph").focus(function(){
		$(this).css('border', '1px solid #000');
		$("#id").css('border', '1px solid #000');
		$("#result").val('');
	});
	
	var $div = $('<p style="text-align: center; margin-bottom:10px; color:#000;">변경하실 비밀번호와 비밀번호를 한번더 입력 후 비밀번호 변경을 누르시면 비밀번호 변경이 완료됩니다.</p><div calss="pwd"><ul><li><input type="password" placeholder="비밀번호" name="pwd" id="pwd"/></li><li><input type="password" placeholder="비밀번호확인" name="pwd2" id="pwd2"/></li><li><button type="button" id="pwdAct">비밀번호 변경</button></li></div>');
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
			url: '${pageContext.request.contextPath}/e/FindpwdAjax',
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
					$("#result").append($div);
					
				} else {
					$("#result").css('color', 'red')
					$("#result").html('검색된 정보가 없습니다. 사번과 휴대폰번호를 확인해주세요.');
					$("#id").css('border','1px solid red');
					$("#ph").css('border','1px solid red');
				}
			}
		});
	});
	$div.find('ul li button').click(function(){
		var id = $("#id").val();
		$("#pwd").focus(function(){
			$(this).css('border', '1px solid #000');
			$("#pwd2").css('border', '1px solid #000');
			$("#result").html('');
		});
		$("#pwd2").focus(function(){
			$(this).css('border', '1px solid #000');
			$("#pwd").css('border', '1px solid #000');
			$("#result").html('');
		});
		
		
		var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		if(pwd == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pwd").focus();
			return false;
		}
		if(pwd2 == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pwd2").focus();
			return false;
		}
		if(pwd != pwd2) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#pwd2").focus();
			return false;
		}
		$.ajax({
			url: '${pageContext.request.contextPath}/t/PwdActAjax/'+id,
			type: 'post',
			dataType: 'json',
			data: {
				'id': id,
				'pwd': pwd
			},
			success: function(response) {
				var link = "${pageContext.request.contextPath}/";
				
				// 링크 이동
				if(response.result === "Y") {
					alert("비밀번호를 변경했습니다. \n변경된 비밀번호로 로그인 해주세요.");
					location.replace(link);
					
				} else {
					alert("비밀번호 변경 중 오류가 발생했습니다. \n관리자에게 문의하세요.");
					location.replace(link);
				}
			},
			error: function(error) {
	            console.error('Error fetching data:', error);
	         }
		});
	});
	
});



</script>
</html>