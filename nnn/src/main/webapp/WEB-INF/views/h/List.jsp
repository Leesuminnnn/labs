<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.util.*"%>
<%@ page import="com.nnn.app.vo.*"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.DayOfWeek" %>
<%@ page import="java.time.YearMonth" %>
<%
	List<HelpVo> helplist = (List<HelpVo>) request.getAttribute("helplist");
	ArrayList<HelpVo> aList = (ArrayList<HelpVo>) request.getAttribute("aList");
	int weekCount = (int) request.getAttribute("weekCount");
	int monthCount = (int) request.getAttribute("monthCount");
	int yearCount = (int) request.getAttribute("yearCount");
	LocalDate startDate = (LocalDate) request.getAttribute("start");
	LocalDate endDate = (LocalDate) request.getAttribute("end");
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<title>Core Work Tools</title>
<meta charset="UTF-8">
<!-- Web App으로 선언하여 브라우저의 UI ( URL 바 ) 를 안 보이도록 할 수 있다. -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="user-scalable=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css"> -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/css.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/Listcss.css">

<style>
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>

<body>
	<%@ include file="../Include/Header2.jsp"%>
	<section>
		<div class="container">
			<!-- 로그인시 출력되는 정보 -->
			<!-- 가입승인중 인 경우 (m_status == 0) -->
			<c:if test="${detail.m_status == 0}">
				<script>
					alert('현재 가입승인중인 계정입니다.');
					location.href = "<%=request.getContextPath() %>/";
				</script>
			</c:if>
