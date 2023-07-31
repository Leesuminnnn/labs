<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 페이지</title>
</head>
<style>
a {
	text-decoration: none;
}
</style>
<body>
	<table>
		<tr>
			<td colspan=1>회원정보</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${detail.m_id}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${detail.m_name}</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>${detail.m_pw}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${detail.m_email}</td>
		</tr>
	</table>
	<a href="${pageContext.request.contextPath}/">홈으로</a>
</body>
</html>