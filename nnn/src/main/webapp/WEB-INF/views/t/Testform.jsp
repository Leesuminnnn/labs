<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testformcss.css">
<title>설문조사</title>
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
		<div style="margin : 20px auto 20px auto; text-align: center;">
			<c:choose>
				<c:when test=""></c:when>
				<c:when test=""></c:when>
				<c:when test=""></c:when>
			</c:choose>
			
			로고가 들어갈 영역입니다
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
							<td colspan="3">평가자</td>
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
							<td colspan="3">평가대상자</td>
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
				<b>[ 섬김 ]</b><br><br>
				<c:set var="index" value="1"/>
				<c:set var="a" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '섬김' }"><p>${status.count}. ${ev.d1}</p><br>
							<p>
								<label><input type="radio" name="a${status.count}" value="5"/>매우우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="a${status.count}" value="4"/>우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="a${status.count}" value="3"/>보통</label>&nbsp;&nbsp;
								<label><input type="radio" name="a${status.count}" value="2"/>미흡</label>&nbsp;&nbsp;
								<label><input type="radio" name="a${status.count}" value="1"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="a" value="${a +1 }"/>
					</c:forEach>
				<b>[ 배움 ]</b><br><br>
				<c:set var="b" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '배움' }"><p>${status.count}. ${ev.d1}</p><br>
							<p>
								<label><input type="radio" name="b${b}" value="5"/>매우우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="b${b}" value="4"/>우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="b${b}" value="3"/>보통</label>&nbsp;&nbsp;
								<label><input type="radio" name="b${b}" value="2"/>미흡</label>&nbsp;&nbsp;
								<label><input type="radio" name="b${b}" value="1"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="b" value="${b +1 }"/>
					</c:forEach>
				<b>[ 키움 ]</b><br><br>
				
				<c:set var="c" value="1"/>
					<c:forEach items="${evf}" var="ev">
						<c:if test="${ev.d3 eq '키움' }"><p>${status.count}. ${ev.d1}</p><br>
							<p>
								<label><input type="radio" name="c${c}" value="5"/>매우우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="c${c}" value="4"/>우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="c${c}" value="3"/>보통</label>&nbsp;&nbsp;
								<label><input type="radio" name="c${c}" value="2"/>미흡</label>&nbsp;&nbsp;
								<label><input type="radio" name="c${c}" value="1"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="c" value="${c +1 }"/>
					</c:forEach>
				<b>[ 나눔 ]</b><br><br>
				<c:set var="d" value="1"/>
					<c:forEach items="${evf}" var="ev">
						<c:if test="${ev.d3 eq '나눔' }"><p>${status.count}. ${ev.d1}</p><br>
							<p>
								<label><input type="radio" name="d${d}" value="5"/>매우우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="d${d}" value="4"/>우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="d${d}" value="3"/>보통</label>&nbsp;&nbsp;
								<label><input type="radio" name="d${d}" value="2"/>미흡</label>&nbsp;&nbsp;
								<label><input type="radio" name="d${d}" value="1"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="d" value="${d +1 }"/>
					</c:forEach>
				<b>[ 목표관리 ]</b><br><br>
				<c:set var="e" value="1"/>
					<c:forEach items="${evf}" var="ev">
						<c:if test="${ev.d3 eq '목표관리' }"><p>${status.count}. ${ev.d1}</p><br>
							<p>
								<label><input type="radio" name="e${e}" value="5"/>매우우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="e${e}" value="4"/>우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="e${e}" value="3"/>보통</label>&nbsp;&nbsp;
								<label><input type="radio" name="e${e}" value="2"/>미흡</label>&nbsp;&nbsp;
								<label><input type="radio" name="e${e}" value="1"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="e" value="${e +1 }"/>
					</c:forEach>
				<b>[ 종합평가 ]</b><br><br>
					<c:forEach items="${evf}" var="ev">
						<c:if test="${ev.d3 eq '주관식' }"><p>${ev.d1}</p><br>
							<textarea style="width: 520px; height: 90px;" name="f"></textarea>
							<br><br>
						</c:if>
					</c:forEach>
			</div>
			<div class="end-area">
			<!--  -->
				<button class="end" >
					평가완료
				</button>
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