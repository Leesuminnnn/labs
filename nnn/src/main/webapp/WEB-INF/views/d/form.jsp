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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/alertcss.css">
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
			<c:if test="${ sessionScope.loginmember eq '12365478' or sessionScope.loginmember eq '1' or empty sessionScope.loginmember }">
				<div style="position:absolute; width: 30px; height: 30px; display: flex; justify-content: center; align-items: center; border: 1px solid; border-radius: 30px; cursor: pointer;"
					onclick="location.href='${pageContext.request.contextPath}/d/admin'">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="30" height="30" fill="currentColor">
					    <path d="M21 11H7.414l4.293-4.293-1.414-1.414L3.586 12l6.707 6.707 1.414-1.414L7.414 13H21v-2z"/>
					</svg>
				</div>
			</c:if>
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
				<c:choose>
					<c:when test="${ev eq 'D' }">
					<!-- 병원 -->
					<b>[ 근무태도 ]</b><br><br>
					<c:set var="index" value="1"/>
					<c:set var="a" value="1"/>
					<c:forEach items="${evf }" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '근무태도' }"><p class="question">${status.count}. ${ev.d1}</p><br>
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
					<b>[ 처리능력 ]</b><br><br>
					<c:set var="b" value="1"/>
					<c:forEach items="${evf }" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '처리능력' }"><p class="question">${status.count}. ${ev.d1}</p><br>
							<p class="answer">
								<label><input type="radio" name="b${ev.idx}" value="매우우수"/>매우우수</label>
								<label><input type="radio" name="b${ev.idx}" value="우수"/>우수</label>
								<label><input type="radio" name="b${ev.idx}" value="보통"/>보통</label>
								<label><input type="radio" name="b${ev.idx}" value="미흡"/>미흡</label>
								<label><input type="radio" name="b${ev.idx}" value="매우미흡"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="a" value="${a +1 }"/>
					</c:forEach>
					<b>[ 업무실적 ]</b><br><br>
					<c:set var="c" value="1"/>
					<c:forEach items="${evf }" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '업무실적' }"><p class="question">${status.count}. ${ev.d1}</p><br>
							<p class="answer">
								<label><input type="radio" name="c${ev.idx}" value="매우우수"/>매우우수</label>
								<label><input type="radio" name="c${ev.idx}" value="우수"/>우수</label>
								<label><input type="radio" name="c${ev.idx}" value="보통"/>보통</label>
								<label><input type="radio" name="c${ev.idx}" value="미흡"/>미흡</label>
								<label><input type="radio" name="c${ev.idx}" value="매우미흡"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="a" value="${a +1 }"/>
					</c:forEach>
					
					</c:when>
					<c:when test="${ev eq 'F' }">
					<!-- 계열사 -->
					<b>[ 근무태도 ]</b><br><br>
					<c:set var="index" value="1"/>
					<c:set var="a" value="1"/>
					<c:forEach items="${evf }" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '근무태도' }"><p class="question">${status.count}. ${ev.d1}</p><br>
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
					<b>[ 처리능력 ]</b><br><br>
					<c:set var="b" value="1"/>
					<c:forEach items="${evf }" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '처리능력' }"><p class="question">${status.count}. ${ev.d1}</p><br>
							<p class="answer">
								<label><input type="radio" name="b${ev.idx}" value="매우우수"/>매우우수</label>
								<label><input type="radio" name="b${ev.idx}" value="우수"/>우수</label>
								<label><input type="radio" name="b${ev.idx}" value="보통"/>보통</label>
								<label><input type="radio" name="b${ev.idx}" value="미흡"/>미흡</label>
								<label><input type="radio" name="b${ev.idx}" value="매우미흡"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="a" value="${a +1 }"/>
					</c:forEach>
					<b>[ 업무실적 ]</b><br><br>
					<c:set var="c" value="1"/>
					<c:forEach items="${evf }" var="ev" varStatus="status">
						<c:if test="${ev.d3 eq '업무실적' }"><p class="question">${status.count}. ${ev.d1}</p><br>
							<p class="answer">
								<label><input type="radio" name="c${ev.idx}" value="매우우수"/>매우우수</label>
								<label><input type="radio" name="c${ev.idx}" value="우수"/>우수</label>
								<label><input type="radio" name="c${ev.idx}" value="보통"/>보통</label>
								<label><input type="radio" name="c${ev.idx}" value="미흡"/>미흡</label>
								<label><input type="radio" name="c${ev.idx}" value="매우미흡"/>매우미흡</label>
							</p><br><br>
						</c:if>
						<c:set var="a" value="${a +1 }"/>
					</c:forEach>
					</c:when>
					<c:otherwise>
					<!-- 부서장 -->
						<b>[ 근무태도 ]</b><br><br>
						<c:set var="index" value="1"/>
						<c:set var="a" value="1"/>
						<c:forEach items="${evf }" var="ev" varStatus="status">
							<c:if test="${ev.d3 eq '근무태도' }"><p class="question">${status.count}. ${ev.d1}</p><br>
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
						<b>[ 리더쉽 ]</b><br><br>
						<c:set var="index" value="1"/>
						<c:set var="b" value="1"/>
						<c:forEach items="${evf }" var="ev" varStatus="status">
							<c:if test="${ev.d3 eq '리더쉽' }"><p class="question">${status.count}. ${ev.d1}</p><br>
								<p class="answer">
									<label><input type="radio" name="b${ev.idx}" value="매우우수"/>매우우수</label>
									<label><input type="radio" name="b${ev.idx}" value="우수"/>우수</label>
									<label><input type="radio" name="b${ev.idx }" value="보통"/>보통</label>
									<label><input type="radio" name="b${ev.idx}" value="미흡"/>미흡</label>
									<label><input type="radio" name="b${ev.idx}" value="매우미흡"/>매우미흡</label>
								</p><br><br>
							</c:if>
							<c:set var="a" value="${a +1 }"/>
						</c:forEach>
						<b>[ 조직관리 ]</b><br><br>
						<c:set var="index" value="1"/>
						<c:set var="c" value="1"/>
						<c:forEach items="${evf }" var="ev" varStatus="status">
							<c:if test="${ev.d3 eq '조직관리' }"><p class="question">${status.count}. ${ev.d1}</p><br>
								<p class="answer">
									<label><input type="radio" name="c${ev.idx}" value="매우우수"/>매우우수</label>
									<label><input type="radio" name="c${ev.idx}" value="우수"/>우수</label>
									<label><input type="radio" name="c${ev.idx}" value="보통"/>보통</label>
									<label><input type="radio" name="c${ev.idx}" value="미흡"/>미흡</label>
									<label><input type="radio" name="c${ev.idx}" value="매우미흡"/>매우미흡</label>
								</p><br><br>
							</c:if>
							<c:set var="a" value="${a +1 }"/>
						</c:forEach>
						<b>[ 업무처리 ]</b><br><br>
						<c:set var="index" value="1"/>
						<c:set var="d" value="1"/>
						<c:forEach items="${evf }" var="ev" varStatus="status">
							<c:if test="${ev.d3 eq '업무처리' }"><p class="question">${status.count}. ${ev.d1}</p><br>
								<p class="answer">
									<label><input type="radio" name="d${ev.idx}" value="매우우수"/>매우우수</label>
									<label><input type="radio" name="d${ev.idx}" value="우수"/>우수</label>
									<label><input type="radio" name="d${ev.idx}" value="보통"/>보통</label>
									<label><input type="radio" name="d${ev.idx}" value="미흡"/>미흡</label>
									<label><input type="radio" name="d${ev.idx}" value="매우미흡"/>매우미흡</label>
								</p><br><br>
							</c:if>
							<c:set var="a" value="${a +1 }"/>
						</c:forEach>
						<b>[ 소통 및 화합 ]</b><br><br>
						<c:set var="index" value="1"/>
						<c:set var="e" value="1"/>
						<c:forEach items="${evf }" var="ev" varStatus="status">
							<c:if test="${ev.d3 eq '소통 및 화합' }"><p class="question">${status.count}. ${ev.d1}</p><br>
								<p class="answer">
									<label><input type="radio" name="e${ev.idx}" value="매우우수"/>매우우수</label>
									<label><input type="radio" name="e${ev.idx}" value="우수"/>우수</label>
									<label><input type="radio" name="e${ev.idx}" value="보통"/>보통</label>
									<label><input type="radio" name="e${ev.idx}" value="미흡"/>미흡</label>
									<label><input type="radio" name="e${ev.idx}" value="매우미흡"/>매우미흡</label>
								</p><br><br>
							</c:if>
							<c:set var="a" value="${a +1 }"/>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<b>[ 종합평가 ]</b><br><br>
					<c:forEach items="${evf}" var="ev">
						<c:if test="${ev.d3 eq '주관식' }"><p class="question">${ev.d1}</p><br>
							<textarea style="width: 99%; height: 90px; padding:5px;" id="g${ev.idx }" name="g${ev.idx }"></textarea>
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
	<div class="modal normal">
		<div class="modal_body">
			<div>
				<div class="menu_msg">현재 답변하지 않은 평가가 있습니다. 확인해주세요.</div>
				<div class="btn pink_btn" id="modal_insert" onclick="closePopup()">
				확인
				</div>
			</div>
		</div>
	</div>
	<div class="modal2 normal">
		<div class="modal_body2">
			<div>
				<div class="menu_msg2">d</div>
				<div class="munu_btn">
					<div class="btn pink_btn" id="modal_insert" onclick="closePopup2redirect()">
					확인
					</div>
					<div class="btn pink_btn cs_btn" id="modal_insert" onclick="closePopup2()">
					취소
					</div>
				</div>
				
			</div>
		</div>
	</div>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
