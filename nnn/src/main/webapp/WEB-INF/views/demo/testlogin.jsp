<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testlogin.css?ver4">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="icon" sizes="192x192" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<title>테스트로그인페이지</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<section>
		
		<div class="text-wrap">
			<div class="text-img" style="color: #222222;">
				<img src="${pageContext.request.contextPath}/resources/icon/ev/login_bg_m_3.png">
			</div>
			<div class="main">
				
				<div class="login-header">
					<span class="header-text">코어솔루션 인사평가 시스템</span>
				</div>
				<div class="login-area">
					<div class="login-content">
						<div class="container">
							<div class="content">
								<div class="login-header-top">
									<span>Login</span>
								</div>
								<div class="id-area">
									<input class="input-text id" type="text" name="id" id="id" placeholder="사번" title="사번입력" >
								</div>
								<div class="pwd-area">
									<input class="input-text name" type="text" name="name" id="pwd" placeholder="이름" title="비밀번호입력">
								</div>
								<div class="login-text">
									<span class="bold" style="">개인 비밀번호를 설정 하신 후 로그인 시 아래의 사번/비밀번호 체크 후 사번과 비밀번호를 입력부탁드립니다.</span>
								</div>
								<div class="chk-area" style="">
									<label class="label label-name">
										<span class="alignBox">
											<input class="radio" type="radio" id="chk_name" name="radio" checked />
											<span class="radioimg"></span>
											<span class="inputTxt normal">사번 / 이름 <span class="bold">(비밀번호 설정 전)</span></span>
										</span>
									</label>
									<label class="label label-pwd">
										<span class="alignBox">
											<input type="radio" class="radio" id="chk_no" name="radio" />
											<span class="radioimg"></span>
											<span class="inputTxt normal">사번 / 비밀번호 <span class="bold">(비밀번호 설정 후)</span></span>
										</span>
									</label>
								</div>
								<!-- <div style="text-align: left; font-size: 10pt; color: #000000; margin-bottom: 26px; font-size: 1.4rem;">
									
								</div> -->
								<div class="pw-find">
									<span class="bold" onclick="location.href='${pageContext.request.contextPath}/demo/Findpwd'">비밀번호 찾기 ></span>
								</div>
								<div class="login-btn">
									<button type="button" id="loginbtn" style="">로그인</button>
								</div>
							</div>
						</div>
					</div>
					<div class="center-line"></div>
					<div class="notice-content">
						<div class="container">
							<div class="content content2">
								<div class="notice-header-top">
									<span>Notice</span>
								</div>
								<div class="notice-bg">
									<img src="${pageContext.request.contextPath}/resources/icon/ev/memo.png">
								</div>
									<div class="notice-main">
										<div class="notice-header bold">
											<span>직원 평가완료 후 재평가(수정)이 안되오니 신중하게 평가해 주시기 바랍니다</span>
										</div>
										<div class="notice-text normal">
											<div>
												<div>
													<c:forEach items="${notice }" var="n">
													<div class="notice-inner">
														<div class="inner-text">
															<c:if test="${not empty n.d2}"><img src="${pageContext.request.contextPath}/resources/icon/ev/dotted.png"></c:if>
															<span>${n.d2 }</span>
														</div>
														<div><span class="inner-span">${n.d3 }</span></div>
													</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
									
								
								<div class="notice-btn">
									<div class="manual" id="manual" style="">인사평가 시스템 메뉴얼 보기</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>

</body>
</html>