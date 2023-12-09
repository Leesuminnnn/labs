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
		<div class="main-section" id="main-section">
			<table style="width: 100%;">
				<tr>
					<td style="text-align: left; border:none;" colspan="8">▣ 본인의 정보를 확인해 주세요</td>
				</tr>
				<tr style="color:#fff; background:#094477">
					<td>기관명</td><td>부서명</td><td>직급/직책</td><td>사원번호</td><td>이름</td><td>연락처</td><td>입사일자</td>
				</tr>
				<tr style="">
					<td>${info.hspt_name }</td><td>${info.hspt_subname }</td><td>${info.hspt_position }</td><td>${info.id}</td><td>${info.name }</td><td>010-0000-0000</td><td>${info.reg_date }</td>
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
const mainContent = document.getElementById('main-section');

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
	iframe.src = '${pageContext.request.contextPath}/e/Info/${info.idx}'
	iframe.width = "100%";
	iframe.style.height = "99vh";
	iframe.style.border = 'none';
	mainContent.appendChild(iframe);
}

function submember() {
	$.ajax({
		url: '${pageContext.request.contextPath}/e/sub/${info.idx}',
		type: 'GET',
		dataType: 'json',
		success: function(response) {
			if (response.result === "Y"){
				mainContent.innerHTML = ''; // 기존 내용을 지우고
				
				const u = response.users;
				const c = response.subcnt;
				const list = response.list;
				const list2 = response.list2;
				
				const tb = document.createElement("TABLE");
 				
				const maintr = document.createElement("TR");
 				
				const maintd1 = document.createElement("TD");
 				maintd1.textContent = "소속기관";
 				const maintd2 = document.createElement("TD");
 				maintd2.textContent = u.hspt_name;
 				
 				const maintd3 = document.createElement("TD");
 				maintd3.textContent = "부서명";
 				const maintd4 = document.createElement("TD");
 				maintd4.textContent = u.hspt_subname;
 				
 				const maintd5 = document.createElement("TD");
 				maintd5.textContent = "부서인원";
 				const maintd6 = document.createElement("TD");
 				maintd6.textContent = c;
 				
 				const maintd7 = document.createElement("TD");
 				maintd7.textContent = "부서원 평균점수";
 				const maintd8 = document.createElement("TD");
 				maintd8.setAttribute("id","score");
 				maintd8.textContent = "";
 				
 				const div = document.createElement("div");
 				div.setAttribute("style", "text-align: left;");
 				div.textContent = "▣ 평가조회 버튼을 클릭하여 개인별 평가결과를 확인해주세요.";
				
 				const tb2 = document.createElement("TABLE");
				const maintr2 = document.createElement("TR");
 				
				const maintd21 = document.createElement("TD");
 				maintd21.textContent = "소속기관";
 				const maintd22 = document.createElement("TD");
 				maintd22.textContent = "직급";
 				
 				const maintd23 = document.createElement("TD");
 				maintd23.textContent = "사원번호";
 				const maintd24 = document.createElement("TD");
 				maintd24.textContent = "성명";
 				
 				const maintd25 = document.createElement("TD");
 				maintd25.textContent = "평가점수";
 				const maintd26 = document.createElement("TD");
 				maintd26.textContent = "평가순위";
 				
 				const maintd27 = document.createElement("TD");
 				maintd27.textContent = "평가등급";
 				const maintd28 = document.createElement("TD");
 				maintd28.textContent = "평가조회";
 				
 				
 				mainContent.appendChild(tb);
 				tb.appendChild(maintr);
 				mainContent.appendChild(div);
 				maintr.appendChild(maintd1);
 				maintr.appendChild(maintd2);
 				maintr.appendChild(maintd3);
 				maintr.appendChild(maintd4);
 				maintr.appendChild(maintd5);
 				maintr.appendChild(maintd6);
 				maintr.appendChild(maintd7);
 				maintr.appendChild(maintd8);
 				tb2.appendChild(maintr2);
 				maintr2.appendChild(maintd21);
 				maintr2.appendChild(maintd22);
 				maintr2.appendChild(maintd23);
 				maintr2.appendChild(maintd24);
 				maintr2.appendChild(maintd25);
 				maintr2.appendChild(maintd26);
 				maintr2.appendChild(maintd27);
 				maintr2.appendChild(maintd28);

 				mainContent.append(tb2);
 				const tr = document.createElement("TR");
 				const td1 = document.createElement("TD");
 				const td2 = document.createElement("TD");
 				const td3 = document.createElement("TD");
 				const td4 = document.createElement("TD");
 				const td5 = document.createElement("TD");
 				const td6 = document.createElement("TD");
 				const td7 = document.createElement("TD");
 				const td8 = document.createElement("TD");
 				
 				function mapValueToScore(value) {
 				    switch (value) {
 				        case '매우우수':
 				            return 5;
 				        case '우수':
 				            return 4;
 				        case '보통':
 				            return 3;
 				        case '미흡':
 				            return 2;
 				        case '매우미흡':
 				            return 1;
 				        default:
 				            return 0; 
 				    }
 				}
	
				const idScores = {};
				let totalSum = 0;
				$.each (list2, function (index, t) {
					const values = t.d1.toLowerCase().split(',').map(value => value.trim());
//					console.log(values);
					values.forEach(value => {
			           const score = mapValueToScore(value) || 0;
			           console.log(score);
			           idScores[t.t1] = (idScores[t.t1] || 0) + score;
//			           console.log(idScores[t.t1]);
			           const per = idScores[t.t1] / (c - 1);
			          //console.log(per);
					});
 				});
				Object.keys(idScores).forEach(id => {
// 					console.log((idScores[id] / c).toFixed(1));
 				});
 				$.each (list, function (index, l) {
 						
	 					const rawValue = idScores[l.id] / (c - 1 ) || 0;
	 				    const formattedValue = rawValue.toFixed(1);
//	 				   console.log("l.id:", l.id, "Total Score:", formattedValue);
	                	totalSum += rawValue;
//	                	console.log(totalSum.toFixed(1) / (c -1));
	                	var subper = totalSum.toFixed(1) / (c -1);
//	                	console.log(subper);
 						const tdElement = $('#score');
 						tdElement.html(subper.toFixed(1));
 						const tr = document.createElement("TR");
 	 				    // Append cells to the row
 	 				    const td1 = document.createElement("TD");
 	 				    td1.textContent = l.hspt_name;

 	 				    const td2 = document.createElement("TD");
 						td2.textContent = l.hspt_position;
 	 				    const td3 = document.createElement("TD");
 						td3.textContent = l.id;
 	 				    const td4 = document.createElement("TD");
 						td4.textContent = l.name;
 	 				    const td5 = document.createElement("TD");
 						td5.textContent = formattedValue;
 	 				    const td6 = document.createElement("TD");
 						td6.textContent = "";
 	 				    const td7 = document.createElement("TD");
 						td7.textContent = "";
 	 				    const td8 = document.createElement("TD");
 	 				    td8.textContent ="평가조회";
 	 				    td8.setAttribute("style", "cursor:pointer;");
 	 				    td8.setAttribute("data-idx", l.idx);
 	 				    td8.setAttribute("onclick", "search(this);");
 	 				    
 	 				    tr.appendChild(td1);
 	 				    tr.appendChild(td2);
 	 				    tr.appendChild(td3);
 	 				    tr.appendChild(td4);
 	 				    tr.appendChild(td5);
 	 				    tr.appendChild(td6);
 	 				    tr.appendChild(td7);
 	 				    tr.appendChild(td8);

 	 				    // Append the row to the table
 	 				    tb2.appendChild(tr);
 					});
	 				
 					
			}
		},
		error: function(error) {
			console.error('Error fetching data:', error);
		}
	});
 				
}

