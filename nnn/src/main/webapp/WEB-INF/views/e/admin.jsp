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
<style>

</style>
</head>
<body>
<form id="frm">
<section>
<div style="background-color: var(--bg-color); color: var(--white-color); padding: 1.5rem 1.5rem 10px; padding-left: 33px;
    transition: .5s; z-index: 101; position: fixed; width: calc(var(--nav--width) + 9.25rem); top: 0; left: 0; height: 80px;">
		<div style="display: flex; justify-content: space-between;">
			<div style="width: 100%;">
				<div class="nav__brand" style="">
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
						<span class="nav_name">1,2,3병원 직원명부 Total</span>
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
						<span class="nav_name">1,2,3병원 평가진행률 Total</span>
					</a>
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
					</a>
					<div style="border-top:1px solid #fff; margin-bottom: 16px; margin-top: 16px;"></div>
					<a href="#" class="nav__link" style="margin-bottom: 0;" data-menu="setting" data-content="">
						<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
						<span class="nav_subname" style="font-size: 18px;">&nbsp;설정관리</span>
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
				<td>idx</td><td>병원명</td><td>부서명</td><td>사번</td><td>직책</td><td>이름</td><td>핸드폰번호</td><td>비밀번호초기화</td>
			</tr>
		
			<c:forEach items="${users }" var="u">
				<c:if test="${u.id ne 12365478 }">
					<tr style="<c:if test="${empty u.pwd }">background: #eaeaea;</c:if>">
						<td>${u.idx }</td>
						<td>${u.hspt_name }</td>
						<td>${u.hspt_subname }</td>
						<td>${u.id }</td>
						<td>${u.hspt_position }</td>
						<td style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/e/Mypage/${u.idx}'">${u.name }</td>
						<c:forEach items="${ph }" var="p">
							<c:if test="${u.id eq p.id }">
								<td>
									${p.number }
								</td>
							</c:if>
						</c:forEach>
						<td data-name="${u.name}" data-id="${u.id}" <c:if test="${not empty u.pwd}">onclick="pwdreset(this)" style="cursor:pointer;"</c:if>><c:if test="${not empty u.pwd }">초기화</c:if></td>
						
						
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</main>

</section>
<nav>
	<div style="position: fixed; right: 10px; bottom: 10px; border: 1px solid; padding: 10px; border-radius: 100px; cursor:pointer;" onclick="javascript:window.scrollTo(0,0);">Top</div>
</nav>
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
		 					var url = "<%=request.getContextPath() %>/e/Mypage/"+idx;
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
	
	


