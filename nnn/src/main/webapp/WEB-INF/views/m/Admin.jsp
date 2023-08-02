<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Admincss.css">
<title>관리자 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>

</script>
</head>
<style>

</style>
<body>
<form:form action="${pageContext.request.contextPath}/m/Admin.do" method="post">
	<c:if test="${m_status != 2 }">
		<script>
			alert('권한이 없습니다.');
			location.href = "${pageContext.request.contextPath}/";
		</script>
	</c:if>
	<div class="page">
		<header class="flex flex-around">
			<h1>HWT</h1>
			<nav class="flex" style="">
				<ul class="flex flex-between">
					<li class="flex"><a href="#">회원관리</a></li>
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
					<li><a href="#">회원가입승인</a></li>
					<li><a href="#">포인트</a></li>
					<li><a href="${pageContext.request.contextPath}/m/HelpList.do">식사수발</a></li>
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
					<li><a href="${pageContext.request.contextPath}/a/Calendar.do">캘린더관리</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	<section >
		<div class="container">
			<table class="table">
				<thead>
					<tr>
						<td>아이디</td>	<td>이름</td>	<td>기관명</td>	<td>부서명</td>	<td>사번</td>	<td>가입일</td>	<td>승인상태</td>
					</tr>
				</thead>
				<tbody class="result">
					<c:forEach items="${mlist}" var="list">
						<tr>
							<td>${list.m_id }</td>
							<td>${list.m_name }</td>
							<td>${list.m_in }</td>
							<td>${list.m_de }</td>
							<td>${list.m_no }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.m_regdate}"/></td>
							<td>
								<c:choose>
									<c:when test="${list.m_status == 1 }"><p>승인완료</p></c:when>
									<c:otherwise>
										<span onclick="info(this);" data-midx="${list.midx }">승인처리</span>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
</form:form>
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

function info(t){
	var midx = parseInt(t.getAttribute("data-midx"));
//	console.log(midx);
	
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/m/Info',
		data : {
			"midx" : midx
		},
		success : function(response){
			if(response.result === "Y"){
				var result = document.querySelector(".result");
				var list = response.memberlist;
				var table = document.querySelector(".table");
				result.innerHTML = "";
				list.forEach(function (list) {
					
					var tbody = document.createElement("tbody");
					tbody.classList.add("result");
					
					var tr = document.createElement("tr");
					
					var td01 = document.createElement("td");
					td01.textContent = list.m_id;
					
					var td02 = document.createElement("td");
					td02.textContent = list.m_name;
					
					var td03 = document.createElement("td");
					td03.textContent = list.m_in;
					
					var td04 = document.createElement("td");
					td04.textContent = list.m_de;
					
					var td05 = document.createElement("td");
					td05.textContent = list.m_no;
					
					// ** date 변환
					var date = new Date(list.m_regdate);
					//console.log(date.toString());		// Thu Jul 06 2023 09:37:32 GMT+0900 (한국 표준시)
					// getFullYear()는 4자리 연도(예: "2023")를 반환
					var year = date.getFullYear();
					// getMonth()는 0부터 시작하는 월(1월은 0, 2월은 1 등)을 반환
					// 한 자릿수 월, 일, 시, 분이 선행 0으로 채워지도록 하려면 -2 인수와 함께 slice() 메서드를 사용
					var month = ('0' + (date.getMonth() + 1)).slice(-2);
					// getDate( )는 해당 월의 날짜를 반환
					var day = ('0' + date.getDate()).slice(-2);
					// getHours()는 시간(24시간 형식)을 반환
					var hours = ('0' + date.getHours()).slice(-2);
					// getMinutes()는 분을 반환
					var minutes = ('0' + date.getMinutes()).slice(-2);
					var formattedDateTime = year + '-' + month + '-' + day;
					// **
					
					var td06 = document.createElement("td");
					td06.textContent = formattedDateTime;
					
					// 승인상태 변환
					var status = new String(list.m_status);
				//	console.log(status);
					var parstatus = "";
					if(status == 0){
						parstatus = "승인처리"
					}else{
						parstatus = "승인완료"
					}
				
				
					var td07 = document.createElement("td");
					td07.textContent = parstatus;
					
					
					
					table.appendChild(tbody);
					tbody.appendChild(tr);
					tr.appendChild(td01);
					tr.appendChild(td02);
					tr.appendChild(td03);
					tr.appendChild(td04);
					tr.appendChild(td05);
					tr.appendChild(td06);
					tr.appendChild(td07);
				});
				// 페이지 새로고침
				location.reload();
			}
		}
	});
}
</script>
</html>