<%-- 
			<c:if
				test="${detail.m_in == null or detail.m_de == null or detail.m_no == null}">
				<script>
					/* confirm('회원정보를 입력하지 않으면 수발기록이 인정되지 않습니다.\\n 그대로 진행하시겠습니까?'); */
					alert('회원 정보를 입력해주세요');
					location.href = "<%=request.getContextPath() %>/m/Detail.do/${detail.midx}";
				</script>
			</c:if>
 --%>
			<c:if test="${detail.m_id == null}">
				<script>
					alert('로그인을 해주세요');
					location.href = "<%=request.getContextPath() %>/m/Login.do";
				</script>
			</c:if>
			<form method="get" name="frm" id="frm">
				<div class="data-box">
					<div class="data1">
						<div class="data_contents btn-duration" data-duration="7"
							onclick="countsearch(this);">
							<div class="d_c_t nomal">금주 누적</div>
							<div class="d_c_t-count nomal">
								<b class="bolder"><%=weekCount %></b>회
							</div>
						</div>
						<div class="data_contents btn-duration" data-duration="30"
							onclick="countsearch(this);">
							<div class="d_c_t nomal">금월 누적</div>
							<div class="d_c_t-count nomal">
								<b class="bolder"><%=monthCount %></b>회
							</div>
						</div>
						<div class="data_contents btn-duration" data-duration="365"
							onclick="countsearch(this);">
							<div class="d_c_t nomal">연간 누적</div>
							<div class="d_c_t-count nomal">
								<b class="bolder"><%=yearCount %></b>회
							</div>
						</div>
					</div>

					<div class="data2">
						<div class="d_c">
							<img
								src="<%=request.getContextPath() %>/resources/icon/days.png">
							<div class="normal">
								최근 수행 일자:
								<fmt:formatDate var="lastday" value="${lastDate}"
									pattern="yyyy. MM. dd" />${lastday}
							</div>
						</div>
					</div>
				</div>
				<!-- 고정되는 영역 -->
				<div class="fixed-area" id="fixed-area">
					<div class="dott" id="dott"></div>
					<div class="btn_box" id="btn_box">
						<div class="flex flex-center btn btn1 normal btn-duration active" data-duration="1" onclick="countsearch(this);"
						>1개월</div>
						<div class="flex flex-center btn btn1 normal btn-duration" data-duration="3" onclick="countsearch(this);"
						>3개월</div>
						<div class="flex flex-center btn btn1 normal btn-duration" data-duration="6" onclick="countsearch(this);"
						>6개월</div>
						<div class="flex flex-center btn btn1 normal btn-duration bbtn" data-duration="0">직접설정</div>
					</div>
					<div class="enter" id="enter"></div>
					<div class="date_box flex flex-center light" id="date_box">
						<div class="date flex flex-center">
							<input class="" type="date" value="<%=startDate %>" name="start" id="start">
						</div>
						<div class="flex flex-center">
							<img
								src="<%=request.getContextPath() %>/resources/icon/~.png">
						</div>
						<!-- 여기 ajax로 복사 안함 -->
						<c:set var="maxDate" value="${end }" />
						<!-- !!!! -->
						<div class="date flex flex-center">
							<input class="" type="date" value="<%=endDate %>" name="end" id="end" max="${maxDate}">
						</div>
						<div class="btn btn2 btn3 flex flex-center bold search btn-duration"
							data-duration="0" onclick="countsearch(this)">조회</div>
					</div>
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
								//	console.log(dur);
									bbtn.classList.add('active');
								}else if(dur === '7'){
								//	console.log(dur);
									bbtn.classList.add('active');
								}else if(dur === '30'){
								//	console.log(dur);
									bbtn.classList.add('active');
								}else if(dur === '365'){
								//	console.log(dur);
									bbtn.classList.add('active');
								}else{
								//	console.log(dur);
									button.classList.add('active');
								}
							});
						});
					</script>
					<div class="enter3" id="enter3"></div>
					<div class="normal listhead" id="listhead">수발기록</div>
				</div>
				<!--  -->
				<div class="helplist" id="helplist">
					<!-- 리스트가 없을 때 출력 -->
					<%
					if(helplist == null || helplist.isEmpty()){
					%>
					<div class="list">
						<div class="normal" style="font-size: 26pt;">데이터가 없습니다!</div>
					</div>
					<%
					}
						for (HelpVo help : aList) {
						// 시간차 구하기 예제
							// Date to String 예제
							// mysql Datetime은 timestamp로 되어있어서 시간으로 변환
							// 만약 수발 진행 중일 경우 (끝난 시간이 null) 시간차를 구할 수 없기때문에 컴파일 오류 발생
							long Hour = 0;
							long Min = 0;
							long sec = 0;
							long H = 0;
							String strstart2 = "";
							if(help.getH_endTime() != null){
								Date date = new Date();
								SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								SimpleDateFormat ff = new SimpleDateFormat("yyyy.MM.dd HH:mm");
								String str = f.format(date);
								// String 형태의 시간
								String strstart = f.format(help.getH_startTime());
								String strend = f.format(help.getH_endTime());
								strstart2 = ff.format(help.getH_startTime());
								// 다시 date로 변환
								Date datestart = f.parse(strstart);
								Date dateend = f.parse(strend);
								
								System.out.println(strstart);
								System.out.println(strstart2);
								System.out.println(datestart);
								
								sec = (dateend.getTime() - datestart.getTime()) / 1000; // 초
								Min = (dateend.getTime() - datestart.getTime()) / 60000; // 분
								
								Hour = (dateend.getTime() - datestart.getTime()) / 3600000; // 시
								H = 0;
								if(Min != 0 && Min >= 300){
									H = 5;
									Min = Min - 300;
								}else if (Min != 0 && Min >= 240) {
									H = 4;
									Min = Min - 240;
								}else if(Min != 0 && Min >= 180){
									H = 3;
									Min = Min - 180;
								}else if(Min != 0 && Min >= 120){
									H = 2;
									Min = Min - 120;
								}else if(Min != 0 && Min >= 60){
									H += 1;
									Min = Min - 60;
								}
								Date firstCurrentTime = f.parse("2023-07-06 09:37:32");
								Date secondCurrentTime = f.parse("2023-07-06 09:37:43");
								
								//	Date startTime = f.parse(help.getH_startTime());
								long diff = firstCurrentTime.getTime() - secondCurrentTime.getTime();
								long timeDiff = diff / 1000;
							}else{
								Date date = new Date();
								SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								SimpleDateFormat ff = new SimpleDateFormat("yyyy.MM.dd HH:mm");
								String str = f.format(date);
								// String 형태의 시간
								String strstart = f.format(help.getH_startTime());
								strstart2 = ff.format(help.getH_startTime());
								// 다시 date로 변환
								Date datestart = f.parse(strstart);
							}
					%>
					<div class="list">
						<div class="listrow">
							<div <% if(help.getH_endTime() == null){%>
								onclick="location.href='<%=request.getContextPath() %>/h/Insert.do?h_name=<%=help.getH_name() %>&h_no=<%=help.getH_no() %>&h_number=<%=help.getH_number() %>'"<%}%>>
								

								<div class="listrow">
									<img class="list-img"
										src="<%=request.getContextPath() %>/resources/img/0.png">
								</div>
								<div class="listrow listtext">
									<div class="listcol normal listdate">
										<img
											src="<%=request.getContextPath() %>/resources/icon/days.png"><%=strstart2%>
									</div>
									<div class="listcol light listwhere">
										<div><%=help.getH_name()%>병동
											<%=help.getH_no()%>병실
											<%=help.getH_number()%>침상
										</div>
									</div>
									<div class="listcol listtime">
										<div>
											<!-- 시간차 계산 해야함 -->
											<%
												if (help.getH_endTime() == null) {
											%>
											수발 진행중
											<%
												} else {
											%>
											<!-- 만약 60분이 넘어갈 경우 1시간으로 설정 -->
											<!-- 만약 시간이 없다면 분만 출력 -->
											<%
												if (Hour == 0) {
											%>
											<%=Min%>분 소요
											<%
												} else {
											%>
											<%=Hour%>시간
											<%=Min%>분 소요
											<%
												}
													}
											%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="line2"></div>
					<%
						}
					%>
				</div>
			</form>
			<!-- 신규등록 버튼 -->

			<div class="flex flex-center"
				<c:if test="${listInsert == null}">style="display:none;"</c:if>>
				<div class="btn btn2 btn3 shadow insert flex flex-center normal"
					onclick="location.href='${pageContext.request.contextPath}/h/Insert.do/${detail.midx}'">신규등록</div>
			</div>

		</div>
	</section>
	<script type="text/javascript">
		/*
		var didScroll;
		var lastScrollTop = 0;
		var delta = 5;
		var fixedAreaHeight = $('.fixed-area').outerHeight();
		var topOffset = $('.header2').offset().top;
		var topHeight = $('.header2').outerHeight() - 2;
		var dataBoxHeight = $('.data-box').outerHeight();

		$(window).scroll(function(event) {
			didScroll = true;
		});

		setInterval(function() {
			if (didScroll) {
				hasScrolled();
				didScroll = false;
			}
		}, 250);

		function hasScrolled() {
			var st = $(this).scrollTop();

			if (st > lastScrollTop) {
				// Scroll down
				// 너비가 맞지 않는 오류로 인해 일단 98vw으로 지정
				if (st > topOffset + topHeight - fixedAreaHeight) {
					$('.fixed-area').css({
						'position' : 'fixed',
						'top' : topHeight + 'px',
						'width' : '98vw'
					}, 250);
				}
			} else {
				// Scroll up
				// 위로 스크롤 할때 top css 제거
				if (st < topOffset + dataBoxHeight) {
					$('.fixed-area').css({
						'position' : 'relative',
						'top' : ''
					}, 250);
				} else if (st < topOffset) {
					$('.fixed-area').css({
						'position' : 'relative',
						'top' : 'auto'
					}, 250);
				}
			}

			lastScrollTop = st;
		}
		*/
	</script>
	<%@ include file="../Include/Footer.jsp"%>
