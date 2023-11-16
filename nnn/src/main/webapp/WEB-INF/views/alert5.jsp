<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<input type="hidden" name="midx" value="${sessionScope.midx }">
	<script>
		var msg = "${msg}";
		var url = "${url}";
		history.pushState(null, null, location.href);
		window.onpopstate = function(event) {
		    history.go(1);
		};


		<%
		
		
		%>
		alert(msg);
		location.href = "${pageContext.request.contextPath}/"+url;
	</script>
</body>
</html>