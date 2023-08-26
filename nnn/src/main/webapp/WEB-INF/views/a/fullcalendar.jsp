<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nnn.app.vo.CalendarVo" %>
<%List<CalendarVo> calendarList = (List<CalendarVo>) request.getAttribute("calendarList");%>
<!DOCTYPE html>
<html>
<head>
    <title>엠블런스</title>

	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!-- fullcalendar css -->

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Admincss.css">


<%-- 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/fullcalendar.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/fullcalendar.print.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/fullcalendar.js"></script>
 --%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>

	
	.container{
		padding-top: 40px;
//		background-color: #DDDDDD;
		/* height: 843px; */
		height: calc(100vh - 97px);
	}
	#wrap {
		width: 1100px;
		margin: 0 auto;
		}

	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		text-align: left;
		}

	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
		}

	.external-event { /* try to mimick the look of a real event */
		margin: 10px 0;
		padding: 2px 4px;
		background: #3366CC;
		color: #fff;
		font-size: .85em;
		cursor: pointer;
		}

	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
		}

	#external-events p input {
		margin: 0;
		vertical-align: middle;
		}

	#calendar {
/* 		float: right; */
        margin: 0 auto;
		width: 900px;
		background-color: #FFFFFF;
		  border-radius: 6px;
        box-shadow: 0 1px 2px #C3C3C3;
		}
