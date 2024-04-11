<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hwt/admin_css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css?ver=0227">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demoheadercss.css?ver=0227">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="icon" sizes="192x192" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<%-- 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin_css.css"> --%>
<meta name="viewport" content="width=device-width, initial-scale=1" >
<title>코어솔루션 전자문서 시스템</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<style>

</style>
</head>
<body>
<form id="frm">
<jsp:include page="header.jsp"></jsp:include>

<section style="display: flex; margin-top: 62px;"> 
	<div style=" width: 240px; background: #2f425a; color:#c3c3c3; position: fixed; height: 100%">
		<div class="nav__link active" data-menu="userall" data-content="all">
			<img class="icon-image" style="margin-right: 10px;" src="${pageContext.request.contextPath}/resources/icon/ev/member_icon_on.png">
			<span class="nav_name">직원DB설정</span>
		</div><%-- 
		<div class="nav__link" data-menu="perall" data-content="all"  style="">
			<img class="icon-image" style="margin-right: 10px;" src="${pageContext.request.contextPath}/resources/icon/ev/ev_icon_off.png">
			<span>인사평가 관리</span>
		</div> --%>
		<div class="nav__link" data-menu="setting" data-content="all" >
			<img class="icon-image" style="margin-right: 10px;" src="${pageContext.request.contextPath}/resources/icon/ev/setting_off.png">
			<span class="nav_name">접근권한관리</span>
		</div>
		<div class="nav__link sub__link" data-menu="setting__insert" data-content="all" >
			<span class="nav_subname">+ 추가</span>
		</div>
		<div class="nav__link sub__link" data-menu="setting__delete" data-content="all" >
			<span class="nav_subname">- 삭제</span>
		</div>
	</div>
<%--
<div style="background-color: var(--bg-color); color: var(--white-color); padding: 1.5rem 1.5rem 10px; padding-left: 33px;
    transition: .5s; z-index: 101; position: fixed; width: calc(var(--nav--width) + 9.25rem); top: 0; left: 0; height: 80px;">
		<div style="display: flex; justify-content: space-between;">
			<div style="width: 100%;">
				<div class="nav__brand" style="">
					<a href="${pageContext.request.contextPath}/demo/admin" class="nav__logo" >코어솔루션병원</a>
				
					<a href="${pageContext.request.contextPath}/e/admin" class="nav__logo" >효사랑</a>
					<a href="${pageContext.request.contextPath}/d/admin" class="nav__logo" >계열사</a>
				</div>
			</div>
		</div>
	</div>
<div class="l-navbar expander" id="navbar">
		<nav class="nav" style="">
			<div style="width: 100%;">
			<!-- 
				<div class="nav__brand">
					<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
					<a href="#" class="nav__logo">Core Hospital</a>
				</div>
				 -->
				<div class="nav__list">
					<a href="#" class="nav__link active" style="margin-bottom: 0;" data-menu="userall" data-content="all">
						<span class="nav_name">직원DB 설정</span>
					</a>
					
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="user1" data-content="content1">
						<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
						<span class="nav_subname">&nbsp;효사랑전주요양병원 직원명부 ${p1}/${h1}</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="user2" data-content="content2">
						<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
						<span class="nav_subname">&nbsp;효사랑가족요양병원 직원명부 ${p2}/${h2}</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="user3" data-content="content3">
						<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
						<span class="nav_subname">&nbsp;가족사랑요양병원 직원명부 ${p3}/${h3}</span>
					</a>
					<div style="border-top:1px solid #fff; margin-bottom: 16px; margin-top: 16px;"></div>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="perall" data-content="all">
						<span class="nav_name">인사평가 관리</span>
					</a><!-- 
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="per1" data-content="content1">
						<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
						<span class="nav_subname" style="font-size: 18px;">&nbsp;효사랑전주요양병원 평가진행률</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="per2" data-content="content2">
						<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
						<span class="nav_subname" style="font-size: 18px;">&nbsp;효사랑가족요양병원 평가진행률</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="per3" data-content="content3">
						<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
						<span class="nav_subname" style="font-size: 18px;">&nbsp;가족사랑요양병원 평가진행률</span>
					</a> -->
					<div style="border-top:1px solid #fff; margin-bottom: 16px; margin-top: 16px;"></div>
					<!-- <a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="setting" data-content="">
						<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
						<span class="nav_subname" style="font-size: 18px;">&nbsp;설정관리</span>
					</a> -->
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="evSetting" data-content="all">
						<span class="nav_name">문제은행 관리</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="evCreate" data-content="all">
						<span class="nav_name">문제유형생성</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="evSelect" data-content="all">
						<span class="nav_name">생성된 유형 보기</span>
					</a>
				</div>
            </div>
        </nav>
    </div>
	<div class="nav__link2" style="margin: 0; position: fixed; bottom: 0;
	 width: calc(var(--nav--width) + 9.25rem); background-color: #08254c; z-index: 100;
	display: flex; justify-content: space-evenly; left: 0; align-items: center; border-radius: 0;">
		<div style="display: flex; justify-content: center; flex-wrap: wrap;">
			<div style="display: flex; justify-content: center;">
			<input type="text" id="str"><button value="찾기" onclick="findStr()" style="background:url(<%=request.getContextPath() %>/resources/icon/search.png) no-repeat center; background-size: contain"></button>
			</div>
			<img style="width: 90%;" src="<%=request.getContextPath() %>/resources/img/core_logo.png">
		</div>
	</div> --%>
	<main id="main-content" >
		<!-- 내용을 이곳에 추가 -->
		<!-- class="col-md-9 ms-sm-auto col-lg-10 px-md-4"  -->
		<div class="pd"></div>
		<div class="scroll-container">
			<table class="infotable">
				<thead>
					<tr>
						<th class="sticky-top info-sticky-top">기관명</th>
						<th class="sticky-top info-sticky-top">부서명</th>
						<th class="sticky-top info-sticky-top">사번</th>
						<th class="sticky-top info-sticky-top">직책</th>
						<th class="sticky-top info-sticky-top">이름</th>
						<th class="sticky-top info-sticky-top">비밀번호 설정 여부</th>
						<th class="sticky-top info-sticky-top">비밀번호초기화</th>
						<th class="sticky-top info-sticky-top">평가자 마이페이지</th>
					</tr>
				</thead>
				<c:forEach items="${users }" var="u">
					<c:if test="${u.id ne 12365478 }">
						<tr class="<c:if test="${empty u.pwd }">bg-gray </c:if>">
							
							<td>${u.hspt_name }</td>
							<td>${u.hspt_subname }</td>
							<td>${u.id }</td>
							<td>${u.hspt_position }</td>
							
							<td>
								${u.name }
								
							</td>
							<td>
								<c:choose>
									<c:when test="${empty u.pwd }">미설정</c:when>
									<c:otherwise>설정완료</c:otherwise>
								</c:choose>
							</td>
							<td data-name="${u.name}" data-id="${u.id}" <c:if test="${not empty u.pwd}">onclick="pwdreset(this)" class="pointer"</c:if>><c:if test="${not empty u.pwd }"><div class="link-btn"><div class="btn-css">초기화</div></div></c:if></td>
							<td class="pointer"  onclick="location.href='${pageContext.request.contextPath}/demo/Info/${u.idx}'"><div class="link-btn"><div class="btn-css">바로가기</div></div></td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
		
		<!-- 
		<div style="padding:10px;">
			<div style=""><span>◈ 인사평가에 사용할  문제의 카테고리를 선택해 주세요.</span></div>
			<div style="">
				<ul style="display: flex; flex-wrap: wrap;">
					<li style="margin-right: 17px;"><label><input type="checkbox"><span>근무태도</span></label></li>
					<li style="margin-right: 17px;"><label><input type="checkbox"><span>목표관리</span></label></li>
					<li style="margin-right: 17px;"><label><input type="checkbox"><span>업무처리</span></label></li>
					<li style="margin-right: 17px;"><label><input type="checkbox"><span>업무실적</span></label></li>
					<li style="margin-right: 17px;"><label><input type="checkbox"><span>소통 및 화합</span></label></li>
					<li style="margin-right: 17px;"><label><input type="checkbox"><span>리더쉽</span></label></li>
					<li style="margin-right: 17px;"><label><input type="checkbox"><span>조직관리</span></label></li>
					<li style="margin-right: 17px;"><label><input type="checkbox"><span>섬김</span></label></li>
					<li style="margin-right: 17px;"><label><input type="checkbox"><span>키움</span></label></li>
					<li style="margin-right: 17px;"><label><input type="checkbox"><span>배움</span></label></li>
					<li style="margin-right: 17px;"><label><input type="checkbox"><span>나눔</span></label></li>
				</ul>
			</div>
		</div> -->
		<!-- 
		<div style="border-bottom:1px solid #000;"></div>
		<div style="padding: 10px;">
			<div style="margin-bottom: 20px;">
				<span>문제수 선택</span><input type="number" /><span>선택된 문제 수</span><input type="number" value=""/><button>랜덤 생성</button>
			</div>
			<div>
				<span>◈ 인사평가에 사용할 문제를 선택하여 문제 유형을 만들어 주세요.</span>
			</div>
			<div style="display: flex;">
				<div style="width: 13px;margin-right: 10px;"></div>
				<div style="width: 100px; text-align: center;">카테고리</div>
				<div>문제</div>
			</div>
			<div id="ev">
				<div style="display: flex;">
					<div style="margin-right: 10px;"><input type="checkbox" /></div>
					<div style="width: 100px; text-align: center;">근무태도</div>
					<div>항상 근면하고 성실한 근무자세로 업무에 임한다.</div>
				</div>
				<div style="display: flex;">
					<div style="margin-right: 10px;"><input type="checkbox" /></div>
					<div style="width: 100px; text-align: center;">근무태도</div>
					<div>방문객 및 직원들에게 언행이 예의 바르다.</div>
				</div>
				<div style="display: flex;">
					<div style="margin-right: 10px;"><input type="checkbox" /></div>
					<div style="width: 100px; text-align: center;">근무태도</div>
					<div>환자와 보호자에게 경어를 사용하면 공손히 대하는가?</div>
				</div>
				<div style="display: flex;">
					<div style="margin-right: 10px;"><input type="checkbox" /></div>
					<div style="width: 100px; text-align: center;">근무태도</div>
					<div>병원내 직원들과 존칭을 쓰며 협력하는가?</div>
				</div>
				<div style="display: flex;">
					<div style="margin-right: 10px;"><input type="checkbox" /></div>
					<div style="width: 100px; text-align: center;">근무태도</div>
					<div>어르신에게 우호적이며 친절한가?</div>
				</div>
				<div style="display: flex;">
					<div style="margin-right: 10px;"><input type="checkbox" /></div>
					<div style="width: 100px; text-align: center;">근무태도</div>
					<div>보호자, 외부인 및 직원에게 환한 미소와 함께 친절한가?</div>
				</div>
				<div style="display: flex;">
					<div style="margin-right: 10px;"><input type="checkbox" /></div>
					<div style="width: 100px; text-align: center;">근무태도</div>
					<div>주어진 업무는 끝까지 하며 책임회피는 하지 않는가?</div>
				</div>
				<div style="display: flex;">
					<div style="margin-right: 10px;"><input type="checkbox" /></div>
					<div style="width: 100px; text-align: center;">근무태도</div>
					<div>업무에 몰입도가 높으며 성실한 자세로 임하는가?</div>
				</div>
				<div style="display: flex;">
					<div style="margin-right: 10px;"><input type="checkbox" /></div>
					<div style="width: 100px; text-align: center;">근무태도</div>
					<div>자신의 이해관계와 감정에 사로잡여있지 않고 직업의식이 투철한가?</div>
				</div>
				<div style="display: flex;">
					<div style="margin-right: 10px;"><input type="checkbox" /></div>
					<div style="width: 100px; text-align: center;">목표관리</div>
					<div>부서의 가치에 적합한 목표설정과 업무방향을 제시하고, 성과창출을 이끌어 갑니까?</div>
				</div>
				<div style="display: flex;">
					<div style="margin-right: 10px;"><input type="checkbox" /></div>
					<div style="width: 100px; text-align: center;">목표관리</div>
					<div>부서원들에게 목표달성의 동기를 부여하여 각자의 성과를 높일 수 있도록 지원합니까?</div>
				</div>
				<div style="display: flex;">
					<div style="margin-right: 10px;"><input type="checkbox" /></div>
					<div style="width: 100px; text-align: center;">목표관리</div>
					<div>하루 일과 중에 처리해야 할 업무를 근무시간내에 처리합니까?</div>
				</div>
				<div style="display: flex;">
					<div style="margin-right: 10px;"><input type="checkbox" /></div>
					<div style="width: 100px; text-align: center;">목표관리</div>
					<div>업무 시간 중에 지시받은 일을 확실하게 이해하고 정확하게 실천합니까?</div>
				</div>
				<div style="display: flex;">
					<div>
						<button>문제유형만들기</button>
					</div>
				</div>
			</div>
		</div>
		-->
	</main>

