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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testformcss.css">
<title>근무평가</title>
<style>
td {
	border: 1px solid #000;
	text-align: center;
	padding : 15px;
}
</style>
</head>
<body>

<form id="frm" onsubmit="return false;">
	<div class="header">
		<div class="logo" style="margin : 20px auto 20px auto; text-align: center;">
			<%-- <c:choose>
				<c:when test="${info.hspt_name eq '효사랑전주요양병원'}">
					<img src="${pageContext.request.contextPath}/resources/img/1hspt.png">
				</c:when>
				<c:when test="${info.hspt_name == '효사랑가족요양병원'}">
					<img src="${pageContext.request.contextPath}/resources/img/2hspt.png">
				</c:when>
				<c:when test="${info.hspt_name == '가족사랑요양병원'}">
					<img src="${pageContext.request.contextPath}/resources/img/3hspt.png">
				</c:when>
			</c:choose> --%>
			${info.c_name }
			<a style="position: absolute; right: 0;" href="${pageContext.request.contextPath}/d/Logout">로그아웃</a>
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
				<div class="infobox">
					<table style="border:1px solid #000; border-collapse: collapse;">
						<tr>
							<td style="background-color: #08254c; color: #fff;" colspan="5">평가자</td>
						</tr>
						<tr>
							<td>기관명</td><td>부서명</td><td>사원번호</td><td>직급</td><td>사원명</td>
						</tr>
						<tr>
							<td>${info.c_name }</td>
							<td>${info.c_subname }</td>
							<td>${info.id }</td>
							<td>${info.c_position }</td>
							<td>${info.name }</td>
						</tr>
					</table>
					<div>==========></div>
					<table style="border:1px solid #000; border-collapse: collapse;">
						<tr>
							<td style="background-color: #08254c; color: #fff;" colspan="5">평가대상자</td>
						</tr>
						<tr>
							<td>기관명</td><td>부서명</td><td>사원번호</td><td>직급</td><td>사원명</td>
						</tr>
						<tr>
							<td>${target.c_name }</td>
							<td>${target.c_subname }</td>
							<td>${target.id }</td>
							<td>${target.c_position }</td>
							<td>${target.name }</td>
						</tr>
					</table>
				</div>
			</div>
			<div style="border-bottom:3px double #000; margin-top: 15px; margin-bottom: 15px;"></div>

			<div class="scrollbase">
			<div class="area">
				<b>[ 섬김 ]</b><br><br>
				<c:set var="index" value="1"/>
				<c:set var="a" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '섬김' }"><p class="question">${status.count}. ${ev.d1}</p><br>
							<p class="answer">
								<label><input type="radio" name="a${ev.idx}" value="매우우수"/>매우우수</label>
								<label><input type="radio" name="a${ev.idx}" value="우수"/>우수</label>
								<label><input type="radio" name="a${ev.idx}" value="보통"/>보통</label>
								<label><input type="radio" name="a${ev.idx}" value="미흡"/>미흡</label>
								<label><input type="radio" name="a${ev.idx}" value="매우미흡"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="a" value="${a +1 }"/>
					</c:forEach>
				<b>[ 배움 ]</b><br><br>
				<c:set var="b" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '배움' }"><p class="question">${status.count}. ${ev.d1}</p><br>
							<p class="answer">
								<label><input type="radio" name="b${ev.idx}" value="매우우수"/>매우우수</label>
								<label><input type="radio" name="b${ev.idx}" value="우수"/>우수</label>
								<label><input type="radio" name="b${ev.idx}" value="보통"/>보통</label>
								<label><input type="radio" name="b${ev.idx}" value="미흡"/>미흡</label>
								<label><input type="radio" name="b${ev.idx}" value="매우미흡"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="b" value="${b +1 }"/>
					</c:forEach>
				<b>[ 키움 ]</b><br><br>
				
				<c:set var="c" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '키움' }"><p class="question">${status.count}. ${ev.d1}</p><br>
							<p class="answer">
								<label><input type="radio" name="c${ev.idx}" value="매우우수"/>매우우수</label>
								<label><input type="radio" name="c${ev.idx}" value="우수"/>우수</label>
								<label><input type="radio" name="c${ev.idx}" value="보통"/>보통</label>
								<label><input type="radio" name="c${ev.idx}" value="미흡"/>미흡</label>
								<label><input type="radio" name="c${ev.idx}" value="매우미흡"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="c" value="${c +1 }"/>
					</c:forEach>
				<b>[ 나눔 ]</b><br><br>
				<c:set var="d" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '나눔' }"><p class="question">${status.count}. ${ev.d1}</p><br>
							<p class="answer">
								<label><input type="radio" name="d${ev.idx}" value="매우우수"/>매우우수</label>
								<label><input type="radio" name="d${ev.idx}" value="우수"/>우수</label>
								<label><input type="radio" name="d${ev.idx}" value="보통"/>보통</label>
								<label><input type="radio" name="d${ev.idx}" value="미흡"/>미흡</label>
								<label><input type="radio" name="d${ev.idx}" value="매우미흡"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="d" value="${d +1 }"/>
					</c:forEach>
				<b>[ 목표관리 ]</b><br><br>
				<c:set var="e" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '목표관리' }"><p class="question">${status.count}. ${ev.d1}</p><br>
							<p class="answer">
								<label><input type="radio" name="e${ev.idx}" value="매우우수"/>매우우수</label>
								<label><input type="radio" name="e${ev.idx}" value="우수"/>우수</label>
								<label><input type="radio" name="e${ev.idx}" value="보통"/>보통</label>
								<label><input type="radio" name="e${ev.idx}" value="미흡"/>미흡</label>
								<label><input type="radio" name="e${ev.idx}" value="매우미흡"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="e" value="${e +1 }"/>
					</c:forEach>
				<b>[ 종합평가 ]</b><br><br>
					<c:forEach items="${evf}" var="ev">
						<c:if test="${ev.d3 eq '주관식' }"><p class="question">${ev.d1}</p><br>
							<textarea style="width: 99%; height: 90px; padding:5px;" id="f${ev.idx }" name="f${ev.idx }"></textarea>
							<br><br>
						</c:if>
					</c:forEach>
			</div>
			<div class="end-area">
				<!--  -->
					<button class="end" id="end">
						평가완료
					</button>
				</div>
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
var form = document.getElementById("frm");

