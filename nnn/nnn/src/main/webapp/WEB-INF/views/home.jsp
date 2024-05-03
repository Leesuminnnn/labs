<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<!-- 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 -->
<title>Home</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">

 <!-- 
 <link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
 -->
 <style type="text/css">

.container {
	padding-top: 150px;;
	text-align: center;
}

</style>
</head>

<body>
<section class="normal">
<div class="container">
	<%-- 
	<form name="frm" method="get"
		action="${pageContext.request.contextPath}/b/List.do?">
		<div class="search_box">
			<input type="text" name="keyword">
			<button type="submit">검색</button>
			<div></div>
		</div>

	</form>
	 --%>
		<div class="link light" style="font-size: 30pt;">
		<%-- 
		<c:if test="${nickname != null and }">
		<script>
			alert("정보입력");
			window.location.href="${pageContext.request.contextPath}/m/Detail.do";
		</script>
		</c:if>
		 --%>
		<%--카카오 로그인 --%>
		<c:choose>
			<c:when test="${sessionScope.loginMembmer.nickname == null }">
			
			</c:when>
			<c:otherwise>
			<span>로그인 정보</span>
				nickname<br>
				${nickname}<br><br>
				
				email<br>
				${email}<br><br>
			</c:otherwise>
		</c:choose>
		
		<%--유저 로그인 
		
		sessionScope.loginMember.m_id<br>
		${sessionScope.loginMember.m_id}<br>
		${sessionScope.loginMember}<br>
		${sessionScope.m_status }<br>
		--%>
		<%-- ${loginMember}<br> --%>
		
		<c:choose>
			<c:when test="${sessionScope.loginMember.m_id != null or nickname != null}" >
			
				 <c:choose>
				 	<%--세션에 저장된 아이디가 있고, 그 아이디의 정보 중 m_status가 (2)관리자 일경우 출력되는 화면 --%>
				 	<c:when test="${sessionScope.loginMember.m_status == 2}">
					 	관리자 입니다.<br><br>
						<a href="${pageContext.request.contextPath}/m/Admin.do">관리자페이지</a><br><br>
						<a href="${pageContext.request.contextPath}/m/Logout.do">로그아웃</a><br><br>
				 	</c:when>
				 	<%--그 외에는 회원이기 때문에 출력되는 화면 --%>
				 	<c:otherwise>
				 		회원입니다.<br>
				 		<c:if test="${sessionScope.loginMember.m_id != null }"><br>
				 		<a href="#">내정보</a><br><br>
				 		<a href="${pageContext.request.contextPath}/m/Logout.do">로그아웃</a><br><br>
				 		</c:if>
				 	</c:otherwise>
				 </c:choose>
			</c:when>
			<%--세션에 저장된 아이디가 없을 경우 출력되는 화면 --%>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/m/Login.do">로그인페이지 이동</a><br><br>
			</c:otherwise>
		</c:choose>
		
		
		<%-- 
			<a href="${pageContext.request.contextPath}/b/List.do">게시판목록</a><br> --%>
			<a href="${pageContext.request.contextPath}/h/Main.do">식사수발메인화면이동</a><br><br>
			<a href="${pageContext.request.contextPath}/m/Logout.do">로그아웃</a><br>
			
		</div>
	</div>
</section>
	
<%@ include file="Include/Footer.jsp" %>
</body>
</html>
