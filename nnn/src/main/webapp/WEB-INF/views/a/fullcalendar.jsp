<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.nnn.app.vo.CalendarVo" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%List<CalendarVo> calendarList = (List<CalendarVo>) request.getAttribute("calendarList");%>
<%
// Convert calendarList to JSON string
ObjectMapper objectMapper = new ObjectMapper();
String calendarListJson = objectMapper.writeValueAsString(calendarList);
%>
<%
request.setCharacterEncoding("utf-8");
String sessionId = (String)(session.getAttribute("userId"));
String sessionNm = (String)(session.getAttribute("name"));

System.out.println("jsp :: "+sessionId);
System.out.println("jsp :: "+sessionNm);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>앰뷸런스 예약</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script><!-- 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script><!-- 
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@4.4.2/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@4.4.2/main.min.js"></script> -->
<!-- 
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script> -->

<style>
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 11px;
    height:100%;
  }
  
  @media screen and (max-width:500px){
	  body {
	    margin: 40px 10px;
	    padding: 0;
	    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	    font-size: 11px;
	    height:100%;
	  }
	  .fc-toolbar-title{
	  	font-size: 10px !important;
	  }
  }
  @media screen and (min-width:501px){
  	  body {
	    margin: 40px 10px;
	    padding: 0;
	    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	    font-size: 14px;
	    height:100%;
	  }
  }

  #calendar {
    max-width: 1400px;
    min-height: 500px;
    margin: 0 auto;
  }
  
  /*요일*/
  .fc-col-header-cell-cushion {
	color: #000;
  }
  .fc-col-header-cell-cushion:hover {
	text-decoration: none;
	color:#000;
  }
  /*일자*/
  .fc-daygrid-day-number{
	color: #000;
	font-size:1em;
  }
  
  /*종일제목*/
  .fc-event-title.fc-sticky{
    
  }
  /*more버튼*/ 
  .fc-daygrid-more-link.fc-more-link{
	color: #000;
  }
  /*일정시간*/
  .fc-daygrid-event > .fc-event-time{
	color:#000;
  }
  /*시간제목*/
  .fc-daygrid-dot-event > .fc-event-title{
    color:#000 !important;
  }
  /*가로 줄 - 월달력 종일 or 복수일자*/
  .fc-h-event{
	
  }
  /*세로 줄 - 주달력, 일달력*/
  .fc-v-event{
	
  }
  /*title 옆에 점*/
  .fc-daygrid-event-dot{
	
  }
  /*month/week/day*/
  .fc-button-active{
	border-color: #ffc107 		!important;
	background-color: #ffc107 	!important;
	color: #000 				!important;
	font-weight: bold 			!important;
  }
  /*노란버튼*/
  .btn-warning{
  	font-weight: bold;
  }
  /*모달 푸터*/
  .modal-footer{
  	display:inline-block;
  }
  
</style>
</head>
<body>
  <div id='calendar'></div>
  
  <!-- insertModal -->
  <div class="modal fade insertModal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">앰뷸런스 운행 예약 요청서</h4>
          <button type="button" class="close" onclick="initModal('insertModal', g_arg)">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
     	  <div class="form-group">
			<label for="">운행구분:</label><br>
			<div class="form-inline">
				<label class="mr-2">
				<input type="radio" onclick="runselect(event)" class="form-control" name="run" value="입원" style="height: 100%;">입원</label> 
				<label class="mr-2">
				<input type="radio" onclick="runselect(event)" class="form-control" name="run" value="외진"style="height: 100%;">외진</label> 
				<label class="mr-2">
				<input type="radio" onclick="runselect(event)" class="form-control" name="run" value="전원(응급)"style="height: 100%;">전원(응급)</label> 
				<label class="mr-2">
				<input type="radio" onclick="runselect(event)" class="form-control" name="run" value="혈액원"style="height: 100%;">혈액원</label> 
				<label class="mr-2">
				<input type="radio" onclick="runselect(event)" class="form-control" id="other" name="run" value="Other"style="height: 100%;">Other&nbsp;
				<input type="text" class="form-control" name="RunotherInput" id="RunotherInput"  value="" onchange="runchange()" disabled="disabled"></label>
				<!-- <input type="text" class="form-control" name="Runhidden" id="Runhidden" value="">  -->
			</div>
		  </div>
		  <div class="form-group">
			<label for="">기관선택:</label><br>
			<div class="form-inline">
			<label class="mr-2">
			<input type="radio" onclick="agencyselect(event)" class="form-control" name="agency" value="전북대학교병원" style="height: 100%;">전북대학교병원</label> 
			<label class="mr-2">
			<input type="radio" onclick="agencyselect(event)" class="form-control" name="agency" value="예수병원"style="height: 100%;">예수병원</label> 
			<label class="mr-2">
			<input type="radio" onclick="agencyselect(event)" class="form-control" name="agency" value="대자인병원"style="height: 100%;">대자인병원</label> 
			<label class="mr-2">
			<input type="radio" onclick="agencyselect(event)" class="form-control" name="agency" value="전주병원"style="height: 100%;">전주병원</label> 
			<label class="mr-2">
			<input type="radio" onclick="agencyselect(event)" class="form-control" name="agency" value="호성전주병원"style="height: 100%;">호성전주병원</label> 
			<label class="mr-2">
			<input type="radio" onclick="agencyselect(event)" class="form-control" name="agency" value="혈액원"style="height: 100%;" >혈액원</label> <br>
			<label class="mr-2">
			<input type="radio" onclick="agencyselect(event)" class="form-control" name="agency" id="agencyOther" value="Other" style="height: 100%;">Other&nbsp;
			<input type="text" class="form-control" name="agencyInput" id="AgencyotherInput" onchange="agencychange()" disabled="disabled"></label> <br>
			</div>
		  </div>
		  <div class="form-group">
			<label for="">준비사항:</label><br>
			<div class="form-inline">
			<label class="mr-2">
			<input type="checkbox" class="form-control" name="prepare" id="checkbox1" value="산소" style="height: 100%;">산소</label> 
			<label class="mr-2">
			<input type="checkbox" class="form-control" name="prepare" id="checkbox2" value="석션"style="height: 100%;">석션</label> 
			<label class="mr-2">
			<input type="checkbox" class="form-control" name="prepare" id="checkbox3" value="환의"style="height: 100%;">환의</label> 
			<label class="mr-2">
			<input type="checkbox" class="form-control" name="prepare" id="checkbox4" value="기타"style="height: 100%;">기타
			<input type="text" class="form-control" name="prepareInput" id="prepareInput" style="display:none;">
			</label> 
		  	</div>
		  </div>
		  <div class="form-group">
			<label for="">환자 정보를 입력해 주세요</label><br>
			<div>
			<label>환자 이름
			<input type="text" class="form-control" name="patientName" id="patientName" value="김환자" style="height: 100%;"></label> 
			<label>병실
			<input type="text" class="form-control" name="patientRoom" id="patientRoom" value="101호" style="height: 100%;"></label> 
			<label>연락처
			<input type="text" class="form-control" name="patientNumber" id="patientNumber" value="010-5678-1234" placeholder="예) 010-1234-5678" style="height: 100%;"></label>
			</div> 
		  </div>
          <br>
          <div class="form-group">
			<label for="title">일정제목:</label>
			<input type="text" class="form-control" value="엠뷸런스예약" id="title">
		  </div>
		  <div class="form-group">
			<label for="content">주의사항 및 특이사항:</label>
			<textarea class="form-control" id="content">낙상주의</textarea>
		  </div>
		  <div class="form-group">
			<label for="start">출발시간:</label>
			<select class="form-control" id="start" onchange="startChange()">
				<option value="" selected>출발시간을 선택해 주세요.</option>
				<option value="09:00">09:00</option>
				<option value="09:30">09:30</option>
				<option value="10:00">10:00</option>
				<option value="10:30">10:30</option>
				<option value="11:00">11:00</option>
				<option value="11:30">11:30</option>
				<option value="12:00">12:00</option>
				<option value="12:30">12:30</option>
				<option value="13:00">13:00</option>
				<option value="13:30">13:30</option>
				<option value="14:00">14:00</option>
				<option value="14:30">14:30</option>
				<option value="15:00">15:00</option>
				<option value="15:30">15:30</option>
				<option value="16:00">16:00</option>
				<option value="16:30">16:30</option>
				<option value="17:00">17:00</option>
				<option value="17:30">17:30</option>
				<option value="18:00">18:00</option>
				<option value="18:30">18:30</option>
			</select>
		  </div><%-- 
		  <c:forEach items="${list }" var="l">
		  	${fn:substring(l.start,0,10) }
		  </c:forEach> --%>
		   <div class="form-group">
			<label for="end">종료시간:</label>
			<select class="form-control" id="end">
				<option value="" selected>종료시간을 선택해 주세요.</option>
				<option value="09:30">09:30</option>
				<option value="10:00">10:00</option>
				<option value="10:30">10:30</option>
				<option value="11:00">11:00</option>
				<option value="11:30">11:30</option>
				<option value="12:00">12:00</option>
				<option value="12:30">12:30</option>
				<option value="13:00">13:00</option>
				<option value="13:30">13:30</option>
				<option value="14:00">14:00</option>
				<option value="14:30">14:30</option>
				<option value="15:00">15:00</option>
				<option value="15:30">15:30</option>
				<option value="16:00">16:00</option>
				<option value="16:30">16:30</option>
				<option value="17:00">17:00</option>
				<option value="17:30">17:30</option>
				<option value="18:00">18:00</option>
				<option value="18:30">18:30</option>
				<option value="19:00">19:00</option>
			</select>
		  </div>
		  <div class="form-group">
		  	<label for="">요청(예약)자 이름 및 부서</label>
		  	<input type="text" class="form-control" value="${name }" id="writer" readonly="readonly">
		  </div>
		  <div class="form-group">
		  	<div><label for="">요청 부서 선택</label></div>
		  	<div class="row-sm-12 form-check">
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="2병동" name="a">2병동 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="3병동" name="a">3병동 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="4병동" name="a">4병동 
				</label>
				
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="5병동" name="a">5병동 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="6병동" name="a">6병동 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="7병동" name="a">7병동 
				</label>
				
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="8병동" name="a">8병동 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="9병동" name="a">9병동 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="10병동" name="a">10병동 
				</label>
				
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="11병동" name="a">11병동 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="외래" name="a">외래 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="원무부" name="a">원무부 
				</label>
				
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="임상병리실" name="a">임상병리실 
				</label>
				<label class="form-check-label col-sm-7">
					<input type="radio" class="form-check-input" value="Other" name="a">Other 
					<input type="text" class="form-control">
				</label>
			</div>
			<br>
		  </div>
		  <!-- 
		  <div class="form-group">
			  <label for="allDay">종일여부:</label>
			  <div class="form-check">
				<label class="form-check-label">
					<input type="radio" class="form-check-input" value="true" name="allDay">예
				</label>
			  </div>
		
			  <div class="form-check">
				<label class="form-check-label">
					<input type="radio" checked="checked" class="form-check-input" value="false" name="allDay">아니오
				</label>
			  </div>
			</div>
			 -->
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
        <!-- 
		  <button type="button" class="btn btn-success approvalBtn" onclick="approvalSch('insertModal',g_arg)">승인</button>
		  <button type="button" class="btn btn-danger rejectBtn" onclick="rejectSch('insertModal', g_arg)">반려</button>
		   -->
		  <button type="button" class="btn btn-dark  float-right deleteBtn" onclick="deleteSch('insertModal', g_arg)">삭제</button>
		  <button type="button" class="btn btn-warning float-right insertBtn" onclick="insertSch('insertModal', g_arg)">등록</button>
        </div>
        
      </div>
    </div>
  </div>