//문제유형
var ev = "${ev}";
console.log(ev);
$("#end").click(function() {
	// 답안 체크
	var a1 = $('input[name=a1]').is(":checked");
	var a2 = $('input[name=a2]').is(":checked");
	var b3 = $('input[name=b3]').is(":checked");
	var b4 = $('input[name=b4]').is(":checked");
	var c5 = $('input[name=c5]').is(":checked");
	var c6 = $('input[name=c6]').is(":checked");
	var d7 = $('input[name=d7]').is(":checked");
	var d8 = $('input[name=d8]').is(":checked");
	var e9 = $('input[name=e9]').is(":checked");
	var e10 = $('input[name=e10]').is(":checked");
	var f11 = $("#f11").val();
	var a12 = $('input[name=a12]').is(":checked");
	var a13 = $('input[name=a13]').is(":checked");
	var a14 = $('input[name=a14]').is(":checked");
	var a15 = $('input[name=a15]').is(":checked");
	var a16 = $('input[name=a16]').is(":checked");
	var a17 = $('input[name=a17]').is(":checked");
	var a18 = $('input[name=a18]').is(":checked");
	var b19 = $('input[name=b19]').is(":checked");
	var b20 = $('input[name=b20]').is(":checked");
	var b21 = $('input[name=b21]').is(":checked");
	var b22 = $('input[name=b22]').is(":checked");
	var c23 = $('input[name=c23]').is(":checked");
	var c24 = $('input[name=c24]').is(":checked");
	var c25 = $('input[name=c25]').is(":checked");
	var c26 = $('input[name=c26]').is(":checked");
	var c27 = $('input[name=c27]').is(":checked");
	var d28 = $('input[name=d28]').is(":checked");
	var d29 = $('input[name=d29]').is(":checked");
	var e30 = $('input[name=e30]').is(":checked");
	var e31 = $('input[name=e31]').is(":checked");
	var f32 = $("#f32").val();
	
	// 문제유형으로 나누기
	// A, B, C 인 경우와 D인 경우
	if(ev == 'A' || ev == 'B' || ev == 'C' || ev == 'E'){
		if(!a1 || !a2 || !b3 || !b4 || !c5 || !c6 || !d7 || !d8 || !e9 || !e10 || $.trim(f11) === ''){
			console.log(a1);console.log(a2);console.log(b3);console.log(b4);console.log(c5);console.log(c6);
			console.log(d7);console.log(d8);console.log(e9);console.log(e10);console.log(f11);
			
			
			alert("현재 답변하지 않은 평가가 있습니다. \n확인해주세요.");
			return false;
		}
	}else {
		if(!a12 || !a13 || !a14 || !a15 || !a16 || !a17 || !a18 || 
				!b19 || !b20 || !b21 || !b22 || 
				!c23 || !c24 || !c25 || !c26 || !c27 ||
				!d28 || !d29|| !e30|| !e31 ||				
				$.trim(f32) === ''){
			alert("현재 답변하지 않은 평가가 있습니다. \n확인해주세요.");
			return false;
		}
	}
	form.action = "${pageContext.request.contextPath}/d/formAction/${info.idx}/${target.idx}/${team}";
	form.submit();
	// 뒤로가기 버튼 비활성화
	window.history.pushState(null, null, window.location.href);
	window.onpopstate = function(event) {
	    window.history.pushState(null, null, window.location.href);
	};
});




/* 
$(document).ready(function(){ 
    window.onbeforeunload = function(){
        doExit();
    };
});

function doExit(){
    event.returnValue = '"페이지를 벗어 나시겠습니까?"';
}
 */
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