<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body><%-- 
	<c:forEach items="sub" var="s">
		${s.subcode }
	</c:forEach> --%>
	<div>
	test
	<c:forEach items="${user }" var="u">
		<c:if test="${u.c_name eq '효사랑전주요양병원' }">
			${u.name }
		</c:if>
	</c:forEach>
	</div>
	
	<%-- <c:forEach items="userop">
	
	</c:forEach> --%>
</body>
</html>