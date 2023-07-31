<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- Web App으로 선언하여 브라우저의 UI ( URL 바 ) 를 안 보이도록 할 수 있다. -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="user-scalable=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Logincss.css">
<title>로그인 페이지</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>

</style>
<body>



<%@ include file="../Include/Header8.jsp" %>
	<section>
	<form action="${pageContext.request.contextPath}/m/Login_check.do"
		method="post">
		<div class="data-box light">
				<div class="data">
					<div>
						<input type="text" name="m_id" placeholder="id" placeholder="아이디"/>
					</div>
					<div>
						<input type="password" name="m_pw" placeholder="pw" placeholder="비밀번호"/>
					</div>
				</div>
			</div>
			<div class="btn-box">
				<!-- <div id="login" class="flex flex-center btn btn2 bold">로그인</div> -->
				<div>
					<input class="flex flex-center btn btn2 bold" type="submit" value="로그인"/>
				</div>
				<div class="flex flex-center kakao">
					<!-- 어디에서 사용할 것인가 ? (ex: 로컬, 도메인) -->
					<!-- local -->
					<script>
					// 배포 할 때마다 변경해야하는 불편함 감소
					document.addEventListener('DOMContentLoaded', function() {
						var Url = window.location.href;	// 현재 페이지 url 변수 저장
						var link = document.getElementById("kakao-login-btn");
						
						console.log(Url);
						// local
						if(Url.includes("http://localhost:8090/app/m/Login.do")){
							link.href = 'https://kauth.kakao.com/oauth/authorize?client_id=ecfda70a16078a6b5a64478901f3dfb3&redirect_uri=http://localhost:8090/app/m/kakao/callback&response_type=code';
						// 도메인
						}else if(Url.includes("https://hwtools.kr/m/Login.do")){
							link.href = 'https://kauth.kakao.com/oauth/authorize?client_id=ecfda70a16078a6b5a64478901f3dfb3&redirect_uri=https://hwtools.kr/m/kakao/callback&response_type=code';
						}
						
					});
					</script>
					<a id="kakao-login-btn" href="">
						<img alt="카카오로그인" src="${pageContext.request.contextPath}/resources/img/Login.jpg">
					</a>
					<!-- local -->
					<!-- 
					<a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?client_id=ecfda70a16078a6b5a64478901f3dfb3&redirect_uri=http://localhost:8090/app/m/kakao/callback&response_type=code">
						<img alt="카카오로그인" src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg">
					</a>
					 -->
					<!-- cswork -->
					<!-- 
					<a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?client_id=ecfda70a16078a6b5a64478901f3dfb3&redirect_uri=http://csworktools.cafe24.com/m/kakao/callback&response_type=code">
						<img alt="카카오로그인" src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg">
					</a>
					-->
					<!--  hwtools (https)  -->
					<!-- 
					<a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?client_id=ecfda70a16078a6b5a64478901f3dfb3&redirect_uri=https://hwtools.kr/m/kakao/callback&response_type=code">
						<img alt="카카오로그인" src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg">
					</a>
					 -->
				</div>
			</div>
		</form>
	</section>
	
	
	
	
	<!-- login form -->
	<%-- <form action="${pageContext.request.contextPath}/m/Login_check.do"
		method="post">
		아이디 : <input type="text" name="m_id" placeholder="id"><br>
		패스워드 : <input type="password" name="m_pw" placeholder="pw"><br>

		<input type="submit" value="로그인">
		
		
		
		
	</form> --%>
	
	<c:if test="${msg == 'error'}">
		<script>
			alert(error);
		</script>
	</c:if>
	
<%@ include file="../Include/Footer.jsp" %>
</body>
<script>
// 쿠키가 있으면 불러오기
function get_cookie(name) {
    var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return value? value[2] : null;
}
</script>
</html>