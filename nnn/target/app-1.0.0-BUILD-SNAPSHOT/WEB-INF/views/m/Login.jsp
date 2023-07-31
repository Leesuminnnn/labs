<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<style>
a {
	text-decoration: none;
}
</style>
<body>
	<!-- 카카오 로그인 javascript -->
	<script
		src="https://t1.kakaocdn.net/kakao_js_sdk/${VERSION}/kakao.min.js"
		integrity="${INTEGRITY_VALUE}" crossorigin="anonymous"></script>
	<!-- <script>
		// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해야 합니다.
		Kakao.init('62cc66e0b125fccc4ec42aa3cde1d7bb');

		// SDK 초기화 여부를 판단합니다.
		console.log(Kakao.isInitialized());
	</script> -->
	<!-- login form -->
	<form action="${pageContext.request.contextPath}/m/Login_check.do"
		method="post">
		아이디 : <input type="text" name="m_id" placeholder="id"><br>
		패스워드 : <input type="password" name="m_pw" placeholder="pw"><br>

		<input type="submit" value="로그인">
	</form>


	<c:if test="${msg == 'error'}">
		<script>
			alert(error);
		</script>
	</c:if>
	<a href="${pageContext.request.contextPath}/">홈으로</a>
</body>
</html>