</body>


<script>


var calendarData = <%= calendarListJson %>;
  //console.log(calendarData);
  var ceoColor = '#ffc107'; //대표일정 황색
  var regColor = '#343a40';	//일반직원등록 흑색
  var approvalColor = '#28a745'; //승인 녹색
  var rejectColor = '#dc3545'; //반려 적색
  var textWhite = '#fff'; //글씨흰색
  var textBlack = '#000'; //글씨검은색
  
  var today = new Date();
  var month = today.getMonth()+1;	//getMonth()는 9월이 8으로 나옴
  var date = today.getDate();
  var g_arg;	//이벤트 글로벌 변수(모달창에서 호출하는 함수에서 참조하기 위함)
  var calendar;	//달력 변수
  var todayStr = today.getFullYear() + '-' + stringFormat(month) + '-' + stringFormat(date);
  var sch;
  var ceo = 'ad';	 //대표아이디
  
  var prepareInput = document.getElementById('prepareInput');
  
  var checkbox4 = document.getElementById('checkbox4');
  
  var titletext = "";
  checkbox4.addEventListener('change', function() {
    if (checkbox4.checked) {
//		prepareInput.removeAttribute('disabled');
    	prepareInput.style.display = 'inline-block';
    } else {
//		prepareInput.setAttribute('disabled', 'disabled');
    	prepareInput.style.display = 'none';
    }
  });

  
  
  
  //이벤트 가져오기
  //DB	
//  $.ajax({
//	  url: "${pageContext.request.contextPath}/t/TestCalendar2.do",
//	  type: "GET",
//	  data: calendarData,
//	  dataType: "JSON",
//	  traditional: true,
//	  async: false, //동기
//	  success : function(/* data, status, xhr */response){
		  //alert(xhr.status);
//		  $.each(data, function(key, value){
//			    sch = value; //스케줄 저장
//			    
//		  });
//			console.log(data); // This is the parsed JSON data from the server
//		    sch = data; // Store the parsed data in the sch variable
//		    $("#calendar").html(response);
//		try {
//            var parsedData = JSON.parse(calendarData);
//            console.log(parsedData); // Inspect the parsed data
//        } catch (error) {
//            console.error("Error parsing JSON:", error);
//        }
//	  },
//	  error : function(xhr, status, error){
		    //alert(xhr.responseText);
		 // alert('데이터 로딩 실패<br>새로고침 해주세요');
