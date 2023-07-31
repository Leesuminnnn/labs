<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>Home</title>
<style type="text/css">
.container {
	padding-top: 150px;;
	text-align: center;
}

</style>
</head>

<body>

	<div class="container">
	<form name="frm" method="get"
		action="${pageContext.request.contextPath}/b/List.do?">
		<div class="search_box">
			<input type="text" name="keyword">
			<button type="submit">검색</button>
			<div></div>
		</div>

	</form>
		<div class="link">
		<%-- 세션에 저장된 아이디가 있을 경우 출력되는 화면 --%>
		<c:choose>
			<c:when test="${sessionScope.loginMember.m_id != null}">
			
				 <c:choose>
				 	<%--세션에 저장된 아이디가 있고, 그 아이디의 정보 중 m_status가 (2)관리자 일경우 출력되는 화면--%>
				 	<c:when test="${sessionScope.loginMember.m_status == 2}">
					 	관리자 입니다.<br>
						<a href="${pageContext.request.contextPath}/m/Admin.do">관리자페이지</a>	
						<a href="${pageContext.request.contextPath}/m/Logout.do">로그아웃</a><br>
				 	</c:when>
				 	<%--그 외에는 회원이기 때문에 출력되는 화면 --%>
				 	<c:otherwise>
				 		회원입니다.<br>
				 		<a href="#">내정보</a><br>
				 		<a href="${pageContext.request.contextPath}/m/Logout.do">로그아웃</a><br>
				 	</c:otherwise>
				 </c:choose>
			</c:when>
			<%--세션에 저장된 아이디가 없을 경우 출력되는 화면 --%>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/m/Login.do">로그인페이지 이동</a><br>
			</c:otherwise>
		</c:choose>
			<a href="${pageContext.request.contextPath}/b/List.do">게시판목록</a><br>
			<a href="${pageContext.request.contextPath}/h/Main.do">식사수발메인화면이동</a>
		</div>
	</div>
</body>
</html>
