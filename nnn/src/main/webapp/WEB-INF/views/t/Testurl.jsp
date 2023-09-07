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
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>

<style>
img{
	margin: 0 auto;
}
/* 
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
 */
 
 /* GOOGLE FONTS */
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap");

/* VARIABLES CSS */
:root {
    --nav--width: 160px;

    /* Colores */
    --first-color: #035397;
    --bg-color: #08254c;
    --sub-color: #2b93a8;
    --white-color: #fff;

    /* Fuente y tipografia */
    --body-font: 'Poppins', sans-serif;
    --normal-font-size: 1rem;
    --small-font-size: .875rem;

    /* z index */
    --z-fixed: 100;
}

/* BASE */
*, ::before, ::after {
    box-sizing: border-box;
}

body {
    position: relative;
    margin: 0;
    padding: 2rem 0 0 6.75rem;
    font-family: var(--body-font);
    font-size: var(--normal-font-size);
    transition: .5s;
}

h1 {
    margin: 0;
}

ul {
    margin: 0;
    padding: 0;
    list-style: none;
}

a {
    text-decoration: none;
}

/* l NAV */
.l-navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: var(--nav--width);
    height: 100vh;
    background-color: var(--bg-color);
    color: var(--white-color);
    padding: 1.5rem 1.5rem 2rem;
    transition: .5s;
    z-index: var(--z-fixed);
}

/* NAV */
.nav {
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    overflow: hidden;
}

.nav__brand {
    display: grid;
    grid-template-columns: max-content max-content;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
}

.nav__toggle {
    font-size: 1.25rem;
    padding: .75rem;
    cursor: pointer;
}

.nav__logo {
    color: var(--white-color);
    font-weight: 600;
}

.nav__link {
    display: grid;
    grid-template-columns: max-content max-content;
    align-items: center;
    column-gap: .75rem;
    padding: .75rem;
    color: var(--white-color);
    border-radius: .5rem;
    margin-bottom: 1rem;
    transition: .3s;
    cursor: pointer;
}

.nav__link:hover {
    background-color: var(--first-color);
}

.nav__icon {
    font-size: 1.25rem;
}

.nav_name {
    font-size: var(--small-font-size);
}

/* Expander menu */
.expander {
    width: calc(var(--nav--width) + 9.25rem);
}

/* Add padding body*/
.body-pd {
    padding: 2rem 0 0 16rem;
}

/* Active links menu */
.active {
    background-color: var(--first-color);
}

/* COLLAPSE */
.collapse {
    grid-template-columns: 20px max-content 1fr;
}

.collapse__link {
    justify-self: flex-end;
    transition: .5;
}

.collapse__menu {
    display: none;
    padding: .75rem 2.25rem;
}

.collapse__sublink {
    color: var(--sub-color);
    font-size: var(--small-font-size);
}

.collapse__sublink:hover {
    color: var(--white-color);
}

/* Show collapse */
.showCollapse {
    display: block;
}

/* Rotate icon */
.rotate {
    transform: rotate(180deg);
    transition: .5s;
}
</style>
</head>
<body id="body-pd">

    <div class="l-navbar expander" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="#" class="nav__logo">TestUrl</a>
                </div>
                <div class="nav__list">
                    <a href="#" class="nav__link active" style="margin-bottom: 0;" data-menu="googleSheetWeb">
                        <!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
                        <span class="nav_name">병실현황 Total VIEW</span>
                    </a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="googleSheetSubMenu1">
                        <!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
                        <span class="nav_name">&nbsp;&nbsp;재원현황 목표</span>
                    </a>
                    <a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="googleSheetSubMenu2">
                        <!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
                        <span class="nav_name">&nbsp;&nbsp;최근7일간 입원 환자 수</span>
                    </a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="googleSheetSubMenu3">
                        <!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
                        <span class="nav_name">&nbsp;&nbsp;병동&의료진별 재원현황</span>
                    </a>
                    <a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="googleSheetSubMenu4">
                        <!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
                        <span class="nav_name">&nbsp;&nbsp;보험유형&재원일수기준 재원현황</span>
                    </a>
                    <a href="#" class="nav__link" data-menu="googleSheetSubMenu5">
                        <!-- <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon> -->
                        <span class="nav_name">&nbsp;&nbsp;연령 및 남여성비 현황</span>
                    </a>
                    <!-- 
                    <div href="#" class="nav__link collapse">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Projects</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="#" class="collapse__sublink">Data</a>
                            <a href="#" class="collapse__sublink">Group</a>
                            <a href="#" class="collapse__sublink">Members</a>
                        </ul>
                    </div> -->