//		  console.error("AJAX Error:", error);
//	        console.log("Error Status:", xhr.status);
//	        console.log("Error Response:", xhr.responseText);
//	        alert('Failed to load data. Please refresh the page.');
//	  }
//	});
	//

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
    calendar = new FullCalendar.Calendar(calendarEl, {
		
      headerToolbar: {
        left: 'prevYear,prev,next,nextYear today',
        center: 'title',
        right: 'timeGridDay,dayGridMonth,timeGridWeek,listMonth'
      },
      locale: 'ko',
	  slotMinTime: '09:00',
      slotMaxTime: '19:00',
      initialDate: todayStr,
      navLinks: true, // can click day/week names to navigate views
      fixedWeekCount: false,		// 31일 이후 다음주 까지 보이는 현상 제거
      selectable: true,
      selectMirror: true,
      select: function(arg) {
		insertModalOpen(arg);	//일자 클릭 시 모달 호출
      },
      eventClick: function(arg) {
		insertModalOpen(arg);	//이벤트 클릭 시 모달 호출
      },
	  eventChange: function(arg){
		//allDay true로 바꾸면 end가 없어서 만듬
		if(arg.event.end == null){
			var end = new Date();
			end.setDate(arg.event.start.getDate()+1);
			arg.event.setEnd(end);	
		}
	  },
	  eventDrop: false/* function(arg){
		  insertModalOpen(arg);		//이벤트 드래그드랍 시 모달 호출
	  } */,
	  eventResize: false/* function(arg){
		  insertModalOpen(arg);		//이벤트 사이즈 변경시(일정변경) 모달 호출
	  } */,	
      editable: false,
      dayMaxEvents: true, // allow "more" link when too many events 
      
      events: [
			//================ ajax데이터 불러올 부분 =====================//
		  
		  <%if (calendarList != null) {%>
		  <%for (CalendarVo vo : calendarList) {%>
			{
				title : '<%=vo.getRun()%> <%=vo.getAgency()%>',
				content : '<%=vo.getContent()%>',
				start : '<%=vo.getStart()%>',	
				end : '<%=vo.getEnd()%>',
				writer : '<%=vo.getWriter()%>',
				id : '<%=vo.getId()%>',
				allday : '<%=vo.isAllday()%>',
				agency : '<%=vo.getAgency()%>',
				run : '<%=vo.getRun()%>',
				prepare : '<%=vo.getPrepare()%>',
				patientName : '<%=vo.getPatientName()%>',
				patientRoom : '<%=vo.getPatientRoom()%>',
				patientNumber : '<%=vo.getPatientNumber()%>',
				regdate : '<%=vo.getRegdate()%>',
				starttime : '<%=vo.getStarttime() %>',
				endtime : '<%=vo.getEndtime()%>',
				startdate: '',
				enddate: ''
			},
			<%}
		}%>
	],
	eventTimeFormat: {
        hour: 'numeric',
        minute: '2-digit',
        meridiem: 'short', // or 'narrow' for abbreviated meridiems
      },
    });

    calendar.render();
  });

  
  //stringFormat date.getMonth() 또는 getDate()가 한자리수 일때 0 추가
  function stringFormat(p_val){
	if(p_val < 10)
		return p_val = '0'+p_val;
	else
		return p_val;
  }
  //시작일자 변경 시 종료일자 +30분 설정
  function startChange(){
	  var start = $('#start').val();
	  var end  = $('#end').val();
	  if(start.substring(3, 5) == '00')
		  end = start.substring(0, 2) + ':30';
	  else
		  end = (parseInt(start.substring(0, 2))+1) + ':00';
	  
	  $('#end').val(end);
  }
  //모달초기화
function initModal(modal, arg){
	
//  	var run = $('.modal .' + modal + ' input[name="run"]:checked').val();
  	
  	var runCheckbox = $('.modal .' + modal + ' input[name="run"]:checked');
  	var agencyCheckbox = $('.modal .' + modal + ' input[name="agency"]:checked');
  	var prepareCheckbox = $('.modal .' + modal + ' input[name="prepare"]:checked');

  	
  	var runValue = runCheckbox.val();
  	var agencyValue = agencyCheckbox.val();
  	var prepareValue = prepareCheckbox.val();
  	console.log(runValue);
  	console.log(agencyValue);
  	console.log(prepareValue);
  	console.log(g_arg.startStr);
	var t = document.querySelector(".modal-title");
	var tv = t.innerHTML
	var text = "앰뷸런스 운행 예약 요청서";
	t.innerHTML = text;
	console.log(t.innerHTML);
//	var agency = $('.modal .' + modal + ' input[name="agency"]:checked').val();
//	var prepare = $('.modal .' + modal + ' input[name="prepare"]:checked').val();
	$('.'+modal+' #title').val('');
	$('.'+modal+' #content').val('');
//	$('.'+modal+' input[name="' + run + '"]:checked').val(''),
	
	runCheckbox.prop('checked', false);
	agencyCheckbox.prop('checked', false);
	prepareCheckbox.prop('checked', false);
	
//	$('.'+modal+' input[name="' + agency + '"]:checked').val(''),
//	$('.'+modal+' input[name="' + prepare + '"]:checked').val(''),
	$('.'+modal+' #patientName').val('');
	$('.'+modal+' #patientRoom').val('');
	$('.'+modal+' #patientNumber').val('');
	$('.'+modal+' #start').val('');
	$('.'+modal+' #end').val('');
	$('.'+modal+' #allDay').val('0');
	$('.'+modal+' input[name="allDay"]').val(['false']);
	$('.'+modal).modal('hide');
	g_arg = null;
	
  }
var run = "";
var agency = "";
var runhidden = $("#Runhidden").val();
var prepare = "";
//모든 체크박스에 대한 이벤트 리스너 등록
var checkboxes = document.getElementsByName("prepare");
for (var i = 0; i < checkboxes.length; i++) {
checkboxes[i].addEventListener("change", updateSelectedValues);
}

//input 요소에 이벤트 리스너 추가
document.getElementById("prepareInput").addEventListener("input", updateSelectedValues);

//선택된 값을 저장할 배열
var selectedValues = [];

//선택된 값을 업데이트하는 함수
function updateSelectedValues() {
selectedValues = [];

// 각 체크박스의 상태를 확인하여 선택된 값을 배열에 추가
for (var i = 0; i < checkboxes.length; i++) {
 if (checkboxes[i].checked && checkboxes[i].value !== "기타") {
   selectedValues.push(checkboxes[i].value);
 }
}

// 기타 체크박스가 선택된 경우, 입력된 텍스트 값을 가져와서 추가
var inputText = document.getElementById("prepareInput").value;
if (checkbox4.checked && inputText.trim() !== "") {
 selectedValues.push(inputText);
}

// 선택된 값을 문자열로 만들어 변수에 저장
var selectedValuesString = selectedValues.join(', ');

// 변수에 저장된 값을 사용하거나 출력
console.log(selectedValuesString);
prepare = selectedValuesString;
}


// 체크박스 상태가 변경될 때마다 updateSelectedValues 함수 호출
document.getElementById("checkbox1").addEventListener("change", updateSelectedValues);
document.getElementById("checkbox2").addEventListener("change", updateSelectedValues);
document.getElementById("checkbox3").addEventListener("change", updateSelectedValues);
document.getElementById("checkbox4").addEventListener("change", updateSelectedValues);


 var runInput = document.getElementById('RunotherInput');
 var agencyInput = document.getElementById('AgencyotherInput');
 var runotherRadio = document.getElementById('other');
 var agencyRadio = document.getElementById('agencyOther');

  // radio value 가져오기
  function runselect(event){
	  var selectedValue = event.target.value;
	  var otherselect = document.getElementById('other');
	  
	  run = selectedValue;
	  console.log(run);		// other
	  console.log(runInput.value);
	  if (selectedValue === 'Other') {
		runInput.removeAttribute('disabled');
		var inputValue = runInput.value;
		console.log(inputValue);
        otherselect.value = inputValue;
        console.log(otherselect.value);
        $("#RunotherInput").on("propertychange change keyup paste input", function(){
        	console.log("   "+otherselect.value);
        });
	} else {
		runInput.setAttribute('disabled', 'disabled');
		runInput.value = "";
	    }
	  otherselect.value = "Other";
  }
  //
  function agencyselect(event){
	  var selectedValue = event.target.value;
	  var otherselect = document.getElementById('agencyOther');
	  
	  agency = selectedValue;
	  
	  if (selectedValue === 'Other') {
		  agencyInput.removeAttribute('disabled');
		  var inputValue = AgencyotherInput.value;
		  console.log(inputValue);
		  otherselect.value = inputValue;
		  console.log(otherselect.value);
		  $("#AgencyotherInput").on("propertychange change keyup paste input", function(){
	        	console.log("   "+otherselect.value);
	        });
	  }else{
		  agencyInput.setAttribute('disabled', 'disabled');
		  agencyInput.value = "";
	  }
	  otherselect.value = "Other";
	  
  }
  
  
  
  function runchange(){
		let value = $('#RunotherInput').val();
		console.log(value);
		run = value;
		var title = document.getElementById("title");
		/* run.on("propertychange change paste input", function() {
			title.value = run;  
		}); */
	}
  
   function agencychange(){
		let value = $('#AgencyotherInput').val();
		console.log(value);
		agency = value;
	}
   
   
   
   
   
   
   
   
   
