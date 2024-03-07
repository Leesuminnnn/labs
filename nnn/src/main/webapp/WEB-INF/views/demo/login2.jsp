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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testlogin2css.css">
<title>코어솔루션 인사평가 시스템</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
	<div class="sc-ilhlFf cSHxTl" style="width:100vw; height:100vh; display:flex; justify-content: center; align-items: center; background-color: rgb(224, 224, 224);">
		<div style="background: url('${pageContext.request.contextPath}/resources/img/login_bg.png')0% 0% / cover no-repeat;">
			<main class="sc-hLBbCX dswxdh MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation0">
				<form action="${pageContext.request.contextPath}/demo/loginAction" method="post">
				
				</form>
			</main>
			<div class="login" style="
		    background: transparent;
		    padding: 80px;
		    color: rgb(255, 255, 255);
		    transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
		    border-radius: 4px;
		    box-shadow: none;
		    box-sizing: inherit;
		    display: block;
			">
				<div style="
				box-sizing: border-box;
			    display: flex;
			    flex-flow: wrap;
			    width: 100%;
			    margin-top: -16px;
				">
					<div style="padding:16px; flex-basis: 100%; flex-grow: 0; max-width: 100%; box-sizing: border-box; margin: 0;"></div>
					<div style="padding:16px; flex-basis: 100%; flex-grow: 0; max-width: 100%; box-sizing: border-box; margin: 0;"></div>
					<div style="padding:16px; flex-basis: 100%; flex-grow: 0; max-width: 100%; box-sizing: border-box; margin: 0;"></div>
					<div style="padding:16px; flex-basis: calc(100% + 8px); flex-grow: 0; max-width: calc(100% + 8px);"></div>
				</div>
			
			
			</div>
		</div>
	</div>	
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