</section>

<!-- 
<nav>
	<div style="position: fixed; right: 10px; bottom: 10px; border: 1px solid; padding: 10px; border-radius: 100px; cursor:pointer;" onclick="javascript:window.scrollTo(0,0);">Top</div>
</nav> -->
</form>
<div class="modal normal">
	<div class="modal_body">
		<div>
			<img class="menu_icon" src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png">
			<div class="menu_msg">text</div>
			<div class="modal_footer">
				<div class="btn modal_btn" onclick="closePopup()">
					확인
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal3 normal">
	<div class="modal_body3">
		<div>
			<img class="menu_icon" src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png">
			<div class="menu_msg3">text</div>
			<div class="modal_footer3">
				<div style="top: 40%" class="btn modal_btn2" onclick="modal_insert()">
					확인
				</div>
				<div style="top: 40%" class="btn pink_btn2" onclick="closePopup3()">
					취소
				</div>
			</div>
			
		</div>
	</div>
</div>
<div class="modal4 normal">
	<div class="modal_body4">
		<div>
			<img class="menu_icon" src="${pageContext.request.contextPath}/resources/icon/ev/alert_img.png">
			<div class="menu_msg4">text</div>
			<div class="modal_footer4">
				<div style="top: 40%" class="btn modal_btn2" onclick="pwd_reset()">
					확인
				</div>
				<div style="top: 40%" class="btn pink_btn2" onclick="closePopup4()">
					취소
				</div>
			</div>
			
		</div>
	</div>
</div>

</body>
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
const linkCollapse = document.getElementsByClassName('collapse__link')
var i

for(i=0;i<linkCollapse.length;i++) {
    linkCollapse[i].addEventListener('click', function(){
        const collapseMenu = this.nextElementSibling
        collapseMenu.classList.toggle('showCollapse')

        const rotate = collapseMenu.previousElementSibling
        rotate.classList.toggle('rotate')
    });
}
const mainContent = document.getElementById('main-content');

menuLinks.forEach(link => {
	link.addEventListener('click', function(event){
		event.preventDefault();
		currentMenuIndex = Array.from(menuLinks).indexOf(this);	// 클린된 메뉴의 인덱스를 업데이트
		activateMenu(currentMenuIndex);
		
	});
});

function userall(contentId) {
	if (contentId === 'all') {
	      
	      $.ajax({
	         url: '${pageContext.request.contextPath}/hwt/usersAll',
	         type: 'GET',
	         dataType: 'json',
	         success: function(response) {
	        	 if(response.result === "Y"){
	 				var listall = response.usersall;
	 				var ph = response.userphList;
	 				
	 				mainContent.innerHTML = ''; // 기존 내용을 지우고
					var bgdv = document.createElement("div");
					bgdv.setAttribute("class","pd");

					mainContent.appendChild(bgdv);
	 				var tbdv = document.createElement("div");
	 				tbdv.setAttribute("class","scroll-container");
	 				var tb = document.createElement("TABLE");
	 				tb.setAttribute("class","infotable")
	 				mainContent.appendChild(tbdv)
	 				tbdv.appendChild(tb);
	 				var thead = document.createElement("THEAD");
	 				
	 				var maintr = document.createElement("TR");
	 				var maintd1 = document.createElement("TH");
	 				maintd1.textContent = "기관명";
	 				maintd1.setAttribute("class","sticky-top info-sticky-top");
	 				var maintd2 = document.createElement("TH");
	 				maintd2.textContent = "부서명";
	 				maintd2.setAttribute("class","sticky-top info-sticky-top");
	 				var maintd3 = document.createElement("TH");
	 				maintd3.textContent = "사번";
	 				maintd3.setAttribute("class","sticky-top info-sticky-top");
	 				var maintd4 = document.createElement("TH");
	 				maintd4.textContent = "직책";
	 				maintd4.setAttribute("class","sticky-top info-sticky-top");
	 				var maintd6 = document.createElement("TH");
	 				maintd6.textContent = "이름";
	 				maintd6.setAttribute("class","sticky-top info-sticky-top");
	 				var maintd7 = document.createElement("TH");
	 				maintd7.textContent = "비밀번호 설정 여부";
	 				maintd7.setAttribute("class","sticky-top info-sticky-top");
	 				var maintd8 = document.createElement("TH");
	 				maintd8.textContent = "비밀번호초기화";
	 				maintd8.setAttribute("class","sticky-top info-sticky-top");
	 				var maintd9 = document.createElement("TH");
	 				maintd9.textContent = "평가자 마이페이지";
	 				maintd9.setAttribute("class","sticky-top info-sticky-top");

	 				var tbody = document.createElement("TBODY");
	 				
	 				tb.appendChild(thead);
	 				thead.appendChild(maintr);
	 				maintr.appendChild(maintd1);
	 				maintr.appendChild(maintd2);
	 				maintr.appendChild(maintd3);
	 				maintr.appendChild(maintd4);
	 				maintr.appendChild(maintd6);
	 				maintr.appendChild(maintd7);
	 				maintr.appendChild(maintd8);
	 				maintr.appendChild(maintd9);
					tb.appendChild(tbody);
	 				listall.forEach(function (list) {
	 					if(list.id != 12365478){

							var idx = list.idx;
		 					var hname = list.hspt_name;
		 					var sname = list.hspt_subname;
		 					var id = list.id;
		 					var position = list.hspt_position;
		 					var name = list.name;
// 		 					var modifiedName = name.charAt(0) + "ㅇㅇ";
		 					
		 					var tr = document.createElement("TR");
		 					if(!list.pwd){
		 						tr.setAttribute("style", "background: #eaeaea;")
		 					}
		 					var tdhname = document.createElement("TD");
		 					tdhname.textContent = hname;
		 					var tdsname = document.createElement("TD");
		 					tdsname.textContent = sname;
		 					var tdid = document.createElement("TD");
		 					tdid.textContent = id;
		 					var tdpo = document.createElement("TD");
		 					tdpo.textContent = position;
		 					var tdname = document.createElement("TD");
		 					tdname.textContent = name;
		 					var url = "<%=request.getContextPath() %>/demo/Info/"+idx;
		 					tdname.setAttribute("onclick","location.href='" + url + "'");
		 					tdname.setAttribute("style", "cursor:pointer;");
		 					var tdpwd = document.createElement("TD");
		 					if(!list.pwd){
		 						tdpwd.textContent = "미설정";
		 					}else{
		 						tdpwd.textContent = "설정완료";
		 					}
		 					
		 					
		 					var tdpwdselect = document.createElement("TD");
		 					var LinkSpan1 = document.createElement("div");
		 					var LinkBtn1 = document.createElement("div");
		 					tdpwdselect.appendChild(LinkSpan1);
		 					LinkSpan1.appendChild(LinkBtn1);
		 					LinkSpan1.setAttribute("class","link-btn");
		 					LinkBtn1.setAttribute("class","btn-css");
		 					tdpwdselect.setAttribute("data-name", name);
		 					tdpwdselect.setAttribute("data-id", id);
		 					if(list.pwd){
		 						LinkBtn1.textContent = '초기화';
		 						tdpwdselect.setAttribute("onclick", "pwdreset(this)");
		 						tdpwdselect.setAttribute("style", "cursor:pointer;");
		 					}
		 					var tdlink = document.createElement("TD");
		 					var LinkSpan2 = document.createElement("div");
		 					var LinkBtn2 = document.createElement("div");
		 					tdlink.appendChild(LinkSpan2);
		 					LinkSpan2.appendChild(LinkBtn2);
		 					LinkSpan2.setAttribute("class", "link-btn");
		 					LinkBtn2.setAttribute("class", "btn-css");
		 					tdlink.setAttribute("onclick", "location.href='" + url + "'");
		 					LinkBtn2.textContent = "바로가기";
		 					//
		 					
		 					
		 					tbody.appendChild(tr);
		 					tr.appendChild(tdhname);
		 					tr.appendChild(tdsname);
		 					tr.appendChild(tdid);
		 					tr.appendChild(tdpo);
		 					tr.appendChild(tdname);
		 					tr.appendChild(tdpwd);
							tr.appendChild(tdpwdselect);
							tr.appendChild(tdlink);
	 					}	
 					});
        	 }
         },
         error: function(error) {
            console.error('Error fetching data:', error);
         }
      });
	}
}
	
	