//  console.log("ㅇㅇㅇ"+prepare);
  //일정등록창 모달
  function insertModalOpen(arg){
	  
	console.log('<%=sessionId%>');
	console.log('<%=sessionNm%>');
    if('<%=sessionId%>' == null){
		alert();
		location.href='login.jsp';
	}
	
	g_arg = arg;
	
	
	//값이 있는경우 세팅
	if(g_arg.event != undefined){
		console.log(arg.event);
		console.log(arg.event.startStr.substring(0,10));
		var t = document.querySelector(".modal-title");
		var tv = t.innerHTML
		t.innerHTML = arg.event.startStr.substring(0,10) + " " + tv;
		console.log(t.innerHTML);
		/* 
		console.log(g_arg.startStr.substring(0,10)); */
		$('.insertModal .deleteBtn').css('display', 'inline');
		$('.insertModal .writer').css('display', 'inline');
		$('.insertModal #writer').val(g_arg.event.extendedProps.writer);
		$('.insertModal #title').val(g_arg.event.title);
		$('.insertModal #content').val(g_arg.event.extendedProps.content);
		$('.insertModal input[name="run"]').val([g_arg.event.extendedProps.run]);
		$('.insertModal input[name="agency"]').val([g_arg.event.extendedProps.agency]);
		$('.insertModal input[name="prepare"]').val([g_arg.event.extendedProps.prepare]);
		$('.insertModal #patientName').val(g_arg.event.extendedProps.patientName);
		$('.insertModal #patientRoom').val(g_arg.event.extendedProps.patientRoom);
		$('.insertModal #patientNumber').val(g_arg.event.extendedProps.patientNumber);
		$('.insertModal #start').val(stringFormat(g_arg.event.start.getHours())+':'+stringFormat(g_arg.event.start.getMinutes()));
		$('.insertModal #end').val(stringFormat(g_arg.event.end.getHours())+':'+stringFormat(g_arg.event.end.getMinutes()));
		$('.insertModal input[name="allDay"]').val([g_arg.event.allDay]);
		//사용자 계정이 대표 계정이면
		if('<%=sessionId%>' == ceo){
			//해당 이벤트가 대표가 등록한 일정이면
			if('<%=sessionNm%>' == g_arg.event.extendedProps.writer){
				//대표일정은 승인/반려 버튼 숨김
				$('.insertModal .approvalBtn').css('display', 'none');
				$('.insertModal .rejectBtn').css('display', 'none');
				$('.insertModal .deleteBtn').css('display', 'inline');
				$('.insertModal .insertBtn').css('display', 'inline');
			//해당 이벤트가 대표가 등록한 일정이 아니면
			}else{
				//승인된 이벤트면 승인버튼 숨김
				if(g_arg.event.extendedProps.allowyn == '1'){
					$('.insertModal .approvalBtn').css('display', 'none');	
				}else{
					$('.insertModal .approvalBtn').css('display', 'inline');
				}
				//대표는 모든 버튼 사용 가능
				$('.insertModal .rejectBtn').css('display', 'inline');
				$('.insertModal .deleteBtn').css('display', 'inline');
				$('.insertModal .insertBtn').css('display', 'inline');	
			}
		//일반 임직원 계정이면
		}else{
			//해당 이벤트가 로그인계정이 등록한 이벤트면
			if('<%=sessionNm%>' == g_arg.event.extendedProps.writer){
				$('.insertModal .deleteBtn').css('display', 'inline');
				$('.insertModal .insertBtn').css('display', 'none');
			//남의 이벤트면
			}else{
				$('.insertModal .deleteBtn').css('display', 'none');
				$('.insertModal .insertBtn').css('display', 'none');
			}		
			//대표 외엔 승인/반려 불가
			$('.insertModal .approvalBtn').css('display', 'none');
			$('.insertModal .rejectBtn').css('display', 'none');
		}
	//신규 이벤트
	}else{
		// 등록 창에 선택한 날짜 출력
//		console.log(g_arg);
//		console.log(g_arg.startStr.substring(0,10));
		var t = document.querySelector(".modal-title");
		var tv = t.innerHTML
		t.innerHTML = g_arg.startStr.substring(0,10) +" "+ tv;
//		console.log(t.innerHTML);
		var thisDate = g_arg.startStr.substring(0,10);
		console.log(thisDate);
		titletext = thisDate;
		var start_select = document.getElementById("start");
		var options = start_select.options;
		
		for (var i = 0; i < options.length; i++) {
		    var optionValue = options[i].value;
		    console.log(optionValue);
		    // JSTL로 출력한 날짜와 옵션의 값이 일치하는지 확인
		    if (optionValue === thisDate) {
		        console.log(optionValue); // 해당 날짜를 출력하거나 다른 작업을 수행할 수 있습니다.
		    }
		}
		//month 외 week, day는 시간 값까지 받아와서 값 바인딩 ex)09:00
		if(g_arg.startStr.length > 10){
			$('.insertModal #start').val(g_arg.startStr.substr(11, 5));
			$('.insertModal #end').val(g_arg.endStr.substr(11, 5));
		}
		//등록자 숨김(readonly)
		$('.insertModal .writer').css('display', 'none');
		//등록버튼 외 숨김
		$('.insertModal .insertBtn').css('display', 'inline');
		$('.insertModal .deleteBtn').css('display', 'none');
		$('.insertModal .approvalBtn').css('display', 'none');
		$('.insertModal .rejectBtn').css('display', 'none');

//		 	var calendarList = '${list}';
//		 	var savedStartTime, savedEndTime;
//		 	console.log(calendarList);
//		 	// 여기서 선택한 날짜에 해당하는 데이터를 찾아서 savedStartTime과 savedEndTime을 설정합니다.
//		 	// 예를 들어, 특정 날짜를 선택했다면 해당 날짜와 일치하는 데이터를 찾아 설정할 수 있습니다.
//		 	for (var i = 0; i < calendarList.length; i++) {
//		 		// 원하는 조건에 따라 날짜를 비교하고 startTime과 endTime을 설정합니다.
//		 		// 예를 들면, 선택한 날짜와 일치하는 데이터를 찾는 로직을 구현합니다.
//		 		if (!calendarList) {
//		 			savedStartTime = calendarList[i].starttime;
//		 			savedEndTime = calendarList[i].endtime;
//		 			break; // 원하는 조건에 해당하는 첫 번째 데이터만 사용합니다.
//		 		}
//		 	}

			// 여기에는 이전에 제공드린 JavaScript 코드를 넣어 시작 시간부터 종료 시간까지의 범위 내의 option을 disabled 상태로 만듭니다.
			// ...
			// DB에서 이미 저장된 starttime과 endtime을 가져옵니다.
			let savedStartTime = "";
			let savedEndTime = "";
		    $.ajax({
		    	url: '${pageContext.request.contextPath}/a/selectCalendar/'+thisDate,
		    	type: 'GET',
		    	dataType: 'json',
		    	data: {
		    		startStr : thisDate
		    	},
		    	success: function(res) {
		    		if (res.result === "Y") {
		    			var s = res.selectCalendar;
		    			
		    			s.forEach(function (c) {
		    				savedStartTime = c.starttime;
		    				savedEndTime = c.endtime;
		    				// AJAX 요청이 완료된 후에 변수를 사용하십시오.
		    				useSavedTimes();

		    			});
		    		}
		    	}
		    });
		 // savedStartTime 및 savedEndTime을 사용하는 함수
		    function useSavedTimes() {
		        console.log("savedStartTime:", savedStartTime);
		        console.log("savedEndTime:", savedEndTime);
		        // 이곳에서 다른 로직을 처리할 수 있습니다.
		     // 모든 option 요소를 선택합니다.
			    const startOptions = document.getElementById("start").querySelectorAll("option");
			    const endOptions = document.getElementById("end").querySelectorAll("option");

			    let disableRange = false;

			    // start select 박스의 option을 순회하면서 시작 시간부터 종료 시간까지의 option을 disabled로 설정합니다.
			    startOptions.forEach(function(option) {
			        if (option.value === savedStartTime) {
			            disableRange = true;
			        }
			        if (disableRange) {
			            option.disabled = true;
			        }
			        if (option.value === savedEndTime) {
			            disableRange = false;  // 종료 시간까지 포함하도록 false로 변경
			        }
			    });

			    // end select 박스의 option을 순회하면서 시작 시간부터 종료 시간까지의 option을 disabled로 설정합니다.
			    endOptions.forEach(function(option) {
			        if (option.value === savedStartTime) {
			            disableRange = true;
			        }
			        if (disableRange) {
			            option.disabled = true;
			        }
			        if (option.value === savedEndTime) {
			            disableRange = false;  // 시작 시간까지 포함하도록 false로 변경
			        }
			    });
		    }
		    

		    
	}
	//모달창 show
	$('.insertModal').modal({backdrop: 'static'});
	console.log("모달창 오픈");
	console.log(arg.event);
	$('.insertModal #title').focus();
  }
  //일정삭제
  function deleteSch(modal, arg){
	if(confirm('일정을 삭제하시겠습니까?')){
		data = [{
			"gubun": "delete",
			"id" : arg.event._def.publicId,
			"allowyn": "0",
			"writer" : arg.event._def.extendedProps.writer,
			"user" : "<%=sessionNm%>"
			}];
		//DB 삭제
		$.ajax({
		  url: "${pageContext.request.contextPath}/a/delete",
		  type: "POST",
		  data: JSON.stringify(data),
		  dataType: "JSON",
		  contentType: "application/json",
		  traditional: true,
		  success : function(data, status, xhr){
			  //alert(xhr.status);
			  arg.event.remove();
			  initModal(modal, arg);
		  },
		  error : function(xhr, status, error){
			    //alert(xhr.responseText);
			    console.log(xhr.responseText);
			  //alert('일정 삭제 실패<br>새로고침 후 재시도 해주세요');
			  location.reload();
		  }
		});
		//
	}
  }
  //일정반려
  function rejectSch(modal, arg){
	if(confirm('일정을 반려하시겠습니까?\n(일정 다시 보지 않음)')){
		var data = {"gubun": "reject", "id" : arg.event.id, "allowyn": "2"};
		//DB 삭제
		$.ajax({
		  url: "./rejectSch.jsp",
		  type: "POST",
		  data: JSON.stringify(data),
		  dataType: "JSON",
		  traditional: true,
		  success : function(data, status, xhr){
			  //alert(xhr.status);
			  arg.event.remove();
			  initModal(modal, arg);
		  },
		  error : function(xhr, status, error){
			    //alert(xhr.responseText);
			  alert('일정 반려 실패<br>새로고침 후 재시도 해주세요');
		  }
		});
		//
	}
  }
