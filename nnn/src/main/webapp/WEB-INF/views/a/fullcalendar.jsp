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
	      select: function(arg) {
	    	  console.log(arg);

	        var title = prompt('일정을 입력하세요.');
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
	          $.ajax({
	        	 type: "post",
	        	 url: "${pageContext.request.contextPath}/a/input",
	        	 data: {
	        		 'event_date_give' : dateFormat(arg.start), // date 형식
	        		 'event_title_give' : title
	        	 },
	        	 success : function (response) {
	        		 alert('일정이 추가 되었습니다.');
	        	 }
	          })
	        }
	        calendar.unselect()
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
	        	})
	          arg.event.remove()
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
             }
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