function user1(contentId) {
	if (contentId === 'content1') {
		$.ajax({
	         url: '${pageContext.request.contextPath}/demo/users1',
	         type: 'GET',
	         dataType: 'json',
	         success: function(response) {
	        	 if(response.result === "Y"){
	 				var list1 = response.users;
	 				var ph = response.userphList;
	 				
	 				mainContent.innerHTML = ''; // 기존 내용을 지우고
	 				var tb = document.createElement("TABLE");
	 				mainContent.appendChild(tb);
	 				var maintr = document.createElement("TR");
	 				var maintd1 = document.createElement("TD");
	 				maintd1.textContent = "idx";
	 				var maintd2 = document.createElement("TD");
	 				maintd2.textContent = "병원명";
	 				var maintd3 = document.createElement("TD");
	 				maintd3.textContent = "부서명";
	 				var maintd4 = document.createElement("TD");
	 				maintd4.textContent = "사번";
	 				var maintd6 = document.createElement("TD");
	 				maintd6.textContent = "직책";
	 				var maintd7 = document.createElement("TD");
	 				maintd7.textContent = "이름";
	 				var maintd8 = document.createElement("TD");
	 				maintd8.textContent = "핸드폰번호";
	 				var maintd9 = document.createElement("TD");
	 				maintd9.textContent = "비밀번호초기화";
	 				tb.appendChild(maintr);
	 				maintr.appendChild(maintd1);
	 				maintr.appendChild(maintd2);
	 				maintr.appendChild(maintd3);
	 				maintr.appendChild(maintd4);
	 				maintr.appendChild(maintd6);
	 				maintr.appendChild(maintd7);
	 				maintr.appendChild(maintd8);
	 				maintr.appendChild(maintd9);
	 				
	 				list1.forEach(function (list) {
	 					if(list.id != 12365478){
	 						var matchingPh = ph.find(function (phn) {
	 					         return phn.id === list.id;
	 					      });
	 						var phid, phnumber;
	 						
							 if (matchingPh) {
		                        phid = matchingPh.id;
		                        phnumber = matchingPh.number;
		                     }

							var idx = list.idx;
		 					var hname = list.hspt_name;
		 					var sname = list.hspt_subname;
		 					var id = list.id;
		 					var position = list.hspt_position;
		 					var name = list.name;
		 					
		 					
		 					var tr = document.createElement("TR");
		 					if(!list.pwd){
		 						tr.setAttribute("style", "background: #eaeaea;")
		 					}
		 					var tdidx = document.createElement("TD");
		 					tdidx.textContent = idx;
		 					var tdhname = document.createElement("TD");
		 					tdhname.textContent = hname;
		 					var tdsname = document.createElement("TD");
		 					tdsname.textContent = sname;
		 					var tdid = document.createElement("TD");
		 					tdid.textContent = id;
		 					var tdpo = document.createElement("TD");
		 					tdpo.textContent = position;
		 					var tdname = document.createElement("TD");
		 					tdname.textContent = name;
		 					var url = "<%=request.getContextPath() %>/demo/Info/"+idx;
		 					tdname.setAttribute("onclick","location.href='" + url + "'");
		 					tdname.setAttribute("style", "cursor:pointer;");
		 					var tdph = document.createElement("TD");
		 					if(id == phid){
		 						tdph.textContent = phnumber;
		 					}
		 					var tdpwdselect = document.createElement("TD");
		 					tdpwdselect.setAttribute("data-name", name);
		 					tdpwdselect.setAttribute("data-id", id);
		 					if(list.pwd){
		 						tdpwdselect.textContent = '초기화';
		 						tdpwdselect.setAttribute("onclick", "pwdreset(this)");
		 						tdpwdselect.setAttribute("style", "cursor:pointer;");
		 					}
		 					//
		 					
		 					tb.appendChild(tr);
		 					tr.appendChild(tdidx);
		 					tr.appendChild(tdhname);
		 					tr.appendChild(tdsname);
		 					tr.appendChild(tdid);
		 					tr.appendChild(tdpo);
		 					tr.appendChild(tdname);
							tr.appendChild(tdph);
							tr.appendChild(tdpwdselect);
	 					}
	 					
	 				});
	        	 }
	         },
	         error: function(error) {
	            console.error('Error fetching data:', error);
	         }
	      });
	   }
}

function user2() {

	$.ajax({
         url: '${pageContext.request.contextPath}/demo/users2',
         type: 'GET',
         dataType: 'json',
         success: function(response) {
        	 if(response.result === "Y"){
 				var list1 = response.users;
 				var ph = response.userphList;
 				
 				mainContent.innerHTML = ''; // 기존 내용을 지우고
 				var tb = document.createElement("TABLE");
 				mainContent.appendChild(tb);
 				var maintr = document.createElement("TR");
 				var maintd1 = document.createElement("TD");
 				maintd1.textContent = "idx";
 				var maintd2 = document.createElement("TD");
 				maintd2.textContent = "병원명";
 				var maintd3 = document.createElement("TD");
 				maintd3.textContent = "부서명";
 				var maintd4 = document.createElement("TD");
 				maintd4.textContent = "사번";
 				var maintd6 = document.createElement("TD");
 				maintd6.textContent = "직책";
 				var maintd7 = document.createElement("TD");
 				maintd7.textContent = "이름";
 				var maintd8 = document.createElement("TD");
 				maintd8.textContent = "핸드폰번호";
 				var maintd9 = document.createElement("TD");
 				maintd9.textContent = "비밀번호초기화";
 				
 				tb.appendChild(maintr);
 				maintr.appendChild(maintd1);
 				maintr.appendChild(maintd2);
 				maintr.appendChild(maintd3);
 				maintr.appendChild(maintd4);
 				maintr.appendChild(maintd6);
 				maintr.appendChild(maintd7);
 				maintr.appendChild(maintd8);
 				maintr.appendChild(maintd9);
 				
 				list1.forEach(function (list) {
 					if(list.id != 12365478){
 						var matchingPh = ph.find(function (phn) {
					         return phn.id === list.id;
					      });
						var phid, phnumber;
						
						 if (matchingPh) {
	                        phid = matchingPh.id;
	                        phnumber = matchingPh.number;
	                     }
 						
 						var idx = list.idx;
	 					var hname = list.hspt_name;
	 					var sname = list.hspt_subname;
	 					var id = list.id;
	 					var position = list.hspt_position;
	 					var name = list.name;
	 					
	 					
	 					var tr = document.createElement("TR");
	 					if(!list.pwd){
	 						tr.setAttribute("style", "background: #eaeaea;")
	 					}
	 					var tdidx = document.createElement("TD");
	 					tdidx.textContent = idx;
	 					var tdhname = document.createElement("TD");
	 					tdhname.textContent = hname;
	 					var tdsname = document.createElement("TD");
	 					tdsname.textContent = sname;
	 					var tdid = document.createElement("TD");
	 					tdid.textContent = id;
	 					var tdpo = document.createElement("TD");
	 					tdpo.textContent = position;
	 					var tdname = document.createElement("TD");
	 					tdname.textContent = name;
	 					var url = "<%=request.getContextPath() %>/demo/Info/"+idx;
	 					tdname.setAttribute("onclick","location.href='" + url + "'");
	 					tdname.setAttribute("style", "cursor:pointer;");
	 					var tdph = document.createElement("TD");
	 					if(id == phid){
	 						tdph.textContent = phnumber;
	 					}
	 					var tdpwdselect = document.createElement("TD");
	 					tdpwdselect.setAttribute("data-name", name);
	 					tdpwdselect.setAttribute("data-id", id);
	 					if(list.pwd){
	 						tdpwdselect.textContent = '초기화';
	 						tdpwdselect.setAttribute("onclick", "pwdreset(this)");
	 						tdpwdselect.setAttribute("style", "cursor:pointer;");
	 					}
	 					
	 					//
	 					
	 					tb.appendChild(tr);
	 					tr.appendChild(tdidx);
	 					tr.appendChild(tdhname);
	 					tr.appendChild(tdsname);
	 					tr.appendChild(tdid);
	 					tr.appendChild(tdpo);
	 					tr.appendChild(tdname);
						tr.appendChild(tdph);
						tr.appendChild(tdpwdselect);
 					}
 					
 				});
        	 }
         },
         error: function(error) {
            console.error('Error fetching data:', error);
         }
      });
   }


function user3() {

	$.ajax({
         url: '${pageContext.request.contextPath}/demo/users3',
         type: 'GET',
         dataType: 'json',
         success: function(response) {
        	 if(response.result === "Y"){
 				var list1 = response.users;
 				var ph = response.userphList;
 				
 				mainContent.innerHTML = ''; // 기존 내용을 지우고
 				var tb = document.createElement("TABLE");
 				mainContent.appendChild(tb);
 				var maintr = document.createElement("TR");
 				var maintd1 = document.createElement("TD");
 				maintd1.textContent = "idx";
 				var maintd2 = document.createElement("TD");
 				maintd2.textContent = "병원명";
 				var maintd3 = document.createElement("TD");
 				maintd3.textContent = "부서명";
 				var maintd4 = document.createElement("TD");
 				maintd4.textContent = "사번";
 				var maintd6 = document.createElement("TD");
 				maintd6.textContent = "직책";
 				var maintd7 = document.createElement("TD");
 				maintd7.textContent = "이름";
 				var maintd8 = document.createElement("TD");
 				maintd8.textContent = "핸드폰번호";
 				var maintd9 = document.createElement("TD");
 				maintd9.textContent = "비밀번호초기화";
 				
 				tb.appendChild(maintr);
 				maintr.appendChild(maintd1);
 				maintr.appendChild(maintd2);
 				maintr.appendChild(maintd3);
 				maintr.appendChild(maintd4);
 				maintr.appendChild(maintd6);
 				maintr.appendChild(maintd7);
 				maintr.appendChild(maintd8);
 				maintr.appendChild(maintd9);
 				
 				
 				list1.forEach(function (list) {
 					if(list.id != 12365478){
 						var matchingPh = ph.find(function (phn) {
					         return phn.id === list.id;
					      });
						var phid, phnumber;
						
						 if (matchingPh) {
	                        phid = matchingPh.id;
	                        phnumber = matchingPh.number;
	                     }
						 
 						var idx = list.idx;
	 					var hname = list.hspt_name;
	 					var sname = list.hspt_subname;
	 					var id = list.id;
	 					var position = list.hspt_position;
	 					var name = list.name;
	 					
	 					
	 					var tr = document.createElement("TR");
	 					if(!list.pwd){
	 						tr.setAttribute("style", "background: #eaeaea;")
	 					}
	 					var tdidx = document.createElement("TD");
	 					tdidx.textContent = idx;
	 					var tdhname = document.createElement("TD");
	 					tdhname.textContent = hname;
	 					var tdsname = document.createElement("TD");
	 					tdsname.textContent = sname;
	 					var tdid = document.createElement("TD");
	 					tdid.textContent = id;
	 					var tdpo = document.createElement("TD");
	 					tdpo.textContent = position;
	 					var tdname = document.createElement("TD");
	 					tdname.textContent = name;
	 					var url = "<%=request.getContextPath() %>/demo/Info/"+idx;
	 					tdname.setAttribute("onclick","location.href='" + url + "'");
	 					tdname.setAttribute("style", "cursor:pointer;");
	 					var tdph = document.createElement("TD");
	 					if(id == phid){
	 						tdph.textContent = phnumber;
	 					}
	 					var tdpwdselect = document.createElement("TD");
	 					tdpwdselect.setAttribute("data-name", name);
	 					tdpwdselect.setAttribute("data-id", id);
	 					if(list.pwd){
	 						tdpwdselect.textContent = '초기화';
	 						tdpwdselect.setAttribute("onclick", "pwdreset(this)");
	 						tdpwdselect.setAttribute("style", "cursor:pointer;");
	 					}
	 					//
	 					
	 					tb.appendChild(tr);
	 					tr.appendChild(tdidx);
	 					tr.appendChild(tdhname);
	 					tr.appendChild(tdsname);
	 					tr.appendChild(tdid);
	 					tr.appendChild(tdpo);
	 					tr.appendChild(tdname);
						tr.appendChild(tdph);
						tr.appendChild(tdpwdselect);
 					}
 					
 				});
        	 }
         },
         error: function(error) {
            console.error('Error fetching data:', error);
         }
      });

}

