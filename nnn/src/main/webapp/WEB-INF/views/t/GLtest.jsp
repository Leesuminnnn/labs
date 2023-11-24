<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELLO OAuth</title>
</head>
<body>
	<fieldset>
		<label>로그인</label> <br>
		<div id="googleLoginBtn" style="cursor: pointer">
			<img id="googleLoginImg" src="${pageContext.request.contextPath}/resources/img/btn_google_signin_light_pressed_web.png">
		</div>
	</fieldset>
</body>
<script>
const onClickGoogleLogin = (e) => {
		window.location.replace("https://accounts.google.com/o/oauth2/v2/auth?client_id=1063815197397-8kjbtqv17dtknb5715762mhskl5rrbpu.apps.googleusercontent.com&redirect_uri=http://localhost:8090/app/t/google&response_type=code&scope=email%20profile%20openid%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive.file&access_type=offline")
	}
	
	const googleLoginBtn = document.getElementById("googleLoginBtn");
	googleLoginBtn.addEventListener("click", onClickGoogleLogin);
	
	/*
	code=4/0AfJohXlEzsRg2Y_Aw8wXnr4agpgmYWCb_q4Folm-c5yMF6aRtgEp6KsNLH9AGHyrzw-56g&scope=email%20profile%20openid%20https://www.googleapis.com/auth/userinfo.profile%20https://www.googleapis.com/auth/userinfo.email&authuser=0&prompt=consent
	*/ 
	/*
	code=4/0AfJohXkrOv7WpkYUJ8a-Jv9gkYivzRGnm06k4J6nJGIWcjRfh3rzljvwp62hgb5RAdOlUw&scope=email%20profile%20openid%20https://www.googleapis.com/auth/userinfo.profile%20https://www.googleapis.com/auth/userinfo.email&authuser=0&prompt=consent
	*/
</script>
</html>