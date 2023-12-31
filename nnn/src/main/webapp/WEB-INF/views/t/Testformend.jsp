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
	padding : 15px;
}
</style>
</head>
<body>

<form action="${pageContext.request.contextPath}/t/formAction/${info.idx}/${target.idx}">
	<div class="header">
		<div class="logo" style="margin : 20px auto 20px auto; text-align: center;">
			<c:choose>
				<c:when test="${info.hspt_name == 1}">
					<img src="${pageContext.request.contextPath}/resources/img/1hspt.png">
				</c:when>
				<c:when test="${info.hspt_name == 2}">
					<img src="${pageContext.request.contextPath}/resources/img/2hspt.png">
				</c:when>
				<c:when test="${info.hspt_name == 3}">
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
							<td style="background-color: #08254c; color: #fff;" colspan="3">평가자</td>
						</tr>
						<tr>
							<td>부서명</td><td>사원번호</td><td>사원명</td>
						</tr>
						<tr>
							<td>
								<c:choose>
									<c:when test="${info.hspt_sub == 'A00'}">진료부</c:when>
									<c:when test="${info.hspt_sub == 'B00'}">원무부</c:when>
									<c:when test="${info.hspt_sub == 'C00'}">총무부</c:when>
									<c:when test="${info.hspt_sub == 'D00'}">관리과</c:when>
									<c:when test="${info.hspt_sub == 'E00'}">QPS</c:when>
									<c:when test="${info.hspt_sub == 'F00'}">임상병리</c:when>
									<c:when test="${info.hspt_sub == 'G00'}">방사선</c:when>
									<c:when test="${info.hspt_sub == 'H00'}">약국</c:when>
									<c:when test="${info.hspt_sub == 'I00'}">사회사업실</c:when>
									<c:when test="${info.hspt_sub == 'J00'}">영양과</c:when>
									<c:when test="${info.hspt_sub == 'K00'}">물리치료실</c:when>
									<c:when test="${info.hspt_sub == 'L00'}">작업치료실</c:when>
									<c:when test="${info.hspt_sub == 'M00'}">외래</c:when>
									<c:when test="${info.hspt_sub == 'N00'}">가정간호</c:when>
									<c:when test="${info.hspt_sub == 'O00'}">인공신장</c:when>
									<c:when test="${info.hspt_sub == 'P00'}">감염관리</c:when>
									<c:when test="${info.hspt_sub == 'Q01'}">1병동</c:when>
									<c:when test="${info.hspt_sub == 'Q02'}">2병동</c:when>
									<c:when test="${info.hspt_sub == 'Q03'}">3병동</c:when>
									<c:when test="${info.hspt_sub == 'Q04'}">4병동</c:when>
									<c:when test="${info.hspt_sub == 'Q05'}">5병동</c:when>
									<c:when test="${info.hspt_sub == 'Q06'}">6병동</c:when>
									<c:when test="${info.hspt_sub == 'Q07'}">7병동</c:when>
									<c:when test="${info.hspt_sub == 'Q08'}">8병동</c:when>
									<c:when test="${info.hspt_sub == 'Q09'}">9병동</c:when>
									<c:when test="${info.hspt_sub == 'Q10'}">10병동</c:when>
									<c:when test="${info.hspt_sub == 'Q11'}">11병동</c:when>
									<c:when test="${info.hspt_sub == 'R00'}">경영전략연구소</c:when>
									<c:when test="${info.hspt_sub == 'S00'}">고객지원</c:when>
									<c:when test="${info.hspt_sub == 'T00'}">의료정보실</c:when>
									<c:when test="${info.hspt_sub == 'U00'}">장래문화원</c:when>
									<c:when test="${info.hspt_sub == 'V00'}">재활치료실</c:when>
									<c:when test="${info.hspt_sub == 'W00'}">홍보기획실</c:when>
								</c:choose>
							</td><td>${info.id }</td><td>${info.name }</td>
						</tr>
					</table>
					<div>==========></div>
					<table style="border:1px solid #000; border-collapse: collapse;">
						<tr>
							<td style="background-color: #08254c; color: #fff;" colspan="3">평가대상자</td>
						</tr>
						<tr>
							<td>부서명</td><td>사원번호</td><td>사원명</td>
						</tr>
						<tr>
							<td>
							<c:choose>
								<c:when test="${target.hspt_sub == 'A00'}">진료부</c:when>
								<c:when test="${target.hspt_sub == 'B00'}">원무부</c:when>
								<c:when test="${target.hspt_sub == 'C00'}">총무부</c:when>
								<c:when test="${target.hspt_sub == 'D00'}">관리과</c:when>
								<c:when test="${target.hspt_sub == 'E00'}">QPS</c:when>
								<c:when test="${target.hspt_sub == 'F00'}">임상병리</c:when>
								<c:when test="${target.hspt_sub == 'G00'}">방사선</c:when>
								<c:when test="${target.hspt_sub == 'H00'}">약국</c:when>
								<c:when test="${target.hspt_sub == 'I00'}">사회사업실</c:when>
								<c:when test="${target.hspt_sub == 'J00'}">영양과</c:when>
								<c:when test="${target.hspt_sub == 'K00'}">물리치료실</c:when>
								<c:when test="${target.hspt_sub == 'L00'}">작업치료실</c:when>
								<c:when test="${target.hspt_sub == 'M00'}">외래</c:when>
								<c:when test="${target.hspt_sub == 'N00'}">가정간호</c:when>
								<c:when test="${target.hspt_sub == 'O00'}">인공신장</c:when>
								<c:when test="${target.hspt_sub == 'P00'}">감염관리</c:when>
								<c:when test="${target.hspt_sub == 'Q01'}">1병동</c:when>
								<c:when test="${target.hspt_sub == 'Q02'}">2병동</c:when>
								<c:when test="${target.hspt_sub == 'Q03'}">3병동</c:when>
								<c:when test="${target.hspt_sub == 'Q04'}">4병동</c:when>
								<c:when test="${target.hspt_sub == 'Q05'}">5병동</c:when>
								<c:when test="${target.hspt_sub == 'Q06'}">6병동</c:when>
								<c:when test="${target.hspt_sub == 'Q07'}">7병동</c:when>
								<c:when test="${target.hspt_sub == 'Q08'}">8병동</c:when>
								<c:when test="${target.hspt_sub == 'Q09'}">9병동</c:when>
								<c:when test="${target.hspt_sub == 'Q10'}">10병동</c:when>
								<c:when test="${target.hspt_sub == 'Q11'}">11병동</c:when>
								<c:when test="${target.hspt_sub == 'R00'}">경영전략연구소</c:when>
								<c:when test="${target.hspt_sub == 'S00'}">고객지원</c:when>
								<c:when test="${target.hspt_sub == 'T00'}">의료정보실</c:when>
								<c:when test="${target.hspt_sub == 'U00'}">장래문화원</c:when>
								<c:when test="${target.hspt_sub == 'V00'}">재활치료실</c:when>
								<c:when test="${target.hspt_sub == 'W00'}">홍보기획실</c:when>
							</c:choose>
							</td><td>${target.id }</td><td>${target.name }</td>
						</tr>
					</table>
				</div>
			</div>
			<div style="border-bottom:3px double #000; margin-top: 15px; margin-bottom: 15px;"></div>
			<div class="area">
				<p>[ ${target.name } ] 평가가 완료 되었습니다.
				<p>2023년도 직원평가에 응답해주셔서 감사합니다.<br><br>
				
				<p>먼저 지난 일 년 동안 함께 울고 웃으며 수고해주신 여러분의 노고에 감사한 마음을 표현하고 싶습니다.
				<p>넘겨진 11장의 달력보다 마지막 남은 1장의 달력이 더욱 소중하다 여겨지는 순간입니다.
				<p>오늘에 최선을 다하고 내일을 기대하는 것처럼, 연초에 계획한 모든 일들을 잘 마무리 하시길 바랍니다.
				<br><br>
				<p>다가오는 2024년 청룡의 해를 맞이하여
				<p>직원 모두가 승천하는 푸르른 용처럼 큰 뜻을 펼칠수 있는 한 해가 되었으면 합니다.
				<p>행복한 연말 되시길 바라며, 건강과 행복을 기원합니다.
				<br><br><br>
				<p class="ps">효사랑가족요양병원장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김정연
				<br><br><br><br>
				
				<p class="ps2">※ 모든 직원의 평가가 완료되지 않으신 직원은 아래 "목록 돌아가기" 버튼을 클릭하여, 평가를 계속 진행해주시기 바랍니다.
				<br><br><br>
				<a style="border: 1px solid #000; padding: 15px; background-color: #D9EAD3;" href="${pageContext.request.contextPath}/t/Testinfo/${info.idx}">평가대상자 목록 돌아가기</a>
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