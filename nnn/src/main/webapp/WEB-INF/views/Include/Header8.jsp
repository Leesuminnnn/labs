<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<input type="checkbox" id="sidebar">
<!-- 헤더 네비게이션 -->
<header>
	<div style="position: absolute; top: 34px; left: 0;">
		<label for="sidebar" class="menu">
		<img id="menu-btn" src="${pageContext.request.contextPath}/resources/icon/menu.png">
		</label>
	</div>
	<div>
		<span class="bold header-text">CW</span>
	</div>
</header>
<!-- 본문영역 -->

<!-- 사이드바 -->
<div class="sidebar_content">
	<div class="info">
		<img class="info-icon" id="info-icon" onclick="check()" src="${pageContext.request.contextPath}/resources/icon/slidemenu_del.png">
		<div class="bold" style="font-size: 40pt; text-align: center;">CW</div>
		<div class="text1 normal">
			<c:choose>
				<c:when test="${detail.midx == null }">
					<span class="light text user-info">로그인을 해주세요.</span>
				</c:when>
				<c:otherwise>
					<span class="bold text user-info">${m_name}</span> 님 안녕하세요. [${m_no}]
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="line"></div>
	<div class="sidebar-section">
		<div class="list list-home flex" onclick="location.href='${pageContext.request.contextPath}/h/Main.do'">
			<img src="${pageContext.request.contextPath}/resources/icon/slidemenu_home.png">
			<div class="text">홈</div>
		</div>
		<div class="list list-my flex" onclick="mypage()">
			<img src="${pageContext.request.contextPath}/resources/icon/slidemenu_my.png">
			<div class="text">마이페이지</div>
		</div>
		<div class="list list-point flex" onclick="point()">
			<img src="${pageContext.request.contextPath}/resources/icon/slidemenu_point.png">
			<div class="text">포인트내역</div>
		</div>
		<div class="list list-notice flex" onclick="notice()">
			<img src="${pageContext.request.contextPath}/resources/icon/slidemenu_notice.png">
			<div class="text">공지사항</div>
		</div>
	</div>
	<div class="fixed">
		<div class="line"></div>
		<div class="list list-logout flex" onclick="location.href='${pageContext.request.contextPath}/m/Logout.do'">
			<img src="${pageContext.request.contextPath}/resources/icon/slidemenu_logout.png">
			<div class="text">로그아웃</div>
		</div>
	</div>
	<label for="sidebar"></label>
</div>
<!-- 사이드바 외 영역 -->
<label for="sidebar" class="background"></label>

<style>
	input#sidebar {
	display:none;
	}

	/* 헤더영역 */
	header {
	font-size: 45pt;
	position:relative;
	z-index:2;
	border-bottom: 1px solid #eeeeee;
	padding-top: 5px;
	padding-bottom: 5px;
	height: 150px;
	width: 100vw;
	background-color: #ffffff;
	display: flex;
	align-items: center;
	justify-content: center;
	}
	.header-text{
	flex-grow: 1;
	text-align: center;
	display: flex;
	justify-content: center;
	}
/*
	header label.menu {position:absolute;top:50%;right:10px;transform:translateY(-50%);width:24px;height:24px;background:url('./img/menu.png') 0 0 no-repeat;cursor:pointer;}
*/
	
	/* 사이드바 */
	.sidebar_content {
		position:fixed;
		top:0;
		left:-90vw;
		width:90vw;
		height:100%;
		background:#f7f7f7;
		transition:all .35s;z-index:5;
	}
	.sidebar_content > ul {
		margin:20px;
	}
	.sidebar_content > ul > li {
		border-bottom:1px solid #ccc;
		list-style:none;
	}
	.sidebar_content > ul > li > a {
		display:inline-block;
		width:auto;
		color:#fff;
		padding:10px;
		margin:10px;
		background:#f5f5f5;
	}
	.sidebar_content label[for='sidebar'] {
		position:absolute;
		top:0;
		left:0;
		width:100%;
		height:100%;
		z-index:-1;
	}
	
	
	/* 사이드바 외 배경영역 */
	.background {
		position:fixed;
		top:0;
		left:0;
		width:100%;
		height:100%;
		background:rgba(0,0,0,.8);
		transition:all .35s;
		opacity:0;
		visibility:hidden;
		z-index:3;
	}
	
.info{
	background-color: #fad15b;
	height: 360px;
	padding-top: 38px;
	align-items: flex-start;
	justify-content: center;
}
.line{
	border-bottom: 20px solid #eaeaea;
}
.list{
	height: 140px;
	padding-left: 40px;
	border-bottom: 1px solid #eaeaea;
}
.list-logout{
	height: 135px;
}
.fixed{
	position: absolute;
	bottom: 0px;
	width: inherit;
}
.text{
	margin-left: 40px;
	font-size: 36pt;
	color: #555555;
}
.text1{
	font-size: 30pt;
	color: #363636;
	display: flex;
	align-items: flex-end;
	position: relative;
	bottom: -130px;
}
.user-info{
	color: #363636;
}
#menu-btn{
	margin-left: 32px;
	flex-shrink: 0;
	z-index: 3;
}
header span{
	color:#2f2f2f;
	display: inline-block;
}
.info-icon{
	position: absolute;
	right: 40px;
}

	/* input 체크 */
	input#sidebar:checked ~ header label {background-position:-24px 0;}
	input#sidebar:checked ~ .sidebar_content {left:0;}
	input#sidebar:checked ~ .background  {opacity:1;visibility:visible; overflow:hidden;}
	

.sidebar-section{
	height: calc(100vh - 535px);
	overflow-y: scroll;
}
</style>
<script>
const body = document.querySelector('body');
const sidebar = document.querySelector('.sidebar_content');



const checkbox = document.getElementById('sidebar');

// 이미지 클릭 시 checked 해제
function check(){
	checkbox.checked = false;
}

checkbox.addEventListener('change', function () {
	  if (this.checked) {
	    body.style.overflow = 'hidden';
	    sidebar.addEventListener('touchmove', preventScroll);
	  } else {
	    body.style.overflow = 'auto';
	    sidebar.removeEventListener('touchmove', preventScroll);
	  }
	});

	function preventScroll(event) {
	  event.preventDefault();
	}

function mypage(){
	if(midx == ""){
		const url = "${pageContext.request.contextPath}/m/Login.do";
		
		alert("로그인이 필요합니다");
		
		window.location.href = url;
	}else{
		window.location.href='${pageContext.request.contextPath}/m/Mypage.do/${detail.midx}'
	}
}

function point(){
	if(midx == ""){
		const url = "${pageContext.request.contextPath}/m/Login.do";
		
		alert("로그인이 필요합니다");
		
		window.location.href = url;
	}else{
		window.location.href='${pageContext.request.contextPath}/m/Point.do/${detail.midx}/1/${start}/${end}/selectOption1'
	}
}

function notice(){
	if(midx == ""){
		const url = "${pageContext.request.contextPath}/m/Login.do";
		
		alert("로그인이 필요합니다");
		
		window.location.href = url;
	}else{
		window.location.href='${pageContext.request.contextPath}/b/List.do'
	}
}
</script>
