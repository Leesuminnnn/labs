<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css?ver=0227">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demoheadercss.css?ver=0227">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demofootercss.css?ver=0227">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demoformendcss.css?ver=0227">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/formmediacss.css?ver=0227">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/formendmediacss.css?ver=0227">
<title>코어솔루션 인사평가 시스템</title>
<style>
</style>
</head>
<body>
<div class="main normal">

<form action="${pageContext.request.contextPath}/demo/formAction/${info.idx}/${target.idx}">
	<jsp:include page="../demo/header.jsp"></jsp:include>
		<div class="info">
			<div>
				<div class="info_area">
					<div class="info_name">
						<span class="normal">
							<c:set var="infofirstName" value="${fn:substring(info.name, 0, 1)}" />
							${infofirstName}ㅇㅇ
						</span>
						<span class="light info_id">(사원번호 : ${info.id })</span>
					</div>
					<div class="info_hs light">
						<span>${info.hspt_name} / ${info.hspt_subname } / ${info.hspt_position }</span>
					</div>
					<div class="info_date light" >
						<span>입사일자 : <fmt:formatDate var="date" value="${info.reg_date }" pattern="yyyy. MM. dd" />${date}</span>
					</div>
				</div>
				
			</div>
		</div>
		<div class="target_info" id="targetInfo">
			<div class="target_text flex">
				<div class="flex notice-area flex-between">
					<div class="flex">
						<img src="${pageContext.request.contextPath}/resources/icon/ev/ok.png">
						<span class="bold ">모든 평가가 완료되지 않으신 직원은 버튼을 클릭하여 평가를 계속 진행해 주시기 바랍니다.</span>
					</div>
					<div class="btn-area">
						<button class="end" type="button" onclick="back()">평가 계속하기</button>
					</div>
				</div>
				
			</div>
		</div>
		<%-- <div class="target_area">
			<div class="target">
				<div class="target_box">
					<table style="">
						<tr class="target_box_header">
							<td colspan="4">평가대상자</td>
						</tr>
						<tr class="target_box_1">
							<td>부서명</td><td>사원번호</td><td>직급</td><td>성명</td>
						</tr>
						<tr class="target_box_2">
							<td>${target.hspt_subname }</td><td>${target.id }</td><td>${target.hspt_position }</td>
							<td>
							<c:set var="targetfirstName" value="${fn:substring(target.name, 0, 1)}" />
	    						${targetfirstName }ㅇㅇ
							</td>
						</tr>
					</table>
				</div>
			</div>
			
		</div> --%>
	<div class="section">
		<div class="container">
			<div class="content">
				<div class="area" style="padding: 0;">
					<div style="padding: 20px;">
						<div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
							<div style="margin-top: 45px; margin-bottom: 10px; color: #333333; font-size: 2.43rem;">
							<div style="margin-bottom: 20px;">
								<img class="check_img" src="${pageContext.request.contextPath}/resources/icon/ev/den.png">
							</div>
							<p style="margin-bottom: 10px;">
								<c:set var="targetfirstName" value="${fn:substring(target.name, 0, 1)}" />
								<span class="bold text-color-blue">${targetfirstName }ㅇㅇ</span> 님의 평가가 완료 되었습니다.
							</p>
							<p>2023년도 직원평가에 응답해주셔서 감사합니다.</p><br>
						</div>
						<div class="text-wrap">
							<div class="text-img" style="color: #222222;">
								<img src="${pageContext.request.contextPath}/resources/icon/ev/msg_img.png">
							</div>
							<div class="text">
								<p>먼저 지난 일 년 동안 함께 울고 웃으며 
								<p>수고해주신 여러분의 노고에 감사한 마음을 표현하고 싶습니다.
								<p>넘겨진 11장의 달력보다 마지막 남은 1장의 달력이 더욱 소중하다 여겨지는 순간입니다.
								<p>오늘에 최선을 다하고 내일을 기대하는 것처럼,
								<p>연초에 계획한 모든 일들을 잘 마무리 하시길 바랍니다.
								<br><br>
								<p>다가오는 2024년 청룡의 해를 맞이하여
								<p>직원 모두가 승천하는 푸르른 용처럼 큰 뜻을 펼칠수 있는 한 해가 되었으면 합니다.
								<p>행복한 연말 되시길 바라며, 건강과 행복을 기원합니다.
								<br><br><br>
								<div style="display: flex; justify-content: space-around; flex-wrap: nowrap;">
				    				<p class="ps">- 코어솔루션 대표이사 -
								</div>
							</div>
						</div><!-- 
						<div class="bg_img" style="color: #222222;">
							<div>
								<p>먼저 지난 일 년 동안 함께 울고 웃으며 
								<p>수고해주신 여러분의 노고에 감사한 마음을 표현하고 싶습니다.
								<p>넘겨진 11장의 달력보다 마지막 남은 1장의 달력이 더욱 소중하다 여겨지는 순간입니다.
								<p>오늘에 최선을 다하고 내일을 기대하는 것처럼,
								<p>연초에 계획한 모든 일들을 잘 마무리 하시길 바랍니다.
								<br><br>
								<p>다가오는 2024년 청룡의 해를 맞이하여
								<p>직원 모두가 승천하는 푸르른 용처럼 큰 뜻을 펼칠수 있는 한 해가 되었으면 합니다.
								<p>행복한 연말 되시길 바라며, 건강과 행복을 기원합니다.
								<br><br><br>
								<div style="display: flex; justify-content: space-around; flex-wrap: nowrap;">
				    				<p class="ps">- 코어솔루션대표이사 -
								</div>
							</div>
							
						</div> -->
						
					
						
					
						
					</div>
					<div style="border-top:1px dotted #c1c1c1; margin-top: 50px; margin-bottom: 30px; padding-top:50px;">
							<!-- <p class="ps2" >
							<span style="background-color: #ffecc0;">모든 평가가 완료되지 않으신 직원은 아래 "평가대상자 목록 돌아가기" 버튼을 클릭하여, 평가를 계속 진행해주시기 바랍니다.</span> -->
							<br><br><br>
							<!-- <div onclick="back()" style="border: 1px solid #000; padding: 15px; background-color: #D9EAD3;"></div> -->
							
						</div>
				</div>
				</div>
				</div>
		</div>
	</div>
	<jsp:include page="../demo/footer.jsp"></jsp:include>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
function back() {
	var infoidx = ${info.idx};
	var link = "${pageContext.request.contextPath}/demo/Info/"+infoidx;
	
	// 링크 이동
	location.replace(link);
}


document.addEventListener("DOMContentLoaded", function () {
	var targetInfo = document.getElementById("targetInfo");
	var initialOffset = 207;
	var fixedOffset = 62;
	var isFixed = false;
	
	function updateScroll() {
		var scrollY = window.scrollY || window.pageYOffset;
		
		if (scrollY >= initialOffset && !isFixed) {
			targetInfo.classList.add("fixed");
			isFixed = true;
		} else if (scrollY < initialOffset && isFixed) {
			targetInfo.classList.remove("fixed");
			isFixed = false;
		}
	
		requestAnimationFrame(updateScroll);
	}
	
	// Initial call to start the animation loop
	updateScroll();
});

/* 
var next = document.querySelector(".next");
var prev = document.querySelector(".prev");
var progress = document.querySelector("#progress");
next.addEventListener("click", NextPage);
prev.addEventListener("click", PrevPage)
function NextPage() {
	progress.value = progress.value + 10;
	console.log(progress.value);
}
function PrevPage() {
	progress.value = progress.value - 10;
	console.log(progress.value);
}
 */

</script>	

</div>
</body>
</html>