//일정승인
  function approvalSch(modal, arg){
	
	if($('.insertModal input[name="allDay"]:checked').val()!='true'){
	  if($('.insertModal #end').val() <= $('.insertModal #start').val()){
		  alert('종료시간을 시작시간보다 크게 선택해주세요');
		  $('.insertModal #end').focus();
		  return;
	  }
	}
	
	if(confirm('일정을 승인하시겠습니까?')){
		if($('.'+modal+' #title').val() == ''){
			alert('제목을 입력해주세요');
			return;
		}
		if($('.'+modal+' #title').val().length > 100){
			alert('제목은 100자를 넘을 수 없습니다 현재 ' + $('.'+modal+' #title').val().length + '자');
			return;
		}	
		if($('.'+modal+' #content').val() == ''){
			alert('내용을 입력해주세요');
			return;
		}
		//이벤트가 있어야 승인 가능, 이벤트 수정 후 승인할 수도 있으므로 수정 로직을 거친다
		//수정
		if(arg.event != undefined){
			var data;
			//시작일자
			var m_start = new Date(arg.event.startStr.substr(0, 4), arg.event.startStr.substr(5, 2)-1, arg.event.startStr.substr(8, 2));
			//종료일자 ex)2021.09.30
			var m_end = new Date(arg.event.endStr.substr(0, 4), arg.event.endStr.substr(5, 2)-1, arg.event.endStr.substr(8, 2));
			var m_month = m_end.getMonth()+1; //문자열 생성에 사용
			var be_allday = arg.event.allDay; //기존 이벤트의 종일여부
			var m_date; //종료일자 일
			var m_end_dt; //종료일자 문자열
			
			//구간이벤트면
			if($('.insertModal input[name="allDay"]:checked').val()!='true'){
				if($('.'+modal+' #start').val() == null){
					alert('시작시간을 입력해주세요');
					return;
				}
				if($('.'+modal+' #end').val() == null){
					alert('종료시간을 입력해주세요');
					return;
				}
				//기존이벤트가 종일이벤트면
				if(be_allday){
					//기존 종일이었으면 [+1일 00시 00분]이기 떄문에 구간이벤트로 변경시 -1 해줌 
					m_end.setDate(m_end.getDate()-1); //ex)2021.10.01 -> 2021.09.30
				}
				
				//종료일자가 말일일 경우를 위한 로직
				//기존종일이었으면 arg.event.endStr 때문에 m_end+1일이 됨 2021.10.01 기존구간이었으면 m_end와 동일 2021.09.30
				var m_end_com = new Date(arg.event.endStr.substr(0, 4), arg.event.endStr.substr(5, 2)-1, arg.event.endStr.substr(8, 2));
				//기존종일이었으면 2021.10.01 기존구간이었으면 ex)2021.09.01
				var m_first = new Date(m_end.getFullYear(),  m_end.getMonth()+1, 1);
				//ex) 기존종일이벤트면 2021.10.01 == 2021.10.01로 true, 기존구간이벤트면 2021.09.01 == 2021.10.01로 false
				if(m_end_com.getFullYear()+''+stringFormat(m_end_com.getMonth())+''+stringFormat(m_end_com.getDate())
						== m_first.getFullYear()+''+stringFormat(m_first.getMonth())+''+stringFormat(m_first.getDate())){
					//기존종일이벤트면 getMonth()+1인 9월
					m_month = m_end.getMonth()+1;
				}
				
				m_date = m_end.getDate(); //종료일자의 일달력
				//종료일자 문자열 생성 ex)2021.09.30 위 말일 로직이 없으면 2021.10.30으로 잡히는 걸 방지
				m_end_dt = m_end.getFullYear() + '-' + stringFormat(m_month) + '-' + stringFormat(m_date);
				//start, end 포맷은 2021-09-30T09:00, 2021-09-30T09:30
				
				data = { 
						id : arg.event.id,
						title : $('.'+modal+' #title').val(),
				  		content : $('.'+modal+' #content').val(),
				  		run : run,
				  		agency : agency,
				  		prepare : prepare,
				  		patientName : $('.'+modal+' #patientName').val(),
				  		patientRoom : $('.'+modal+' #patientRoom').val(),
				  		patientNumber : $('.'+modal+' #patientNumber').val(),
				  		start : arg.event.startStr.substr(0, 10)+'T'+$('.'+modal+' #start').val(),
				  		end : m_end_dt+'T'+$('.'+modal+' #end').val(),
				  		allday : $('.'+modal+' input[name="allDay"]:checked').val(),				  		
				  		allowyn : '1',
				  		comments : '',
				  		regid : '<%=sessionId%>'
				  	}
				//종일이벤트면
			}else{
				//기존에 종일이 아니었는데 종일로 바뀌니 일자 +1 ex)2021.09.30T09:30 -> 2021.10.01T00:00
				if(!be_allday){
					m_end.setDate(m_end.getDate()+1); //2021.10.01
				}
				//기존종일이면 2021.10.01 기존구간이면 2021.09.30
				var m_end_com = new Date(arg.event.endStr.substr(0, 4), arg.event.endStr.substr(5, 2)-1, arg.event.endStr.substr(8, 2));
				//종일 이벤트니 비교용 변수에 일자+1 (기존종일이면 2021.10.02 기존구간이면 2021.10.01)
				m_end_com.setDate(m_end_com.getDate()+1);
				//2021.10.01
				var m_first = new Date(m_end.getFullYear(),  m_end.getMonth(), 1);
				//ex) 기존종일이벤트면 2021.10.02 == 2021.10.01로 false, 기존구간이벤트면 2021.10.01 == 2021.10.01로 true
				if(m_end_com.getFullYear()+''+stringFormat(m_end_com.getMonth())+''+stringFormat(m_end_com.getDate())
						== m_first.getFullYear()+''+stringFormat(m_first.getMonth())+''+stringFormat(m_first.getDate())){
					//기존 구간을 종일로 바꾸니 월+1
					m_month = m_end.getMonth()+1;
				}
				
				m_date = m_end.getDate();
				m_end_dt = m_end.getFullYear() + '-' + stringFormat(m_month) + '-' + stringFormat(m_date);
				
				data = {
						id : arg.event.id,
						title : $('.'+modal+' #title').val(),
				  		content : $('.'+modal+' #content').val(),
				  		run : run,
				  		agency : agency,
				  		prepare : prepare,
				  		patientName : $('.'+modal+' #patientName').val(),
				  		patientRoom : $('.'+modal+' #patientRoom').val(),
				  		patientNumber : $('.'+modal+' #patientNumber').val(),
				  		start : arg.event.startStr.substr(0, 10)+'T'+$('.'+modal+' #start').val(),
				  		end : m_end_dt+'T'+$('.'+modal+' #end').val(),
				  		allday : $('.'+modal+' input[name="allDay"]:checked').val(),				  		
				  		allowyn : '1',
				  		comments : '',
				  		regid : '<%=sessionId%>'
				  	}
			}
			if(data.startdt >= data.enddt){
				alert('종료시간을 시작시간보다 크게 선택해주세요');
				return;
			}
			//DB 이벤트 수정(승인)
			
			$.ajax({
			  url: "./approvalSch.jsp",
			  type: "POST",
			  data: JSON.stringify(data),
			  dataType: "JSON",
			  traditional: true,
			  success : function(data, status, xhr){
				//alert(xhr.status);
				  //종일이벤트면
				  if($('.insertModal input[name="allDay"]:checked').val()=='true'){
						arg.event.setProp('title', $('.'+modal+' #title').val());
						arg.event.setAllDay(true);
						arg.event.setStart(arg.event.startStr+'T00:00');
						arg.event.setEnd(m_end_dt+'T00:00');	
						arg.event.setExtendedProp('allowyn', '1');
						//구간이벤트면
				  }else{
						arg.event.setProp('title', $('.'+modal+' #title').val());
						arg.event.setAllDay(false);
						arg.event.setStart(new Date(arg.event.startStr.substr(0, 10)+'T'+$('.'+modal+' #start').val()));
						arg.event.setEnd(new Date(m_end_dt+'T'+$('.'+modal+' #end').val()));
						arg.event.setExtendedProp('allowyn', '1');
				  }
				  arg.event.setProp('backgroundColor', approvalColor);
				  arg.event.setProp('borderColor', approvalColor);
				  arg.event.setProp('textColor', textWhite);
				//모달초기화
				  initModal(modal, arg);
			  },
			  error : function(xhr, status, error){
				    //alert(xhr.responseText);
				  alert('일정 승인 실패<br>새로고침 후 재시도 해주세요');
			  }
			});
			//
		//신규	
		}
	}
  }
  //일정등록
  function insertSch(modal, arg){
	
	if($('.'+modal+' #title').val() == ''){
		alert('제목을 입력해주세요');
		return;
	}
	if($('.'+modal+' #title').val().length > 100){
		alert('제목은 100자를 넘을 수 없습니다 현재 ' + $('.'+modal+' #title').val().length + '자');
		return;
	}
	if($('.'+modal+' #content').val() == ''){
		alert('내용을 입력해주세요');
		return;
	}
	if($('.'+modal+' #start').val() == ''){
		alert('출발시간을 선택해주세요');
		return;
	}
	if($('.'+modal+' #end').val() == ''){
		alert('출발시간을 선택해주세요');
		return;
	}
	//수정 (승인 함수의 수정로직과 동일)
	if(arg.event != undefined){
		console.log("수정");
		if($('.insertModal input[name="allDay"]:checked').val()!='true'){
			  if(arg.event.startStr.substring(0, 10) == arg.event.endStr.substring(0, 10)){
				  if($('.insertModal #end').val() <= $('.insertModal #start').val()){
					  alert('종료시간을 시작시간보다 크게 선택해주세요');
					  $('.insertModal #end').focus();
					  return;
				  }
		  		}
			}
		var data;
		var m_start = new Date(arg.event.startStr.substr(0, 4), arg.event.startStr.substr(5, 2)-1, arg.event.startStr.substr(8, 2));
		var m_end = new Date(arg.event.endStr.substr(0, 4), arg.event.endStr.substr(5, 2)-1, arg.event.endStr.substr(8, 2));
		var m_month = m_end.getMonth()+1;
		var be_allday = arg.event.allDay;
		var m_date;
		var m_end_dt;
		if($('.insertModal input[name="allDay"]:checked').val()!='true'){
			if($('.'+modal+' #start').val() == null || $('.'+modal+' #start').val() == ''){
				alert('출발시간을 입력해주세요');
				return;
			}
			if($('.'+modal+' #end').val() == null || $('.'+modal+' #end').val() == ''){
				alert('종료시간을 입력해주세요');
				return;
			}
			if(be_allday){
				m_end.setDate(m_end.getDate()-1);
			}
			
			var m_end_com = new Date(arg.event.endStr.substr(0, 4), arg.event.endStr.substr(5, 2)-1, arg.event.endStr.substr(8, 2));
			var m_first = new Date(m_end.getFullYear(),  m_end.getMonth()+1, 1);
			if(m_end_com.getFullYear()+''+stringFormat(m_end_com.getMonth())+''+stringFormat(m_end_com.getDate())
					== m_first.getFullYear()+''+stringFormat(m_first.getMonth())+''+stringFormat(m_first.getDate())){
				m_month = m_end.getMonth()+1;
			}
			
			m_date = m_end.getDate();
			m_end_dt = m_end.getFullYear() + '-' + stringFormat(m_month) + '-' + stringFormat(m_date);
			
			data = { 
					id : arg.event.id,
					title : $('.'+modal+' #title').val(),
			  		content : $('.'+modal+' #content').val(),
			  		run : run,
			  		agency : agency,
			  		prepare : prepare,
			  		patientName : $('.'+modal+' #patientName').val(),
			  		patientRoom : $('.'+modal+' #patientRoom').val(),
			  		patientNumber : $('.'+modal+' #patientNumber').val(),
			  		start : arg.event.startStr.substr(0, 10)+'T'+$('.'+modal+' #start').val(),
			  		end : m_end_dt+'T'+$('.'+modal+' #end').val(),
			  		allday : $('.'+modal+' input[name="allDay"]:checked').val(),				  		
			  		allowyn : '1',
			  		comments : '',
			  		regid : '<%=sessionId%>'
			  	}
		}else{
			if(!be_allday){
				m_end.setDate(m_end.getDate()+1);
			}
			
			var m_end_com = new Date(arg.event.endStr.substr(0, 4), arg.event.endStr.substr(5, 2)-1, arg.event.endStr.substr(8, 2));
			m_end_com.setDate(m_end_com.getDate()+1);
			var m_first = new Date(m_end.getFullYear(),  m_end.getMonth(), 1);
			if(m_end_com.getFullYear()+''+stringFormat(m_end_com.getMonth())+''+stringFormat(m_end_com.getDate())
					== m_first.getFullYear()+''+stringFormat(m_first.getMonth())+''+stringFormat(m_first.getDate())){
				m_month = m_end.getMonth()+1;
			}
			
			m_date = m_end.getDate();
			m_end_dt = m_end.getFullYear() + '-' + stringFormat(m_month) + '-' + stringFormat(m_date);
			
			
			data = {
					title : $('.'+modal+' #title').val(),
			  		content : $('.'+modal+' #content').val(),
			  		run : run,
			  		agency : agency,
			  		prepare : prepare,
			  		patientName : $('.'+modal+' #patientName').val(),
			  		patientRoom : $('.'+modal+' #patientRoom').val(),
			  		patientNumber : $('.'+modal+' #patientNumber').val(),
			  		start : arg.event.startStr.substr(0, 10)+'T00:00',
			  		end : m_end_dt+'T00:00',
			  		allday : $('.'+modal+' input[name="allDay"]:checked').val(),
			  		writer: '<%=sessionNm%>'
			  	}
		}
		if(data.startdt >= data.enddt){
			alert('종료시간을 시작시간보다 크게 선택해주세요');
			return;
		}
		//DB 수정
		$.ajax({
		  url: "./updateSch.jsp",
		  type: "POST",
		  data: JSON.stringify(data),
		  dataType: "JSON",
		  traditional: true,
		  success : function(data, status, xhr){
			  if($('.insertModal input[name="allDay"]:checked').val()=='true'){
					arg.event.setProp('title', $('.'+modal+' #title').val());
					arg.event.setAllDay(true);
					arg.event.setStart(arg.event.startStr+'T00:00');
					arg.event.setEnd(m_end_dt+'T00:00');	
					arg.event.setExtendedProp('allowyn', '0');
			  }else{
					arg.event.setProp('title', $('.'+modal+' #title').val());
					arg.event.setAllDay(false);
					arg.event.setStart(new Date(arg.event.startStr.substr(0, 10)+'T'+$('.'+modal+' #start').val()));
					arg.event.setEnd(new Date(m_end_dt+'T'+$('.'+modal+' #end').val()));
					arg.event.setExtendedProp('allowyn', '0');
			  }
			  if(arg.event.extendedProps.regid == ceo){
				  arg.event.setProp('backgroundColor', '#ffc107');
				  arg.event.setProp('borderColor', '#ffc107');
				  arg.event.setProp('textColor', textBlack);  
			  }else{
				  arg.event.setProp('backgroundColor', '#343a40');
				  arg.event.setProp('borderColor', '#343a40');
				  arg.event.setProp('textColor', textWhite);  
			  }
			  initModal(modal, arg);
		  },
		  error : function(xhr, status, error){
			    //alert(xhr.responseText);
			  alert('일정 수정 실패<br>새로고침 후 재시도 해주세요');
		  }
		});
		//
		//
		//
		//
	//신규	
	}else{
		if($('.insertModal input[name="allDay"]:checked').val()!='true'){
			  if(arg.startStr.substring(0, 10) == arg.endStr.substring(0, 10)){
				  if($('.insertModal #end').val() <= $('.insertModal #start').val()){
					  alert('종료시간을 시작시간보다 크게 선택해주세요');
					  $('.insertModal #end').focus();
					  return;
				  }
		  		}
			}
		var data;
		//구간이벤트면
		if($('.insertModal input[name="allDay"]:checked').val()!='true'){
			var m_start = new Date(arg.startStr.substr(0, 4), arg.startStr.substr(5, 2)-1, arg.startStr.substr(8, 2));
			var m_end = new Date(arg.endStr.substr(0, 4), arg.endStr.substr(5, 2)-1, arg.endStr.substr(8, 2));
			var m_month = m_end.getMonth()+1;
			//week나 day에서 추가할때(시간 존재)
			if(arg.endStr.length > 10){
				m_end.setDate(m_end.getDate());
				//month에선 2021.09.30 클릭 시 endstr이 2021.10.01로 잡히기 떄문에 일-1
			}else{
				m_end.setDate(m_end.getDate()-1);	
			}
			
			//말일에 대한 로직
			var m_end_com = new Date(arg.endStr.substr(0, 4), arg.endStr.substr(5, 2)-1, arg.endStr.substr(8, 2));
			var m_first = new Date(m_end.getFullYear(),  m_end.getMonth()+1, 1);
			if(m_end_com.getFullYear()+''+stringFormat(m_end_com.getMonth())+''+stringFormat(m_end_com.getDate())
					== m_first.getFullYear()+''+stringFormat(m_first.getMonth())+''+stringFormat(m_first.getDate())){
				m_month = m_end.getMonth()+1;
			}
							
			var m_date = m_end.getDate();
			arg.endStr = m_end.getFullYear() + '-' + stringFormat(m_month) + '-' + stringFormat(m_date);
			
			if(arg.startStr.length > 10){
				//일자만 추출
				arg.startStr = arg.startStr.substr(0, 10);
			}
			 
			
			data = { 
			  		title : $('.'+modal+' #title').val(),
			  		content : $('.'+modal+' #content').val(),
			  		run : run,
			  		agency : agency,
			  		prepare : prepare,
			  		patientName : $('.'+modal+' #patientName').val(),
			  		patientRoom : $('.'+modal+' #patientRoom').val(),
			  		patientNumber : $('.'+modal+' #patientNumber').val(),
			  		start : arg.startStr+'T'+$('.'+modal+' #start').val(),
			  		end : arg.endStr+'T'+$('.'+modal+' #end').val(),
			  		allday : $('.'+modal+' input[name="allDay"]:checked').val(),
			  		starttime : $('.'+modal+' #start').val(),
			  		endtime : $('.'+modal+' #end').val(),
			  		startdate: arg.startStr,
			  		enddate : arg.endStr,
			  		writer: '<%=sessionNm%>'
			  	}
			//종일이벤트면
		}else{
			if(arg.startStr.length > 10){
				//일자만 추출
				arg.startStr = arg.startStr.substr(0, 10);
			}
			if(arg.endStr.length > 10){
				var m_end = new Date(arg.endStr.substr(0, 4), arg.endStr.substr(5, 2)-1, arg.endStr.substr(8, 2));
				//종일이기에 일+1 (시간은 어차피 00:00)
				m_end.setDate(m_end.getDate()+1);
				arg.endStr = m_end.getFullYear()+'-'+ stringFormat(m_end.getMonth()+1)+'-'+ stringFormat(m_end.getDate());
			}
			
			 
			data = {
					title : $('.'+modal+' #title').val(),
			  		content : $('.'+modal+' #content').val(),
			  		run : run,
			  		agency : agency,
			  		prepare : prepare,
			  		patientName : $('.'+modal+' #patientName').val(),
			  		patientRoom : $('.'+modal+' #patientRoom').val(),
			  		patientNumber : $('.'+modal+' #patientNumber').val(),
			  		start : arg.startStr+'T00:00',
			  		end : arg.endStr+'T00:00',
					starttime : $('.'+modal+' #start').val(),
					endtimg : $('.'+modal+' #end').val(),
			  		allday : $('.'+modal+' input[name="allDay"]:checked').val(),				  		
			  		writer: '<%=sessionNm%>'
			  	}
		}
		
		if(data.startdt >= data.enddt){
			alert('종료시간을 시작시간보다 크게 선택해주세요');
			return;
		}
		// ajax로 보내는 데이터 출력
		console.log("Sending JSON data:", JSON.stringify(data));
		//DB 삽입	
		$.ajax({
		  url: "${pageContext.request.contextPath}/a/input",
		  contentType : "application/json",
		  type: "POST",
		  data: JSON.stringify(data),
		  dataType: "JSON",
		  traditional: true,
		  headers: {
			    "Content-Type": "application/json",
			    "Accept": "application/json" // Make sure to add this line
			  },
			  success : function(data, status, xhr){
				  var id;
				  $.each(data, function(key, value){
					  id = value;
					  console.log(id);
				  });
				  if($('.insertModal input[name="allDay"]:checked').val()=='true'){
					  calendar.addEvent({
					    id: id,
					    title : $('.'+modal+' #title').val(),
				  		content : $('.'+modal+' #content').val(),
				  		run : run,
				  		agency : agency,
				  		prepare : $('.'+modal+' input[name="prepare"]:checked').val(),
				  		patientName : $('.'+modal+' #patientName').val(),
				  		patientRoom : $('.'+modal+' #patientRoom').val(),
				  		patientNumber : $('.'+modal+' #patientNumber').val(),
						start: arg.startStr+'T'+$('.'+modal+' #start').val(),
						end: arg.endStr+'T'+$('.'+modal+' #end').val(),
						backgroundColor: ceoColor,
						borderColor: ceoColor,
						textColor: textBlack,
						writer: '<%=sessionNm%>',
						starttime : $('.'+modal+' #start').val(),
						endtimg : $('.'+modal+' #end').val(),
						startdate : arg.startStr,
						enddate : arg.endStr,
						allDay: true
					  });
				  }else{
					  calendar.addEvent({
						id: id,
						title : $('.'+modal+' #title').val(),
				  		content : $('.'+modal+' #content').val(),
				  		run : run,
				  		agency : agency,
				  		prepare : prepare,
				  		patientName : $('.'+modal+' #patientName').val(),
				  		patientRoom : $('.'+modal+' #patientRoom').val(),
				  		patientNumber : $('.'+modal+' #patientNumber').val(),
						start: arg.startStr+'T'+$('.'+modal+' #start').val(),
						end: arg.endStr+'T'+$('.'+modal+' #end').val(),
						backgroundColor: ceoColor,
						borderColor: ceoColor,
						writer: '<%=sessionNm%>',
						starttime : $('.'+modal+' #start').val(),
						endtime : $('.'+modal+' #end').val(),
						startdate : arg.startStr,
						enddate : arg.endStr,
						textColor: textBlack
					});
				  }
				  calendar.unselect();
				  initModal(modal, arg);
			//	  location.reload();
			  },
		  error : function(xhr, status, error){
			//    alert(xhr.responseText);
			    console.log(xhr.responseText);
				  initModal(modal, arg);
			//  alert('일정 등록 실패<br>새로고침 후 재시도 해주세요');
			    location.reload();
//			    console.log(prepare);
		  }
		});
		//
	}
  }

