<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/HelpListcss.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/Admincss.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>

</script>
</head>
<body>
<form>
<c:if test="${m_status != 2 }">
		<script>
			alert('권한이 없습니다.');
			location.href = "<%=request.getContextPath() %>/";
		</script>
	</c:if>
	<div class="page">
		<header class="flex flex-around">
			<h1>HWT</h1>
			<nav class="flex" style="">
				<ul class="flex flex-between">
					<li class="flex"><a href="">회원관리</a></li>
					<li class="flex"><a href="#">플랫폼관리</a></li>
					<li class="flex"><a href="#">엠블런스관리</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<nav class="left-nav">
		<ul class="main-menu main1">
			<li><a href="#" onclick="menucontrol1()">회원관리</a>
				<ul class="sub-menu" id="menu1">	
					<li><a href="${pageContext.request.contextPath}/m/Admin.do">회원가입승인</a></li>
					<li><a href="#">포인트</a></li>
					<li><a href="#">식사수발</a></li>
				</ul>
			</li>
		</ul>
		<ul class="main-menu main2">
			<li><a href="#" onclick="menucontrol2()">플랫폼관리</a>
				<ul class="sub-menu" id="menu2">
					<li><a href="#">공지사항관리</a></li>
				</ul>
			</li>
		</ul>
		<ul class="main-menu main3">
			<li><a href="#" onclick="menucontrol3()">엠블런스관리</a>
				<ul class="sub-menu" id="menu3">
					<li><a href="#">예약관리</a></li>
					<li><a href="#">캘린더관리</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	<section>
		<div class="flex flex-start">
			<div style="margin-right: 10px; cursor: pointer;" onclick="location.reload();">식사수발 내역</div>
			<div>시간대 설정</div>
		</div>
		<div class="container">
			<div class="flex flex-center help center">
				<div>이름</div>
				<div>병동</div>
				<div>병실</div>
				<div>침상</div>
				<div>시작시간</div>
				<div>끝난시간</div>
				<div>소요시간</div>
				<div>코멘트</div>
			</div>
			<c:forEach items="${list }" var="l">
				<div class="flex flex-center help center">
					<div>${l.h_userName }</div>
					<div>${l.h_name }</div>
					<div>${l.h_no }</div>
					<div>${l.h_number }</div>
					<div>
						<fmt:formatDate value="${l.h_startTime }" pattern="yyyy-MM-dd HH:mm"/>
					</div>
					<div>
						<fmt:formatDate value="${l.h_endTime }" pattern="yyyy-MM-dd HH:mm"/>
					</div>
					<div>
						<c:set var="elapsedTime" value="${(l.h_endTime.time - l.h_startTime.time)}" />
						<fmt:formatNumber value="${elapsedTime/1000/60}" pattern="#"/>분
					</div>
					<div>
						${l.h_comm }
					</div>
				</div>
				
			</c:forEach>
		</div>
	</section>	
</form>
</body>
<script>

var sub1 = document.getElementById('menu1');
var sub2 = document.getElementById('menu2');
var sub3 = document.getElementById('menu3');
var main1 = document.getElementById('main1');
var main2 = document.getElementById('main2');
var main3 = document.getElementById('main3');

function menucontrol1(){
	if(sub1.classList.contains('open')){
		sub1.classList.remove('open');
	}else{
		sub1.classList.add('open');
	}
}

function menucontrol2(){
	if(sub2.classList.contains('open')){
		sub2.classList.remove('open');
	}else{
		sub2.classList.add('open');
	}
}

function menucontrol3(){
	if(sub3.classList.contains('open')){
		sub3.classList.remove('open');
	}else{
		sub3.classList.add('open');
	}
}
</script>
</html>