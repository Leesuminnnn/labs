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
.data {
	text-align : left;	
}
.search_box{
	text-align : right;
	}
.table{
	margin-top : 100px;
	width:1000px;
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	margin-left: auto;
    margin-right: auto;
}
tr td{
	border: 1px solid black;
	padding : 10px;
}

.container{
	width:1000px;
	margin-left: auto;
    margin-right: auto;
	
}
ul{
list-style-type: none;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>

<body>
<div class="container">
	<!-- 로그인시 출력되는 정보 -->
	<div style="text-align : right">
	<!-- 가입승인중 인 경우 (m_status == 0) -->
	<c:if test="${sessionScope.loginMember.m_status == 0}">
		<script>
			alert('현재 가입승인중인 계정입니다.');
			location.href = "${pageContext.request.contextPath}/";
		</script>
	</c:if>
	
	</div>
	<form method="get" name="frm">
		<div class="data">
			<div>최근수행 : 2023.02.22</div>
			<div>금주누적 : 1회 금월누적 : 3회 연간누적 : 23회</div>
		</div>
		<div class="search_box">
			<input type="date" name="h_startTime">~
			<input type="date" name="h_endTime">
			<input type="submit" value="검색" />
		</div>
		
		<div>수발기록</div>
		<table class="table">
			<tr>
				<td rowspan="3" width="150px;" height="150px">이미지</td>
				<td> 일시 : 2023.02.22 12:02</td>
			</tr>
			<tr>
			
				<td> 9병동 3호실 2번 침상</td>
			</tr>
			<tr>
			
				<td> 소요시간 : 16분</td>
			</tr>
	
		</table>
	
	
	</form>
	<div>
	<a href="${pageContext.request.contextPath}/">홈으로</a>
	<a href="#">마이포인트</a>
	<a href="${pageContext.request.contextPath}/h/Insert.do">신규등록</a>
	</div>
</div>

</body>

</html>