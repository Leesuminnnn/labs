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
<script>






</script>
</head>

<body>
<div class="container">
	<!-- 로그인시 출력되는 정보 -->
	<div style="text-align : right">
	<c:if test="${sessionScope.member_id != null}">
		${sessionScope.member_name} ( ${sessionScope.member_id} ) 님 
	</c:if>
	</div>
	<form method="get" name="frm" action="${pageContext.request.contextPath}/h/InsertProcess.do">
		<div class="scan">
			<a href="#">QR스캔</a>
		</div>
		
		<div>수발기록</div>
		<table class="table">
			<tr>
				
				<td> 병동명 : <input type="text" name="h_name"></td>
			</tr>
			<tr>
			
				<td> 병실번호 : <input type="text" name="h_no"></td>
			</tr>
			<tr>
			
				<td> 침상번호 : <input type="text" name="h_number"></td>
			</tr>
	
		</table>
	
		<a href="#">수발시작</a>
		<a href="#">수발완료</a>
	</form>
	<div >
	
	</div>
</div>

</body>

</html>