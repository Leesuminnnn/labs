<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<div>
이곳은 마이페이지입니다.
</div>
<div>
${info.name} 님의 코드는 ${info.hspt_name } 입니다.
</div>
<br>
<div>
코드 ${info.hspt_name }에 속한 유저는<br>
<c:forEach items="${target}" var="t" >
	${t.name}<br>
</c:forEach>
</div>
</body>
</html>