<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypagecss.css">
<title>마이 페이지</title>
</head>
<style>

</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>

</script>
<body>
<%@ include file="../Include/Header4.jsp" %>
<section>
	<form action="" method="post">
		<!-- 사용자 정보 start -->
		<div class="container">
			<div class="first-content">
				<div>
					<div class="light content-text1">안녕하세요.</div>
					<div class="normal content-text2">
					<b class="bold content-text3">
					${detail.m_name}
					<c:set var="midx" value="${detail.midx }"/>
					</b>님[${detail.m_no }]</div>
				</div>
			</div>
			<div class="second-content" onclick="location.href='${pageContext.request.contextPath}/m/Point.do/${detail.m_name}/1/${start}/${end}'">
				<div class="normal content-text1 content-text5">보유포인트</div>
				<div class="normal content-text4">
				<b>
				<fmt:formatNumber var="point" value="${detail.m_point}" pattern="#,###,###"/>
				<c:if test="${point == null}">0</c:if>
				${point }&nbsp;P
				</b></div>
			</div>
		</div>
		<!-- 사용자 정보 end -->
		<div class="line"></div>
		<div class="list flex" onclick="location.href='${pageContext.request.contextPath}/m/Detail.do/${detail.m_name}'">
			<img src="${pageContext.request.contextPath}/resources/icon/mypage_modify.png">
			<div class="text light">회원정보변경</div>
		</div>
		<div class="line2"></div>
		<div class="list flex" onclick="location.href='#'">
			<img src="${pageContext.request.contextPath}/resources/icon/mypage_x.png">
			<div class="text light">회원탈퇴</div>
		</div>
		<div class="line2"></div>
	</form>
</section>
<%@ include file="../Include/Footer.jsp" %>
</body>
</html>