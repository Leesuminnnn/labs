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
		var msg = "<c:out value='${msg}'/>";
		var url = "<c:out value='${url}'/>";
		
		
		alert(msg);
		location.href = "${pageContext.request.contextPath}/"+url;
	</script>
</body>
</html>