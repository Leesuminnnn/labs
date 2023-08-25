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

<style>

	
	.container{
		padding-top: 40px;
		background-color: #DDDDDD;
		/* height: 843px; */
		height: calc(100vh - 80px);
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
