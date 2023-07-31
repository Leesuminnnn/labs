<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Core Work Tools</title>
	<meta charset="UTF-8">
	<!-- 
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	 -->
	<!-- Web App으로 선언하여 브라우저의 UI ( URL 바 ) 를 안 보이도록 할 수 있다. -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="viewport" content="user-scalable=no">
	<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Maincss.css?after">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<style>
	</style>
	
	<script>
	/* $(document).ready(function(){
		//모바일에서만 적용되도록
		var winWidth = $(window).width();
		if(winWidth < 769){
			mobileLandscapeChk();
		}
	});	//jqb
	
	function mobileLandscapeChk(){
		var supportsOrientationChange = "onorientationchange" in window,
		orientationEvant = supportsOrientationChange ? "orientationchange" : "resize";
		
		// 화면방향에 따라 보여줌
		window.addEventListener(orientationEvent, function(){
			landscapeView();
		}, false);
		
		// 최초 접속시 화면 방향 체크해서 보여줌
		window.onload = landscapeView();
		
		// 화면방향 체크해서 보여줄 view 체크
		
	} */
	
	</script>
</head>

<body>
<div>
<%@ include file="../Include/Header8.jsp" %>
<section class="section">
	<!-- 사용자 정보 start -->
	<div class="container">
		<div class="first-content">
			<div>
				<div class="light content-text1">안녕하세요.</div>
				<div class="normal content-text2">
				<b class="bold content-text3">
				${detail.m_name}
				<c:set var="midx" value="${detail.midx }"/>
				</b>님[${detail.m_no }]</div>
			</div>
		</div>
		<div class="second-content" onclick="location.href='${pageContext.request.contextPath}/m/Point.do/${detail.midx}/1/${start}/${end}/selectOption1'">
			<div class="normal content-text1 content-text5">보유포인트</div>
			<div class="normal content-text4">
			<b>
			<fmt:formatNumber var="point" value="${detail.m_point}" pattern="#,###,###"/>
			<c:if test="${point == null}">0</c:if>
			${point }&nbsp;P
			</b></div>
		</div>
	</div>
	<!-- 사용자 정보 end -->
	<div class="">
		<!-- 로그인시 출력되는 정보 -->
		<!-- userid = 카카오로그인
			 m_id = 회원로그인
		 -->
		<div>
		<%-- 
		<c:choose>
			<c:when test="${sessionScope.loginMember.m_id != null}">
				<!-- 회원로그인인 경우 -->
				회원입니다.<br>
				sessionScope.loginMember.m_id<br>
				${sessionScope.loginMember.m_id}<br>
				<a href="#">내정보</a><br>
				<a href="${pageContext.request.contextPath}/m/Logout.do">로그아웃</a><br>
				<a href="${pageContext.request.contextPath}/m/Login.do">로그인</a><br>
			</c:when>
			
			<c:when test="${sessionScope.nickname != null }">
				<!-- 카카오로그인인경우 -->
				회원입니다.<br>
				sessionScope.nickname<br>
				${sessionScope.nickname}<br>
				${sessionScope.email}<br>
		 		<a href="#">내정보</a><br>
		 		<a href="${pageContext.request.contextPath}/m/KakaoLogout.do">카카오로그아웃</a><br>
			</c:when>
			<c:otherwise>
				<!-- 로그인을 안한 경우 -->	
				<a href="${pageContext.request.contextPath}/m/Login.do">로그인</a><br>
			</c:otherwise>
		</c:choose>
	 --%>
		
		
		</div>
		<form method="get" name="frm">
			<%-- 
			<h3>Core Work Tools</h3>
			<c:if test="${sessionScope.loginMember.m_id != null}">
			<!-- 회원로그인인 경우 -->
			<input type="text" name="h_userId" value="${sessionScope.loginMember.m_id}">
			<input type="text" name="h_userName" value="${sessionScope.loginMember.m_name}">
			</c:if>
			<c:if test="${sessionScope.nickname != null }">
			<!-- 카카오로그인인경우 -->
			<input type="text" name="h_userId" value="${sessionScope.email}">
			<input type="text" name="h_userName" value="${sessionScope.nickname}">
			</c:if>
			 --%>
			<div class="app-container bolder">
				<div class="app-content">
					<div class="a shadow1" <%-- onclick="location.href='${pageContext.request.contextPath}/h/List.do?h_userId=${sessionScope.loginMember.m_id}&h_userName=${sessionScope.loginMember.m_name}&duration=1'" --%>
					onclick="location.href='${pageContext.request.contextPath}/h/List.do/${detail.midx}/1/${start}/${end}'">
						
						<div class="content">
							<div>
								<img alt="식사수발" src="${pageContext.request.contextPath}/resources/icon/help_icon.png"><br>
								<div>식사수발</div>
							</div>
						</div>
					</div>
					
					<div class="f shadow1" onclick="location.href='${pageContext.request.contextPath}/c/CounselList.do'">
						<div class="content">
							<div>
								<img alt="" src="${pageContext.request.contextPath}/resources/icon/counsel_icon.png"><br>
								<div>전자문서</div>
							</div>
						</div>	
					</div>
					<%-- 
					<div class="f shadow1" onclick="location.href='${pageContext.request.contextPath}/c/Written.do'">
						<div class="content">
							<div>
								<img alt="" src="${pageContext.request.contextPath}/resources/icon/log_icon.png"><br>
								<div>서약서</div>
							</div>
						</div>	
					</div>
					 --%>
					<div class="b shadow1" onclick="location.href='#'">
						<div class="content">
							<div>
								<img alt="앰블런스" src="${pageContext.request.contextPath}/resources/icon/ambul_icon.png"><br>
								<div>앰블런스</div>
							</div>
						</div>	
					</div>
					<div class="c shadow1" onclick="location.href='#'">
						<div class="content">
							<div>
								<img alt="차량관리" src="${pageContext.request.contextPath}/resources/icon/vehicle_icon.png"><br>
								<div >차량관리</div>
							</div>
						</div>	
					</div>
					<div class="d shadow1" onclick="location.href='#'">
						<div class="content">
							<div>
								<img alt="면회신청" src="${pageContext.request.contextPath}/resources/icon/interview_icon.png"><br>
								<div>면회신청</div>
							</div>
						</div>	
					</div>
					<div class="e shadow1" onclick="location.href='#'">
						<div class="content">
							<div>
								<img alt="봉사신청" src="${pageContext.request.contextPath}/resources/icon/service_icon.png"><br>
								<div>봉사신청</div>
							</div>
						</div>	
					</div>
					<div class="f shadow1" onclick="location.href='#'">
						<div class="content">
							<div>
								<img alt="업무일지" src="${pageContext.request.contextPath}/resources/icon/log_icon.png"><br>
								<div>업무일지</div>
							</div>
						</div>	
					</div>
					
				</div>
			</div>
			<div class="notice shadow2" onclick="location.href='${pageContext.request.contextPath}/b/List.do'">
				<div class="flex flex-between">
					<img class="notice-img"src="${pageContext.request.contextPath}/resources/icon/notice.png">
					<span class="normal notice-text">식사수발 서비스가 곧 오픈합니다. <img src="${pageContext.request.contextPath}/resources/icon/new.png"></span>
					<img class="arrow" src="${pageContext.request.contextPath}/resources/icon/arrow.png">
				</div>
			</div>
			
		</form>
		<!-- 광고 베너 -->
		<div class="ad">
			<div class="grayline"></div>
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/ad1.png"></div>
					<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/ad2.png"></div>
				</div>
				<div class="page normal swiper-pagination"></div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../Include/Footer.jsp" %>
<script>
    var swiper = new Swiper(".mySwiper", {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 3500,
        disableOnInteraction: false,
      },
      // 무한 재생
      loop: true,
      pagination: {
          el: ".swiper-pagination",
          type: "fraction",
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      grabCursor: true
    });
  </script>
</div>
</body>

</html>