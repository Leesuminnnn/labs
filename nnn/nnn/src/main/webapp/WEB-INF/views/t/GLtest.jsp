<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- content에 자신의 OAuth2.0 클라이언트ID를 넣습니다. -->
<meta name ="google-signin-client_id" content="1063815197397-8kjbtqv17dtknb5715762mhskl5rrbpu.apps.googleusercontent.com">
<title>HELLO OAuth</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 
    <div id="g_id_onload"
         data-client_id="1063815197397-8kjbtqv17dtknb5715762mhskl5rrbpu.apps.googleusercontent.com"
         data-callback="handleCredentialResponse">
    </div>
    <div class="g_id_signin" data-type="standard"></div> -->
    
    <script>
    function handleCredentialResponse(response) {
    	const responsePayload = parseJwt(response.credential);
    	console.log("ID: " + responsePayload.sub);
        console.log('Full Name: ' + responsePayload.name);
        console.log('Given Name: ' + responsePayload.given_name);
        console.log('Family Name: ' + responsePayload.family_name);
        console.log("Image URL: " + responsePayload.picture);
        console.log("Email: " + responsePayload.email);
    }
    function parseJwt (token) {
        var base64Url = token.split('.')[1];
        var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
        var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
            return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        }).join(''));

        return JSON.parse(jsonPayload);
    };
    window.onload = function () {
    google.accounts.id.initialize({
      client_id: '1063815197397-8kjbtqv17dtknb5715762mhskl5rrbpu.apps.googleusercontent.com',
      callback: handleCredentialResponse
    });
    google.accounts.id.prompt();
    
  };
</script>
<div id="buttonDiv"></div> 
</body>
</html>