function asc1() {
	$.ajax({
        url: '${pageContext.request.contextPath}/demo/users1',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
       	 if(response.result === "Y"){
				var list1 = response.listpwd1;
				var ph = response.userphList;
				
				mainContent.innerHTML = ''; // 기존 내용을 지우고
				var tb = document.createElement("TABLE");
				mainContent.appendChild(tb);
				var maintr = document.createElement("TR");
				var maintd1 = document.createElement("TD");
				maintd1.textContent = "idx";
				var maintd2 = document.createElement("TD");
				maintd2.textContent = "병원명";
				var maintd3 = document.createElement("TD");
				maintd3.textContent = "부서명";
				var maintd4 = document.createElement("TD");
				maintd4.textContent = "사번";
				var maintd6 = document.createElement("TD");
				maintd6.textContent = "직책";
				var maintd7 = document.createElement("TD");
				maintd7.textContent = "이름";
				var maintd8 = document.createElement("TD");
				maintd8.textContent = "핸드폰번호";
 				var maintd9 = document.createElement("TD");
 				maintd9.textContent = "비밀번호초기화";
 				maintd9.setAttribute("data-menu","user1");
 				maintd9.setAttribute("data-content","content1");
 				maintd9.setAttribute("style","cursor:pointer;");
				
				tb.appendChild(maintr);
				maintr.appendChild(maintd1);
				maintr.appendChild(maintd2);
				maintr.appendChild(maintd3);
				maintr.appendChild(maintd4);
				maintr.appendChild(maintd6);
				maintr.appendChild(maintd7);
				maintr.appendChild(maintd8);
 				maintr.appendChild(maintd9);
				
				list1.forEach(function (list) {
					if(list.id != 12365478){
						var matchingPh = ph.find(function (phn) {
					         return phn.id === list.id;
					      });
						var phid, phnumber;
						
						 if (matchingPh) {
	                        phid = matchingPh.id;
	                        phnumber = matchingPh.number;
	                     }
						 
						var idx = list.idx;
	 					var hname = list.hspt_name;
	 					var sname = list.hspt_subname;
	 					var id = list.id;
	 					var position = list.hspt_position;
	 					var name = list.name;
	 					
	 					
	 					var tr = document.createElement("TR");
	 					if(!list.pwd){
	 						tr.setAttribute("style", "background: #eaeaea;")
	 					}
	 					var tdidx = document.createElement("TD");
	 					tdidx.textContent = idx;
	 					var tdhname = document.createElement("TD");
	 					tdhname.textContent = hname;
	 					var tdsname = document.createElement("TD");
	 					tdsname.textContent = sname;
	 					var tdid = document.createElement("TD");
	 					tdid.textContent = id;
	 					var tdpo = document.createElement("TD");
	 					tdpo.textContent = position;
	 					var tdname = document.createElement("TD");
	 					tdname.textContent = name;
	 					var url = "<%=request.getContextPath() %>/demo/Info/"+idx;
	 					tdname.setAttribute("onclick","location.href='" + url + "'");
	 					tdname.setAttribute("style", "cursor:pointer;");
	 					var tdph = document.createElement("TD");
	 					if(id == phid){
	 						tdph.textContent = phnumber;
	 					}
	 					var tdpwdselect = document.createElement("TD");
	 					tdpwdselect.setAttribute("data-name", name);
	 					tdpwdselect.setAttribute("data-id", id);
	 					if(list.pwd){
	 						tdpwdselect.textContent = '초기화';
	 						tdpwdselect.setAttribute("onclick", "pwdreset(this)");
	 						tdpwdselect.setAttribute("style", "cursor:pointer;");
	 					}
	 					//
	 					
	 					tb.appendChild(tr);
	 					tr.appendChild(tdidx);
	 					tr.appendChild(tdhname);
	 					tr.appendChild(tdsname);
	 					tr.appendChild(tdid);
	 					tr.appendChild(tdpo);
	 					tr.appendChild(tdname);
						tr.appendChild(tdph);
						tr.appendChild(tdpwdselect);
					}
					
				});
       	 }
        },
        error: function(error) {
           console.error('Error fetching data:', error);
        }
     });
}

function perall(contentId) {
	if (contentId === 'all') {
	      
	      $.ajax({
	         url: '${pageContext.request.contextPath}/demo/perall',
	         type: 'GET',
	         dataType: 'json',
	         success: function(response) {
	        	 if(response.result === "Y"){
	 				var listall = response.usersall;
	 				var target = response.target;
	 				var answer = response.answer;
	 				var targetsum = response.targetsum;
	 				var answersum = response.answersum;
	 				
	 				mainContent.innerHTML = ''; // 기존 내용을 지우고
	 				var bgdv = document.createElement("div");
	 				bgdv.setAttribute("class","pd");
	 				var dv = document.createElement("div");
	 				dv.setAttribute("class","scroll-container");
	 				var tb = document.createElement("TABLE");
 					tb.setAttribute("class","scrolltable");
 					
	 				var thead = document.createElement("THEAD");
	 				
	 				var maintr1 = document.createElement("TR");
	 				var maintd1 = document.createElement("TH");
	 				maintd1.textContent = "평가자정보";
	 				maintd1.setAttribute("colspan","4"); 
	 				maintd1.setAttribute("class","bg-425c7b sticky-top");
	 				var maintd2 = document.createElement("TH");
	 				maintd2.textContent = "평가대상자수";
	 				maintd2.setAttribute("rowspan","2");
	 				maintd2.setAttribute("class","bg-425c7b sticky-top");
	 				var maintd3 = document.createElement("TH");
	 				maintd3.textContent = "평가결과수";
	 				maintd3.setAttribute("rowspan","2");
	 				maintd3.setAttribute("class","bg-425c7b sticky-top");
	 				var maintd4 = document.createElement("TH");
	 				maintd4.textContent = "진행율";
	 				maintd4.setAttribute("rowspan","2");
	 				maintd4.setAttribute("class","bg-425c7b sticky-top");
	 				var maintd7 = document.createElement("TH");
	 				maintd7.textContent = "평가자 마이페이지";
	 				maintd7.setAttribute("rowspan","2");
	 				maintd7.setAttribute("class","bg-425c7b sticky-top");
	 				
	 				
	 				var maintr2 = document.createElement("TR");

					var maintd9 = document.createElement("TH");
					maintd9.textContent = "기관명";
					maintd9.setAttribute("class","bg-586f8b sticky-middle");
					var maintd10 = document.createElement("TH");
					maintd10.textContent = "부서명";
					maintd10.setAttribute("class","bg-586f8b sticky-middle");
					var maintd11 = document.createElement("TH");
					maintd11.textContent = "직급/직책";
					maintd11.setAttribute("class","bg-586f8b sticky-middle");
					var maintd12 = document.createElement("TH");
					maintd12.textContent = "사원명";
					maintd12.setAttribute("class","lasttd bg-586f8b sticky-middle");
					maintd12.setAttribute("style","")
					var maintr3 = document.createElement("TR");
					maintr3.setAttribute("class","tr-bottom");
					var maintd13 = document.createElement("TH");
					maintd13.setAttribute("colspan","4");
					maintd13.textContent = "전 직원 정보";
					maintd13.setAttribute("class","bg-d9e9e9 sticky-bottom");
	 				
					var maintd14 = document.createElement("TH");	// 대상자수
					maintd14.textContent = targetsum;
					maintd14.setAttribute("class","bg-d9e9e9 sticky-bottom");
					
					var maintd15 = document.createElement("TH");	// 평가 결과수
					maintd15.textContent = answersum;
					maintd15.setAttribute("class","bg-d9e9e9 sticky-bottom");
					
					var maintd16 = document.createElement("TH");
					var percentageall =  (answersum / targetsum) * 100;
					
					maintd16.textContent = isFinite(percentageall) ? percentageall.toFixed(2) + "%" : "N/A";
					maintd16.setAttribute("class","bg-d9e9e9 sticky-bottom");
					
					var maintd17 = document.createElement("TH");
					maintd17.textContent = "-"
					maintd17.setAttribute("class","bg-d9e9e9 sticky-bottom");
					
	 				var tbody = document.createElement("TBODY");
					
					mainContent.appendChild(bgdv);
	 				mainContent.appendChild(dv);
	 				dv.appendChild(tb);
	 				tb.appendChild(thead);
	 				thead.appendChild(maintr1);
	 				maintr1.appendChild(maintd1);
	 				maintr1.appendChild(maintd2);
	 				maintr1.appendChild(maintd3);
	 				maintr1.appendChild(maintd4);
	 				maintr1.appendChild(maintd7);
	 				thead.appendChild(maintr2);
	 				maintr2.appendChild(maintd9);
	 				maintr2.appendChild(maintd10);
	 				maintr2.appendChild(maintd11);
	 				maintr2.appendChild(maintd12);
	 				thead.appendChild(maintr3);
	 				maintr3.appendChild(maintd13);
	 				maintr3.appendChild(maintd14);
	 				maintr3.appendChild(maintd15);
	 				maintr3.appendChild(maintd16);
	 				maintr3.appendChild(maintd17);
	 				
	 				tb.appendChild(tbody);
	 				
	 				listall.forEach(function (list) {
	 				//	if(list.id != 12365478){		// 관리자 제거
	 						
	 						var matchingTarget = target.find(function (tg) {
	 							return tg.id === list.id;
	 						});
	 						
	 						var targetid, tgt
	 						if(matchingTarget) {
	 							targetid = matchingTarget.id;
	 							tgt = matchingTarget.target;
	 						}
	 						
	 						var matchingAnswer = answer.filter(function (as) {
	 							return as.u2 === list.id;
	 						});
	 						var answerid
	 						if (matchingAnswer && matchingAnswer.length > 0) {
	 					        answerid = matchingAnswer[0].id;
	 					    }
	 						var answercnt = matchingAnswer ? matchingAnswer.length : 0;

	 					    // Calculate the percentage, handle division by zero or empty string
 					    	var percentage = answercnt > 0 ? (answercnt / tgt) * 100 : 0;
	 					    
	 						var idx = list.idx;
		 					var code = list.user_code;
		 					var hname = list.hspt_name;
		 					var subname = list.hspt_subname;
		 					var position = list.hspt_position
		 					var name = list.name;
		 					var modifiedName = name.charAt(0) + "ㅇㅇ";
		 					
		 					
		 					var tr = document.createElement("TR");
		 					
		 					var tdhname = document.createElement("TD");
		 					tdhname.textContent = hname;
		 					var tdsname = document.createElement("TD");
		 					tdsname.textContent = subname;
		 					var tdpo = document.createElement("TD");
		 					tdpo.textContent = position;
		 					var tdname = document.createElement("TD");
		 					tdname.textContent = modifiedName;
		 					
		 					var tdtarget = document.createElement("TD");
		 					tdtarget.textContent = tgt;
		 					
		 					var tdanswer = document.createElement("TD");
		 					tdanswer.textContent = answercnt;
		 					
		 					var tdpersent = document.createElement("TD");
		 					tdpersent.textContent = isFinite(percentage) ? percentage.toFixed(2) + "%" : "N/A";
		 					
		 					
		 					if (tdanswer.innerText === tdtarget.innerText) {
		 						tdpersent.setAttribute("style", "background:#32b0ca;");
							} else if (tdanswer.innerText == 0) {
								tdpersent.setAttribute("style", "background: ; color: #ff0000; font-weight: 600;");
							}else if (Number(tdtarget.innerText) < Number(tdanswer.innerText)){
								tr.setAttribute("style", "background: #E6B8AF;")
							}
		 					
							
		 					var tdinfo = document.createElement("TD");
		 					var LinkSpan = document.createElement("div");
		 					var LinkBtn = document.createElement("div");
		 					LinkSpan.setAttribute("class", "link-btn");
		 					LinkBtn.setAttribute("class", "btn-css");
		 					tdinfo.appendChild(LinkSpan);
		 					LinkSpan.appendChild(LinkBtn);
		 					var url = "<%=request.getContextPath() %>/demo/Info/"+idx;
		 					LinkBtn.textContent = "바로가기";
		 					tdinfo.setAttribute("onclick","location.href='" + url + "'");
		 					tdinfo.setAttribute("style","width: 187px; cursor:pointer;");
		 					
		 					
		 					//
		 					
		 					tbody.appendChild(tr);
		 					tr.appendChild(tdhname);
		 					tr.appendChild(tdsname);
		 					tr.appendChild(tdpo);
		 					tr.appendChild(tdname);
		 					tr.appendChild(tdtarget);
		 					tr.appendChild(tdanswer);
		 					tr.appendChild(tdpersent);
		 					
		 					
		 					tr.appendChild(tdinfo);
	 	//				}			// 관리자 제거
 					});
        	 }
         },
         error: function(error) {
            console.error('Error fetching data:', error);
         }
      });
	}
}

