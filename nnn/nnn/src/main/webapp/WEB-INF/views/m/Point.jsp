<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.nnn.app.vo.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
	List<Pointdetail> pointlist = (List<Pointdetail>) request.getAttribute("pointlist");
ArrayList<Pointdetail> list = (ArrayList<Pointdetail>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- Web App으로 선언하여 브라우저의 UI ( URL 바 ) 를 안 보이도록 할 수 있다. -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="user-scalable=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/nice-select.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Pointcss.css">
<title>포인트 내역</title>
</head>
<style>

</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.js"></script>
<script>
$(document).ready(function(){
	$('select').niceSelect();
	$('#duration').val("1");
	
	
});
</script>
<body>
<%@ include file="../Include/Header5.jsp" %>
<section>
	<div class="container">
		<form action="" method="post" name="frm">
			<div class="content flex flex-col">
				<div class="normal">
					${detail.m_name }님의 보유 포인트
				</div>
				<div class="normal point">
					<b class="point-text">
					<fmt:formatNumber var="point" value="${detail.m_point}" pattern="#,###,###"/>
					<c:if test="${point == null}">0</c:if>
					${point} P</b>
				</div>
			</div>
			<div class="gray-box">
				<div class="btn_box">
					<div class="flex flex-center btn btn1 normal btn-duration active" data-duration="1"
					onclick="listSearch(this);">1개월</div>
					<div class="flex flex-center btn btn1 normal btn-duration" data-duration="3" 
					onclick="listSearch(this);">3개월</div>
					<div class="flex flex-center btn btn1 normal btn-duration" data-duration="6" 
					onclick="listSearch(this);">6개월</div>
					<div class="flex flex-center btn btn1 normal btn-duration bbtn" data-duration="0">직접설정</div>
				</div>
				<div class="date_box flex flex-center light">
					<div class="date flex flex-center">
						<input class="" type="date" value="${start}" name="start" id="start">
					</div>
					<div class="flex flex-center">
						<img src="${pageContext.request.contextPath}/resources/icon/~.png">
					</div>
					<c:set var="maxDate" value="${end }"/>
					<div class="date flex flex-center">
						<input class="" type="date" value="${end}" name="end" id="end" max="${maxDate}">
					</div>
					<div class="btn btn2 btn3 flex flex-center bold search btn-duration" data-duration="0" onclick="listSearch(this);">조회</div>
				</div>
				
				<div class="status">
					<div class="area-custom-select">
						<select class="select-origin" style="" name="select" id="select">
							<option value="selectOption1" <c:if test="${select == 'selectOption1' }">selected</c:if>>전체</option>
							<option value="selectOption2" <c:if test="${select == 'selectOption2' }">selected</c:if>>적립</option>
							<option value="selectOption3" <c:if test="${select == 'selectOption3' }">selected</c:if>>사용</option>
						</select>
						<input type="hidden" name="selectInput" value="${select }">
					</div>
				</div>
				<input type="hidden" value="" id="duration">
				<div class="" id="pointlist">
					<c:if test="${empty pointlist}">
						<div class="dataN normal" style="background-color: #fff;">
							<div class="normal" style="font-size:26pt;">데이터가 없습니다!</div>
						</div>
					</c:if>
					<c:forEach items="${pointlist}" var="list">
						<div class="list1 flex flex-between normal">
							<c:choose>
								<c:when test="${list.p_status == '적립' }">
									<div class="flex flex-row">
										<div class="flex flex-col">
											<div class="list-place bold">식사수발 ${list.h_name}병동 ${list.h_no}병실 ${list.h_number}침상</div>
											<div class="list-date">${list.p_regdate}</div>
										</div>
									</div>
									<div class="flex flex-row">
										<div class="flex flex-col">
											<div class="list-point bolder">+ ${list.details}<span class="normal">P</span></div>
											<div class="list-status light">${list.p_status}</div>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="flex flex-row">
										<div class="flex flex-col">
											<div class="list-place bold">포인트 사용</div>
											<div class="list-date">${list.p_regdate}</div>
										</div>
									</div>
									<div class="flex flex-row">
										<div class="flex flex-col">
											<div class="list-point bolder">- ${list.details}<span class="normal">P</span></div>
											<div class="list-status light">${list.p_status}</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="line"></div>
					</c:forEach>
				</div>
			</div>
		</form>
	</div>
	
</section>
<script>
//list 검색 ajax
function listSearch(element){
	var midx = ${detail.midx};
	var start = document.getElementById('start').value;
	var end = document.getElementById('end').value;
    let duration = element.getAttribute("data-duration");
    var select = document.getElementById("select").value;
    var startTime = document.getElementById('start');
    var endTime = document.getElementById('end');
    var durationInput = document.getElementById('duration').value;
    
    $.ajax({
    	type : 'post',
    	url : '<%=request.getContextPath()%>/m/PointAjax',
    	datatype : "json",
    	data : {
    		"midx" : midx,
    		"start" : start,
    		"end" : end,
    		"duration" : duration,
    		"select" : select
    	},
    	success : function(response){
    		if(response.result === "Y"){
    			// 리스트 꺼내기
    			var list = response.pointlist;
    			var pointlistElement = document.querySelector("#pointlist");
    			pointlistElement.innerHTML = "";
    		
    		// 현재 날짜 계산해서 1, 3, 6 개월 이면 날짜 변경
    			<%!
				LocalDate nowDate = LocalDate.now();
				// 1개월 검색
				LocalDate oneMonth = nowDate.minusMonths(1);
				// 3개월 검색
				LocalDate threeMonth = nowDate.minusMonths(3);
				// 6개월 검색
				LocalDate sixMonth = nowDate.minusMonths(6);
				DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				String nowdate = nowDate.format(dateTimeFormatter);
				%>
		//		console.log("현재 input value : "+startTime.value);
		//		console.log("현재 end value : "+endTime.value);
		//		console.log(duration);
				
    		//	console.log(list);
    			list.forEach(function (list) {
    				var listwrap = document.createElement("div");
    				listwrap.classList.add("list1","flex","flex-between","normal")
    				
    				var rowlist = document.createElement("div");
    				rowlist.classList.add("flex", "flex-row");
    				
    				var collist = document.createElement("div");
    				collist.classList.add("flex", "flex-col");
    				
    				var place = document.createElement("div");
    				place.classList.add("list-place", "bold");
    				place.textContent = "식사수발 "+ list.h_name +"병동 "+ list.h_no + "병실 " + list.h_number + "침상";
    				
    				var date = document.createElement("div");
    				date.classList.add("list-date");
    				date.textContent = list.p_regdate;
    				
    				var rowlist2 = document.createElement("div");
    				rowlist2.classList.add("flex", "flex-row");
    				
    				var collist2 = document.createElement("div");
    				collist2.classList.add("flex", "flex-col");
    				
    				var point = document.createElement("div");
    				point.classList.add("list-point", "bolder");
    				point.textContent ="+ "+list.details;
    				
    				var spantext = document.createElement("span");
    				spantext.classList.add("normal");
    				spantext.textContent = "P";
    				
    				var status = document.createElement("div");
    				status.classList.add("list-status", "light");
    				status.textContent = list.p_status;
    				
    				var line = document.createElement("div");
    				line.classList.add("line");
    				
    				pointlistElement.appendChild(listwrap);
    				listwrap.appendChild(rowlist);
    				rowlist.appendChild(collist);
    				collist.appendChild(place);
    				collist.appendChild(date);
    				listwrap.appendChild(rowlist2);
    				rowlist2.appendChild(collist2);
    				collist2.appendChild(point);
    				point.appendChild(spantext);
    				collist2.appendChild(status);
    				pointlistElement.appendChild(line);
    			});
    			
    			// 개월수 변경 하면 값 바뀌게 설정
    			if(duration == 1){
//					console.log("1번")
					startTime.value = "<%=oneMonth%>";
//					console.log(startTime.value);
					if(endTime.value != "<%=nowDate%>"){
//						console.log("값이 다름");
						endTime.value = "<%=nowDate%>";
					}
				}else if(duration == 3){
//					console.log("2번");
					startTime.value = "<%=threeMonth%>";
//					console.log(startTime.value);
					if(endTime.value != "<%=nowDate%>"){
//						console.log("값이 다름");
						endTime.value = "<%=nowDate%>";
					}
				}else if(duration == 6){
//					console.log("3번");
					startTime.value = "<%=sixMonth%>";
//					console.log(startTime.value);
					if(endTime.value != "<%=nowDate%>"){
//						console.log("값이 다름");
						endTime.value = "<%=nowDate%>";
					}
				}
    			
    		}else{	// data = N (데이터 없음)
//				console.log("data 없음");
    			var pointlistElement = document.querySelector("#pointlist");
    			var frm = document.querySelector("#frm");
    			var status = document.querySelector(".status");
    			var graybox = document.querySelector(".gray-box")
    			pointlistElement.innerHTML = "";
    			
    			var list = document.createElement("div");
    			list.classList.add("dataN", "normal");
    			list.setAttribute("style", "background-color: #ffffff;");
    			
				var listtext = document.createElement("div");
				listtext.classList.add("normal");
				listtext.setAttribute("style", "font-size: 26pt;")
				listtext.textContent = "데이터가 없습니다!";
				
				// before : 선택한 요소의 앞에 내용 삽입
				// after : 선택한 요소의 뒤에 내용 삽입
				// prepend : 선택한요소의 자식요소 앞에 내용삽입
				// append : 선택한요소의 자식요소 뒤에 내용삽입
				pointlistElement.append(list);
				list.appendChild(listtext);
				// 개월수 변경 하면 값 바뀌게 설정
				if(duration == 1){
//					console.log("1번")
					startTime.value = "<%=oneMonth%>";
//					console.log(startTime.value);
					if(endTime.value != "<%=nowDate%>"){
						console.log("값이 다름");
						endTime.value = "<%=nowDate%>";
					}
				}else if(duration == 3){
//					console.log("2번");
					startTime.value = "<%=threeMonth%>";
//					console.log(startTime.value);
					if(endTime.value != "<%=nowDate%>"){
//						console.log("값이 다름");
						endTime.value = "<%=nowDate%>";
					}
				}else if(duration == 6){
//					console.log("3번");
					startTime.value = "<%=sixMonth%>";
//					console.log(startTime.value);
					if(endTime.value != "<%=nowDate%>"){
//						console.log("값이 다름");
						endTime.value = "<%=nowDate%>";
					}
				}
    			
    		}
    	}
    });
	
}
</script>
<script>
	// 모든 버튼 요소를 선택합니다.
	var buttons = document
			.querySelectorAll('.btn-duration');
	var bbtn = document.querySelector(".bbtn");
	
	// 버튼을 클릭했을 때의 이벤트 리스너를 등록합니다.
	buttons.forEach(function(button) {
		button.addEventListener('click', function() {
			// 기존에 추가되어 있던 "active" 클래스를 모두 제거합니다.
			buttons.forEach(function(btn) {
				btn.classList.remove('active');
			});

			// 클릭한 버튼에 "active" 클래스를 추가합니다.
			var dur = button.getAttribute('data-duration'); 
			if(dur === '0'){
//				console.log("dur : "+dur);
				bbtn.classList.add('active');
				$("#duration").val("0");
			}else{
//				console.log("dur : "+dur);
				button.classList.add('active');
				$("#duration").val(dur);
			}
		});
	});
</script>
<script>
// selectBox 선택 시 실행되는 script
function selectsearch(){
//	console.log("여기실행2");
		
    var midx = ${detail.midx};
    var start = document.getElementById('start').value;
    var end = document.getElementById('end').value;
    var select = document.getElementById("select").value;
    let duration = document.getElementById("duration").value;
    var startTime = document.getElementById('start');
    var endTime = document.getElementById('end');
    
//	console.log("midx : " + midx);
//	console.log("start : " + start);
//	console.log("end : " + end);
//	console.log("select : " + select);
//	console.log("duration : "+duration);
	
    $.ajax({
    	type : 'post',
    	url : '<%=request.getContextPath()%>/m/PointAjax',
    	datatype : "json",
    	data : {
    		"midx" : midx,
    		"start" : start,
    		"end" : end,
    		"duration" : duration,
    		"select" : select
    	},
    	success : function(response){
    		if(response.result === "Y"){
    			// 리스트 꺼내기
    			var list = response.pointlist;
//    			console.log("통신 성공");
    			var pointlistElement = document.querySelector("#pointlist");
    			pointlistElement.innerHTML = "";
    			
				// 현재 날짜 계산해서 1, 3, 6 개월 이면 날짜 변경
    			
//				console.log("현재 input value : "+startTime.value);
//				console.log("현재 end value : "+endTime.value);
//				console.log(duration);

				
				
    			list.forEach(function (list) {
    				var listwrap = document.createElement("div");
    				listwrap.classList.add("list1","flex","flex-between","normal")
    				
    				var rowlist = document.createElement("div");
    				rowlist.classList.add("flex", "flex-row");
    				
    				var collist = document.createElement("div");
    				collist.classList.add("flex", "flex-col");
    				
    				var place = document.createElement("div");
    				place.classList.add("list-place", "bold");
    				place.textContent = "식사수발 "+ list.h_name +"병동 "+ list.h_no + "병실 " + list.h_number + "침상";
    				
    				var date = document.createElement("div");
    				date.classList.add("list-date");
    				date.textContent = list.p_regdate;
    				
    				var rowlist2 = document.createElement("div");
    				rowlist2.classList.add("flex", "flex-row");
    				
    				var collist2 = document.createElement("div");
    				collist2.classList.add("flex", "flex-col");
    				
    				var point = document.createElement("div");
    				point.classList.add("list-point", "bolder");
    				point.textContent ="+ "+list.details;
    				
    				var spantext = document.createElement("span");
    				spantext.classList.add("normal");
    				spantext.textContent = "P";
    				
    				var status = document.createElement("div");
    				status.classList.add("list-status", "light");
    				status.textContent = list.p_status;
    				
    				var line = document.createElement("div");
    				line.classList.add("line");
    				
    				pointlistElement.appendChild(listwrap);
    				listwrap.appendChild(rowlist);
    				rowlist.appendChild(collist);
    				collist.appendChild(place);
    				collist.appendChild(date);
    				listwrap.appendChild(rowlist2);
    				rowlist2.appendChild(collist2);
    				collist2.appendChild(point);
    				point.appendChild(spantext);
    				collist2.appendChild(status);
    				pointlistElement.appendChild(line);
    			});
    			// 개월수 변경 하면 값 바뀌게 설정
    			if(duration == 1){
//					console.log("1번")
					startTime.value = "<%=oneMonth%>";
//					console.log(startTime.value);
					
				}else if(duration == 3){
//					console.log("2번");
					startTime.value = "<%=threeMonth%>";
//					console.log(startTime.value);
				}else if(duration == 6){
//					console.log("3번");
					startTime.value = "<%=sixMonth%>";
//					console.log(startTime.value);
				}
    			
    			
    		}else{	// data = N (데이터 없음)
    			
//				console.log("data 없음");
    			
    			var pointlistElement = document.querySelector("#pointlist");
    			// list도 삭제해야함 (데이터가 없습니다!)
    			var frm = document.querySelector("#frm");
    			var status = document.querySelector(".status");
    			var graybox = document.querySelector(".gray-box")
    			pointlistElement.innerHTML = "";
    			
    			var list = document.createElement("div");
    			list.classList.add("dataN", "normal");
    			list.setAttribute("style", "background-color: #ffffff;");
    			
				var listtext = document.createElement("div");
				listtext.classList.add("normal");
				listtext.setAttribute("style", "font-size: 26pt;")
				listtext.textContent = "데이터가 없습니다!";
				
				// before : 선택한 요소의 앞에 내용 삽입
				// after : 선택한 요소의 뒤에 내용 삽입
				// prepend : 선택한요소의 자식요소 앞에 내용삽입
				// append : 선택한요소의 자식요소 뒤에 내용삽입
				pointlistElement.append(list);
				list.appendChild(listtext);
    			
				if(duration == 1){
//					console.log("1번")
					startTime.value = "<%=oneMonth%>";
//					console.log(startTime.value);
					if(endTime.value != "<%=nowDate%>"){
//						console.log("값이 다름");
						endTime.value = "<%=nowDate%>";
					}
				}else if(duration == 3){
//					console.log("2번");
					startTime.value = "<%=threeMonth%>";
//					console.log(startTime.value);
					if(endTime.value != "<%=nowDate%>"){
//						console.log("값이 다름");
						endTime.value = "<%=nowDate%>";
					}
				}else if(duration == 6){
//					console.log("3번");
					startTime.value = "<%=sixMonth%>";
//					console.log(startTime.value);
					if(endTime.value != "<%=nowDate%>"){
//						console.log("값이 다름");
						endTime.value = "<%=nowDate%>";
					}
				}
    		}
    	}
    });
}

// 날짜 선택할 때 시작시간을 설정하면 끝난시간을 이 전으로 지정하지 못하게 설정
const startDateInput = document.getElementById("start");
const endDateInput = document.getElementById("end");

startDateInput.addEventListener("change", () => {
	endDateInput.min = startDateInput.value;
	if (endDateInput.value < startDateInput.value) {
		endDateInput.value = startDateInput.value;
	}
});

endDateInput.addEventListener("change", () => {
	startDateInput.max = endDateInput.value;
	if(startDateInput.value > endDateInput.value){
		startDateInput.value = endDateInput.value;
	}
});


</script>
<%@ include file="../Include/Footer.jsp" %>
</body>
</html>