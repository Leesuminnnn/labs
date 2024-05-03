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
		
		var urlsp = url.split('&');
		console.log(urlsp);
		//  ['h/Insert.do?h_name=6', 'amp;h_no=6', 'amp;h_number=6']
		console.log(urlsp[0]);
		console.log(urlsp[1]);
		console.log(urlsp[2]);
		
		var spsub1 = urlsp[0].slice(12);
		var spsub2 = urlsp[1].slice(4);
		var spsub3 = urlsp[2].slice(4);
		console.log(spsub1);
		console.log(spsub2);
		console.log(spsub3);
		
		var urlsl = url.slice(0,12);
		console.log(urlsl);
		
		alert(msg);
		location.href = "${pageContext.request.contextPath}/"+urlsl+spsub1+"&"+spsub2+"&"+spsub3;
	</script>
</body>
</html>