<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post form</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/c/Written.do" method="post">
<input name="param1" type="text" value="이름">
<input name="param2" type="text" value="성별">
<input name="param3" type="text" value="생년월일">
<input name="param4" type="text" value="등록번호">
<input name="param5" type="text" value="입원병실">
<input name="param6" type="text" value="전화">
<input type="submit" value="전송">
</form>

</body>
</html>