var form = document.getElementById("frm");
const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const modal2 = document.querySelector('.modal2');
const msg = document.querySelector('.menu_msg');
const msg2 = document.querySelector('.menu_msg2');

//문제유형
var ev = "${ev}";
console.log(ev);
$(function () {
	$(document).on("click", "#end", function () {
		// 답안 체크
		// AC		C , E
		var a33 = $('input[name=a33]').is(":checked");
		var a34 = $('input[name=a34]').is(":checked");
		var b35 = $('input[name=b35]').is(":checked");
		var b36 = $('input[name=b36]').is(":checked");
		var c37 = $('input[name=c37]').is(":checked");
		var c38 = $('input[name=c38]').is(":checked");
		var d39 = $('input[name=d39]').is(":checked");
		var d40 = $('input[name=d40]').is(":checked");
		var e41 = $('input[name=e41]').is(":checked");
		var e42 = $('input[name=e42]').is(":checked");
		var g83 = $("#g83").val();
		
		// AD	D
		var a43 = $('input[name=a43]').is(":checked");
		var a44 = $('input[name=a44]').is(":checked");
		var a45 = $('input[name=a45]').is(":checked");
		var a46 = $('input[name=a46]').is(":checked");
		var a47 = $('input[name=a47]').is(":checked");
		var a48 = $('input[name=a48]').is(":checked");
		var a49 = $('input[name=a49]').is(":checked");
		var a50 = $('input[name=a50]').is(":checked");
		var a51 = $('input[name=a51]').is(":checked");
		var a52 = $('input[name=a52]').is(":checked");
		var b53 = $('input[name=b53]').is(":checked");
		var b54 = $('input[name=b54]').is(":checked");
		var b55 = $('input[name=b55]').is(":checked");
		var b56 = $('input[name=b56]').is(":checked");
		var b57 = $('input[name=b57]').is(":checked");
		var c58 = $('input[name=c58]').is(":checked");
		var c59 = $('input[name=c59]').is(":checked");
		var c60 = $('input[name=c60]').is(":checked");
		var c61 = $('input[name=c61]').is(":checked");
		var c62 = $('input[name=c62]').is(":checked");
		var g84 = $("#g84").val();
		
		// AE		F
		var a63 = $('input[name=a63]').is(":checked");
		var a64 = $('input[name=a64]').is(":checked");
		var a65 = $('input[name=a65]').is(":checked");
		var a66 = $('input[name=a66]').is(":checked");
		var a67 = $('input[name=a67]').is(":checked");
		var a68 = $('input[name=a68]').is(":checked");
		var a69 = $('input[name=a69]').is(":checked");
		var a70 = $('input[name=a70]').is(":checked");
		var a71 = $('input[name=a71]').is(":checked");
		var a72 = $('input[name=a72]').is(":checked");
		var b73 = $('input[name=b73]').is(":checked");
		var b74 = $('input[name=b74]').is(":checked");
		var b75 = $('input[name=b75]').is(":checked");
		var b76 = $('input[name=b76]').is(":checked");
		var b77 = $('input[name=b77]').is(":checked");
		var c78 = $('input[name=c78]').is(":checked");
		var c79 = $('input[name=c79]').is(":checked");
		var c80 = $('input[name=c80]').is(":checked");
		var c81 = $('input[name=c81]').is(":checked");
		var c82 = $('input[name=c82]').is(":checked");
		var g85 = $("#g85").val();
		
		// 점수
		// AC
		var g1 = $('input[name=a33]:checked').val();
		var g2 = $('input[name=a34]:checked').val();
		var g3 = $('input[name=b35]:checked').val();
		var g4 = $('input[name=b36]:checked').val();
		var g5 = $('input[name=c37]:checked').val();
		var g6 = $('input[name=c38]:checked').val();
		var g7 = $('input[name=d39]:checked').val();
		var g8 = $('input[name=d40]:checked').val();
		var g9 = $('input[name=e41]:checked').val();
	   var g10 = $('input[name=e42]:checked').val();
		
	    if(ev === 'D') {
	    	// AD
			var k1  = $('input[name=a43]:checked').val();
			var k2  = $('input[name=a44]:checked').val();
			var k3  = $('input[name=a45]:checked').val();
			var k4  = $('input[name=a46]:checked').val();
			var k5  = $('input[name=a47]:checked').val();
			var k6  = $('input[name=a48]:checked').val();
			var k7  = $('input[name=a49]:checked').val();
			var k8  = $('input[name=a50]:checked').val();
			var k9  = $('input[name=a51]:checked').val();
			var k10 = $('input[name=a52]:checked').val();
			var k11 = $('input[name=b53]:checked').val();
			var k12 = $('input[name=b54]:checked').val();
			var k13 = $('input[name=b55]:checked').val();
			var k14 = $('input[name=b56]:checked').val();
			var k15 = $('input[name=b57]:checked').val();
			var k16 = $('input[name=c58]:checked').val();
			var k17 = $('input[name=c59]:checked').val();
			var k18 = $('input[name=c60]:checked').val();
			var k19 = $('input[name=c61]:checked').val();
			var k20 = $('input[name=c62]:checked').val();
	    }else if (ev === 'F') {
	    	// AE
			var k1  = $('input[name=a63]:checked').val();
			var k2  = $('input[name=a64]:checked').val();
			var k3  = $('input[name=a65]:checked').val();
			var k4  = $('input[name=a66]:checked').val();
			var k5  = $('input[name=a67]:checked').val();
			var k6  = $('input[name=a68]:checked').val();
			var k7  = $('input[name=a69]:checked').val();
			var k8  = $('input[name=b70]:checked').val();
			var k9  = $('input[name=a71]:checked').val();
			var k10 = $('input[name=a72]:checked').val();
			var k11 = $('input[name=b73]:checked').val();
			var k12 = $('input[name=b74]:checked').val();
			var k13 = $('input[name=b75]:checked').val();
			var k14 = $('input[name=b76]:checked').val();
			var k15 = $('input[name=b77]:checked').val();
			var k16 = $('input[name=c78]:checked').val();
			var k17 = $('input[name=c79]:checked').val();
			var k18 = $('input[name=c80]:checked').val();
			var k19 = $('input[name=c81]:checked').val();
			var k20 = $('input[name=c82]:checked').val();
	    }
		
		
		
		function mapValueToScore(value) {
		    switch (value) {
		        case '매우우수':
		            return 5;
		        case '우수':
		            return 4;
		        case '보통':
		            return 3;
		        case '미흡':
		            return 2;
		        case '매우미흡':
		            return 1;
		        default:
		            return 0; 
		    }
		}
		function mapValueToScore2(value) {
		    switch (value) {
		        case '매우우수':
		            return 10;
		        case '우수':
		            return 8;
		        case '보통':
		            return 6;
		        case '미흡':
		            return 4;
		        case '매우미흡':
		            return 2;
		        default:
		            return 0; 
		    }
		}
		
		var sumAA = mapValueToScore2(g1) + mapValueToScore2(g2) + mapValueToScore2(g3) + mapValueToScore2(g4) + mapValueToScore2(g5) + mapValueToScore2(g6) + mapValueToScore2(g7) + mapValueToScore2(g8) + mapValueToScore2(g9) + mapValueToScore2(g10);
		var sumAB = mapValueToScore(k1) + mapValueToScore(k2) + mapValueToScore(k3) + mapValueToScore(k4) + mapValueToScore(k5) + mapValueToScore(k6) + mapValueToScore(k7) + mapValueToScore(k8) + mapValueToScore(k9) + mapValueToScore(k10) + mapValueToScore(k11) + mapValueToScore(k12) + mapValueToScore(k13) + mapValueToScore(k14) + mapValueToScore(k15) + mapValueToScore(k16) + mapValueToScore(k17) + mapValueToScore(k18) + mapValueToScore(k19) + mapValueToScore(k20);
		
		// 문제유형으로 나누기
		// A, B, C 인 경우와 D인 경우
		if(ev === 'A' || ev === 'B' || ev === 'C' || ev === 'E'){
			console.log("A B C E 	");
			if(!a33 || !a34 || !b35 || !b36 || !c37 || !c38 || !d39 || !d40 || !e41 || !e42 || $.trim(g83) === ''){
				console.log(a33);
				console.log(a34);
				console.log(b35);
				console.log(b36);
				console.log(c37);
				console.log(c38);
				console.log(d39);
				console.log(d40);
				console.log(e41);
				console.log(e42);
				
				msg.innerText = "현재 답변하지 않은 평가가 있습니다. 확인해주세요."
				modal.classList.toggle('show');
				
				if (modal.classList.contains('show')) {
					body.style.overflow = 'hidden';
				}
			} else {
				msg2.innerHTML = "<p>${target.name} 님의 평가 <b style='color:red;'>예상점수는 "+sumAA+"점</b>입니다.<br>평가완료 후 재평가(수정)이 안됩니다. 평가완료를 하시겠습니까?</p>";
				modal2.classList.toggle('show');
		   		
		   		if (modal2.classList.contains('show')) {
		   			body.style.overflow = 'hidden';
		   		}
			}
		}else if (ev === 'D' || ev === 'F') {
			if (ev === 'D') {
				console.log("D");
				if(!a43 || !a44 || !a45 || !a46 || !a47 || !a48 || !a49 || 
						!a50 || !a51 || !a52 || !b53 || 
						!b54 || !b55 || !b56 || !b57 || !c58 ||
						!c59 || !c60 || !c61 || !c62 ||				
						$.trim(g84) === ''){
					
					msg.innerText = "현재 답변하지 않은 평가가 있습니다. 확인해주세요."
					modal.classList.toggle('show');
					
					if (modal.classList.contains('show')) {
						body.style.overflow = 'hidden';
					}
				}
				else {
					msg2.innerHTML = "<p>${target.name} 님의 평가 <b style='color:red;'>예상점수는 "+sumAB+"점</b>입니다.<br>평가완료 후 재평가(수정)이 안됩니다. 평가완료를 하시겠습니까?</p>";
					modal2.classList.toggle('show');
			   		
			   		if (modal2.classList.contains('show')) {
			   			body.style.overflow = 'hidden';
			   		}
				}
			}else if (ev === 'F') {
				console.log("F");
				if(!a63 || !a64 || !a65 || !a66 || !a67 || !a68 || !a69 || 
						!a70 || !a71 || !a72 || !b73 || 
						!b74 || !b75 || !b76 || !b77 || !c78 ||
						!c79 || !c80 || !c81 || !c82 ||				
						$.trim(g85) === ''){
					msg.innerText = "현재 답변하지 않은 평가가 있습니다. 확인해주세요."
					modal.classList.toggle('show');
					
					if (modal.classList.contains('show')) {
						body.style.overflow = 'hidden';
					}
				}else {
					msg2.innerHTML = "<p>${target.name} 님의 평가 <b style='color:red;'>예상점수는 "+sumAB+"점</b>입니다.<br>평가완료 후 재평가(수정)이 안됩니다. 평가완료를 하시겠습니까?</p>";
					modal2.classList.toggle('show');
			   		
			   		if (modal2.classList.contains('show')) {
			   			body.style.overflow = 'hidden';
			   		}
				}
			}
			
		}
		
		
	});
	

});
function closePopup2redirect(){
	modal2.classList.toggle('show');
	if (!modal2.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
	form.action = "${pageContext.request.contextPath}/d/formAction/${info.idx}/${target.idx}/${team}";
	form.submit();
}
function closePopup(){
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}
function closePopup2(){
	modal2.classList.toggle('show');
	if (!modal2.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}
</script>	
</body>
</html>