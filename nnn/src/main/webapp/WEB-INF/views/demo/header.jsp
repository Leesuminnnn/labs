<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrapper">
	<div class="logo">
		<c:if test="${sessionScope.loginmember eq 12365478}">
			<div class="home-icon">
				<a href="${pageContext.request.contextPath}/demo/admin">
					<img src="${pageContext.request.contextPath}/resources/icon/home_y.png">
				</a>
			</div>
		</c:if>
		<div class="logo-img">
			<img src="${pageContext.request.contextPath}/resources/icon/ev/core_logo2.png">
		</div>
		<div class="logout-img">
			<a href="${pageContext.request.contextPath}/demo/Logout">
				<img src="${pageContext.request.contextPath}/resources/icon/ev/logout.png">
			</a>
		</div>
	</div>
</div>
