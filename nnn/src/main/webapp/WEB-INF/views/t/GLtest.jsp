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
    <div id="g_id_onload"
         data-client_id="1063815197397-8kjbtqv17dtknb5715762mhskl5rrbpu.apps.googleusercontent.com"
         data-callback="handleCredentialResponse">
    </div>
    <div class="g_id_signin" data-type="standard"></div>
    <script>
    google.accounts.id.initialize(IdConfiguration)
    function handleCredentialResponse(response) {
      console.log("Encoded JWT ID token: " + response.credential);
    }
    window.onload = function () {
    google.accounts.id.initialize({
      client_id: '1063815197397-8kjbtqv17dtknb5715762mhskl5rrbpu.apps.googleusercontent.com',
      callback: handleCredentialResponse
    });
    google.accounts.id.prompt();
    
  };
    </script>
</body>
</html>