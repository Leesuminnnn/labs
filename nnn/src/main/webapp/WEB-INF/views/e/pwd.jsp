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
<title>비밀번호 변경</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
<form id="frm" action="${pageContext.request.contextPath}/e/pwdAction/${info.idx}" method="post">
	<section>
	<div class="login">
		<h2>비밀번호 변경</h2>
		<ul>
			<li><input type="text" name="id" id="id" placeholder="사번" title="사번" readonly="readonly" value="${info.id }"></li>
			<li><input type="text" name="name" id="name" placeholder="이름" title="이름" readonly="readonly" value="${info.name }"></li>
			<li><input type="password" name="pwd" id="pwd" placeholder="비밀번호" title="비밀번호"></li>
			<li><input type="password" name="pwd2" id="pwd2" placeholder="비밀번호확인" title="비밀번호확인"></li>
			<li><button type="button" id="btn" value="">비밀번호 변경</button></li>			
		</ul>
	</div>
		
	</section>
</form>
</body>
<script>

$(document).ready(function () {

	var btn = $("#btn");
	
	btn.click(function(){
		var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		var frm = $("#frm");
		console.log(pwd);
		console.log(pwd2);
		if(pwd == "" || pwd2 == ""){
			alert("비밀번호를 입력해 주세요");
			return false;
		}else if(pwd != pwd2){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}else{
			frm.submit();
		}
	});
	
});




</script>
</html>