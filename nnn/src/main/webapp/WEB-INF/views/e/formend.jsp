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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testformendcss.css">
<title>평가완료</title>
<style>
td {
	border: 1px solid #000;
	text-align: center;
	padding : 25px;
	font-size:  1.2rem
}
</style>
</head>
<body>

<form action="${pageContext.request.contextPath}/e/formAction/${info.idx}/${target.idx}">
	<div class="header">
		<div class="logo" style="margin : 20px auto 20px auto; text-align: center;">
			<c:choose>
				<c:when test="${info.hspt_name eq '효사랑전주요양병원'}">
					<img src="${pageContext.request.contextPath}/resources/img/1hspt.png">
				</c:when>
				<c:when test="${info.hspt_name == '효사랑가족요양병원'}">
					<img src="${pageContext.request.contextPath}/resources/img/2hspt.png">
				</c:when>
				<c:when test="${info.hspt_name == '가족사랑요양병원'}">
					<img src="${pageContext.request.contextPath}/resources/img/3hspt.png">
				</c:when>
			</c:choose>
		</div>
	</div>
	<div class="section">
		<div class="container">
		<!-- 
			<div class="progress">
				<progress id="progress" value="0" min="0" max="100"></progress>
			</div>
			 -->
			<div class="info">
				<p style="margin-bottom: 10px;">▣ 평가자 및 평가대상자 정보를 확인해주세요.</p>
				<div style="display: flex; justify-content: space-around; align-items: center; ">
					<table style="border:1px solid #000; border-collapse: collapse;">
						<tr>
							<td style="background-color: #08254c; color: #fff;" colspan="4">평가자</td>
						</tr>
						<tr>
							<td>부서명</td><td>사원번호</td><td>직급</td><td>사원명</td>
						</tr>
						<tr>
							<td>
							${info.hspt_subname }
							</td>
							<td>${info.id }</td>
							<td>${info.hspt_position }</td>
							<td>${info.name }</td>
						</tr>
					</table>
					<div>==========></div>
					<table style="border:1px solid #000; border-collapse: collapse;">
						<tr>
							<td style="background-color: #08254c; color: #fff;" colspan="4">평가대상자</td>
						</tr>
						<tr>
							<td>부서명</td><td>사원번호</td><td>직급</td><td>사원명</td>
						</tr>
						<tr>
							<td>${target.hspt_subname }
							</td>
							<td>${target.id }</td>
							<td>${info.hspt_position }</td>
							<td>${target.name }</td>
						</tr>
					</table>
				</div>
			</div>
			<div style="border-bottom:3px double #000; margin-top: 15px; margin-bottom: 50px;"></div>
			<div class="area" style="font-weight: bold; padding: 0;">
				<p>[ ${target.name } ] 님의 평가가 완료 되었습니다.
				<p>2023년도 직원평가에 응답해주셔서 감사합니다.
				<div style="border-bottom:1px solid #000; margin-top: 50px; margin-bottom: 50px;"></div>
				<p>먼저 지난 일 년 동안 함께 울고 웃으며 수고해주신 여러분의 노고에 감사한 마음을 표현하고 싶습니다.
				<p>넘겨진 11장의 달력보다 마지막 남은 1장의 달력이 더욱 소중하다 여겨지는 순간입니다.
				<p>오늘에 최선을 다하고 내일을 기대하는 것처럼, 연초에 계획한 모든 일들을 잘 마무리 하시길 바랍니다.
				<br><br>
				<p>다가오는 2024년 청룡의 해를 맞이하여
				<p>직원 모두가 승천하는 푸르른 용처럼 큰 뜻을 펼칠수 있는 한 해가 되었으면 합니다.
				<p>행복한 연말 되시길 바라며, 건강과 행복을 기원합니다.
				<br><br><br>
				<div style="display: flex;
    justify-content: space-around;
    flex-wrap: nowrap;">
    <p>
				<c:choose>
					<c:when test="${info.hspt_name eq '효사랑전주요양병원'}">
						<p class="ps">효사랑전주요양병원장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;박진상
					</c:when>
					<c:when test="${info.hspt_name == '효사랑가족요양병원'}">
						<p class="ps">효사랑가족요양병원장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김정연
					</c:when>
					<c:when test="${info.hspt_name == '가족사랑요양병원'}">
						<p class="ps">가족사랑요양병원 이사장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;박진만
					</c:when>
				</c:choose>
				</div>
				
				<div style="border-bottom:1px solid #000; margin-top: 50px; margin-bottom: 30px;"></div>
				
				<p class="ps2">※ 모든 직원의 평가가 완료되지 않으신 직원은 아래 "목록 돌아가기" 버튼을 클릭하여, 평가를 계속 진행해주시기 바랍니다.
				<br><br><br>
				<!-- <div onclick="back()" style="border: 1px solid #000; padding: 15px; background-color: #D9EAD3;"></div> -->
				<a style="border: 1px solid #000; padding: 15px; margin-bottom: 15px;; background-color: #D9EAD3; display: inline-block;" href="${pageContext.request.contextPath}/e/Info/${info.idx}">평가대상자 목록 돌아가기</a>
				</div>
				</div>
	</div>
	
	<div class="footer">
		<div class="nav">
			<img style="height: 35px;" src="${pageContext.request.contextPath}/resources/img/core_logo.png">
		</div>
	</div>
	
</form>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
function back() {
	var infoidx = ${info.idx};
	var link = "${pageContext.request.contextPath}/e/Info/"+infoidx;
	
	// 링크 이동
	location.replace(link);
}

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
</body>
</html>