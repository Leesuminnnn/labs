<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Calendarcss.css">
<title>Calendar</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
</style>
</head>
<body>
<div class="container">
<div class="calendar">
    <div class="header">
      <div class="year-month"></div>
      <div class="nav">
        <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
        <button class="nav-btn go-today" onclick="goToday()">Today</button>
        <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
      </div>
    </div>
    <div class="main">
      <div class="days">
        <div class="day">일</div>
        <div class="day">월</div>
        <div class="day">화</div>
        <div class="day">수</div>
        <div class="day">목</div>
        <div class="day">금</div>
        <div class="day">토</div>
      </div>
      <div class="dates"></div>
    </div>
  </div>
</div>
<div class="flex flex-end plan" id="plan" style="width: 600px; cursor: pointer;">예약하기</div>
<div class="modal normal">
	<div class="modal_body">
		<div>
			<img class="del-icon" src="${pageContext.request.contextPath}/resources/icon/del.png" onclick="closePopup()">
			<div class="text3 normal">엠블런스 예약 하기</div>
			<div class="comment light" id="comment">
				<div id="result">
				</div>
			</div>
			
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/calendar.js"></script>
</body>
</html>