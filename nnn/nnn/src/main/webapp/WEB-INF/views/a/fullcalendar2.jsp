<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>앰뷸런스 예약2</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/fullcalendar-6.1.10/dist/index.global.min.js"></script>

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
		  </div>
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
 
        var calendar = null;
        var initialLocaleCode = 'ko';
        var localeSelectorEl = document.getElementById('locale-selector');
 
            $(document).ready(function (){
 
                    var calendarEl = document.getElementById('calendar');
                    calendar = new FullCalendar.Calendar(calendarEl, {
                        initialDate: '2022-02-07',
                        headerToolbar: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                        },
                        navLinks: true,
                        editable: true,
                        selectable: true,
                        droppable: true, // this allows things to be dropped onto the calendar
 
                        // eventAdd: function () { // 이벤트가 추가되면 발생하는 이벤트
                        //     // console.log()
                        // },
 
                        /**
                         * 드래그로 이벤트 수정하기
                         */
                        eventDrop: function (info){
                            console.log(info);
                            if(confirm("'"+ info.event.title +"' 매니저의 일정을 수정하시겠습니까 ?")){
                            }
                            var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                            var obj = new Object();
 
                            obj.title = info.event._def.title;
                            obj.start = info.event._instance.range.start;
                            obj.end = info.event._instance.range.end;
                            events.push(obj);
 
                            console.log(events);
                            $(function deleteData() {
                                $.ajax({
                                    url: "/full-calendar/calendar-admin-update",
                                    method: "PATCH",
                                    dataType: "json",
                                    data: JSON.stringify(events),
                                    contentType: 'application/json',
                                })
                            })
                        },
 
                        /**
                         * 드래그로 이벤트 추가하기
                         */
                        select: function (arg) { // 캘린더에서 이벤트를 생성할 수 있다.
 
                            var title = prompt('일정을 입력해주세요.');
                            if (title) {
                                calendar.addEvent({
                                    title: title,
                                    start: arg.start,
                                    end: arg.end,
                                    allDay: arg.allDay,
                                })
                            }
 
                            var allEvent = calendar.getEvents(); // .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)
 
                            var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                            for (var i = 0; i < allEvent.length; i++) {
                                var obj = new Object();     // Json 을 담기 위해 Object 선언
                                // alert(allEvent[i]._def.title); // 이벤트 명칭 알람
                                obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
                                obj.start = allEvent[i]._instance.range.start; // 시작
                                obj.end = allEvent[i]._instance.range.end; // 끝
 
                                events.push(obj);
                            }
                            var jsondata = JSON.stringify(events);
                            console.log(jsondata);
                            // saveData(jsondata);
 
                            $(function saveData(jsondata) {
                                $.ajax({
                                    url: "/full-calendar/calendar-admin-update",
                                    method: "POST",
                                    dataType: "json",
                                    data: JSON.stringify(events),
                                    contentType: 'application/json',
                                })
                                    .done(function (result) {
                                        // alert(result);
                                    })
                                    .fail(function (request, status, error) {
                                         // alert("에러 발생" + error);
                                    });
                                calendar.unselect()
                            });
                        },
 
                        /**
                         * 이벤트 선택해서 삭제하기
                         */
                        eventClick: function (info){
                            if(confirm("'"+ info.event.title +"' 매니저의 일정을 삭제하시겠습니까 ?")){
                                // 확인 클릭 시
                                info.event.remove();
                            }
 
                            console.log(info.event);
                            var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                            var obj = new Object();
                                obj.title = info.event._def.title;
                                obj.start = info.event._instance.range.start;
                                events.push(obj);
 
                            console.log(events);
                            $(function deleteData(){
                                $.ajax({
                                    url: "/full-calendar/calendar-admin-update",
                                    method: "DELETE",
                                    dataType: "json",
                                    data: JSON.stringify(events),
                                    contentType: 'application/json',
                                })
                            })
                        },
                        // eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
                        //
                        // },
                        
                    });
                    calendar.render();
        });
 
 
 
 
    </script>


</html>