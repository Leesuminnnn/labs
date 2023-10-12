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
</head>
<body>
<form action="${pageContext.request.contextPath}/t/loginAction" method="post">
	<section class="login">
		<h2>로그인</h2>
		<ul>
			<li><input type="text" name="id" placeholder="아이디" title="아이디입력"></li>
			<li><input type="password" name="pwd" placeholder="비밀번호" title="비밀번호입력"></li>
			<li><input type="checkbox" id="chk_id"><label for="chk_id">아이디저장</label></li>
			<li><button>로그인</button></li>			
		</ul>
		<div>
			<ul>
				<li>회원가입</li>				
			</ul>
		</div>
	</section>
</form>
</body>
</html>