function per1() {
	$.ajax({
        url: '${pageContext.request.contextPath}/e/per1',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
       	 if(response.result === "Y"){
				var listall = response.usersall;
				var target = response.target;
 				var answer = response.answer;
 				var targetsum = response.targetsum;
 				var answersum = response.answersum;
 				
 				mainContent.innerHTML = ''; // 기존 내용을 지우고
 				var dv = document.createElement("div");
 				dv.setAttribute("class","scroll-container");
 				var tb = document.createElement("TABLE");
					tb.setAttribute("class","scrolltable");
					
 				var thead = document.createElement("THEAD");
 				
 				var maintr1 = document.createElement("TR");
 				var maintd1 = document.createElement("TD");
 				maintd1.textContent = "평가자정보";
 				maintd1.setAttribute("colspan","4");
 				var maintd2 = document.createElement("TD");
 				maintd2.textContent = "평가대상자수";
 				maintd2.setAttribute("rowspan","2");
 				maintd2.setAttribute("style","width: 140px;");
 				var maintd3 = document.createElement("TD");
 				maintd3.textContent = "평가결과수";
 				maintd3.setAttribute("rowspan","2");
 				maintd3.setAttribute("style","width: 120px;");
 				var maintd4 = document.createElement("TD");
 				maintd4.textContent = "진행율";
 				maintd4.setAttribute("rowspan","2");
 				var maintd7 = document.createElement("TD");
 				maintd7.textContent = "평가자 마이페이지";
 				maintd7.setAttribute("style","width: 187px;");
 				maintd7.setAttribute("class","lasttd");
 				maintd7.setAttribute("rowspan","2");
 				
 				var maintr2 = document.createElement("TR");

				var maintd9 = document.createElement("TD");
				maintd9.textContent = "기관명";
 				maintd9.setAttribute("style","width: 210px;");
				var maintd10 = document.createElement("TD");
				maintd10.textContent = "부서명";
				maintd10.setAttribute("style","width: 150px;");
				var maintd11 = document.createElement("TD");
				maintd11.textContent = "직급/직책";
				maintd11.setAttribute("style","width: 195px;");
				var maintd12 = document.createElement("TD");
				maintd12.textContent = "사원명";
				
				var maintr3 = document.createElement("TR");
				maintr3.setAttribute("style","width: 195px; background:#00A8E4;");
				var maintd13 = document.createElement("TD");
				maintd13.setAttribute("colspan","4");
				maintd13.textContent = "전 직원 정보";
				
				var maintd14 = document.createElement("TD");	// 대상자수
				maintd14.textContent = targetsum;
				
				var maintd15 = document.createElement("TD");	// 평가 결과수
				maintd15.textContent = answersum;
				
				var maintd16 = document.createElement("TD");
				var percentageall =  (answersum / targetsum) * 100;
				maintd16.textContent = isFinite(percentageall) ? percentageall.toFixed(2) + "%" : "N/A";
				
				var maintd17 = document.createElement("TD");
				maintd17.textContent = "-"
				maintd17.setAttribute("class","lasttd");
				
 				var tbody = document.createElement("TBODY");
				
				
 				mainContent.appendChild(dv);
 				dv.appendChild(tb);
 				tb.appendChild(thead);
 				thead.appendChild(maintr1);
 				maintr1.appendChild(maintd1);
 				maintr1.appendChild(maintd2);
 				maintr1.appendChild(maintd3);
 				maintr1.appendChild(maintd4);
 				maintr1.appendChild(maintd7);
 				thead.appendChild(maintr2);
 				maintr2.appendChild(maintd9);
 				maintr2.appendChild(maintd10);
 				maintr2.appendChild(maintd11);
 				maintr2.appendChild(maintd12);
 				thead.appendChild(maintr3);
 				maintr3.appendChild(maintd13);
 				maintr3.appendChild(maintd14);
 				maintr3.appendChild(maintd15);
 				maintr3.appendChild(maintd16);
 				maintr3.appendChild(maintd17);

 				tb.appendChild(tbody);
 				
 				listall.forEach(function (list) {
 				//	if(list.id != 12365478){		// 관리자 제거
 						
 						var matchingTarget = target.find(function (tg) {
 							return tg.id === list.id;
 						});
 						
 						var targetid, tgt
 						if(matchingTarget) {
 							targetid = matchingTarget.id;
 							tgt = matchingTarget.target;
 						}
 						
 						var matchingAnswer = answer.filter(function (as) {
 							return as.u2 === list.id;
 						});
 						var answerid
 						if (matchingAnswer && matchingAnswer.length > 0) {
 					        answerid = matchingAnswer[0].id;
 					    }
 						var answercnt = matchingAnswer ? matchingAnswer.length : 0;

 					    // Calculate the percentage, handle division by zero or empty string
 					    var percentage = answercnt > 0 ? (answercnt / tgt) * 100 : 0;
 					    
 						var idx = list.idx;
	 					var code = list.user_code;
	 					var hname = list.hspt_name;
	 					var subname = list.hspt_subname;
	 					var position = list.hspt_position
	 					var name = list.name;
	 					
	 					
	 					
	 					var tr = document.createElement("TR");
	 					
	 					var tdhname = document.createElement("TD");
	 					tdhname.textContent = hname;
	 					tdhname.setAttribute("style","width: 210px;");
	 					var tdsname = document.createElement("TD");
	 					tdsname.textContent = subname;
	 					tdsname.setAttribute("style","width: 150px;");
	 					var tdpo = document.createElement("TD");
	 					tdpo.textContent = position;
	 					tdpo.setAttribute("style","width: 195px;");
	 					var tdname = document.createElement("TD");
	 					tdname.textContent = name;
	 					
	 					var tdtarget = document.createElement("TD");
	 					tdtarget.setAttribute("style","width: 140px;");
	 					tdtarget.textContent = tgt;
	 					
	 					var tdanswer = document.createElement("TD");
	 					tdanswer.setAttribute("style","width: 120px;");
	 					tdanswer.textContent = answercnt;
	 					
	 					var tdpersent = document.createElement("TD");
	 					tdpersent.textContent = isFinite(percentage) ? percentage.toFixed(2) + "%" : "N/A";
	 					if (tdanswer.innerText === tdtarget.innerText) {
	 						tdpersent.setAttribute("style", "background:#32b0ca;");
						} else if (tdanswer.innerText == 0) {
							tdpersent.setAttribute("style", "background: red; color: #fff");
						}else if (Number(tdtarget.innerText) < Number(tdanswer.innerText)){
							tr.setAttribute("style", "background: #E6B8AF;")
						}
	 					var tdinfo = document.createElement("TD");
	 					var url = "<%=request.getContextPath() %>/demo/Info/"+idx;
	 					tdinfo.textContent = "링크";
	 					tdinfo.setAttribute("onclick","location.href='" + url + "'");
	 					tdinfo.setAttribute("style","width: 187px; cursor:pointer;");
	 					
	 					
	 					//
	 					
	 					tbody.appendChild(tr);
	 					tr.appendChild(tdhname);
	 					tr.appendChild(tdsname);
	 					tr.appendChild(tdpo);
	 					tr.appendChild(tdname);
	 					tr.appendChild(tdtarget);
	 					tr.appendChild(tdanswer);
	 					tr.appendChild(tdpersent);
	 					
	 					
	 					tr.appendChild(tdinfo);
 	//				}			// 관리자 제거
					
				});
       	 }
        },
        error: function(error) {
           console.error('Error fetching data:', error);
        }
     });
}


