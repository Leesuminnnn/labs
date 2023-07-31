<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Core Work Tools</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
	.container{
	
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>

<body>
<div class="container">
	<!-- 로그인시 출력되는 정보 -->
	<!-- userid = 카카오로그인
		 m_id = 회원로그인
	 -->
	<div>
	<c:choose>
		<c:when test="${sessionScope.loginMember.m_id == null}">
			<!-- 로그인을 하지 않은 경우 -->
			<a href="${pageContext.request.contextPath}/m/Login.do">로그인</a><br>
		</c:when>
		<c:otherwise>
			<!-- 로그인을 한 경우 -->	
			
			<%-- 
			<a href="${pageContext.request.contextPath}/m/Detail.do/${midx}">내정보</a>
			 --%>
			<a href="#">내정보</a>
			<a href="${pageContext.request.contextPath}/m/Logout.do">로그아웃</a><br>
		</c:otherwise>
	</c:choose>

	
	
	</div>
	<form method="get" name="frm">
		<h3>Core Work Tools</h3>
		
		<a href="${pageContext.request.contextPath}/h/List.do">식사수발</a>
		<a href="#">앰블런스</a>
		<a href="#">차량관리</a>
		<a href="#">면회신청</a>
		<a href="#">봉사신청</a>
		<a href="#">업무일지</a>
	</form>
<div>
<br>
	<a href="${pageContext.request.contextPath}/">홈으로</a>
	</div>
</div>

</body>

</html>