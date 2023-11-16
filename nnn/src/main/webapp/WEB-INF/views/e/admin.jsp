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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin_css.css">
<title>관리자 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<form>
<section>
<div style="background-color: var(--bg-color); color: var(--white-color); padding: 1.5rem 1.5rem 10px; padding-left: 33px;
    transition: .5s; z-index: 101; position: fixed; width: calc(var(--nav--width) + 9.25rem); top: 0; left: 0; height: 80px;">
		<div style="display: flex; justify-content: space-between;">
			<div style="width: 100%;">
				<div class="nav__brand" style="">
					<a href="#" class="nav__logo" onclick="window.location.reload()">관리자 페이지</a>
					
					
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
					<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name">1,2,3병원 직원명부 Total</span>
					</a>
					
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="user1" data-content="content1">
						<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
						<span class="nav_subname">&nbsp;&nbsp;효사랑전주요양병원 직원명부</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="user2" data-content="content2">
						<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
						<span class="nav_subname">&nbsp;&nbsp;효사랑가족요양병원 직원명부</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="user3" data-content="content3">
						<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
						<span class="nav_subname">&nbsp;&nbsp;가족사랑요양병원 직원명부</span>
					</a>
					<div style="border-top:1px solid #fff; margin-bottom: 16px; margin-top: 16px;"></div>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="per1" data-content="content1">
					<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name" style="font-size: 18px;">효사랑전주요양병원 평가진행률</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="per2" data-content="content2">
					<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name" style="font-size: 18px;">효사랑가족요양병원 평가진행률</span>
					</a>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="per3" data-content="content3">
					<!-- <ion-icon name="home-outline" class="nav__icon"></ion-icon> -->
						<span class="nav_name" style="font-size: 18px;">가족사랑요양병원 평가진행률</span>
					</a>
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
	<main id="main-content" 
			style="width : calc(99vw - (var(--nav--width) + 9.25rem)); height : 100%; margin-left: calc(var(--nav--width) + 9.25rem);">
		<!-- 내용을 이곳에 추가 -->
		<!-- class="col-md-9 ms-sm-auto col-lg-10 px-md-4"  -->
		<table style="">
			<tr>
				<td>idx</td><td>병원명</td><td>부서명</td><td>사번</td><td>직책</td><td>이름</td><td>핸드폰번호</td>
			</tr>
		
		<c:forEach items="${users }" var="u">
			<c:if test="${u.id ne 12365478 }">
			<tr style="<c:if test="${empty u.pwd }">background: #eaeaea;</c:if>">
				<td>${u.idx }</td>
				<td>${u.hspt_name }</td>
				<td>${u.hspt_subname }</td>
				<td>${u.id }</td>
				<td>${u.hspt_position }</td>
				<td style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/e/Info/${u.idx}'">${u.name }</td>
				<c:forEach items="${ph }" var="p">
					<c:if test="${u.id eq p.id }">
					<td>
						${p.number }
					</td>
					</c:if>
					
				</c:forEach>
				
				
				
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</main>