<%-- 
$(function() {
	//ceo만 1분에 한번 업데이트
	if('<%=sessionId%>' == ceo){ 
		//주기적으로 실행  1000 = 1sec
		setInterval(function()
		 {
		//DB	
		  $.ajax({
			  url: "./selectSch.jsp",
			  type: "POST",
			  data: {'year' : '2021'},
			  dataType: "JSON",
			  traditional: true,
			  async: false,
			  success : function(data, status, xhr){
				  //alert(xhr.status);
				  $.each(data, function(key, value){
					    sch = value;
					    
				  });
			  },
			  error : function(xhr, status, error){
				    //alert(xhr.responseText);
				  alert('데이터 로딩 실패<br>새로고침 해주세요');
			  }
			});
			//
		  var calendarEl = document.getElementById('calendar');
		    
		    calendar = new FullCalendar.Calendar(calendarEl, {
			
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay'
		      },
		      locale: 'ko',
			  slotMinTime: '09:00',
		      slotMaxTime: '19:00',
		      initialDate: todayStr,
		      navLinks: true, // can click day/week names to navigate views
		      selectable: true,
		      selectMirror: true,
		      select: function(arg) {
				insertModalOpen(arg);
		      },
		      eventClick: function(arg) {
				insertModalOpen(arg);
		      },
			  eventChange: function(arg){
				//allDay true로 바꾸면 end가 없어서 만듬
				if(arg.event.end == null){
					var end = new Date();
					end.setDate(arg.event.start.getDate()+1);
					arg.event.setEnd(end);	
				}
			  },
			  eventDrop: function(arg){
				  insertModalOpen(arg);
			  },
			  eventResize: function(arg){
				  insertModalOpen(arg);
			  },
		      editable: true,
		      dayMaxEvents: true, // allow "more" link when too many events
		      events: sch
		    });
		
		    calendar.render();
		 }, 60000 ); //1min
	}
});
 --%>
