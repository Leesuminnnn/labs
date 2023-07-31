<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- Web App으로 선언하여 브라우저의 UI ( URL 바 ) 를 안 보이도록 할 수 있다. -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="user-scalable=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/noticeViewcss.css">
<style>
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>

<body>
<%@ include file="../Include/Header7.jsp" %>
<section>
<div class="flex flex-between list">
	<div>
		<div class="normal list-title">
			${vo.b_title}
		</div>
		<div class="light list-date">
		<fmt:formatDate value="${vo.b_regdate }" pattern="yyyy-MM-dd HH:mm" var="b_regdate"/>
			${b_regdate}
		</div>
	</div>	
</div>
<div class="line"></div>
<div class="content normal">
<p>${vo.b_content }</p>
</div>
</section>
<%@ include file="../Include/Footer.jsp" %>
</body>

</html>