<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrapper">
	<div class="logo">
			<div class="home-icon">
				<%-- <a href="${pageContext.request.contextPath}/mediplat/Main/${info.idx}" style="font-size: 2rem; color: #fff;">
					MEDIPLAT
				</a> --%>
			</div>
		<div class="logo-img">
			<img src="${pageContext.request.contextPath}/resources/icon/ev/core_logo2.png">
		</div>
		<div class="logout-img">
			<a href="${pageContext.request.contextPath}/hwt/Logout">
				<img src="${pageContext.request.contextPath}/resources/icon/ev/logout.png">
			</a>
		</div>
	</div>
</div>