<!-- 
                    <a href="#" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Analytics</span>
                    </a>

                    <div href="#" class="nav__link collapse">
                        <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Team</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="#" class="collapse__sublink">Data</a>
                            <a href="#" class="collapse__sublink">Group</a>
                            <a href="#" class="collapse__sublink">Members</a>
                        </ul>
                    </div>

                    <a href="#" class="nav__link">
                        <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Settings</span>
                    </a>
                </div>
                <a href="#" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">Log out</span>
                </a> -->
            </div>
        </nav>
    </div>
					 
			<!-- 나머지 컨텐츠 -->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" id="main-content" style="height: 100vh;">
				<!-- 내용을 이곳에 추가 -->
			</main><!-- 
		</div>
	</div> -->
	<script>
		const mainContent = document.getElementById('main-content');
		const menuLinks = document.querySelectorAll('[data-menu]');
		
		
		
		// 메뉴 클릭 이벤트 처리
		menuLinks.forEach(link => {
	      link.addEventListener('click', function (event) {
	        event.preventDefault();
	        const menuId = this.getAttribute('data-menu');
	        if (menuId === 'googleSheetWeb') {
	          showGoogleSheetWebView();
	        }else if(menuId === 'googleSheetSubMenu1'){
	        	showGoogleSheetSubMenu1();
	        }else if(menuId === 'googleSheetSubMenu2'){
	        	showGoogleSheetSubMenu2();
	        }else if(menuId === 'googleSheetSubMenu3'){
	        	showGoogleSheetSubMenu3();
	        }else if(menuId === 'googleSheetSubMenu4'){
	        	showGoogleSheetSubMenu4();
	        }else if(menuId === 'googleSheetSubMenu5'){
	        	showGoogleSheetSubMenu5();
	        }
	      });
	    });
		
		// 메뉴에 해당하는 컨텐츠를 보여주는 함수
		function showMenuContent(menuId) {
			// 메뉴에 따른 컨텐츠 내용을 여기에서 설정
			const content = getMenuContent(menuId);
			mainContent.innerHTML = content;
		}
		
		// 메뉴 ID에 따른 컨텐츠 내용을 반환하는 함수
		function getMenuContent(menuId) {
			switch (menuId) {
			case 'menu1':
				return '<h2>메뉴 1의 내용</h2><p>메뉴 1에 대한 내용을 여기에 작성합니다.</p>';
			case 'menu2':
				return '<h2>메뉴 2의 내용</h2><p>메뉴 2에 대한 내용을 여기에 작성합니다.</p>';
			case 'menu3':
				return '<h2>메뉴 3의 내용</h2><p>메뉴 3에 대한 내용을 여기에 작성합니다.</p>';
			default:
				return '<p>선택된 메뉴의 내용이 없습니다.</p>';
			}
		}
		
		function showGoogleSheetWebView() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR6JOk436AoXyveEv4VWOQ5CrbgL3orbrEysB9rQnY5BGLMpmii72CuJVKUTst_TZrRnFmMJyhzqCrM/pubhtml'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			  
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 재원현황 목표
		function showGoogleSheetSubMenu1() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR6JOk436AoXyveEv4VWOQ5CrbgL3orbrEysB9rQnY5BGLMpmii72CuJVKUTst_TZrRnFmMJyhzqCrM/pubhtml?gid=729631478&single=true'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 최근7일간입원환자 수
		function showGoogleSheetSubMenu2() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR6JOk436AoXyveEv4VWOQ5CrbgL3orbrEysB9rQnY5BGLMpmii72CuJVKUTst_TZrRnFmMJyhzqCrM/pubhtml?gid=2068231873&single=true'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 병동&의료진별 재원현황
		function showGoogleSheetSubMenu3() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR6JOk436AoXyveEv4VWOQ5CrbgL3orbrEysB9rQnY5BGLMpmii72CuJVKUTst_TZrRnFmMJyhzqCrM/pubhtml?gid=354748894&single=true'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 보험유형&재원일수기준 재원현황
		function showGoogleSheetSubMenu4() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR6JOk436AoXyveEv4VWOQ5CrbgL3orbrEysB9rQnY5BGLMpmii72CuJVKUTst_TZrRnFmMJyhzqCrM/pubhtml?gid=2104170411&single=true'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		// 연령 및 남여성비 현황
		function showGoogleSheetSubMenu5() {
			const iframe = document.createElement('iframe');
			iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR6JOk436AoXyveEv4VWOQ5CrbgL3orbrEysB9rQnY5BGLMpmii72CuJVKUTst_TZrRnFmMJyhzqCrM/pubhtml?gid=116728830&single=true'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			iframe.width = '100%';
			iframe.height = '100%';
			iframe.frameborder = '0';
			iframe.allowfullscreen = true;
			
			mainContent.innerHTML = ''; // 기존 내용을 지우고
			mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		/* 
		function shewGoogleSheet(range){
			const iframe = document.createElement('iframe');
			  iframe.src = 'https://docs.google.com/spreadsheets/d/1MECrScp7CxVALaZKH9R9KpA_eEFTweLr-sqpMQGQQEA/edit#gid=989350309&range=${range}/1/public/full?alt=json'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			  iframe.width = '100%';
			  iframe.height = '100%';
			  iframe.frameborder = '0';
			  iframe.allowfullscreen = true;
			
			  mainContent.innerHTML = ''; // 기존 내용을 지우고
			  mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		 */
		 function showGoogleSheet(){
				const iframe = document.createElement('iframe');
				  iframe.src = 'https://docs.google.com/gview?url=https://drive.google.com/file/d/1mR7ByU9iXg3w0XjXRrSrChfQUoa5QI9y/view?usp=drive_link&embedded=true'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
				  iframe.width = '100%';
				  iframe.height = '100%';
				  iframe.frameborder = '0';
				  iframe.allowfullscreen = true;
				
				  mainContent.innerHTML = ''; // 기존 내용을 지우고
				  mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
			}
		function showGoogleSheet3(){
			const iframe = document.createElement('iframe');
			  iframe.src = '<%=request.getContextPath() %>/resources/img/test/1.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			  iframe.width = '100%';
			  iframe.height = '100%';
			  iframe.frameborder = '0';
			  iframe.allowfullscreen = true;

			  mainContent.innerHTML = ''; // 기존 내용을 지우고
			  mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
		}
		function showGoogleSheet4(){
			const iframe = document.createElement('iframe');
			  iframe.src = '<%=request.getContextPath() %>/resources/img/test/2.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			  iframe.width = '100%';
			  iframe.height = '100%';
			  iframe.frameborder = '0';
			  iframe.allowfullscreen = true;

			  const iframe2 = document.createElement('iframe');
			  iframe2.src = '<%=request.getContextPath() %>/resources/img/test/3.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			  iframe2.width = '100%';
			  iframe2.height = '100%';
			  iframe2.frameborder = '0';
			  iframe2.allowfullscreen = true;

			  const iframe3 = document.createElement('iframe');
			  iframe3.src = '<%=request.getContextPath() %>/resources/img/test/3.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			  iframe3.width = '100%';
			  iframe3.height = '100%';
			  iframe3.frameborder = '0';
			  iframe3.allowfullscreen = true;
			  
			  const iframe4 = document.createElement('iframe');
			  iframe4.src = '<%=request.getContextPath() %>/resources/img/test/3.jpg'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
			  iframe4.width = '100%';
			  iframe4.height = '100%';
			  iframe4.frameborder = '0';
			  iframe4.allowfullscreen = true;
			  
			  
			  mainContent.innerHTML = ''; // 기존 내용을 지우고
			  mainContent.appendChild(iframe); // 웹 뷰를 추가합니다.
			  mainContent.appendChild(iframe2); // 웹 뷰를 추가합니다.
			  mainContent.appendChild(iframe3); // 웹 뷰를 추가합니다.
			  mainContent.appendChild(iframe4); // 웹 뷰를 추가합니다.
		}
		/* 
		async function fetchGoogleSheetData() {
			  try {
				  const response = await fetch(
						  'https://script.google.com/macros/s/AKfycbx4rbvC14NkU_IPveSqyLueH3t766VdS8U1H23GdSjC-h6ZPX90gtyHYRwsOcNXl-z0/exec'); // 배포한 스크립트의 URL 입력
				    
			    if (response.ok) {
			      const data = await response.json();
			      return data;
			    } else {
			      throw new Error('Fetch failed with status: ' + response.status);
			    }
			  } catch (error) {
			    console.error('Fetch error:', error);
			    return null;
			  }
			} */
		/* 	
		async function fetchGoogleSheetData() {
			  const response = await fetch('https://script.google.com/macros/s/AKfycbyVqbEkdYL2BmC6QZy0jBcw02A1_AjdHlWQ4r_YEPA_1Pk7kWro5YrX8PS9KVtE5qCsaQ/exec');
			  const data = await response.json();
			  return data;
			} */
		function fetchGoogleSheetData() {
			  var sheetId = "1kT6_er2dzrxNNTCnttU1TW5vOGs3nRG51dSXDtdSnL8"; // 수정된 스프레드시트 ID 입력
			  var sheetName = "재원환자통계VIEW"; // 시트의 이름 입력
			  var range = "B7:V16"; // 읽어올 데이터의 범위 입력
			  var sheet = SpreadsheetApp.openById(sheetId).getSheetByName(sheetName);
			  var dataRange = sheet.getRange(range); // 범위 내의 셀 객체 가져오기
			  var data = dataRange.getValues(); // 셀 내용을 실제 값으로 가져오기
			  return data;
			}
		function createDataTableView(data) {
		      let tableHtml = '<table border=1 style="width:100%; height:100%;">';
		      for (const row of data) {
		        tableHtml += '<tr>';
		        for (const cell of row) {
		          tableHtml += `<td>${cell}</td>`;
		        }
		        tableHtml += '</tr>';
		      }
		      tableHtml += '</table>';
		      return tableHtml;
		    }
		async function showGoogleSheetDataView() {
		      // 구글 스크립트를 사용하여 데이터를 가져와서 표시
		      // 구글 스크립트를 활용하여 원하는 데이터만 가져올 수 있습니다.
		      const data = await fetchGoogleSheetData();
		      const content = createDataTableView(data);
		      mainContent.innerHTML = content;
		    }
		
		
		// 초기 화면 로딩 시 첫 번째 메뉴를 보여줌
//		showGoogleSheetDataView();
		showGoogleSheetWebView();
		
	</script>
	<script>
	/* EXPANDER MENU */
	const showMenu = (toggleId, navbarId, bodyId) => {
	    const toggle = document.getElementById(toggleId),
	    navbar = document.getElementById(navbarId),
	    bodypadding = document.getElementById(bodyId)

	    if( toggle && navbar ) {
	        toggle.addEventListener('click', ()=>{
	            navbar.classList.toggle('expander');

	            bodypadding.classList.toggle('body-pd')
	        })
	    }
	}

	showMenu('nav-toggle', 'navbar', 'body-pd')

	/* LINK ACTIVE */
	const linkColor = document.querySelectorAll('.nav__link')
	function colorLink() {
	    linkColor.forEach(l=> l.classList.remove('active'))
	    this.classList.add('active')
	}
	linkColor.forEach(l=> l.addEventListener('click', colorLink))

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
	</script>
</body>
</html>