function per2() {
	$.ajax({
        url: '${pageContext.request.contextPath}/demo/per2',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
       	 if(response.result === "Y"){
				var listall = response.usersall;
				var target = response.target;
 				var answer = response.answer;
 				var targetsum = response.targetsum;
 				var answersum = response.answersum;
 				
 				mainContent.innerHTML = ''; // 기존 내용을 지우고
 				var dv = document.createElement("div");
 				dv.setAttribute("class","scroll-container");
 				var tb = document.createElement("TABLE");
					tb.setAttribute("class","scrolltable");
					
 				var thead = document.createElement("THEAD");
 				
 				var maintr1 = document.createElement("TR");
 				var maintd1 = document.createElement("TD");
 				maintd1.textContent = "평가자정보";
 				maintd1.setAttribute("colspan","4");
 				var maintd2 = document.createElement("TD");
 				maintd2.textContent = "평가대상자수";
 				maintd2.setAttribute("rowspan","2");
 				maintd2.setAttribute("style","width: 140px;");
 				var maintd3 = document.createElement("TD");
 				maintd3.textContent = "평가결과수";
 				maintd3.setAttribute("rowspan","2");
 				maintd3.setAttribute("style","width: 120px;");
 				var maintd4 = document.createElement("TD");
 				maintd4.textContent = "진행율";
 				maintd4.setAttribute("rowspan","2");
 				var maintd7 = document.createElement("TD");
 				maintd7.textContent = "평가자 마이페이지";
 				maintd7.setAttribute("style","width: 187px;");
 				maintd7.setAttribute("rowspan","2");
 				
 				var maintr2 = document.createElement("TR");

				var maintd9 = document.createElement("TD");
				maintd9.textContent = "기관명";
 				maintd9.setAttribute("style","width: 210px;");
				var maintd10 = document.createElement("TD");
				maintd10.textContent = "부서명";
				maintd10.setAttribute("style","width: 150px;");
				var maintd11 = document.createElement("TD");
				maintd11.textContent = "직급/직책";
				maintd11.setAttribute("style","width: 195px;");
				var maintd12 = document.createElement("TD");
				maintd12.textContent = "사원명";
				
				var maintr3 = document.createElement("TR");
				maintr3.setAttribute("style","width: 195px; background:#00A8E4;");
				var maintd13 = document.createElement("TD");
				maintd13.setAttribute("colspan","4");
				maintd13.textContent = "전 직원 정보";
				
				var maintd14 = document.createElement("TD");	// 대상자수
				maintd14.textContent = targetsum;
				
				var maintd15 = document.createElement("TD");	// 평가 결과수
				maintd15.textContent = answersum;
				
				var maintd16 = document.createElement("TD");
				var percentageall =  (answersum / targetsum) * 100;
				maintd16.textContent = isFinite(percentageall) ? percentageall.toFixed(2) + "%" : "N/A";
				
				var maintd17 = document.createElement("TD");
				maintd17.textContent = "-"
				
 				var tbody = document.createElement("TBODY");
				
				
 				mainContent.appendChild(dv);
 				dv.appendChild(tb);
 				tb.appendChild(thead);
 				thead.appendChild(maintr1);
 				maintr1.appendChild(maintd1);
 				maintr1.appendChild(maintd2);
 				maintr1.appendChild(maintd3);
 				maintr1.appendChild(maintd4);
 				maintr1.appendChild(maintd7);
 				thead.appendChild(maintr2);
 				maintr2.appendChild(maintd9);
 				maintr2.appendChild(maintd10);
 				maintr2.appendChild(maintd11);
 				maintr2.appendChild(maintd12);
 				thead.appendChild(maintr3);
 				maintr3.appendChild(maintd13);
 				maintr3.appendChild(maintd14);
 				maintr3.appendChild(maintd15);
 				maintr3.appendChild(maintd16);
 				maintr3.appendChild(maintd17);

 				tb.appendChild(tbody);
 				
 				listall.forEach(function (list) {
 				//	if(list.id != 12365478){		// 관리자 제거
 						
 						var matchingTarget = target.find(function (tg) {
 							return tg.id === list.id;
 						});
 						
 						var targetid, tgt
 						if(matchingTarget) {
 							targetid = matchingTarget.id;
 							tgt = matchingTarget.target;
 						}
 						
 						var matchingAnswer = answer.filter(function (as) {
 							return as.u2 === list.id;
 						});
 						var answerid
 						if (matchingAnswer && matchingAnswer.length > 0) {
 					        answerid = matchingAnswer[0].id;
 					    }
 						var answercnt = matchingAnswer ? matchingAnswer.length : 0;

 					    // Calculate the percentage, handle division by zero or empty string
 					    var percentage = answercnt > 0 ? (answercnt / tgt) * 100 : 0;
 						var idx = list.idx;
	 					var code = list.user_code;
	 					var hname = list.hspt_name;
	 					var subname = list.hspt_subname;
	 					var position = list.hspt_position
	 					var name = list.name;
	 					
	 					
	 					
	 					var tr = document.createElement("TR");
	 					
	 					var tdhname = document.createElement("TD");
	 					tdhname.textContent = hname;
	 					tdhname.setAttribute("style","width: 210px;");
	 					var tdsname = document.createElement("TD");
	 					tdsname.textContent = subname;
	 					tdsname.setAttribute("style","width: 150px;");
	 					var tdpo = document.createElement("TD");
	 					tdpo.textContent = position;
	 					tdpo.setAttribute("style","width: 195px;");
	 					var tdname = document.createElement("TD");
	 					tdname.textContent = name;
	 					
	 					var tdtarget = document.createElement("TD");
	 					tdtarget.setAttribute("style","width: 140px;");
	 					tdtarget.textContent = tgt;
	 					
	 					var tdanswer = document.createElement("TD");
	 					tdanswer.setAttribute("style","width: 120px;");
	 					tdanswer.textContent = answercnt;
	 					
	 					var tdpersent = document.createElement("TD");
	 					tdpersent.textContent = isFinite(percentage) ? percentage.toFixed(2) + "%" : "N/A";
	 					if (tdanswer.innerText === tdtarget.innerText) {
	 						tdpersent.setAttribute("style", "background:#32b0ca;");
						} else if (tdanswer.innerText == 0) {
							tdpersent.setAttribute("style", "background: red; color: #fff");
						}else if (Number(tdtarget.innerText) < Number(tdanswer.innerText)){
							tr.setAttribute("style", "background: #E6B8AF;")
						}
	 					var tdinfo = document.createElement("TD");
	 					var url = "<%=request.getContextPath() %>/demo/Info/"+idx;
	 					tdinfo.textContent = "링크";
	 					tdinfo.setAttribute("onclick","location.href='" + url + "'");
	 					tdinfo.setAttribute("style","width: 187px; cursor:pointer;");
	 					
	 					
	 					//
	 					
	 					tbody.appendChild(tr);
	 					tr.appendChild(tdhname);
	 					tr.appendChild(tdsname);
	 					tr.appendChild(tdpo);
	 					tr.appendChild(tdname);
	 					tr.appendChild(tdtarget);
	 					tr.appendChild(tdanswer);
	 					tr.appendChild(tdpersent);
	 					
	 					
	 					tr.appendChild(tdinfo);
 	//				}			// 관리자 제거
					
				});
       	 }
        },
        error: function(error) {
           console.error('Error fetching data:', error);
        }
     });
}


function per3() {
	$.ajax({
        url: '${pageContext.request.contextPath}/demo/per3',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
       	 if(response.result === "Y"){
				var listall = response.usersall;
				var target = response.target;
 				var answer = response.answer;
 				var targetsum = response.targetsum;
 				var answersum = response.answersum;
 				
 				mainContent.innerHTML = ''; // 기존 내용을 지우고
 				var dv = document.createElement("div");
 				dv.setAttribute("class","scroll-container");
 				var tb = document.createElement("TABLE");
					tb.setAttribute("class","scrolltable");
					
 				var thead = document.createElement("THEAD");
 				
 				var maintr1 = document.createElement("TR");
 				var maintd1 = document.createElement("TD");
 				maintd1.textContent = "평가자정보";
 				maintd1.setAttribute("colspan","4");
 				var maintd2 = document.createElement("TD");
 				maintd2.textContent = "평가대상자수";
 				maintd2.setAttribute("rowspan","2");
 				maintd2.setAttribute("style","width: 140px;");
 				var maintd3 = document.createElement("TD");
 				maintd3.textContent = "평가결과수";
 				maintd3.setAttribute("rowspan","2");
 				maintd3.setAttribute("style","width: 120px;");
 				var maintd4 = document.createElement("TD");
 				maintd4.textContent = "진행율";
 				maintd4.setAttribute("rowspan","2");
 				var maintd7 = document.createElement("TD");
 				maintd7.textContent = "평가자 마이페이지";
 				maintd7.setAttribute("style","width: 187px;");
 				maintd7.setAttribute("rowspan","2");
 				
 				var maintr2 = document.createElement("TR");

				var maintd9 = document.createElement("TD");
				maintd9.textContent = "기관명";
 				maintd9.setAttribute("style","width: 210px;");
				var maintd10 = document.createElement("TD");
				maintd10.textContent = "부서명";
				maintd10.setAttribute("style","width: 150px;");
				var maintd11 = document.createElement("TD");
				maintd11.textContent = "직급/직책";
				maintd11.setAttribute("style","width: 195px;");
				var maintd12 = document.createElement("TD");
				maintd12.textContent = "사원명";
				
				var maintr3 = document.createElement("TR");
				maintr3.setAttribute("style","width: 195px; background:#00A8E4;");
				var maintd13 = document.createElement("TD");
				maintd13.setAttribute("colspan","4");
				maintd13.textContent = "전 직원 정보";
				
				var maintd14 = document.createElement("TD");	// 대상자수
				maintd14.textContent = targetsum;
				
				var maintd15 = document.createElement("TD");	// 평가 결과수
				maintd15.textContent = answersum;
				
				var maintd16 = document.createElement("TD");
				var percentageall =  (answersum / targetsum) * 100;
				maintd16.textContent = isFinite(percentageall) ? percentageall.toFixed(2) + "%" : "N/A";
				
				var maintd17 = document.createElement("TD");
				maintd17.textContent = "-"
				
 				var tbody = document.createElement("TBODY");
				
				
 				mainContent.appendChild(dv);
 				dv.appendChild(tb);
 				tb.appendChild(thead);
 				thead.appendChild(maintr1);
 				maintr1.appendChild(maintd1);
 				maintr1.appendChild(maintd2);
 				maintr1.appendChild(maintd3);
 				maintr1.appendChild(maintd4);
 				maintr1.appendChild(maintd7);
 				thead.appendChild(maintr2);
 				maintr2.appendChild(maintd9);
 				maintr2.appendChild(maintd10);
 				maintr2.appendChild(maintd11);
 				maintr2.appendChild(maintd12);
 				thead.appendChild(maintr3);
 				maintr3.appendChild(maintd13);
 				maintr3.appendChild(maintd14);
 				maintr3.appendChild(maintd15);
 				maintr3.appendChild(maintd16);
 				maintr3.appendChild(maintd17);

 				tb.appendChild(tbody);
 				
 				listall.forEach(function (list) {
 				//	if(list.id != 12365478){		// 관리자 제거
 						
 						var matchingTarget = target.find(function (tg) {
 							return tg.id === list.id;
 						});
 						
 						var targetid, tgt
 						if(matchingTarget) {
 							targetid = matchingTarget.id;
 							tgt = matchingTarget.target;
 						}
 						

 						var matchingAnswer = answer.filter(function (as) {
 							return as.u2 === list.id;
 						});
 						var answerid
 						if (matchingAnswer && matchingAnswer.length > 0) {
 					        answerid = matchingAnswer[0].id;
 					    }
 						var answercnt = matchingAnswer ? matchingAnswer.length : 0;

 					    // Calculate the percentage, handle division by zero or empty string
 					    var percentage = answercnt > 0 ? (answercnt / tgt) * 100 : 0;
 					    
 						var idx = list.idx;
	 					var code = list.user_code;
	 					var hname = list.hspt_name;
	 					var subname = list.hspt_subname;
	 					var position = list.hspt_position
	 					var name = list.name;
	 					
	 					var tr = document.createElement("TR");
	 					
	 					var tdhname = document.createElement("TD");
	 					tdhname.textContent = hname;
	 					tdhname.setAttribute("style","width: 210px;");
	 					var tdsname = document.createElement("TD");
	 					tdsname.textContent = subname;
	 					tdsname.setAttribute("style","width: 150px;");
	 					var tdpo = document.createElement("TD");
	 					tdpo.textContent = position;
	 					tdpo.setAttribute("style","width: 195px;");
	 					var tdname = document.createElement("TD");
	 					tdname.textContent = name;
	 					
	 					var tdtarget = document.createElement("TD");
	 					tdtarget.setAttribute("style","width: 140px;");
	 					tdtarget.textContent = tgt;
	 					
	 					var tdanswer = document.createElement("TD");
	 					tdanswer.setAttribute("style","width: 120px;");
	 					tdanswer.textContent = answercnt;
	 					
	 					var tdpersent = document.createElement("TD");
	 					tdpersent.textContent = isFinite(percentage) ? percentage.toFixed(2) + "%" : "N/A";
	 					if (tdanswer.innerText === tdtarget.innerText) {
	 						tdpersent.setAttribute("style", "background:#32b0ca;");
						} else if (tdanswer.innerText == 0) {
							tdpersent.setAttribute("style", "background: red; color: #fff");
						} else if (Number(tdtarget.innerText) < Number(tdanswer.innerText)){
							tr.setAttribute("style", "background: #E6B8AF;")
						}
	 					
	 					var tdinfo = document.createElement("TD");
	 					var url = "<%=request.getContextPath() %>/demo/Info/"+idx;
	 					tdinfo.textContent = "링크";
	 					tdinfo.setAttribute("onclick","location.href='" + url + "'");
	 					tdinfo.setAttribute("style","width: 187px; cursor:pointer;");
	 					
	 					
	 					//
	 					
	 					tbody.appendChild(tr);
	 					tr.appendChild(tdhname);
	 					tr.appendChild(tdsname);
	 					tr.appendChild(tdpo);
	 					tr.appendChild(tdname);
	 					tr.appendChild(tdtarget);
	 					tr.appendChild(tdanswer);
	 					tr.appendChild(tdpersent);
	 					
	 					
	 					tr.appendChild(tdinfo);
 	//				}			// 관리자 제거
					
				});
       	 }
        },
        error: function(error) {
           console.error('Error fetching data:', error);
        }
     });
}