</script>
<script>

// document.addEventListener("DOMContentLoaded", function() {
// // 	var calendarList = '${list}';
// // 	var savedStartTime, savedEndTime;
// // 	console.log(calendarList);
// // 	// 여기서 선택한 날짜에 해당하는 데이터를 찾아서 savedStartTime과 savedEndTime을 설정합니다.
// // 	// 예를 들어, 특정 날짜를 선택했다면 해당 날짜와 일치하는 데이터를 찾아 설정할 수 있습니다.
// // 	for (var i = 0; i < calendarList.length; i++) {
// // 		// 원하는 조건에 따라 날짜를 비교하고 startTime과 endTime을 설정합니다.
// // 		// 예를 들면, 선택한 날짜와 일치하는 데이터를 찾는 로직을 구현합니다.
// // 		if (!calendarList) {
// // 			savedStartTime = calendarList[i].starttime;
// // 			savedEndTime = calendarList[i].endtime;
// // 			break; // 원하는 조건에 해당하는 첫 번째 데이터만 사용합니다.
// // 		}
// // 	}

// 	// 여기에는 이전에 제공드린 JavaScript 코드를 넣어 시작 시간부터 종료 시간까지의 범위 내의 option을 disabled 상태로 만듭니다.
// 	// ...
    
    
//     // DB에서 이미 저장된 starttime과 endtime을 가져옵니다.
// 	const savedStartTime = "10:30";
// 	const savedEndTime = "13:00";

//     // 모든 option 요소를 선택합니다.
//     const startOptions = document.getElementById("start").querySelectorAll("option");
//     const endOptions = document.getElementById("end").querySelectorAll("option");

//     let disableRange = false;

//     // start select 박스의 option을 순회하면서 시작 시간부터 종료 시간까지의 option을 disabled로 설정합니다.
//     startOptions.forEach(function(option) {
//         if (option.value === savedStartTime) {
//             disableRange = true;
//         }
//         if (disableRange) {
//             option.disabled = true;
//         }
//         if (option.value === savedEndTime) {
//             disableRange = false;  // 종료 시간까지 포함하도록 false로 변경
//         }
//     });

//     // end select 박스의 option을 순회하면서 시작 시간부터 종료 시간까지의 option을 disabled로 설정합니다.
//     endOptions.forEach(function(option) {
//         if (option.value === savedStartTime) {
//             disableRange = true;
//         }
//         if (disableRange) {
//             option.disabled = true;
//         }
//         if (option.value === savedEndTime) {
//             disableRange = false;  // 시작 시간까지 포함하도록 false로 변경
//         }
//     });
// });

</script>
</html>