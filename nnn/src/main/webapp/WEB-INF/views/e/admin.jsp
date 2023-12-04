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
						<td style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/e/Info/${u.idx}'">${u.name }</td>
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
		 					var url = "<%=request.getContextPath() %>/e/Info/"+idx;
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
		 					var url = "<%=request.getContextPath() %>/e/Info/"+idx;
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
	 					var url = "<%=request.getContextPath() %>/e/Info/"+idx;
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
	 					var url = "<%=request.getContextPath() %>/e/Info/"+idx;
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
	 					var url = "<%=request.getContextPath() %>/e/Info/"+idx;
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
							}
		 					
							
		 					var tdinfo = document.createElement("TD");
		 					var url = "<%=request.getContextPath() %>/e/Info/"+idx;
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
						}
	 					var tdinfo = document.createElement("TD");
	 					var url = "<%=request.getContextPath() %>/e/Info/"+idx;
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
						}
	 					var tdinfo = document.createElement("TD");
	 					var url = "<%=request.getContextPath() %>/e/Info/"+idx;
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
						}
	 					
	 					var tdinfo = document.createElement("TD");
	 					var url = "<%=request.getContextPath() %>/e/Info/"+idx;
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

</script>
</html>