</section>
</form>
</body>
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
	         url: '${pageContext.request.contextPath}/e/usersAll',
	         type: 'GET',
	         dataType: 'json',
	         success: function(response) {
	        	 if(response.result === "Y"){
	 				var listall = response.usersall;
	 				var ph = response.userph;
	 				
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
	 				
	 				tb.appendChild(maintr);
	 				maintr.appendChild(maintd1);
	 				maintr.appendChild(maintd2);
	 				maintr.appendChild(maintd3);
	 				maintr.appendChild(maintd4);
	 				maintr.appendChild(maintd6);
	 				maintr.appendChild(maintd7);
	 				maintr.appendChild(maintd8);
	 				
	 				listall.forEach(function (list) {
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
		 					var url = "<%=request.getContextPath() %>/e/Info/"+idx;
		 					tdname.setAttribute("onclick","location.href='" + url + "'");
		 					tdname.setAttribute("style", "cursor:pointer;");
		 					var tdph = document.createElement("TD");
		 					if(id == phid){
		 						tdph.textContent = phnumber;
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
	         url: '${pageContext.request.contextPath}/e/users1',
	         type: 'GET',
	         dataType: 'json',
	         success: function(response) {
	        	 if(response.result === "Y"){
	 				var list1 = response.users;
	 				var ph = response.userph;
	 				
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
	 				tb.appendChild(maintr);
	 				maintr.appendChild(maintd1);
	 				maintr.appendChild(maintd2);
	 				maintr.appendChild(maintd3);
	 				maintr.appendChild(maintd4);
	 				maintr.appendChild(maintd6);
	 				maintr.appendChild(maintd7);
	 				maintr.appendChild(maintd8);
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
		 					var url = "<%=request.getContextPath() %>/e/Info/"+idx;
		 					tdname.setAttribute("onclick","location.href='" + url + "'");
		 					tdname.setAttribute("style", "cursor:pointer;");
		 					var tdph = document.createElement("TD");
		 					if(id == phid){
		 						tdph.textContent = phnumber;
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
         url: '${pageContext.request.contextPath}/e/users2',
         type: 'GET',
         dataType: 'json',
         success: function(response) {
        	 if(response.result === "Y"){
 				var list1 = response.users;
 				var ph = response.userph;
 				
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
 				tb.appendChild(maintr);
 				maintr.appendChild(maintd1);
 				maintr.appendChild(maintd2);
 				maintr.appendChild(maintd3);
 				maintr.appendChild(maintd4);
 				maintr.appendChild(maintd6);
 				maintr.appendChild(maintd7);
 				maintr.appendChild(maintd8);
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
	 					var url = "<%=request.getContextPath() %>/e/Info/"+idx;
	 					tdname.setAttribute("onclick","location.href='" + url + "'");
	 					tdname.setAttribute("style", "cursor:pointer;");
	 					var tdph = document.createElement("TD");
	 					if(id == phid){
	 						tdph.textContent = phnumber;
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
         url: '${pageContext.request.contextPath}/e/users3',
         type: 'GET',
         dataType: 'json',
         success: function(response) {
        	 if(response.result === "Y"){
 				var list1 = response.users;
 				var ph = response.userph;
 				
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
 				
 				tb.appendChild(maintr);
 				maintr.appendChild(maintd1);
 				maintr.appendChild(maintd2);
 				maintr.appendChild(maintd3);
 				maintr.appendChild(maintd4);
 				maintr.appendChild(maintd6);
 				maintr.appendChild(maintd7);
 				maintr.appendChild(maintd8);
 				
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
	 					var url = "<%=request.getContextPath() %>/e/Info/"+idx;
	 					tdname.setAttribute("onclick","location.href='" + url + "'");
	 					tdname.setAttribute("style", "cursor:pointer;");
	 					var tdph = document.createElement("TD");
	 					if(id == phid){
	 						tdph.textContent = phnumber;
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
 					}
 					
 				});
        	 }
         },
         error: function(error) {
            console.error('Error fetching data:', error);
         }
      });

}

function per1() {
	$.ajax({
        url: '${pageContext.request.contextPath}/e/per1',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
       	 if(response.result === "Y"){
				var list1 = response.users;
				var ph = response.userph;
				
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
				
				tb.appendChild(maintr);
				maintr.appendChild(maintd1);
				maintr.appendChild(maintd2);
				maintr.appendChild(maintd3);
				maintr.appendChild(maintd4);
				maintr.appendChild(maintd6);
				maintr.appendChild(maintd7);
				maintr.appendChild(maintd8);
				
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
	 					var url = "<%=request.getContextPath() %>/e/Info/"+idx;
	 					tdname.setAttribute("onclick","location.href='" + url + "'");
	 					tdname.setAttribute("style", "cursor:pointer;");
	 					var tdph = document.createElement("TD");
	 					if(id == phid){
	 						tdph.textContent = phnumber;
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
					}
					
				});
       	 }
        },
        error: function(error) {
           console.error('Error fetching data:', error);
        }
     });
}

const menuScripts = [
	{ id: 'userall', contentId: 'all', script: userall },
	{ id: 'user1', contentId: 'content1', script: user1 },
	{ id: 'user2', contentId: 'content2', script: user2 },
	{ id: 'user3', contentId: 'content3', script: user3 },
	{ id: 'per1', contentId: 'content1', script: per1 },
	{ id: 'per2', contentId: 'content2', script: per2 },
	{ id: 'per3', contentId: 'content3', script: per3 },
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
</script>
</html>