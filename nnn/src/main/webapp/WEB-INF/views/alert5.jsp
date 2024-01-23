<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<title></title>
</head>
<body>
	<input type="hidden" name="midx" value="${sessionScope.midx }">
	
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
	$(function(){
		var msg = "${msg}";
		var url = "${url}";
		
		history.pushState(null, null, location.href);
		window.onpopstate = function(event) {
		    history.go(1);
		};
		alert(msg);
		location.href = "${pageContext.request.contextPath}/"+url;
	});
		
	</script>
</body>
</html>