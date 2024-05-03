<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web App으로 선언하여 브라우저의 UI ( URL 바 ) 를 안 보이도록 할 수 있다. -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="user-scalable=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/CounselListcss.css">
<title>List</title>
</head>
<body class="normal" style="font-size: 14pt; ">
<form action="${pageContext.request.contextPath}/t/TestListsearch.do">
<%-- 
<input type="hidden" name="keyword1" value="${pageMaker.cri.keyword1}">
<input type="hidden" name="keyword2" value="${pageMaker.cri.keyword2}">
<input type="hidden" name="keyword3" value="${pageMaker.cri.keyword3}">
 --%>
<div class="flex flex-center" style="text-align: center; height: 88px;">
	<div class="">환자명</div><input class="" type="text" name="keyword1"/>
	<div class="">보호자명</div><input class="" type="text" name="keyword2"/>
	<div class="">전화번호</div><input class="" type="text" name="keyword3"/>
	<input class="" style="cursor: pointer;" type="submit" value="검색"/>
</div>
<div style="border-bottom: 1px solid #ddd"></div>

<div class="flex" style="justify-content: space-around;">
	<div>작성일</div>
	<div>환자명</div>
	<div>신청자</div>
	<div>주보호자</div>
	<div>부보호자</div>
	<div>종류</div>
	<div>상태</div>
</div>
<c:forEach items="${cslist}" var="list">
<div class="flex" style="justify-content: space-around;">
	<div>${list.cs_data_31}</div>
	<div>${list.cs_data_01 }</div>
	<div>${list.cs_data_29}</div>
	<div>${list.cs_data_07 }</div>
	<div>${list.cs_data_12 }</div>
	<div>입원서약서</div>
	<div>
		<c:choose>
			<c:when test="${list.cs_data_30 == 1}">
				임시저장 <div style="display: inline-block; cursor: pointer;" <%-- onclick="location.href='${pageContext.request.contextPath}/c/WrittenModify.do/${list.cs_idx}'" --%>>서명</div>
			</c:when>
			<c:otherwise>
				등록완료 <div style="display: inline-block; cursor: pointer;" <%-- onclick="location.href='${pageContext.request.contextPath}/c/WrittenView.do/'" --%>>보기</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</c:forEach>
</form>
</body>
</html>