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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/CounselListcss.css?0307">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hwt/demoheadercss.css?after">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="icon" sizes="192x192" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<title>전자문서 검색</title>
<style>


</style>
</head>
<body class="normal" style="font-size: 14pt; background:#f7f7f7;">
<%@ include file="header.jsp" %>


<section style=""> 
	<div class="nav__section" style=" ">
		<div class="nav__link active" data-menu="userall" data-content="all" onclick="location.href='${pageContext.request.contextPath}/hwt/CounselList.do'">
			<img class="icon-image" src="${pageContext.request.contextPath}/resources/icon/list_on.png">
			<a class="" style="color: #fff; font-size:18px;" ><span>서&nbsp;약&nbsp;서&nbsp;목&nbsp;록</span></a>
		</div>
		<div class="nav__link" data-menu="perall" data-content="all" onclick="location.href='${pageContext.request.contextPath}/hwt/Written.do'">
			<img class="icon-image" src="${pageContext.request.contextPath}/resources/icon/sign_off.png">
			<a class="" style="color: #c3c3c3; font-size:18px;" ><span>서&nbsp;약&nbsp;서&nbsp;등&nbsp;록</span></a>
		</div>
	</div>
	<main id="main-content" >
		<!-- 내용을 이곳에 추가 -->
		<!-- class="col-md-9 ms-sm-auto col-lg-10 px-md-4"  -->
		<div class="pd"></div>
		<div class="scroll-container">
		<form action="
			<c:choose>
				<c:when test="${keyword1 == '' and keyword2 == '' and keyword3 == ''}">
				${pageContext.request.contextPath}/hwt/CounselList
				</c:when>
				<c:otherwise>
				${pageContext.request.contextPath}/hwt/CounselListSearch
				</c:otherwise>
			</c:choose>	
		">
		<div class="flex flex-center " style="text-align: center; height: 88px; background-color: #f7f7f7; color:#2f2f2f; padding:13px 20px;;">
			<div class="dv_tx" style="">환자명</div><input class="ip_tx" type="text" name="keyword1" id="keyword1" onkeyup="keyword1text()"/>
			<div class="dv_tx" style="">보호자명</div><input class="ip_tx" type="text" name="keyword2" id="keyword2" onkeyup="keyword2text()"/>
			<div class="dv_tx" style="">전화번호</div><input class="ip_tx ip_pn" type="text" name="keyword3" id="keyword3" onkeyup="keyword3text()"/>
			<input class="ip_sb" style="cursor: pointer;" type="submit" value="검색"/>&nbsp;
			<a class="ip_sb ip_sb2" style="cursor: pointer; padding-top:10px;" href="${pageContext.request.contextPath}/hwt/Written.do">등록</a>
		</div>
		<div style="border-bottom: 1px solid #ddd"></div>
			<table class="infotable">
				  <colgroup>
                    <col width="12%">
                    <col width="12%">
                    <col width="11%">
                    <col width="9%">
                    <col width="9%">
                    <col width="9%">
                    <col width="12%">
                    <col width="10%">
                    <col width="*">
                </colgroup>
				<thead>
					<tr>
						<th class="sticky-top info-sticky-top">작성일</th>
						<th class="sticky-top info-sticky-top">차트번호</th>
						<th class="sticky-top info-sticky-top">환자명</th>
						<th class="sticky-top info-sticky-top">신청자</th>
						<th class="sticky-top info-sticky-top">주보호자</th>
						<th class="sticky-top info-sticky-top">부보호자</th>
						<th class="sticky-top info-sticky-top">종류</th>
						<th class="sticky-top info-sticky-top">상태</th>
						<th class="sticky-top info-sticky-top">서명란</th>
					</tr>
				</thead>
				<c:choose>
			<c:when test="${keyword == 1}">
				<c:forEach items="${cslist}" var="list">
				<tr class="light list-tr" style="border-bottom: 1px solid #e9e9e9; color: #000000;">
					<td>${list.cs_data_31}</td>
					<td>${list.cs_data_02}</td>
					<td>${list.cs_data_01}</td>
					<td>${list.cs_data_29}</td>
					<td>${list.cs_data_07}</td>
					<td>${list.cs_data_12}</td>
					<td>입원서약서</td>
					<td>
						<c:choose>
							<c:when test="${list.cs_data_30 == 1}">
								임시저장
							</c:when>
							<c:otherwise>
								등록완료
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<div style="display: flex; align-items: center; vertical-align: middle; justify-content: center; padding:13px 20px;">
							<c:choose>
								<c:when test="${list.cs_data_30 == 1}">
									<div class="save flex flex-center" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/hwt/WrittenModify/${list.cs_idx}'">서명</div>
								</c:when>
								<c:otherwise>
									<div class="sb flex flex-center" style="cursor: pointer; margin-right: 5px;" onclick="window.open('${pageContext.request.contextPath}/hwt/WrittenView/${list.cs_idx}')">보기</div>
									<div class="sb flex flex-center" style="cursor: pointer; margin-left: 5px;">
									<a download="${list.cs_idx}" href="${pageContext.request.contextPath}/hwt/WrittenView/${list.cs_idx}" >
										<img src="${pageContext.request.contextPath}/resources/icon/dwonload_icon_w.png" style="width: 40px; vertical-align: middle;">
									</a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</td>
				</tr>
				<c:set value="1" var="keyword"/>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach items="${matchingList}" var="list">
				<tr class="light list-tr" style="border-bottom: 1px solid #e9e9e9; color: #000000; <c:if test ="${keyword == 1}">display:none;</c:if>" >
					<td>${list.cs_data_31}</td>
					<td>${list.cs_data_02}</td>
					<td>${list.cs_data_01}</td>
					<td>${list.cs_data_29}</td>
					<td>${list.cs_data_07}</td>
					<td>${list.cs_data_12}</td>
					<td>입원서약서</td>
					<td>
						<c:choose>
							<c:when test="${list.cs_data_30 == 1}">
								임시저장
							</c:when>
							<c:otherwise>
								등록완료
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<div style="display: flex; align-items: center; vertical-align: middle; justify-content: center; padding:13px 20px;">
						<c:choose>
							<c:when test="${list.cs_data_30 == 1}">
								<div class="save flex flex-center" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/hwt/WrittenModify/${list.cs_idx}'">서명</div>
							</c:when>
							<c:otherwise>
								<div class="sb flex flex-center" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/hwt/WrittenView/${list.cs_idx}'">보기</div>
								<div class="sb flex flex-center" style="cursor: pointer; margin-left: 5px;">
									<a download="${list.cs_idx}" href="${pageContext.request.contextPath}/hwt/WrittenView/${list.cs_idx}" >
										<img src="${pageContext.request.contextPath}/resources/icon/dwonload_icon_w.png" style="width: 40px; vertical-align: middle;">
									</a>
									</div>
							</c:otherwise>
						</c:choose>
						</div>
					</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
	</form>
	</div>
	</main>
	