.fc-day-sat a { color:#0000FF; }     /* 토요일 */
.fc-day-sun a { color:#FF0000; }    /* 일요일 */
</style>
</head>
<body class="normal">
<div class="page">
		<header class="flex flex-around">
			<h1>HWT</h1>
			<nav class="flex" style="">
				<ul class="flex flex-between">
					<li class="flex"><a href="#">회원관리</a></li>
					<li class="flex"><a href="#">플랫폼관리</a></li>
					<li class="flex"><a href="#">엠블런스관리</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<nav class="left-nav">
		<ul class="main-menu main1">
			<li><a href="#" onclick="menucontrol1()">회원관리</a>
				<ul class="sub-menu" id="menu1">	
					<li><a href="${pageContext.request.contextPath}/m/Admin.do">회원가입승인</a></li>
					<li><a href="#">포인트</a></li>
					<li><a href="${pageContext.request.contextPath}/m/HelpList.do">식사수발</a></li>
				</ul>
			</li>
		</ul>
		<ul class="main-menu main2">
			<li><a href="#" onclick="menucontrol2()">플랫폼관리</a>
				<ul class="sub-menu" id="menu2">
					<li><a href="#">공지사항관리</a></li>
				</ul>
			</li>
		</ul>
		<ul class="main-menu main3">
			<li><a href="#" onclick="menucontrol3()">엠블런스관리</a>
				<ul class="sub-menu open" id="menu3">
					<li><a href="#">예약관리</a></li>
					<li><a href="${pageContext.request.contextPath}/a/Calendar.do">캘린더관리</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	<section >
		<div class="container">
			<div id='calendar'></div>
		</div>
	</section>
<!-- insertModal -->
  <div class="modal fade insertModal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">일정 등록</h4>
          <button type="button" class="close" onclick="initModal('insertModal', g_arg)">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="form-group empl_nm">
			<label for="empl_nm">보고자:</label>
			<input type="text" class="form-control" placeholder="" id="empl_nm" readonly="readonly">
		  </div>
		  <br>
          <div class="form-group">
			<label for="title">일정내용:</label>
			<input type="text" class="form-control" placeholder="" id="title">
		  </div>
		  <div class="form-group">
			<label for="start">시작시간:</label>
			<select class="form-control" id="start" onchange="startChange()">
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
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
		  <button type="button" class="btn btn-success approvalBtn" onclick="approvalSch('insertModal',g_arg)">승인</button>
		  <button type="button" class="btn btn-danger rejectBtn" onclick="rejectSch('insertModal', g_arg)">반려</button>
		  
		  <button type="button" class="btn btn-dark  float-right deleteBtn" onclick="deleteSch('insertModal', g_arg)">삭제</button>
		  <button type="button" class="btn btn-warning float-right insertBtn" onclick="insertSch('insertModal', g_arg)">등록</button>
        </div>
        
      </div>
    </div>
  </div>




<script>
	let user = "${name}"
	if(user != null){
	//	alert(user);
	}
	
	  document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: 'dayGridMonth',// 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		//	initialDate: '2023-08-08', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			locale : 'ko',	// 한국어 설정
			navLinks: true, // can click day/week names to navigate views
			selectable : true, // 달력 일자 드래그 설정가능
			selectMirror: true,
			nowIndicator: true, // 현재 시간 마크
			headerToolbar: {
				start : 'prev next today',
				center : 'title',
				end : 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			},
			// 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
			select: function (arg) { // 캘린더에서 이벤트를 생성할 수 있다.
				insertModalOpen(arg);	//일자 클릭 시 모달 호출
				/*
				var title = prompt('일정을 입력해주세요.');
				if (title !== null) {
					calendar.addEvent({
						title: title,
						start: arg.start,
						end: arg.end,
						allDay: arg.allDay,
						writer : user,
					});
				
			
				var events = new Array(); // Json 데이터를 받기 위한 배열 선언
					var obj = new Object();     // Json 을 담기 위해 Object 선언
			
					obj.title = title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
					obj.start = arg.start; // 시작
					obj.end = arg.end; // 끝
					obj.writer = user;	// 작성자
					obj.allDay = arg.allDay;
					console.log(obj.allDay);
					
					events.push(obj);
					
				var jsondata = JSON.stringify(events);
				console.log(jsondata);
			
				$(function saveData(jsondata) {
					$.ajax({
						url: "${pageContext.request.contextPath}/a/input",
						method: "POST",
						dataType: "json",
						data: JSON.stringify(events),
						contentType: 'application/json',
					})
						.done(function (result) {
							alert(result);
							console.log(result);
						})
						.fail(function (request, status, error) {
						//	alert("에러 발생" + error);
							console.log(error);
						});
					calendar.unselect()
					});
				} 
				*/
			},
	
			eventClick: function(arg) {
				  // 있는 일정 클릭시,
				  console.log("#등록된 일정 클릭#");
				  console.log(arg.event.title);
				  console.log(arg.event.id);
				  console.log(arg.event.extendedProps.writer);
				  var events = new Array(); // Json 데이터를 받기 위한 배열 선언
					var obj = new Object();     // Json 을 담기 위해 Object 선언
			
					obj.title = arg.event.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
					obj.start = arg.event.start; // 시작
					obj.end = arg.event.end; // 끝
					obj.id = arg.event.id
					obj.allDay = arg.event.allDay;
					obj.writer = arg.event.extendedProps.writer;
					obj.user = user
					console.log(obj.allDay);
					
					events.push(obj);
					
				var jsondata = JSON.stringify(events);
				console.log(jsondata);
				if(user == arg.event.extendedProps.writer){
					if (confirm(arg.event.title + ' - 삭제 하시겠어요?')) {
						
						$.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/a/delete",
							method: "POST",
							data: JSON.stringify(events),
							
							contentType: 'application/json',
							success : function (response){
								window.location.reload()
							}
						});
					  arg.event.remove();
					}
				}else{
					alert("작성한 본인만 삭제할 수 있습니다.");
				}
				
			  },
			  editable: true,
			  dayMaxEvents: true, // allow "more" link when too many events
			  events: [
				//================ ajax데이터 불러올 부분 =====================//
				  
				  <%if (calendarList != null) {%>
				  <%for (CalendarVo vo : calendarList) {%>
					{
						title : '<%=vo.getTitle()%>',
						start : '<%=vo.getStart()%>',
						end : '<%=vo.getEnd()%>',
						writer : '<%=vo.getWriter()%>',
						id : '<%=vo.getId()%>',
						allday : '<%=vo.isAllday()%>',
					},
					<%}
				}%>
			],
			// 작성자 표시
			eventContent: function(arg) {
				return {
					html: arg.event.title + '<br>By ' + arg.event.extendedProps.writer,
				};
			},
		});
		calendar.render();
		
			
		calendar.on('dateClick', function(info) {
			console.log('clicked on ' + info.dateStr);
		  });
		
	  });
	  
	//모달초기화
		function initModal(modal, arg){
		  $('.'+modal+' #title').val('');
		  $('.'+modal+' #start').val('09:00');
		  $('.'+modal+' #end').val('09:30');
		  $('.'+modal+' #allDay').val('0');
		  $('.'+modal+' input[name="allDay"]').val(['false']);
		  $('.'+modal).modal('hide');
		  g_arg = null;
		}
	  
	  //일정등록창 모달
		function insertModalOpen(arg){
		  
		 
		  
		  g_arg = arg;
		  //값이 있는경우 세팅
		  if(g_arg.event != undefined){
			  $('.insertModal .deleteBtn').css('display', 'inline');
			  $('.insertModal .empl_nm').css('display', 'inline');
			  $('.insertModal #empl_nm').val(g_arg.event.extendedProps.empl_nm);
			  $('.insertModal #title').val(g_arg.event.title);
			  $('.insertModal #start').val(stringFormat(g_arg.event.start.getHours())+':'+stringFormat(g_arg.event.start.getMinutes()));
			  $('.insertModal #end').val(stringFormat(g_arg.event.end.getHours())+':'+stringFormat(g_arg.event.end.getMinutes()));
			  $('.insertModal input[name="allDay"]').val([g_arg.event.allDay]);
			  
		  //신규 이벤트
		  }else{
			  //month 외 week, day는 시간 값까지 받아와서 값 바인딩 ex)09:00
			  if(g_arg.startStr.length > 10){
				  $('.insertModal #start').val(g_arg.startStr.substr(11, 5));
				  $('.insertModal #end').val(g_arg.endStr.substr(11, 5));
			  }
			  //등록자 숨김(readonly)
			  $('.insertModal .empl_nm').css('display', 'none');
			  //등록버튼 외 숨김
			  $('.insertModal .insertBtn').css('display', 'inline');
			  $('.insertModal .deleteBtn').css('display', 'none');
			  $('.insertModal .approvalBtn').css('display', 'none');
			  $('.insertModal .rejectBtn').css('display', 'none');
		  }
		  //모달창 show
		  $('.insertModal').modal({backdrop: 'static'});
		  console.log(arg);
		  $('.insertModal #title').focus();
		}
		//일정삭제
		function deleteSch(modal, arg){
		  if(confirm('일정을 삭제하시겠습니까?')){
			  var data = {"gubun": "delete", "id" : arg.event.id, "allowyn": "0"};
			  //DB 삭제
			  $.ajax({
				url: "./deleteSch.jsp",
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
					alert('일정 삭제 실패<br>새로고침 후 재시도 해주세요');
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
		
	};
	//DB 삽입	
	$.ajax({
	  url: "./insertSch.jsp",
	  type: "POST",
	  data: JSON.stringify(events),
	  dataType: "JSON",
	  traditional: true,
	  success : function(data, status, xhr){
		  var id;
		  $.each(data, function(key, value){
			  id = value;
		  });
		  if($('.insertModal input[name="allDay"]:checked').val()=='true'){
			  if(user == ceo){
				  calendar.addEvent({
					id: id,
					title: $('.'+modal+' #title').val(),
					start: arg.startStr+'T'+$('.'+modal+' #start').val(),
					end: arg.endStr+'T'+$('.'+modal+' #end').val(),
					backgroundColor: ceoColor,
					borderColor: ceoColor,
					textColor: textBlack,
					regid: user,
					empl_nm: user,
					allDay: true
				  });
			  }else{
				  calendar.addEvent({
						id: id,
						title: $('.'+modal+' #title').val(),
						start: arg.startStr+'T'+$('.'+modal+' #start').val(),
						end: arg.endStr+'T'+$('.'+modal+' #end').val(),
						backgroundColor: regColor,
						borderColor: regColor,
						textColor: textWhite,
						regid: uesr,
						empl_nm: user,
						allDay: true
					});  
			  }
				
		  }
				
		  
		  calendar.unselect();
		  initModal(modal, arg);
	  },
	  error : function(xhr, status, error){
			//alert(xhr.responseText);
		  alert('일정 등록 실패<br>새로고침 후 재시도 해주세요');
	  }
	  });
	  
	  
	  var sub1 = document.getElementById('menu1');
	  var sub2 = document.getElementById('menu2');
	  var sub3 = document.getElementById('menu3');
	  var main1 = document.getElementById('main1');
	  var main2 = document.getElementById('main2');
	  var main3 = document.getElementById('main3');
	
	  function menucontrol1(){
		  if(sub1.classList.contains('open')){
			  sub1.classList.remove('open');
		  }else{
			  sub1.classList.add('open');
		  }
	  }
	
	  function menucontrol2(){
		  if(sub2.classList.contains('open')){
			  sub2.classList.remove('open');
		  }else{
			  sub2.classList.add('open');
		  }
	  }
	
	  function menucontrol3(){
		  if(sub3.classList.contains('open')){
			  sub3.classList.remove('open');
		  }else{
			  sub3.classList.add('open');
		  }
	  }
	</script>
</body>
</html>
