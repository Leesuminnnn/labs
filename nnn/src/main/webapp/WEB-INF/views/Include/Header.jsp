<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Headercss.css">
<div class="header">
	<img id="menu-btn" src="${pageContext.request.contextPath}/resources/icon/menu.png">
	<div>
		<span class="bold">CW</span>
	</div>
	<div id="menu">
		<div class="menu-body light">
			<div class="info">
				<div class="bold">CW</div>
				<div class="text1 normal"><span class="bold text user-info">${detail.m_name}</span> 님 안녕하세요. [${detail.m_no}]</div>
			</div>
			<div class="line">
			</div>
			<div class="list list-home flex" onclick="location.href='${pageContext.request.contextPath}/h/Main.do'">
				<img src="${pageContext.request.contextPath}/resources/icon/slidemenu_home.png">
				<div class="text">홈</div>
			</div>
			<div class="list list-my flex" onclick="location.href='${pageContext.request.contextPath}/m/Mypage.do/${detail.m_name}'">
				<img src="${pageContext.request.contextPath}/resources/icon/slidemenu_my.png">
				<div class="text">마이페이지</div>
			</div>
			<div class="list list-point flex" onclick="location.href='${pageContext.request.contextPath}/m/Point.do/${detail.m_name}/1/${start}/${end}'">
				<img src="${pageContext.request.contextPath}/resources/icon/slidemenu_point.png">
				<div class="text">포인트내역</div>
			</div>
			<div class="list list-notice flex" onclick="location.href='${pageContext.request.contextPath}/b/List.do'">
				<img src="${pageContext.request.contextPath}/resources/icon/slidemenu_notice.png">
				<div class="text">공지사항</div>
			</div>
			<div class="fixed">
				<div class="line"></div>
				<div class="list list-logout flex" onclick="location.href='${pageContext.request.contextPath}/m/Logout.do'">
					<img src="${pageContext.request.contextPath}/resources/icon/slidemenu_logout.png">
					<div class="text">로그아웃</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
const menuBtn = document.getElementById('menu-btn');
const menu = document.getElementById('menu');

menuBtn.addEventListener('click', () => {
  menuBtn.classList.toggle('active');
  menu.classList.toggle('active');
});


</script>
