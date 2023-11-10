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

<form id="frm" onsubmit="return false;">
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
							<td style="background-color: #08254c; color: #fff;" colspan="3">평가자</td>
						</tr>
						<tr>
							<td>부서명</td><td>사원번호</td><td>사원명</td>
						</tr>
						<tr>
							<td>
							${info.hspt_subname }
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
							${target.hspt_subname }
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
								<label><input type="radio" name="a${ev.idx}" value="매우우수"/>매우우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="a${ev.idx}" value="우수"/>우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="a${ev.idx}" value="보통"/>보통</label>&nbsp;&nbsp;
								<label><input type="radio" name="a${ev.idx}" value="미흡"/>미흡</label>&nbsp;&nbsp;
								<label><input type="radio" name="a${ev.idx}" value="매우미흡"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="a" value="${a +1 }"/>
					</c:forEach>
				<b>[ 배움 ]</b><br><br>
				<c:set var="b" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '배움' }"><p>${status.count}. ${ev.d1}</p><br>
							<p>
								<label><input type="radio" name="b${ev.idx}" value="매우우수"/>매우우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="b${ev.idx}" value="우수"/>우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="b${ev.idx}" value="보통"/>보통</label>&nbsp;&nbsp;
								<label><input type="radio" name="b${ev.idx}" value="미흡"/>미흡</label>&nbsp;&nbsp;
								<label><input type="radio" name="b${ev.idx}" value="매우미흡"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="b" value="${b +1 }"/>
					</c:forEach>
				<b>[ 키움 ]</b><br><br>
				
				<c:set var="c" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '키움' }"><p>${status.count}. ${ev.d1}</p><br>
							<p>
								<label><input type="radio" name="c${ev.idx}" value="매우우수"/>매우우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="c${ev.idx}" value="우수"/>우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="c${ev.idx}" value="보통"/>보통</label>&nbsp;&nbsp;
								<label><input type="radio" name="c${ev.idx}" value="미흡"/>미흡</label>&nbsp;&nbsp;
								<label><input type="radio" name="c${ev.idx}" value="매우미흡"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="c" value="${c +1 }"/>
					</c:forEach>
				<b>[ 나눔 ]</b><br><br>
				<c:set var="d" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '나눔' }"><p>${status.count}. ${ev.d1}</p><br>
							<p>
								<label><input type="radio" name="d${ev.idx}" value="매우우수"/>매우우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="d${ev.idx}" value="우수"/>우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="d${ev.idx}" value="보통"/>보통</label>&nbsp;&nbsp;
								<label><input type="radio" name="d${ev.idx}" value="미흡"/>미흡</label>&nbsp;&nbsp;
								<label><input type="radio" name="d${ev.idx}" value="매우미흡"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="d" value="${d +1 }"/>
					</c:forEach>
				<b>[ 목표관리 ]</b><br><br>
				<c:set var="e" value="1"/>
					<c:forEach items="${evf}" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '목표관리' }"><p>${status.count}. ${ev.d1}</p><br>
							<p>
								<label><input type="radio" name="e${ev.idx}" value="매우우수"/>매우우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="e${ev.idx}" value="우수"/>우수</label>&nbsp;&nbsp;
								<label><input type="radio" name="e${ev.idx}" value="보통"/>보통</label>&nbsp;&nbsp;
								<label><input type="radio" name="e${ev.idx}" value="미흡"/>미흡</label>&nbsp;&nbsp;
								<label><input type="radio" name="e${ev.idx}" value="매우미흡"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="e" value="${e +1 }"/>
					</c:forEach>
				<b>[ 종합평가 ]</b><br><br>
					<c:forEach items="${evf}" var="ev">
						<c:if test="${ev.d3 eq '주관식' }"><p>${ev.d1}</p><br>
							<textarea style="width: 520px; height: 90px;" name="f${ev.idx }"></textarea>
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
	
	<div class="footer">
		<div class="nav">
<img style="height: 35px;" src="${pageContext.request.contextPath}/resources/img/core_logo.png">
		</div>
	</div>
	
</form>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
var form = document.getElementById("frm");

$("#end").click(function() {
	alert("현재 답변하지 않은 평가가 있습니다. \n확인해주세요.");
	frm.action = "${pageContext.request.contextPath}/e/formAction/${info.idx}/${target.idx}/${team}";
	form.submit();
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