function search(element) {
	const idx = element.getAttribute("data-idx");
	const link = "${pageContext.request.contextPath}/e/s/"+idx;
	console.log(idx);
	
	$.ajax({
		url: link,
		type: 'GET',
		dataType: 'json',
		success: function(response) {
			if (response.result ==="Y") {
				mainContent.innerHTML = ''; // 기존 내용을 지우고
				const list = response.list2;
				const u = response.users;
				
				
				const tb = document.createElement("TABLE");
 				
				const tr1 = document.createElement("TR");
 				
				const td1 = document.createElement("TD");
				td1.textContent = "소속기관";
 				const td2 = document.createElement("TD");
 				td2.textContent = u.hspt_name;
 				
 				const td3 = document.createElement("TD");
 				td3.textContent = "부서명";
 				const td4 = document.createElement("TD");
 				td4.textContent = u.hspt_subname;
 				
 				const td5 = document.createElement("TD");
 				td5.textContent = "직급";
 				const td6 = document.createElement("TD");
 				td6.textContent = u.hspt_position;
 				
 				const td7 = document.createElement("TD");
 				td7.textContent = "사원번호";
 				const td8 = document.createElement("TD");
 				td8.textContent = u.id;
 				
 				const tr2 = document.createElement("TR");
 				
 				const td9 = document.createElement("TD");
 				td9.textContent = "사원명";
 				const td10 = document.createElement("TD");
 				td10.textContent = u.name;
 				
 				const td11 = document.createElement("TD");
 				td11.textContent = "평가점수";
 				const td12 = document.createElement("TD");
 				td12.textContent = "";
 				
 				const td13 = document.createElement("TD");
 				td13.textContent = "부서원 평균점수";
 				const td14 = document.createElement("TD");
 				td14.textContent = "";
 				
 				const td15 = document.createElement("TD");
 				td15.textContent = "평가등급";
 				const td16 = document.createElement("TD");
 				td16.textContent = "";
 				
 				const div = document.createElement("div");
 				div.setAttribute("style", "text-align: left;");
 				div.textContent = "▣ "+u.name+" 님의 세부 평가 내역 입니다.";

 				const div2 = document.createElement("div");
 				div2.setAttribute("style", "overflow-x : auto;");
 				// 평가답안 리스트
 				const tb2 = document.createElement("TABLE");
 				
 				const tr3 = document.createElement("TR");
 				
 				const td17 = document.createElement("TD");
 				td17.textContent = "평가자정보";
 				td17.setAttribute("style", "width:200px;");
 				const td18 = document.createElement("TD");
 				td18.textContent = "평가점수";
 				const td19 = document.createElement("TD");
 				td19.textContent = "종합평가";
 				const td20 = document.createElement("TD");
 				td20.textContent = "1번문항";
 				const td21 = document.createElement("TD");
 				td21.textContent = "2번문항";
 				const td22 = document.createElement("TD");
 				td22.textContent = "3번문항";
 				const td23 = document.createElement("TD");
 				td23.textContent = "4번문항";
 				const td24 = document.createElement("TD");
 				td24.textContent = "5번문항";
 				const td25 = document.createElement("TD");
 				td25.textContent = "6번문항";
 				const td26 = document.createElement("TD");
 				td26.textContent = "7번문항";
 				const td27 = document.createElement("TD");
 				td27.textContent = "8번문항";
 				const td28 = document.createElement("TD");
 				td28.textContent = "9번문항";
 				const td29 = document.createElement("TD");
 				td29.textContent = "10번문항";
 				const td30 = document.createElement("TD");
 				td30.textContent = "11번문항";
 				const td31 = document.createElement("TD");
 				td31.textContent = "12번문항";
 				const td32 = document.createElement("TD");
 				td32.textContent = "13번문항";
 				const td33 = document.createElement("TD");
 				td33.textContent = "14번문항";
 				const td34 = document.createElement("TD");
 				td34.textContent = "15번문항";
 				const td35 = document.createElement("TD");
 				td35.textContent = "16번문항";
 				const td36 = document.createElement("TD");
 				td36.textContent = "17번문항";
 				const td37 = document.createElement("TD");
 				td37.textContent = "18번문항";
 				const td38 = document.createElement("TD");
 				td38.textContent = "19번문항";
 				const td39 = document.createElement("TD");
 				td39.textContent = "20번문항";
 				
 				
 				
 				mainContent.appendChild(tb);
 				tb.appendChild(tr1);
 				tr1.appendChild(td1);
 				tr1.appendChild(td2);
 				tr1.appendChild(td3);
 				tr1.appendChild(td4);
 				tr1.appendChild(td5);
 				tr1.appendChild(td6);
 				tr1.appendChild(td7);
 				tr1.appendChild(td8);
 				tb.appendChild(tr2);
 				tr2.appendChild(td9);
 				tr2.appendChild(td10);
 				tr2.appendChild(td11);
 				tr2.appendChild(td12);
 				tr2.appendChild(td13);
 				tr2.appendChild(td14);
 				tr2.appendChild(td15);
 				tr2.appendChild(td16);
 				
 				mainContent.appendChild(div);
 				mainContent.appendChild(div2);
 				div2.appendChild(tb2);
 				tb2.appendChild(tr3);
 				tr3.appendChild(td17);
 				tr3.appendChild(td18);
 				tr3.appendChild(td19);
 				tr3.appendChild(td20);
 				tr3.appendChild(td21);
 				tr3.appendChild(td22);
 				tr3.appendChild(td23);
 				tr3.appendChild(td24);
 				tr3.appendChild(td25);
 				tr3.appendChild(td26);
 				tr3.appendChild(td27);
 				tr3.appendChild(td28);
 				tr3.appendChild(td29);
 				tr3.appendChild(td30);
 				tr3.appendChild(td31);
 				tr3.appendChild(td32);
 				tr3.appendChild(td33);
 				tr3.appendChild(td34);
 				tr3.appendChild(td35);
 				tr3.appendChild(td36);
 				tr3.appendChild(td37);
 				tr3.appendChild(td38);
 				tr3.appendChild(td39);
 				
 				$.each (list, function (index, l) {
 					console.log(l.d1.split(',')[0]);
 					const tr3 = document.createElement("TR");
 	 				
 	 				const td17 = document.createElement("TD");
 	 				td17.textContent = "***";
 	 				const td18 = document.createElement("TD");
 	 				td18.textContent = "평가점수";
 	 				const td19 = document.createElement("TD");
 	 				td19.textContent = l.d1.split(',')[20];
 	 				const td20 = document.createElement("TD");
 	 				td20.textContent = l.d1.split(',')[0];
 	 				const td21 = document.createElement("TD");
 	 				td21.textContent = l.d1.split(',')[1];
 	 				const td22 = document.createElement("TD");
 	 				td22.textContent = l.d1.split(',')[2];
 	 				const td23 = document.createElement("TD");
 	 				td23.textContent = l.d1.split(',')[3];
 	 				const td24 = document.createElement("TD");
 	 				td24.textContent = l.d1.split(',')[4];
 	 				const td25 = document.createElement("TD");
 	 				td25.textContent = l.d1.split(',')[5];
 	 				const td26 = document.createElement("TD");
 	 				td26.textContent = l.d1.split(',')[6];
 	 				const td27 = document.createElement("TD");
 	 				td27.textContent = l.d1.split(',')[7];
 	 				const td28 = document.createElement("TD");
 	 				td28.textContent = l.d1.split(',')[8];
 	 				const td29 = document.createElement("TD");
 	 				td29.textContent = l.d1.split(',')[9];
 	 				const td30 = document.createElement("TD");
 	 				td30.textContent = l.d1.split(',')[10];
 	 				const td31 = document.createElement("TD");
 	 				td31.textContent = l.d1.split(',')[11];
 	 				const td32 = document.createElement("TD");
 	 				td32.textContent = l.d1.split(',')[12];
 	 				const td33 = document.createElement("TD");
 	 				td33.textContent = l.d1.split(',')[13];
 	 				const td34 = document.createElement("TD");
 	 				td34.textContent = l.d1.split(',')[14];
 	 				const td35 = document.createElement("TD");
 	 				td35.textContent = l.d1.split(',')[15];
 	 				const td36 = document.createElement("TD");
 	 				td36.textContent = l.d1.split(',')[16];
 	 				const td37 = document.createElement("TD");
 	 				td37.textContent = l.d1.split(',')[17];
 	 				const td38 = document.createElement("TD");
 	 				td38.textContent = l.d1.split(',')[18];
 	 				const td39 = document.createElement("TD");
 	 				td39.textContent = l.d1.split(',')[19];
 	 				
 	 				tb2.appendChild(tr3);
 	 				tr3.appendChild(td17);
 	 				tr3.appendChild(td18);
 	 				tr3.appendChild(td19);
 	 				tr3.appendChild(td20);
 	 				tr3.appendChild(td21);
 	 				tr3.appendChild(td22);
 	 				tr3.appendChild(td23);
 	 				tr3.appendChild(td24);
 	 				tr3.appendChild(td25);
 	 				tr3.appendChild(td26);
 	 				tr3.appendChild(td27);
 	 				tr3.appendChild(td28);
 	 				tr3.appendChild(td29);
 	 				tr3.appendChild(td30);
 	 				tr3.appendChild(td31);
 	 				tr3.appendChild(td32);
 	 				tr3.appendChild(td33);
 	 				tr3.appendChild(td34);
 	 				tr3.appendChild(td35);
 	 				tr3.appendChild(td36);
 	 				tr3.appendChild(td37);
 	 				tr3.appendChild(td38);
 	 				tr3.appendChild(td39);
 				});
			}
		},
		error: function (error) {
			console.error("Error fetching data:", error);
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