</body>
<script>

// 리스트 ajax 호출

// 먼저 누적 데이터 ( 금주, 금월, 연간) 호출
function countsearch(element){		// btn : onclick="countsearch(this)"
	var midx = ${detail.midx};
	var start = document.getElementById('start').value;
	var end = document.getElementById('end').value;
    var duration = element.getAttribute("data-duration");
    var startTime = document.getElementById('start');
    var endTime = document.getElementById('end');
    
//   console.log("midx : " + midx);
//	console.log("duration : " + duration);
	
	$.ajax({
		type : 'post',
		url : "<%=request.getContextPath() %>/h/ListAjax",
		datatype : "json",
		data : {
			"midx" : midx,
			"start" : start,
			"end" : end,
			"duration" : duration
		},
		success : function(response){
			if (response.result === "Y") {
				var helplist = response.helplist; 
		//		console.log("여기 실행됨1");
		//		console.log(response.result);
		//		console.log(helplist);
		//		console.log("reslist 길이"+ helplist.length);
				// 데이터를 꺼내기
				var helplistElement = document.querySelector(".helplist");
				helplistElement.innerHTML = ""; // 기존 리스트 삭제
				
				// 현재 날짜 계산해서 1, 3, 6 개월 이면 날짜 변경
				// endTime 을 바꾸고 1, 3, 6개월 검색 할 때 현재 날짜로 변경
				<%
				LocalDate nowDate = LocalDate.now();
				// 1개월 검색
				LocalDate oneMonth = nowDate.minusMonths(1);
				// 3개월 검색
				LocalDate threeMonth = nowDate.minusMonths(3);
				// 6개월 검색
				LocalDate sixMonth = nowDate.minusMonths(6);
				// 금주 데이터 검색
				// 해당 날짜의 요일을 반환
				DayOfWeek dow = nowDate.getDayOfWeek();
				// 토요일을 나타내는 숫자를 반환 - 해당 날짜의 요일
				int daysToAdd = DayOfWeek.SATURDAY.getValue() - dow.getValue();
				
				if (daysToAdd < 0) {
				    daysToAdd += 7;
				}
				LocalDate weekend = nowDate.plusDays(daysToAdd);
				LocalDate weekstart = weekend.minusDays(6);
				
				// 금월 데이터 검색
				YearMonth thisMonth = YearMonth.now();
				LocalDate monthend = thisMonth.atEndOfMonth();
				LocalDate monthstart = thisMonth.atDay(1);
				
				// 연간 데이터 검색
				LocalDate yearstart = nowDate.withDayOfYear(1);
				LocalDate yearend = nowDate.withDayOfYear(nowDate.lengthOfYear());
				
				
				DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				String nowdate = nowDate.format(dateTimeFormatter);
				%>
				
				
				
				helplist.forEach(function (help) {	// 반복문
					var h_name = help.h_name;
					var h_no = help.h_no;
					var h_number = help.h_number;
					// 수발 진행 중 일 경우 클릭해서 수발등록으로 갈 수 있게 url 추가해주기
					var url = "<%= request.getContextPath() %>/h/Insert.do?h_name="+h_name+"&h_no="+h_no+"&h_number="+h_number;
					
					var list = document.createElement("div");
					list.classList.add("list");
					
					var listRow = document.createElement("div");
					listRow.classList.add("listrow");
					
					var listdiv = document.createElement("div");
					if(help.h_endTime == null){
						listdiv.setAttribute("onclick","location.href='" + url + "'");
					}
										
					var listRow2 = document.createElement("div");
					listRow2.classList.add("listrow");
					
					var listimg = document.createElement("div");
					listimg.classList.add("listrow", "listtext");
					
					var imageElement = document.createElement("img");
					imageElement.classList.add("list-img");
					imageElement.src = "<%=request.getContextPath() %>/resources/img/0.png";
					
					var listtext = document.createElement("div");
					listtext.classList.add("listcol", "normal", "listdate");
					
					
					
					var listdateimg = document.createElement("img");
					listdateimg.src = "<%=request.getContextPath() %>/resources/icon/days.png";
					
					var listwhere = document.createElement("div");
					listwhere.classList.add("listcol", "light", "listwhere");
					
					var listwheretext = document.createElement("div");
					listwheretext.textContent = help.h_name+"병동  "+help.h_no+"병실 "+help.h_number+"침상";
					
					var listtime = document.createElement("div");
					listtime.classList.add("listcol", "listtime");
					
					
					
					
					var line2 = document.createElement("div");
					line2.classList.add("line2");
					
					helplistElement.appendChild(list);
					list.appendChild(listRow);
					listRow.appendChild(listdiv);
					listdiv.appendChild(listRow2);
					listdiv.appendChild(listimg);
					listRow2.appendChild(imageElement);
					
					listimg.appendChild(listtext);
					listtext.appendChild(listdateimg);
					
					// 마찬가지로 수발 중일때 오류 막기
					if(help.h_endTime != null){
						// 시간이 1688013398000 형식으로 나와서 변환
						var date = new Date(help.h_startTime);
						var date2 = new Date(help.h_endTime);
		//				console.log(help.h_endTime);
		//				console.log(date2);
						
		//				console.log(date.toString());		// Thu Jul 06 2023 09:37:32 GMT+0900 (한국 표준시)
						// getFullYear()는 4자리 연도(예: "2023")를 반환
						var year = date.getFullYear();
						// getMonth()는 0부터 시작하는 월(1월은 0, 2월은 1 등)을 반환
						// 한 자릿수 월, 일, 시, 분이 선행 0으로 채워지도록 하려면 -2 인수와 함께 slice() 메서드를 사용
						var month = ('0' + (date.getMonth() + 1)).slice(-2);
						// getDate( )는 해당 월의 날짜를 반환
						var day = ('0' + date.getDate()).slice(-2);
						// getHours()는 시간(24시간 형식)을 반환
						var hours = ('0' + date.getHours()).slice(-2);
						// getMinutes()는 분을 반환
						var minutes = ('0' + date.getMinutes()).slice(-2);
						var formattedDateTime = year + '.' + month + '.' + day + ' ' + hours + ':' + minutes;
		//				console.log("qq : "+formattedDateTime);		// 2023.07.06 09:37
						
						// 수발완료 시간과 시작시간의 시간차 구하기
						var timeDiff = Math.abs(date2 - date);
						var hours2 = Math.floor(timeDiff / (1000 * 60 * 60));
						var minutes2 = Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60));
		//				console.log('Time difference: ' + hours2 + ' hours ' + minutes2 + ' minutes');
						var times = "";
						if(hours2 == 0 && minutes2 == 0){
							times = 0+"분 소요";
						}else if(hours2 != 0 && minutes2 != 0){
							times = hours2+"시간 "+minutes2+"분 소요";
						}
						
					}else{
						var date = new Date(help.h_startTime);
		//				console.log(date.toString());		// Thu Jul 06 2023 09:37:32 GMT+0900 (한국 표준시)
						// getFullYear()는 4자리 연도(예: "2023")를 반환
						var year = date.getFullYear();
						// getMonth()는 0부터 시작하는 월(1월은 0, 2월은 1 등)을 반환
						// 한 자릿수 월, 일, 시, 분이 선행 0으로 채워지도록 하려면 -2 인수와 함께 slice() 메서드를 사용
						var month = ('0' + (date.getMonth() + 1)).slice(-2);
						// getDate( )는 해당 월의 날짜를 반환
						var day = ('0' + date.getDate()).slice(-2);
						// getHours()는 시간(24시간 형식)을 반환
						var hours = ('0' + date.getHours()).slice(-2);
						// getMinutes()는 분을 반환
						var minutes = ('0' + date.getMinutes()).slice(-2);
						var formattedDateTime = year + '.' + month + '.' + day + ' ' + hours + ':' + minutes;
		//				console.log("gg : "+formattedDateTime);		// 2023.07.06 09:37
						var times = "수발 진행중";
					}
					
					
					
					var startTimeElement = document.createElement("span");
					startTimeElement.textContent = formattedDateTime;
					
					listtext.appendChild(startTimeElement);
					
					listimg.appendChild(listwhere);
					listwhere.appendChild(listwheretext);
					listimg.appendChild(listtime);
					// 시간차 계산
					var listtimetext = document.createElement("div");
					listtimetext.textContent = times;
					listtime.appendChild(listtimetext);
					
					helplistElement.appendChild(line2);
					
				});
					// 개월수 변경 하면 값 바뀌게 설정
					if(duration == 1){
						console.log("1번");
						console.log(duration);
						startTime.value = "<%=oneMonth%>";
						console.log(startTime.value);
						if(endTime.value != "<%=nowDate%>"){
							console.log("값이 다름");
							endTime.value = "<%=nowDate%>";
						}
					}else if(duration == 3){
						console.log("2번");
						console.log(duration);
						startTime.value = "<%=threeMonth%>";
						console.log(startTime.value);
						if(endTime.value != "<%=nowDate%>"){
							console.log("값이 다름");
							endTime.value = "<%=nowDate%>";
						}
					}else if(duration == 6){
						console.log("3번");
						console.log(duration);
						startTime.value = "<%=sixMonth%>";
						console.log(startTime.value);
						if(endTime.value != "<%=nowDate%>"){
							console.log("값이 다름");
							endTime.value = "<%=nowDate%>";
						}
					}else if(duration == 7){
						console.log("4번");
						console.log(duration);
						startTime.value = "<%=weekstart%>";
						console.log(startTime.value);
						endTime.value = "<%=weekend%>";
						console.log(endTime.value);
					}else if (duration == 30){
						console.log("5번");
						console.log(duration);
						startTime.value = "<%=monthstart%>";
						console.log(startTime.value);
						endTime.value = "<%=monthend%>";
						console.log(endTime.value);
					}else if(duration == 365){
						console.log("6번");
						console.log(duration);
						startTime.value = "<%=yearstart%>";
						console.log(startTime.value);
						endTime.value = "<%=yearend%>";
						console.log(endTime.value);
					}
						
				
						
					
				} else {	// data = N (데이터 없음)
					console.log("data 비어있음");
					var helplistElement = document.querySelector(".helplist");
					helplistElement.innerHTML = ""; // 기존 리스트 삭제
					
					var list = document.createElement("div");
					list.classList.add("list");
					
					var listtext = document.createElement("div");
					listtext.classList.add("normal");
					listtext.setAttribute("style","font-size: 26pt;");
					listtext.textContent = "데이터가 없습니다!";
					
					helplistElement.appendChild(list);
					list.appendChild(listtext);
					// 개월수 변경 하면 값 바뀌게 설정
					if(duration == 1){
						console.log("1번")
						startTime.value = "<%=oneMonth%>";
						console.log(startTime.value);
						if(endTime.value != "<%=nowDate%>"){
							console.log("값이 다름");
							endTime.value = "<%=nowDate%>";
						}
					}else if(duration == 3){
						console.log("2번");
						startTime.value = "<%=threeMonth%>";
						console.log(startTime.value);
						if(endTime.value != "<%=nowDate%>"){
							console.log("값이 다름");
							endTime.value = "<%=nowDate%>";
						}
					}else if(duration == 6){
						console.log("3번");
						startTime.value = "<%=sixMonth%>";
						console.log(startTime.value);
						if(endTime.value != "<%=nowDate%>"){
							console.log("값이 다름");
							endTime.value = "<%=nowDate%>";
						}
					}else if(duration == 7){
						console.log("4번");
						console.log(duration);
						startTime.value = "<%=weekstart%>";
						console.log(startTime.value);
						endTime.value = "<%=weekend%>";
						console.log(endTime.value);
					}else if (duration == 30){
						console.log("5번");
						console.log(duration);
						startTime.value = "<%=monthstart%>";
						console.log(startTime.value);
						endTime.value = "<%=monthend%>";
						console.log(endTime.value);
					}else if(duration == 365){
						console.log("6번");
						console.log(duration);
						startTime.value = "<%=yearstart%>";
						console.log(startTime.value);
						endTime.value = "<%=yearend%>";
						console.log(endTime.value);
					}
				}
		}
	});
}


//날짜 선택할 때 시작시간을 설정하면 끝난시간을 시작시간 전으로 지정하지 못하게 설정
const startDateInput = document.getElementById("start");
const endDateInput = document.getElementById("end");

startDateInput.addEventListener("change", () => {
	endDateInput.min = startDateInput.value;
	if (endDateInput.value < startDateInput.value) {
		endDateInput.value = startDateInput.value;
	}
});

//날짜 선택할 때 끝난시간을 설정하면 시작시간을 끝난시간 이후로 지정하지 못하게 설정
endDateInput.addEventListener("change", () => {
	startDateInput.max = endDateInput.value;
	if(startDateInput.value > endDateInput.value){
		startDateInput.value = endDateInput.value;
	}
});

</script>
</html>