// 설정관리
function setting() {
	$.ajax({
		url: '${pageContext.request.contextPath}/hwt/setting',
		type: 'GET',
		dataType: 'json',
		success: function(res) {
			if(res.result === "Y"){
 				
 				mainContent.innerHTML = ''; // 기존 내용을 지우고
 				const accessAll = res.accessAll;
 				const user = res.user;
 				
 				const dv = document.createElement("div");
 				dv.setAttribute('class', 'setting-area');
 				mainContent.appendChild(dv);
 				
 				const dv02 = document.createElement("div");
 				dv02.setAttribute('class','setting-zone');
 				
 				const dv03 = document.createElement("div");
 				dv03.setAttribute('class', 'setting-left');
 				dv03.setAttribute('data-menu', 'setting__insert');
 				const left_span = document.createElement("span");
 				left_span.textContent = '+ 권한추가';
 				
 				const dv04 = document.createElement("div");
 				dv04.setAttribute('class', 'setting-right');
 				dv04.setAttribute('data-menu', 'setting__delete');
 				const right_span = document.createElement("span");
 				right_span.textContent = '- 권한삭제'
 				
 				const dv05 = document.createElement("div");
 				dv05.setAttribute('class', 'setting-center');
 				
 				dv.appendChild(dv02);
 				dv02.appendChild(dv03);
 				dv03.appendChild(left_span);
 				dv02.appendChild(dv05);
 				dv02.appendChild(dv04);
 				dv04.appendChild(right_span);
 				
				
 				
			}
		},
		error: function(error) {
			console.error('Error fetching data:', error);
		}
	});
}

function setting__insert() {
	$.ajax({
		url: '${pageContext.request.contextPath}/hwt/setting__insert',
		type: 'GET',
		dataType: 'json',
		success: function(res) {
			if(res.result === "Y"){
 				 
				// Clear existing content
				mainContent.innerHTML = '';
				
				const dv = document.createElement("div");
				dv.setAttribute('class', 'setting-area');
				mainContent.appendChild(dv);
				
				const dv02 = document.createElement("div");
				dv02.setAttribute('class', 'setting-select-zone');
				dv.appendChild(dv02);
				
				const dv03 = document.createElement("div");
				dv03.setAttribute('class', 'setting-insert-zone');
				dv.appendChild(dv03);
				
				const hsptArea = document.createElement("div");
				hsptArea.setAttribute('class', 'hspt-area');
				dv02.appendChild(hsptArea);
				
				const userSubArea = document.createElement('div');
				userSubArea.setAttribute('class', 'user-sub-area');
				userSubArea.setAttribute('id', 'peopleDisplay');
				dv02.appendChild(userSubArea);
				
				const userArea = document.createElement("div");
				userArea.setAttribute("class", "user-area");
				userArea.setAttribute('id', 'userDisplay');
				dv02.appendChild(userArea);
				
				const uniqueHospitals = new Set();
				res.accessAll.forEach(function(item) {
				    uniqueHospitals.add(item.hspt_name);
				});
				
				// 선택 상태를 저장할 객체
				let selectedState = {
				    departments: new Set(),
				    employees: new Set()
				};
				
				uniqueHospitals.forEach(function(hsptname) {
				    const hsptDiv = document.createElement("div");
				    hsptDiv.textContent = hsptname;
				    hsptArea.appendChild(hsptDiv);
				
				    hsptDiv.addEventListener('click', function() {
				        userSubArea.innerHTML = '';
				        userArea.innerHTML = '';
				
				        const subDepartments = new Set();
				        
				        res.accessAll.forEach(function(item) {
				            if(item.hspt_name === hsptname) subDepartments.add(item.hspt_subname);
				        });
				
				        subDepartments.forEach(function(subname) {
				            const subDivWrapper = document.createElement("div");
				            const subDivCheckbox = document.createElement("input");
				            subDivCheckbox.type = 'checkbox';
				            subDivCheckbox.className = 'sub-dept-checkbox';
				            subDivCheckbox.dataset.subname = subname;
				
				            const subDivText = document.createElement("span");
				            subDivText.textContent = subname;
				            subDivText.style.cursor = "pointer";
				
				            subDivCheckbox.addEventListener('change', function() {
				                // 여기서 `this`는 이벤트가 발생한 `subDivCheckbox` 요소를 가리킵니다.
				                handleDepartmentCheckboxChange(this, subname, selectedState, dv03, addToInsertZone, removeFromInsertZone);
				            });
				
				            subDivText.addEventListener('click', function() {
				            	displayPeopleInSubdepartment(subname, subDivCheckbox, selectedState);
				            });
				
				            subDivWrapper.appendChild(subDivCheckbox);
				            subDivWrapper.appendChild(subDivText);
				            userSubArea.appendChild(subDivWrapper);
				        });
				     // 체크박스 상태 복원
				        document.querySelectorAll('.sub-dept-checkbox').forEach(checkbox => {
				            if (selectedState.departments.has(checkbox.dataset.subname)) {
				                checkbox.checked = true;
				            }
				        });

				        document.querySelectorAll('.person-checkbox').forEach(checkbox => {
				            if (selectedState.employees.has(checkbox.dataset.name)) {
				                checkbox.checked = true;
				            }
				        });
				    });
				});
				function addToInsertZone(itemName, itemType, dv03) { 
					// Prevent duplicate entries
				    if (!dv03.querySelector('[data-name="' + itemName + '"][data-type="' + itemType + '"]')) {
				        const itemDiv = document.createElement("div");
				        itemDiv.textContent = itemName + " (" + itemType + ")";
				        itemDiv.dataset.type = itemType;
				        itemDiv.dataset.name = itemName;
				        dv03.appendChild(itemDiv);
				    }
			    }
					
				
				function handleEmployeeCheckboxChange(checkbox, subname, selectedState, dv03, addToInsertZone, removeFromInsertZone) {
				    const isChecked = checkbox.checked;
				    const departmentCheckbox = document.querySelector(`.sub-dept-checkbox[data-subname="${subname}"]`);
				    const employeeCheckboxes = document.querySelectorAll(`.person-checkbox[data-subname="${subname}"]`);

				    if (isChecked) {
				        selectedState.employees.add(checkbox.dataset.name);
				    } else {
				        selectedState.employees.delete(checkbox.dataset.name);
				        removeFromInsertZone(checkbox.dataset.name, "person", dv03);
				    }

				    const allChecked = [...employeeCheckboxes].every(cb => cb.checked || selectedState.employees.has(cb.dataset.name));

				    if (allChecked) {
				        departmentCheckbox.checked = true;
				        selectedState.departments.add(subname);

				        // Remove individual employee entries if they were added before.
				        employeeCheckboxes.forEach(cb => {
				            removeFromInsertZone(cb.dataset.name, "person", dv03);
				        });

				        // Add the department entry.
				        addToInsertZone(subname, 'department', dv03);
				    } else {
				        departmentCheckbox.checked = false;
				        selectedState.departments.delete(subname);
				        removeFromInsertZone(subname, 'department', dv03);

				        // Add individual employees to dv03 if they are still selected.
				        employeeCheckboxes.forEach(cb => {
				            if (cb.checked || selectedState.employees.has(cb.dataset.name)) {
				                addToInsertZone(cb.dataset.name, "person", dv03);
				            }
				        });
				    }
				}
				// Assuming initial setup and element creation code remains the same.

				function handleDepartmentCheckboxChange(checkbox, subname, selectedState, dv03, addToInsertZone, removeFromInsertZone) {
					console.log("handleDepartmentCheckboxChange called", { checkbox, subname, selectedState });
			    
				    const isDepartmentChecked = checkbox.checked;
				    const employeeCheckboxes = document.querySelectorAll(`.person-checkbox[data-subname="${subname}"]`);
				    
				    if (isDepartmentChecked) {
				    	// 부서 체크 시, 부서를 selectedState에 추가하고, dv03에 부서를 추가
				        selectedState.departments.add(subname);
				        addToInsertZone(subname, 'department', dv03); // 부서 추가
				        
				     	// 해당 부서에 속한 모든 직원을 자동으로 선택하고, selectedState에 추가
				        employeeCheckboxes.forEach(cb => {
				            cb.checked = true;
				            selectedState.employees.add(cb.dataset.name); // 직원 상태 업데이트

				            // 개별 직원을 dv03에 추가하는 대신, 부서를 추가하는 방식으로 구현할 수 있습니다.
				            // 여기서는 부서 단위로 추가하는 로직만 포함되어 있습니다.
				        });
				    } else {
				        // 부서 체크 해제 시, 부서를 selectedState에서 제거하고, dv03에서 부서 제거
				        selectedState.departments.delete(subname);
				        removeFromInsertZone(subname, 'department', dv03); // 부서 제거
				        
				        // 해당 부서에 속한 모든 직원의 선택을 해제하고, selectedState에서 제거
				        employeeCheckboxes.forEach(cb => {
				            cb.checked = false;
				            selectedState.employees.delete(cb.dataset.name); // 직원 상태 업데이트
				            
				            // 개별 직원을 dv03에서 제거하는 로직은 여기에 포함되지 않았습니다.
				            // 필요한 경우, 여기서 개별 직원을 제거하는 로직을 추가할 수 있습니다.
				        });
				    }
				 
				}
				function displayPeopleInSubdepartment(subname, departmentCheckbox, selectedState) {
				    userArea.innerHTML = ''; // Clear the current list

				    const isDepartmentChecked = departmentCheckbox.checked; // Check if the department is checked

				    const peopleInSub = res.accessAll.filter(item => item.hspt_subname === subname);

				    peopleInSub.forEach(person => {
				        const personDivWrapper = document.createElement("div");
				        const personDivCheckbox = document.createElement("input");
				        personDivCheckbox.type = 'checkbox';
				        personDivCheckbox.className = 'person-checkbox';
				        personDivCheckbox.dataset.name = person.name;
				        personDivCheckbox.dataset.subname = subname;

				        // Set the checkbox state based on the department's checkbox state
				        personDivCheckbox.checked = isDepartmentChecked;

				        const personDivText = document.createElement("span");
				        personDivText.textContent = person.name;

				        personDivWrapper.appendChild(personDivCheckbox);
				        personDivWrapper.appendChild(personDivText);
				        userArea.appendChild(personDivWrapper);
				    });
				}
				
				
				
				function removeFromInsertZone(itemName, itemType) {
				    console.log('Attempting to remove: ' + itemName + ' of type ' + itemType);
				    // querySelectorAll을 사용하여 일치하는 모든 요소를 선택합니다.
				    const items = dv03.querySelectorAll('[data-name="' + itemName + '"][data-type="' + itemType + '"]');
				    console.log('Found items to remove:', items.length);
				    items.forEach(function(item) {
				        console.log('Removing item: ', item);
				        item.parentNode.removeChild(item); // 각 항목을 부모 노드에서 제거합니다.
				    });
				}
				function clearIndividualsFromInsertZone(subname) {
				    const individuals = dv03.querySelectorAll('[data-type="person"]');
				    individuals.forEach(ind => {
				        if (ind.textContent.includes(subname)) {
				            dv03.removeChild(ind);
				        }
				    });
				}
				function checkDepartmentState(subname, selectedState, addToInsertZone, removeFromInsertZone) {
				    const allEmployeeCheckboxes = document.querySelectorAll(`.person-checkbox[data-subname="${subname}"]`);
				    const departmentCheckbox = document.querySelector(`.sub-dept-checkbox[data-subname="${subname}"]`);
				    
				    const allChecked = Array.from(allEmployeeCheckboxes).every(cb => cb.checked);
				    if (allChecked) {
				        departmentCheckbox.checked = true;
				        selectedState.departments.add(subname);
				        addToInsertZone(subname, 'department');
				    } else {
				        departmentCheckbox.checked = false;
				        selectedState.departments.delete(subname);
				        removeFromInsertZone(subname, 'department');
				    }
				}
			
			}
		},
		error: function(error) {
			console.error('Error fetching data:', error);
		}
	});
}



