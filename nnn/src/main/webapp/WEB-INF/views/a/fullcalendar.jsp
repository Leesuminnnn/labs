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
    <title>FullCalendar by Creative Tim </title>

	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!-- fullcalendar css -->

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">


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
.fc-day-sat a { color:#0000FF; }     /* 토요일 */
.fc-day-sun a { color:#FF0000; }    /* 일요일 */
</style>
</head>
<body>
<div id='calendar'></div>
<script>

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
			end : 'dayGridMonth,dayGridWeek,dayGridDay'
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
		        });
		    
		
		    var events = new Array(); // Json 데이터를 받기 위한 배열 선언
		        var obj = new Object();     // Json 을 담기 위해 Object 선언
		
		        obj.title = title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
		        obj.start = arg.start; // 시작
		        obj.end = arg.end; // 끝
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
		                // alert(result);
		            })
		            .fail(function (request, status, error) {
		                 // alert("에러 발생" + error);
		            });
		        calendar.unselect()
		    	});
		    }
		},

		eventClick: function(arg) {
	    	  // 있는 일정 클릭시,
	    	  console.log("#등록된 일정 클릭#");
	    	  console.log(arg.event.title);
	    	  
	        if (confirm(arg.event.title + ' - 삭제 하시겠어요?')) {
	        	$.ajax({
	        		type : "post",
	        		url : "${pageContext.request.contextPath}/a/delete",
	        		data: {
	        			'event_date_give' : dateFormat(arg.event.start),	// date 형식
	        			'event_title_give' : arg.event.title
	        		},
	        		success : function (response){
	        			window.location.reload()
	        		}
	        	});
	          arg.event.remove();
	        }
	      },
	      editable: true,
	      dayMaxEvents: true, // allow "more" link when too many events
	      events: [
	      
      		
      		<%if (calendarList != null) {%>
      		<%for (CalendarVo vo : calendarList) {%>
            {
            	title : '<%=vo.getTitle()%>',
                start : '<%=vo.getStart()%>',
                end : '<%=vo.getEnd()%>',
                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
             },
				<%}
			}%>
				]
				
	   	 //================ ajax데이터 불러올 부분 =====================//
	    	  /* function(info, successCallback, failureCallback){
	    	  // ajax 처리로 데이터를 로딩 시킨다.
	    	  $.ajax({
	    		 type:"get",
	    		 url:"${pageContext.request.contextPath}/a/fullcalendar?method=data",
	    		dataType:"json"  
	    		
	    	  }); 
	    	  
	      }*/
    });
    calendar.render();
    
    calendar.on('dateClick', function(info) {
  	  console.log('clicked on ' + info.dateStr);
  	});
});
 
 
</script>
</body>
</html>
