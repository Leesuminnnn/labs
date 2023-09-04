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
<style>
img{
	margin: 0 auto;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row" style="height: 100vh;">
			<!-- 좌측 메뉴 탭 -->
			<nav class="col-md-3 col-lg-2 d-md-block bg-light sidebar">
				<div class="position-sticky">
					<ul class="nav flex-column">
						<li class="nav-item">
							<a class="nav-link active" href="#" data-menu="googleSheetWeb">병실현황뷰</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link" href="#" data-menu="googleSheet">aa</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link" href="#" data-menu="img">이미지링크</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#" data-menu="imgs">이미지 여러개 링크</a>
						</li>
						
					</ul>
				</div>
			</nav>
			<!-- 나머지 컨텐츠 -->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" id="main-content">
				<!-- 내용을 이곳에 추가 -->
			</main>
		</div>
	</div>
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
	        }else if(menuId === 'googleSheet'){
	        	showGoogleSheet();
	        }else if(menuId === 'img'){
	        	showGoogleSheet3();
	        }else if(menuId === 'imgs'){
	        	showGoogleSheet4();
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
			  iframe.src = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQkYgWmgGTeXRZswQlGoJN_SpYhCTMaVQ__b6sSTe_q8IcGL6LhYzdR0RFV9_Y1hMZi23lkGGmnJ2Kh/pubhtml'; // 여기에 구글 시트 웹 뷰 URL을 입력하세요
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
</body>
</html>