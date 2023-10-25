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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testlogincss.css">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
<form action="${pageContext.request.contextPath}/t/loginAction" method="post">
	<section>
	<div class="notice" style="display: none;">
		<p>공지사항</p>
	</div>
	<div class="login">
		<h2>로그인</h2>
		<ul>
			<li><input type="text" name="id" id="id" placeholder="사번" title="사번입력"></li>
			<li><input type="text" name="name" id="pwd" placeholder="이름" title="이름입력"></li>
			<li><input type="radio" name="radio" id="chk_name" <c:if test="${dbpwdOk != 'true'}">checked</c:if>><label for="chk_name">사번/이름</label>
				<input type="radio" name="radio" id="chk_no" <c:if test="${dbpwdOk == 'true'}">checked</c:if>><label for="chk_no">사번/비밀번호</label>
			</li>
			<li><button>로그인</button></li>			
		</ul>
		<div>
			<ul>
				<li>회원가입</li>				
			</ul>
		</div>
	</div>
	</section>
</form>
</body>
<script>

console.log($('#chk_name').prop("checked"));
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




</script>
</html>