<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage_css.css">
<script>

</script>
</head>
<body>

<form id="frm">
<div class="section-my">
<div style="background-color: var(--bg-color); color: var(--white-color); padding: 1.5rem 1.5rem 10px; padding-left: 33px;
    transition: .5s; z-index: 101; position: fixed; width: calc(var(--nav--width) + 9.25rem); top: 0; left: 0; height: 80px;">
		<div style="display: flex; justify-content: space-between;">
			<div style="width: 100%;">
				<div class="nav__brand" style="">
					<a href="" class="nav__logo" >코어솔루션 인사평가 시스템</a>
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
				
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="info" data-content="">
						<span class="nav_name">직원 평가하기</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="" data-content="">
						<span class="nav_name">부서원 평가 진행률</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="" data-content="">
						<span class="nav_name">본인 평가 결과 리포트</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="submember" data-content="">
						<span class="nav_name">부서원 평가 결과 리포트</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="" data-content="">
						<span class="nav_name">부서원2 평가 결과 리포트</span>
					</a>
					
					<div style="border-top:1px solid #fff; margin-bottom: 16px; margin-top: 16px;"></div>
					
				</div>
            </div>
        </nav>
    </div>
	<div class="nav__link2" style="margin: 0; position: fixed; bottom: 0;
	 width: calc(var(--nav--width) + 9.25rem); background-color: #08254c; z-index: 100;
	display: flex; justify-content: space-evenly; left: 0; align-items: center; border-radius: 0;">
		<div style="display: flex; justify-content: center; flex-wrap: wrap;">
			<%-- <div style="display: flex; justify-content: center;">
			<input type="text" id="str"><button value="찾기" onclick="findStr()" style="background:url(<%=request.getContextPath() %>/resources/icon/search.png) no-repeat center; background-size: contain"></button>
			</div> --%>
			<img style="width: 90%;" src="<%=request.getContextPath() %>/resources/img/core_logo.png">
		</div>
	</div>
	<div id="main-content-my" 
			style="width : calc(99vw - (var(--nav--width) + 9.25rem)); height : 100%; margin-left: calc(var(--nav--width) + 9.25rem);">
		<!-- 내용을 이곳에 추가 -->
		<!-- class="col-md-9 ms-sm-auto col-lg-10 px-md-4"  -->
		<div class="main-logo"><img src="${pageContext.request.contextPath}/resources/img/2hspt.png"></div>
		<div class="main-section">
			<table style="width: 100%;">
				<tr>
					<td style="text-align: left; border:none;" colspan="8">▣ 본인의 정보를 확인해 주세요</td>
				</tr>
				<tr style="color:#fff; background:#094477">
					<td>기관명</td><td>부서명</td><td>직급/직책</td><td>사원번호</td><td>이름</td><td>연락처</td><td>입사일자</td>
				</tr>
				<tr style="">
					<td>효사랑가족요양병원</td><td>5병동</td><td>병동장</td><td>사원번호</td><td>장ㅇㅇ</td><td>010-0000-0000</td><td>18.05.25</td>
				</tr>
				
			</table>
		</div>
		
	</div>

</div>
<nav>
	<div style="position: fixed; right: 10px; bottom: 10px; border: 1px solid; padding: 10px; border-radius: 100px; cursor:pointer;" onclick="javascript:window.scrollTo(0,0);">Top</div>
</nav>
</form>
<script>

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
const mainContent = document.getElementById('main-content-my');

menuLinks.forEach(link => {
	link.addEventListener('click', function(event){
		event.preventDefault();
		currentMenuIndex = Array.from(menuLinks).indexOf(this);	// 클릭된 메뉴의 인덱스를 업데이트
		activateMenu(currentMenuIndex);
		
	});
});

function info() {
	mainContent.innerHTML = ''; // 기존 내용을 지우고
	// Fetch the content of Info.jsp using AJAX
	var iframe = document.createElement("iframe");
	iframe.src = '${pageContext.request.contextPath}/e/Info/218'
	iframe.width = "100%";
	iframe.style.height = "99vh";
	iframe.style.border = 'none';
	mainContent.appendChild(iframe);
}

function submember() {
	$.ajax({
		url: '${pageContext.request.contextPath}/e/sub/218',
		type: 'GET',
		dataType: 'json',
		success: function(response) {
			if (response.result === "Y"){
				mainContent.innerHTML = ''; // 기존 내용을 지우고
			}
		},
		error: function(error) {
			console.error('Error fetching data:', error);
		}
	});
}

const menuScripts = [
	{ id: 'info', contentId: 'all', script: info },
	{ id: 'submember', contentId: 'all', script: submember },
];
function activateMenu(menuIndex) {

	
	menuLinks.forEach(link => link.classList.remove('active'));
	
	menuLinks[menuIndex].classList.add('active');
	menuLinks[menuIndex].focus(); // 선택된 메뉴 항목에 포커스 설정
	const menuId = menuLinks[menuIndex].getAttribute('data-menu');
	const contentId = menuLinks[menuIndex].getAttribute('data-content');
	const menuScript = menuScripts.find(item => item.id === menuId);
	console.log("console.log(menuScript);" + menuScript);
	if (menuScript) {
        menuScript.script(contentId);
        
     // 추가 작업 함수가 정의되어 있으면 실행
        if (menuScript.additionalAction) {
        	console.log("Additional action exists:", menuScript.additionalAction);
            menuScript.additionalAction();
        }else {
            console.log("No additional action defined.");
        }
    }
}



</script>

<script>
const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const modal2 = document.querySelector('.modal2');
const msg = document.querySelector('.menu_msg');
const msg2 = document.querySelector('.menu_msg2');
var id = "${sessionScope.loginmember}";
var info = "${info.id}";
console.log("세션아이디 ${sessionScope.loginmember}");
console.log("model아이디 ${info.id}");
if(id != info && id != '12365478'){
	alert("잘못된 접근입니다.");
	location.href = "${pageContext.request.contextPath}/";
}

function closePopup(){
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}
</script>
</body>
</html>