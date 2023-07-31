<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.search_box{
	padding-top : 150px;;
	text-align : right;
	}
.table{
	margin-top : 100px;
	width:1000px;
	border-bottom: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	margin-left: auto;
    margin-right: auto;
}
tr td{
	border-bottom: 1px solid black;
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
	<form method="get" name="frm">
		<div class="search_box">
			<input type="text" name="keyword"/> <input type="submit" value="검색" />
		</div>
	
	<table class="table">
		<tr style="text-align:center;">
			<td>이미지</td>
			<td>제목</td>
			<td>내용</td>
			<td>제작일자</td>
			<td>제작기관</td>
			<td>제작자</td>
			<td>자료형태</td>
			<td>자료위치</td>
			<td>비고</td>
		</tr>
		<c:forEach var="list" items="${blist}">
		
		<tr>
			<td> </td>
			<td>${list.b_title}</td>
			<td>${list.b_content}</td>
			<td>${list.b_regdate}</td>
			<td>${list.b_institution}</td>
			<td>${list.b_writer}</td>
			<td>${list.b_place}</td>
			<td>${list.b_where}</td>
			<td>${list.b_note}</td>
		</tr>
		</c:forEach>
		
		

	</table>
	
	
</form>
<div>
	<a href="${pageContext.request.contextPath}/">홈으로</a>
	</div>
</div>

</body>

</html>