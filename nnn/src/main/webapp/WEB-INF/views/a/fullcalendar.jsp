<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>FullCalendar by Creative Tim </title>

	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!-- 
<link href='assets/css/fullcalendar.css' rel='stylesheet' />
<link href='assets/css/fullcalendar.print.css' rel='stylesheet' media='print' />
 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/fullcalendar.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/fullcalendar.print.css"media='print'>

<script src='${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js' type="text/javascript"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.8/index.global.min.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
		initialDate: '2023-08-08', // 초기 로딩 날짜.
		navLinks: true, // can click day/week names to navigate views
		selectable: true,
		selectMirror: true,
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay'
		}, 
		// 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
	      select: function(arg) {
	    	  console.log(arg);

	        var title = prompt('입력할 일정:');
	    // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
	        if (title) {
	          calendar.addEvent({
	            title: title,
	            start: arg.start,
	            end: arg.end,
	            allDay: arg.allDay,
	            backgroundColor:"yellow",
	            textColor:"blue"
	          })
	        }
	        calendar.unselect()
	      },
	      eventClick: function(arg) {
	    	  // 있는 일정 클릭시,
	    	  console.log("#등록된 일정 클릭#");
	    	  console.log(arg.event);
	    	  
	        if (confirm('Are you sure you want to delete this event?')) {
	          arg.event.remove()
	        }
	      },
	      editable: true,
	      dayMaxEvents: true, // allow "more" link when too many events
	      events: 
	      //================ ajax데이터 불러올 부분 =====================//
	    	  function(info, successCallback, failureCallback){
	    	  // ajax 처리로 데이터를 로딩 시킨다.
	    	  $.ajax({
	    		 type:"get",
	    		 url:"${pageContext.request.contextPath}/a/fullcalendar?method=data",
	    		dataType:"json"  
	    		
	    	  });
	    	  
	      }
    });
    calendar.render();
    calendar.on('dateClick', function(info) {
  	  console.log('clicked on ' + info.dateStr);
  	});

  });
  
 
 
</script>
<style>

	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Helvetica Nueue",Arial,Verdana,sans-serif;
		background-color: #DDDDDD;
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

</style>
</head>
<body>
<div id='calendar'></div>
</body>
</html>