function setting__delete() {
	$.ajax({
		url: '${pageContext.request.contextPath}/hwt/setting__delete',
		type: 'GET',
		dataType: 'json',
		success: function(res) {
			if(res.result === "Y"){
 				
 				mainContent.innerHTML = ''; // 기존 내용을 지우고
 				const accessAll = res.accessAll;
 				const user = res.user;
 				
 				const dv = document.createElement("div");
 				dv.setAttribute('class', 'setting-area');
 				mainContent.appendChild(dv);
 				
 				const dv02 = document.createElement("div");
 				dv02.setAttribute('class','setting-zone');
 				
 				const dv03 = document.createElement("div");
 				dv03.setAttribute('class', 'setting-left');
 				
 				
 				const dv04 = document.createElement("div");
 				dv04.setAttribute('class', 'setting-right');
 				
 				const dv05 = document.createElement("div");
 				dv05.setAttribute('class', 'setting-center');
 				
 				dv.appendChild(dv02);
 				dv02.appendChild(dv03);
 				dv02.appendChild(dv05);
 				dv02.appendChild(dv04);
 				
				
 				
			}
		},
		error: function(error) {
			console.error('Error fetching data:', error);
		}
	});
}
var targetId = "";
console.log("대상 아이디 초기화 : "+ targetId);
var frm = $("#frm");
//비밀번호 초기화
function pwdreset(element){
	var name = element.getAttribute('data-name');
	var id = element.getAttribute('data-id');
	targetId = id;
	console.log(name.substring(0,1));
	console.log(targetId);
	
	modal3.classList.toggle('show');
 	msg3.style.top = '34%';
	msg3.innerHTML = '<p>'+name.substring(0,1)+'ㅇㅇ 님의 비밀번호를 초기화 하시겠습니까?</p>'
	if (modal3.classList.contains('show')) {
		body.style.overflow = 'hidden';
	}
	
}
function modal_insert(){
	closePopup3();
	
	// confirm창 띄우기
 	msg4.style.top = '34%';
	msg4.innerHTML = '<p><input type="password" value="" name="pwd_reset_input" id="pwd_reset_input" placeholder="관리자 비밀번호를 입력해주세요." autofocus="autofocus"></p>';

	openModal4();
}
function pwd_reset() {
// 	var pwd_reset_input = document.getElementById("#pwd_reset_input");
	console.log($("#pwd_reset_input").val());
	console.log(targetId);
	if ($("#pwd_reset_input").val() === '123qwe') {
		// 관리자 비밀번호가 일치 시
		$.ajax({
			type: 'post',
			url: '${pageContext.request.contextPath}/demo/pwdreset/'+targetId,
			datatype: 'json',
			data: {
				id: targetId,
			},
			success: function(response) {
				var res = response.result;
				
				if (res === "Y") {
					closePopup4();
					modal.classList.toggle('show');
				 	msg.style.top = '34%';
					msg.innerHTML = '<p>초기화가 완료되었습니다.</p>';
					$('.btn1').attr("onclick", "reload()");
				}
				else {
					closePopup4();
					modal.classList.toggle('show');
				 	msg.style.top = '34%';
					msg.innerHTML = '<p>데이터 오류입니다.</p>';
					$('.btn1').attr("onclick", "reload()");
				}
			},
			error: function(error) {
				console.error('Error fetching data: ',error);
			}
		});
// 		closePopup();
	} 
	else {
		// 관리자 비밀번호가 일치하지 않을 때
		closePopup4();
		modal.classList.toggle('show');
	 	msg.style.top = '34%';
		msg.innerHTML = '<p>비밀번호가 일치하지 않습니다.</p>';
		$('.btn1').attr("onclick", "reload()");
	}
	
	
	
}

function reload() {
	location.reload();
}
// 특정 영역만 리로드?
function targetreload() {
	targetId.load(window.location.href + targetId);
}

const menuScripts = [
	{ id: 'userall', contentId: 'all', script: userall },
	{ id: 'user1', contentId: 'content1', script: user1 },
	{ id: 'user2', contentId: 'content2', script: user2 },
	{ id: 'user3', contentId: 'content3', script: user3 },
	{ id: 'per1', contentId: 'content1', script: per1 },
	{ id: 'per2', contentId: 'content2', script: per2 },
	{ id: 'per3', contentId: 'content3', script: per3 },
	{ id: 'perall', contentId: 'all', script: perall },
	{ id: 'setting', contentId: 'all', script: setting },
	{ id: 'setting__insert', contentId: 'all', script: setting__insert },
	{ id: 'setting__delete', contentId: 'all', script: setting__delete },
];
function activateMenu(menuIndex) {

	
	menuLinks.forEach(link => link.classList.remove('active'));
	
	menuLinks[menuIndex].classList.add('active');
	menuLinks[menuIndex].focus(); // 선택된 메뉴 항목에 포커스 설정
	const menuId = menuLinks[menuIndex].getAttribute('data-menu');
	const contentId = menuLinks[menuIndex].getAttribute('data-content');
	const menuScript = menuScripts.find(item => item.id === menuId);
// 	console.log(menuIndex);
	if (menuScript) {
        menuScript.script(contentId);
	// Check if the 'icon-image' class exists in the menuLink
	const iconImage1 = menuLinks[0].querySelector('.icon-image');
	const iconImage2 = menuLinks[1].querySelector('.icon-image');
	if (iconImage1) {
		// Set the image source based on the 'active' class
		if(menuIndex == 0){
			iconImage1.src = "${pageContext.request.contextPath}/resources/icon/ev/member_icon_on.png";
			iconImage2.src = "${pageContext.request.contextPath}/resources/icon/ev/setting_off.png";
		}else if (menuIndex == 1){
			iconImage1.src = "${pageContext.request.contextPath}/resources/icon/ev/member_icon_off.png";
			iconImage2.src = "${pageContext.request.contextPath}/resources/icon/ev/setting_on.png";
		}else if (menuIndex == 2){
			iconImage1.src = "${pageContext.request.contextPath}/resources/icon/ev/member_icon_off.png";
			iconImage2.src = "${pageContext.request.contextPath}/resources/icon/ev/setting_on.png";
		}else if (menuIndex == 3){
			iconImage1.src = "${pageContext.request.contextPath}/resources/icon/ev/member_icon_off.png";
			iconImage2.src = "${pageContext.request.contextPath}/resources/icon/ev/setting_on.png";
		}
	}


     // 추가 작업 함수가 정의되어 있으면 실행
        if (menuScript.additionalAction) {
//         	console.log("Additional action exists:", menuScript.additionalAction);
            menuScript.additionalAction();
        }else {
//             console.log("No additional action defined.");
        }
    }
}


// 검색기능?
function findStr() {
    var n = 0;
    var str = document.getElementById("str").value;
    if(navigator.userAgent.indexOf("rv:11") > -1) {
        var f, contents = document.body.createTextRange();
        for(var i = 0; i <= n && (f = contents.findText(str)) != false; i++) {
            contents.moveStart('character');
            contents.moveEnd('textedit');
        }
        if(f) {
            contents.moveStart('character', -1);
            contents.findText(str);
            contents.select();
            n++;
        }
    } else {
        window.find(str);
    }
}


let index = 1;


function closePopup(){
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}
function closePopup3(){
	modal3.classList.toggle('show');
	if (!modal3.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}

function closePopup4(){
	modal4.classList.toggle('show');
	if (!modal4.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}

function openModal4() {
	modal4.classList.toggle('show');
	if (modal4.classList.contains('show')) {
		body.style.overflow = 'hidden';
	}
}













</script>
</html>