function user1(contentId) {
	if (contentId === 'content1') {
		$.ajax({
	         url: '${pageContext.request.contextPath}/e/users1',
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
		 					var url = "<%=request.getContextPath() %>/e/Mypage/"+idx;
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
         url: '${pageContext.request.contextPath}/e/users2',
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
	 					var url = "<%=request.getContextPath() %>/e/Mypage/"+idx;
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
         url: '${pageContext.request.contextPath}/e/users3',
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
	 					var url = "<%=request.getContextPath() %>/e/Mypage/"+idx;
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
        url: '${pageContext.request.contextPath}/e/users1',
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
	 					var url = "<%=request.getContextPath() %>/e/Mypage/"+idx;
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
	         url: '${pageContext.request.contextPath}/e/perall',
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
		 					var url = "<%=request.getContextPath() %>/e/Mypage/"+idx;
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
	 					var url = "<%=request.getContextPath() %>/e/Mypage/"+idx;
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
        url: '${pageContext.request.contextPath}/e/per2',
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
	 					var url = "<%=request.getContextPath() %>/e/Mypage/"+idx;
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
        url: '${pageContext.request.contextPath}/e/per3',
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
	 					var url = "<%=request.getContextPath() %>/e/Mypage/"+idx;
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
		url: '${pageContext.request.contextPath}/e/setting',
		type: 'GET',
		dataType: 'json',
		success: function(res) {
			if(res.result === "Y"){
 				
 				mainContent.innerHTML = ''; // 기존 내용을 지우고
 				const sub = res.sub;
 				const user = res.user;
 				const userop = res.userop;
//  				console.log(sub);
//  				console.log(user);
//  				console.log(userop);
 				const dv = document.createElement("div");
 				dv.setAttribute("style","font-size: 14px; margin: 10px; display: flex; justify-content: center; flex-direction: column;");
 				mainContent.appendChild(dv);
				
 				const dv2 = document.createElement("div");
 				dv2.setAttribute("style","margin: 15px 0 15px 20px; display: flex; justify-content: flex-start;");
 				dv2.setAttribute("id", "nav");
 				dv.appendChild(dv2);
 				
 				const dv3 = document.createElement("div");
 				dv3.textContent = " 직원명부 ";
 				dv3.setAttribute("style","margin-right: 15px; padding: 15px; border: 1px solid #dddddd; background: #eaeaea; border-radius: 25px; cursor: pointer;");
 				dv3.setAttribute("class", "set_menu select");
 				dv3.setAttribute("onclick","set1();");
 				dv3.setAttribute("id","set_menu1");
 				const dv4 = document.createElement("div");
 				dv4.textContent = " 직원별 변수 설정 ";
 				dv4.setAttribute("style","margin-right: 15px; padding: 15px; border: 1px solid #dddddd; background: #eaeaea; border-radius: 25px; cursor: pointer;");
 				dv4.setAttribute("class", "set_menu");
 				dv4.setAttribute("onclick","set2();");
 				dv4.setAttribute("id","set_menu2");
 				const dv5 = document.createElement("div");
 				dv5.textContent = " 부서 설정 ";
 				dv5.setAttribute("style","margin-right: 15px; padding: 15px; border: 1px solid #dddddd; background: #eaeaea; border-radius: 25px; cursor: pointer;");
 				dv5.setAttribute("class", "set_menu");
 				dv5.setAttribute("onclick","set3();");
 				dv5.setAttribute("id","set_menu3");
				dv2.appendChild(dv3);
 				dv2.appendChild(dv4);
 				dv2.appendChild(dv5);
 				
 				const maindiv = document.createElement("div");
 				maindiv.setAttribute("id","maindiv");
 				const tb = document.createElement("TABLE");
 				tb.setAttribute("class","st_tb");
 				dv.appendChild(maindiv);
 				maindiv.appendChild(tb);
				

				const thead = document.createElement("THEAD");
				const tr1 = document.createElement("TR");
				const td1 = document.createElement("TD");
 				td1.textContent = "기관명";
 				const td2 = document.createElement("TD");
 				td2.textContent = "소속기관명";
 				const td3 = document.createElement("TD");
 				td3.textContent = "부서명";
 				const td4 = document.createElement("TD");
 				td4.textContent = "사원번호";
 				const td5 = document.createElement("TD");
 				td5.textContent = "직급/직책";
 				const td6 = document.createElement("TD");
 				td6.textContent = "사원명";
 				const td7 = document.createElement("TD");
 				td7.textContent = "입사일자";
 				const td8 = document.createElement("TD");
 				td8.textContent = "퇴사일자";
 				const td9 = document.createElement("TD");
 				td9.textContent = "연락처";
 				
 				tb.appendChild(thead);
 				thead.appendChild(tr1);
 				tr1.appendChild(td1);
 				tr1.appendChild(td2);
 				tr1.appendChild(td3);
 				tr1.appendChild(td4);
 				tr1.appendChild(td5);
 				tr1.appendChild(td6);
 				tr1.appendChild(td7);
 				tr1.appendChild(td8);
 				tr1.appendChild(td9);
				
 				$.each (user, function (index, u) {
 					const tr = document.createElement("TR");
 					
 					const td1 = document.createElement("TD");
					td1.textContent = u.c_name;
					const td2 = document.createElement("TD");
	 				td2.textContent = u.c_name2;
	 				const td3 = document.createElement("TD");
	 				td3.textContent = u.subname;
	 				const td4 = document.createElement("TD");
	 				td4.textContent = u.id;
	 				const td5 = document.createElement("TD");
	 				td5.textContent = u.position;
	 				const td6 = document.createElement("TD");
	 				td6.textContent = u.name;
	 				const td7 = document.createElement("TD");
	 				td7.textContent = u.reg_date[0]+"년 "+u.reg_date[1]+"월 "+u.reg_date[2]+"일";
	 				const td8 = document.createElement("TD");
	 				td8.textContent = u.end_date;
	 				const td9 = document.createElement("TD");
	 				td9.textContent = u.phone;
	 				tr.appendChild(td1);
					tr.appendChild(td2);
					tr.appendChild(td3);
					tr.appendChild(td4);
					tr.appendChild(td5);
					tr.appendChild(td6);
					tr.appendChild(td7);
					tr.appendChild(td8);
					tr.appendChild(td9);
					
					tb.appendChild(tr);
					
 				});
 				
			}
		},
		error: function(error) {
			console.error('Error fetching data:', error);
		}
	});
}


//비밀번호 초기화
function pwdreset(element){
	var frm = $("#frm");
	var name = element.getAttribute('data-name');
	var id = element.getAttribute('data-id');
	console.log(name);
	console.log(id);
	alert("[" + name + "]님의 비밀번호를 초기화 합니다.");
	
	prmpwd = window.prompt('비밀번호를 입력해주세요');
	if(prmpwd == '123qwe' || prmpwd == '123ㅂㅈㄷ'){
		alert('인증 성공 \n비밀번호 초기화를 진행합니다.');
		
		frm.attr("action","${pageContext.request.contextPath}/e/pwdreset/"+id).submit();
		/* $.ajax({
			url: '${pageContext.request.contextPath}/e/pwdreset/'+id,
			type: 'post',
			dataType: 'json',
			success: function(response){
				if(response.result === "Y"){
					
					location.reload();
				}
			},
			error: function(error) {
				console.error('Error fetching data:', error);
			}
			
		});
		 */
		 
		 
	}else {
		alert('인증 실패');
	}
	
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

function set1(){
	setting();
}

function set2(){
	var maindiv = document.getElementById("maindiv");
	var dv3 = document.querySelector("#set_menu1");
	var dv4 = document.querySelector("#set_menu2");
	var dv5 = document.querySelector("#set_menu3");
	dv3.classList.remove('select');
	dv5.classList.remove('select');
	dv4.classList.add('select');
	
	const nav = document.getElementById("nav");
	$.ajax({
		url: '${pageContext.request.contextPath}/e/setting',
		type: 'GET',
		dataType: 'json',
		success: function (res) {
			if(res.result === "Y") {
				maindiv.innerHTML = "";
				const user = res.user;
				// 중복을 제거하고 배열로
				const uniqueValues = Array.from(new Set(user.map(u => u.c_name)));
// 				console.log(uniqueValues);
				const divContainer = document.createElement('div');
				divContainer.setAttribute("style", "display: flex; justify-content: flex-start; margin-bottom: 10px;")
				// 배열의 각 요소를 <div>로 묶음
				let indexOf = 1;
				uniqueValues.forEach(value => {
				    const div = document.createElement('div');
				    div.textContent = value;
				    div.setAttribute("style", "margin-right: 15px; padding: 15px; border: 1px solid #dddddd; background: #eaeaea; border-radius: 25px; cursor: pointer;");
				    // 배열에 id부여
				    div.setAttribute("id", "unq"+indexOf);
				    div.setAttribute("onclick", "unq"+indexOf+"()");
				    divContainer.appendChild(div);
				    indexOf += 1;
				});
				
				maindiv.appendChild(divContainer);
				const btn = document.createElement('div');
				btn.setAttribute("style", "border: 1px solid #ddd; border-radius: 25px; background: #eaeaea; padding: 15px; cursor: pointer;");
				btn.setAttribute("onclick", "modify();");
				btn.textContent = "수정";
				nav.appendChild(btn);
				const tb = document.createElement("TABLE");
 				tb.setAttribute("class","st_tb");
 				maindiv.appendChild(tb);
				
 				const thead = document.createElement("THEAD");
				const tr1 = document.createElement("TR");
				const td1 = document.createElement("TD");
 				td1.textContent = "기관명";
 				const td2 = document.createElement("TD");
 				td2.textContent = "소속기관명";
 				const td3 = document.createElement("TD");
 				td3.textContent = "부서명";
 				const td4 = document.createElement("TD");
 				td4.textContent = "사원번호";
 				const td5 = document.createElement("TD");
 				td5.textContent = "직급/직책";
 				const td6 = document.createElement("TD");
 				td6.textContent = "사원명";
 				const td7 = document.createElement("TD");
 				td7.textContent = "경혁팀장여부";
 				const td8 = document.createElement("TD");
 				td8.textContent = "경혁팀여부";
 				const td9 = document.createElement("TD");
 				td9.textContent = "부서장여부";
 				const td10 = document.createElement("TD");
 				td10.textContent = "1인부서여부";
 				const td11 = document.createElement("TD");
 				td11.textContent = "진료팀장여부";
 				const td12 = document.createElement("TD");
 				td12.textContent = "진료부여부";
 				const td13 = document.createElement("TD");
 				td13.textContent = "평가제외여부";
 				
 				tb.appendChild(thead);
 				thead.appendChild(tr1);
 				tr1.appendChild(td1);
 				tr1.appendChild(td2);
 				tr1.appendChild(td3);
 				tr1.appendChild(td4);
 				tr1.appendChild(td5);
 				tr1.appendChild(td6);
 				tr1.appendChild(td7);
 				tr1.appendChild(td8);
 				tr1.appendChild(td9);
 				tr1.appendChild(td10);
 				tr1.appendChild(td11);
 				tr1.appendChild(td12);
 				tr1.appendChild(td13);
 				
 				$.each (user, function (index, u) {
 					const tr = document.createElement("TR");
 					
 					const td1 = document.createElement("TD");
					td1.textContent = u.c_name;
					const td2 = document.createElement("TD");
	 				td2.textContent = u.c_name2;
	 				const td3 = document.createElement("TD");
	 				td3.textContent = u.subname;
	 				const td4 = document.createElement("TD");
	 				td4.textContent = u.id;
	 				const td5 = document.createElement("TD");
	 				td5.textContent = u.position;
	 				const td6 = document.createElement("TD");
	 				td6.textContent = u.name;
	 				const td7 = document.createElement("TD");
	 				const input7 = document.createElement("input");
	 				input7.setAttribute("type", "checkbox");
	 				input7.setAttribute("disabled", "disabled");
	 				if(u.k == 'T'){
	 					input7.setAttribute("checked", "checked");
	 				}
	 				td7.appendChild(input7);
	 				const td8 = document.createElement("TD");
	 				const input8 = document.createElement("input");
	 				input8.setAttribute("type", "checkbox");
	 				input8.setAttribute("disabled", "disabled");
	 				if(u.v == 'T'){
	 					input8.setAttribute("checked", "checked");
	 				}
	 				td8.appendChild(input8);
	 				const td9 = document.createElement("TD");
	 				const input9 = document.createElement("input");
	 				input9.setAttribute("type", "checkbox");
	 				input9.setAttribute("disabled", "disabled");
	 				if(u.b == 'T'){
	 					input9.setAttribute("checked", "checked");
	 				}
	 				td9.appendChild(input9);
	 				const td10 = document.createElement("TD");
	 				const input10 = document.createElement("input");
	 				input10.setAttribute("type", "checkbox");
	 				input10.setAttribute("disabled", "disabled");
	 				if(u.x == 'T'){
	 					input10.setAttribute("checked", "checked");
	 				}
	 				td10.appendChild(input10);
	 				const td11 = document.createElement("TD");
	 				const input11 = document.createElement("input");
	 				input11.setAttribute("type", "checkbox");
	 				input11.setAttribute("disabled", "disabled");
	 				if(u.z == 'T'){
	 					input11.setAttribute("checked", "checked");
	 				}
	 				td11.appendChild(input11);
	 				const td12 = document.createElement("TD");
	 				const input12 = document.createElement("input");
	 				input12.setAttribute("type", "checkbox");
	 				input12.setAttribute("disabled", "disabled");
	 				if(u.a == 'T'){
	 					input12.setAttribute("checked", "checked");
	 				}
	 				td12.appendChild(input12);
	 				const td13 = document.createElement("TD");
	 				const input13 = document.createElement("input");
	 				input13.setAttribute("type", "checkbox");
	 				input13.setAttribute("disabled", "disabled");
	 				if(u.del_yn == 'Y'){
	 					input13.setAttribute("checked", "checked");
	 				}
	 				td13.appendChild(input13);
	 				
	 				tr.appendChild(td1);
					tr.appendChild(td2);
					tr.appendChild(td3);
					tr.appendChild(td4);
					tr.appendChild(td5);
					tr.appendChild(td6);
	 				tr.appendChild(td7);
	 				tr.appendChild(td8);
	 				tr.appendChild(td9);
	 				tr.appendChild(td10);
	 				tr.appendChild(td11);
	 				tr.appendChild(td12);
	 				tr.appendChild(td13);
					
					tb.appendChild(tr);
					
 				});
			}
		},
		error: function (error) {
			console.error('Error fetching data:', error);
		}
	});
	
}

function set3(){
	var maindiv = document.getElementById("maindiv");
	var dv3 = document.querySelector("#set_menu1");
	var dv4 = document.querySelector("#set_menu2");
	var dv5 = document.querySelector("#set_menu3");
	dv3.classList.remove('select');
	dv5.classList.add('select');
	dv4.classList.remove('select');
	var maindiv = document.getElementById("maindiv");
	$.ajax({
		url: '${pageContext.request.contextPath}/e/setting',
		type: 'GET',
		dataType: 'json',
		success: function (res) {
			if(res.result === "Y") {
				
				maindiv.innerHTML = "";
				const sub = res.sub;
				
 				const dv = document.createElement("div");
 				dv.setAttribute("style","font-size: 14px; margin: 10px; display: flex; justify-content: center; flex-direction: column;");
 				mainContent.appendChild(dv);

 				const tb = document.createElement("TABLE");
 				maindiv.appendChild(tb);
 				const thead = document.createElement("THEAD");
 				const tr1 = document.createElement("TR");
				const td1 = document.createElement("TD");
 				td1.textContent = "부서명";
 				const td2 = document.createElement("TD");
 				td2.textContent = "부서코드명";

 				tb.appendChild(thead);
 				thead.appendChild(tr1);
 				tr1.appendChild(td1);
 				tr1.appendChild(td2);
 				$.each (sub, function (index, s) {
 					const tr = document.createElement("TR");
 					const td1 = document.createElement("TD");
					td1.textContent = s.subname;
					const td2 = document.createElement("TD");
	 				td2.textContent = s.subcode;

					tb.appendChild(tr);
	 				tr.appendChild(td1);
					tr.appendChild(td2);
 				});
				
			}
		},
		error: function (error) {
			console.error('Error fetching data:', error);
		}
	});
}

let index = 1;

function add(){
	var maindiv = document.getElementById("maindiv");
	
	$.ajax({
		url: '${pageContext.request.contextPath}/e/add',
		type: 'GET',
		dataType: 'json',
		success: function(res) {
			if(res.result === 'Y'){
				const div = document.createElement('div');
				const div2 = document.createElement('div');
				const input = document.createElement('input');
				
				input.setAttribute("id", "col"+index);
				maindiv.appendChild(div);
				div.appendChild(div2);
				div2.appendChild(input);
				index += 1;
				console.log(index);
			}
		},
		error: function (error) {
			console.error('Error fetching data:', error);
		}
	});
}



function addcol() {
	var maindiv = document.getElementById("maindiv");
	$.ajax({
		url: '${pageContext.request.contextPath}/e/addcol',
		type: 'GET',
		dataType: 'json',
		success: function(res) {
			if(res.result === 'Y') {
				
			}
		},
		error: function (error) {
			console.error('Error fetching data:', error);
		}
	});
}

function modify(){
	var maindiv = document.getElementById("maindiv");
	var dv3 = document.querySelector("#set_menu1");
	var dv4 = document.querySelector("#set_menu2");
	var dv5 = document.querySelector("#set_menu3");
	dv3.classList.remove('select');
	dv5.classList.remove('select');
	dv4.classList.add('select');
	
	const nav = document.getElementById("nav");
	$.ajax({
		url: '${pageContext.request.contextPath}/e/setting',
		type: 'GET',
		dataType: 'json',
		success: function (res) {
			if(res.result === "Y") {
				maindiv.innerHTML = "";
				
				const user = res.user;
				// 중복을 제거하고 배열로
				const uniqueValues = Array.from(new Set(user.map(u => u.c_name)));
// 				console.log(uniqueValues);
				const divContainer = document.createElement('div');
				divContainer.setAttribute("style", "display: flex; justify-content: flex-start; margin-bottom: 10px;")
				// 배열의 각 요소를 <div>로 묶음
				let indexOf = 1;
				uniqueValues.forEach(value => {
				    const div = document.createElement('div');
				    div.textContent = value;
				    div.setAttribute("style", "margin-right: 15px; padding: 15px; border: 1px solid #dddddd; background: #eaeaea; border-radius: 25px; cursor: pointer;");
				    // 배열에 id부여
				    div.setAttribute("id", "unq"+indexOf);
				    div.setAttribute("onclick", "unq"+indexOf+"()");
				    divContainer.appendChild(div);
				    indexOf += 1;
				});
				
				maindiv.appendChild(divContainer);
				nav.innerHTML = "";
				
 				const div3 = document.createElement("div");
 				div3.textContent = " 직원명부 ";
 				div3.setAttribute("style","margin-right: 15px; padding: 15px; border: 1px solid #dddddd; background: #eaeaea; border-radius: 25px; cursor: pointer;");
 				div3.setAttribute("class", "set_menu");
 				div3.setAttribute("onclick","set1();");
 				div3.setAttribute("id","set_menu1");
 				const div4 = document.createElement("div");
 				div4.textContent = " 직원별 변수 설정 ";
 				div4.setAttribute("style","margin-right: 15px; padding: 15px; border: 1px solid #dddddd; background: #eaeaea; border-radius: 25px; cursor: pointer;");
 				div4.setAttribute("class", "set_menu select");
 				div4.setAttribute("onclick","set2();");
 				div4.setAttribute("id","set_menu2");
 				const div5 = document.createElement("div");
 				div5.textContent = " 부서 설정 ";
 				div5.setAttribute("style","margin-right: 15px; padding: 15px; border: 1px solid #dddddd; background: #eaeaea; border-radius: 25px; cursor: pointer;");
 				div5.setAttribute("class", "set_menu");
 				div5.setAttribute("onclick","set3();");
 				div5.setAttribute("id","set_menu3");
				nav.appendChild(div3);
 				nav.appendChild(div4);
 				nav.appendChild(div5);
 				
				const btn = document.createElement('div');
				btn.setAttribute("style", "border: 1px solid #ddd; border-radius: 25px; background: #eaeaea; padding: 15px; cursor: pointer;");
				btn.setAttribute("onclick", "btn_submit();");
				btn.setAttribute("class", "select");
				btn.textContent = "저장";
				nav.appendChild(btn);
				const tb = document.createElement("TABLE");
 				tb.setAttribute("class","st_tb");
 				maindiv.appendChild(tb);
				
 				const thead = document.createElement("THEAD");
				const tr1 = document.createElement("TR");
				const td1 = document.createElement("TD");
 				td1.textContent = "기관명";
 				const td2 = document.createElement("TD");
 				td2.textContent = "소속기관명";
 				const td3 = document.createElement("TD");
 				td3.textContent = "부서명";
 				const td4 = document.createElement("TD");
 				td4.textContent = "사원번호";
 				const td5 = document.createElement("TD");
 				td5.textContent = "직급/직책";
 				const td6 = document.createElement("TD");
 				td6.textContent = "사원명";
 				const td7 = document.createElement("TD");
 				td7.textContent = "경혁팀장여부";
 				const td8 = document.createElement("TD");
 				td8.textContent = "경혁팀여부";
 				const td9 = document.createElement("TD");
 				td9.textContent = "부서장여부";
 				const td10 = document.createElement("TD");
 				td10.textContent = "1인부서여부";
 				const td11 = document.createElement("TD");
 				td11.textContent = "진료팀장여부";
 				const td12 = document.createElement("TD");
 				td12.textContent = "진료부여부";
 				const td13 = document.createElement("TD");
 				td13.textContent = "평가제외여부";
 				
 				tb.appendChild(thead);
 				thead.appendChild(tr1);
 				tr1.appendChild(td1);
 				tr1.appendChild(td2);
 				tr1.appendChild(td3);
 				tr1.appendChild(td4);
 				tr1.appendChild(td5);
 				tr1.appendChild(td6);
 				tr1.appendChild(td7);
 				tr1.appendChild(td8);
 				tr1.appendChild(td9);
 				tr1.appendChild(td10);
 				tr1.appendChild(td11);
 				tr1.appendChild(td12);
 				tr1.appendChild(td13);
 				
 				$.each (user, function (index, u) {
 					const tr = document.createElement("TR");
 					
 					const td1 = document.createElement("TD");
					td1.textContent = u.c_name;
					const td2 = document.createElement("TD");
	 				td2.textContent = u.c_name2;
	 				const td3 = document.createElement("TD");
	 				td3.textContent = u.subname;
	 				const td4 = document.createElement("TD");
	 				td4.textContent = u.id;
	 				const td5 = document.createElement("TD");
	 				td5.textContent = u.position;
	 				const td6 = document.createElement("TD");
	 				td6.textContent = u.name;
	 				const td7 = document.createElement("TD");
	 				const input7 = document.createElement("input");
	 				input7.setAttribute("type", "checkbox");
	 				if(u.k == 'T'){
	 					input7.setAttribute("checked", "checked");
	 				}
	 				td7.appendChild(input7);
	 				const td8 = document.createElement("TD");
	 				const input8 = document.createElement("input");
	 				input8.setAttribute("type", "checkbox");
	 				if(u.v == 'T'){
	 					input8.setAttribute("checked", "checked");
	 				}
	 				td8.appendChild(input8);
	 				const td9 = document.createElement("TD");
	 				const input9 = document.createElement("input");
	 				input9.setAttribute("type", "checkbox");
	 				if(u.b == 'T'){
	 					input9.setAttribute("checked", "checked");
	 				}
	 				td9.appendChild(input9);
	 				const td10 = document.createElement("TD");
	 				const input10 = document.createElement("input");
	 				input10.setAttribute("type", "checkbox");
	 				if(u.x == 'T'){
	 					input10.setAttribute("checked", "checked");
	 				}
	 				td10.appendChild(input10);
	 				const td11 = document.createElement("TD");
	 				const input11 = document.createElement("input");
	 				input11.setAttribute("type", "checkbox");
	 				if(u.z == 'T'){
	 					input11.setAttribute("checked", "checked");
	 				}
	 				td11.appendChild(input11);
	 				const td12 = document.createElement("TD");
	 				const input12 = document.createElement("input");
	 				input12.setAttribute("type", "checkbox");
	 				if(u.a == 'T'){
	 					input12.setAttribute("checked", "checked");
	 				}
	 				td12.appendChild(input12);
	 				const td13 = document.createElement("TD");
	 				const input13 = document.createElement("input");
	 				input13.setAttribute("type", "checkbox");
	 				if(u.del_yn == 'Y'){
	 					input13.setAttribute("checked", "checked");
	 				}
	 				td13.appendChild(input13);
	 				
	 				tr.appendChild(td1);
					tr.appendChild(td2);
					tr.appendChild(td3);
					tr.appendChild(td4);
					tr.appendChild(td5);
					tr.appendChild(td6);
	 				tr.appendChild(td7);
	 				tr.appendChild(td8);
	 				tr.appendChild(td9);
	 				tr.appendChild(td10);
	 				tr.appendChild(td11);
	 				tr.appendChild(td12);
	 				tr.appendChild(td13);
					
					tb.appendChild(tr);
					
 				});
			}
		},
		error: function (error) {
			console.error('Error fetching data:', error);
		}
	});
}
// 직원별 변수 설정 저장
function btn_submit(){
	
}


// 효사랑전주요양병원
function unq1(){
	
}
















</script>
</html>