</section>

<script>

const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const msg = document.querySelector('.menu_msg');
const modal3 = document.querySelector('.modal3');
const msg3 = document.querySelector('.menu_msg3');
const modal4 = document.querySelector('.modal4');
const msg4 = document.querySelector('.menu_msg4');

const menuLinks = document.querySelectorAll('.nav__link'); // 메뉴 링크 요소들

let currentMenuIndex = 0; // 현재 메뉴 인덱스

let isScriptActive = true; // 스크립트의 활성화 상태를 나타내는 변수
let lastMenuVisited = false; // 사용자가 마지막 메뉴를 방문했는지 여부를 나타내는 변수
let inactiveTime = 0; // 페이지 비활성 시간을 나타내는 변수
let timer = null; // 타이머 변수
let lastMenuVisitTime = 0;

/* 메뉴 활성화 및 해당 스크립트 실행 함수 */

/* COLLAPSE MENU */


// const linkCollapse = document.getElementsByClassName('collapse__link')
// var i

// for(i=0;i<linkCollapse.length;i++) {
//     linkCollapse[i].addEventListener('click', function(){
//         const collapseMenu = this.nextElementSibling
//         collapseMenu.classList.toggle('showCollapse')

//         const rotate = collapseMenu.previousElementSibling
//         rotate.classList.toggle('rotate')
//     });
// }
// const mainContent = document.getElementById('main-content');

// menuLinks.forEach(link => {
// 	link.addEventListener('click', function(event){
// 		event.preventDefault();
// 		currentMenuIndex = Array.from(menuLinks).indexOf(this);	// 클린된 메뉴의 인덱스를 업데이트
// 		activateMenu(currentMenuIndex);
		
// 	});
// });

</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- <script>
$(document).ready(function(){
	var deviceWidth = $(window).width();
	var deviceHeight = $(window).height();
	var he = $('.container').height();
	var he2 = $('section').height();
	if (deviceWidth < 768) {
	  $('.dv_tx').css('font-size', '10pt');
	} else if (deviceWidth < 992) {
	  $('.dv_tx').css('font-size', '12pt');
	} else if (deviceWidth < 1400) {
	  $('.dv_tx').css('font-size', '13pt');
	} else {
	  $('.dv_tx').css('font-size', '16pt');
	}
	
	if(he < 800){
		$('.container').css({
			"height" : "calc(100vh - 45px)"
			
		});
		console.log("여기 실행됨");
	}
	console.log(deviceHeight);
	console.log(he);
	console.log(he2);
});
</script> -->
<script>
function keyword1text(){
	let value = $('#keyword1').val();
	console.log(value);
}
function keyword2text(){
	let value = $('#keyword2').val();
	console.log(value);
}
function keyword3text(){
	let value = $('#keyword3').val();
	console.log(value);
}
</script>

</body>
</html>