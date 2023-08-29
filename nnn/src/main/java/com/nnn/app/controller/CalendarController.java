package com.nnn.app.controller;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.CalenService;
import com.nnn.app.service.MemberService;
import com.nnn.app.vo.CalendarVo;

@Controller
@RequestMapping(value = "a/*")
public class CalendarController {
	
	
	@Autowired(required = false)
	private CalenService calenService;
	private MemberService memberService;

	
//	@GetMapping(params="method=list")
//	public String list(Model d, CalendarVo calendarVo) {
//		d.addAttribute("list", calenService.calenList(calendarVo));
//		return "a/fullcalendar";
//	}
	
	@RequestMapping(value = "Calendar.do")
	public ModelAndView list(ModelAndView mv, HttpServletRequest request, HttpSession session) {
		List<CalendarVo> calendar = null;
		try {
			calendar = calenService.calenList();
			request.setAttribute("calendarList", calendar);
			System.out.println("calendar : "+ calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(session.getAttribute("name"));
//		mv.addObject("detail", memberService.detail2((String)session.getAttribute("name")));
		// 시연용
		session.getAttribute("loginMember");
		session.getAttribute("email");
    	session.getAttribute("name");
    	session.getAttribute("m_status");
    	session.getAttribute("midx");
    	session.getAttribute("userId");
    	session.getAttribute("m_no");
    	session.getAttribute("m_point");
    	session.getAttribute("m_in");
    	session.getAttribute("m_de");
		
		mv.setViewName("a/fullcalendar");
		return mv;
	}
	

	
	@RequestMapping(value = "input", method = RequestMethod.POST)
	public String input(@RequestBody CalendarVo CalendarVo/*List<Map<String, Object>> calendarData*/, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		System.out.println("input ajax");
		System.out.println("Received Request Body: " + CalendarVo);
		System.out.println(CalendarVo.getTitle());
		System.out.println(CalendarVo.getStart());
		System.out.println(CalendarVo.getEnd());
		System.out.println(CalendarVo.getWriter());
		System.out.println(CalendarVo.getContent());
		System.out.println(CalendarVo.getRun());
		System.out.println(CalendarVo.getAgency());
		System.out.println(CalendarVo.getPrepare());
		System.out.println(CalendarVo.getPatientName());
		System.out.println(CalendarVo.getPatientRoom());
		System.out.println(CalendarVo.getPatientNumber());
		
		
		String eventName = (String) CalendarVo.getTitle();
		String startDateString = (String) CalendarVo.getStart();
		String endDateString = (String) CalendarVo.getEnd();
		String writer = (String) CalendarVo.getWriter();
		boolean allday = (boolean) CalendarVo.isAllday();
		String content = (String) CalendarVo.getContent();
		String run = (String) CalendarVo.getRun();
		String agency = (String) CalendarVo.getAgency();
		String prepare = (String)CalendarVo.getPrepare();
//		String prepare = (String) CalendarVo.getPrepare();
		String patientName = (String) CalendarVo.getPatientName();
		String patientRoom = (String) CalendarVo.getPatientRoom();
		String patientNumber = (String) CalendarVo.getPatientNumber();
				
				
		
		
		System.out.println(allday);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", eventName);
		map.put("start", startDateString);
		map.put("end", endDateString);
		map.put("allday", allday);
		map.put("writer", writer);
		map.put("content", content);
		map.put("run", run);
		map.put("agency", agency);
		map.put("prepare", prepare);
		map.put("patientName", patientName);
		map.put("patientRoom", patientRoom);
		map.put("patientNumber", patientNumber);
		
		
		int select = calenService.calenselect(map);
		System.out.println(select);
		if(select != 1) {
			System.out.println("DB에 중복없음");
			int result = calenService.caleninput(map);
			System.out.println(result);
			if (result >= 1) {
				// 성공
				System.out.println("성공");
				request.setAttribute("msg", "등록이 완료되었습니다.");
	    		request.setAttribute("url", "a/Calendar.do");
	    		return "alert";
			}else {
				// 실패
				System.out.println("실패");
			}
			
		}else {
			System.out.println("중복");
			request.setAttribute("msg", "이미 등록이 된 날짜입니다.");
    		request.setAttribute("url", "a/Calendar.do");
    		return "alert";
		}
		
		
		
		
		
	
//		for (Map<String, Object> list : calendarData) {
//			
//			String eventName = (String) list.get("title"); // 이름 받아오기
//			String startDateString = (String) list.get("start");
//			String endDateString = (String) list.get("end");
//			String writer = (String)list.get("writer");
////			String allday = (String) list.get("allDay");
//			boolean allday = (boolean) list.get("allDay");
//			
//			System.out.println(allday);
//			String input = "2023-08-09T15:00:00.000Z";
//	        
//	        // 입력 문자열의 형식 지정
//	        DateTimeFormatter inputFormatter = DateTimeFormatter.ISO_INSTANT;
//	        
//	        // 문자열을 Instant로 변환
//	        Instant instant = Instant.parse(input);
//	        Instant instant2 = Instant.parse(startDateString);
//	        Instant instant3 = Instant.parse(endDateString);
//	        		
//	        // Instant를 LocalDateTime으로 변환 (기본 시간대는 UTC)
//	        // 9시간을 더하여 계산
//	        LocalDateTime localDateTime = LocalDateTime.ofInstant(instant, ZoneId.of("UTC"));
//	        LocalDateTime localDateTimestart = LocalDateTime.ofInstant(instant2, ZoneId.of("UTC")).plus(9, ChronoUnit.HOURS);
//	        LocalDateTime localDateTimeend = LocalDateTime.ofInstant(instant3, ZoneId.of("UTC")).plus(9, ChronoUnit.HOURS);
//	        
//	        // 출력 형식 지정
//	        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//	        
//	        // LocalDateTime을 문자열로 변환하여 출력
//	        String formattedDate = localDateTime.format(outputFormatter);
//	        String formattedDateStart = localDateTimestart.format(outputFormatter);
//	        String formattedDateEnd = localDateTimeend.format(outputFormatter);
//	        System.out.println(formattedDate);
//	        System.out.println(formattedDateStart);
//	        System.out.println(formattedDateEnd);
//	        
//			System.out.println("**============================");
//			System.out.println(startDateString);
//			System.out.println(endDateString);
//			System.out.println("**============================");
//			System.out.println("============================**");
//			System.out.println( );
//			System.out.println( );
//			System.out.println("============================**");
//			LocalDateTime startDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
//			LocalDateTime endDate = LocalDateTime.parse(endDateString, dateTimeFormatter);
//			System.out.println("============================");
//			System.out.println(eventName);
//			System.out.println(startDate);
//			System.out.println(endDate);
//
//			System.out.println("============================");
//
//			System.out.println("여기");
//			System.out.println(formattedDateStart);
//			System.out.println(formattedDateEnd);
//			System.out.println(writer);
//			System.out.println("============================");
//			
//			
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("title", eventName);
//			map.put("start", formattedDateStart);
//			map.put("end", formattedDateEnd);
//			map.put("allday", allday);
//			map.put("writer", writer);
//			int select = calenService.calenselect(map);
//			
//			
		System.out.println("여기");
		request.setAttribute("msg", "등록이 완료되었습니다.");
		request.setAttribute("url", "a/Calendar.do");
		
		return "alert";
		
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestBody List<Map<String, Object>> param, HttpServletRequest request) throws Exception {
		for (Map<String, Object> list : param) {
			String eventName = (String) list.get("title"); // 이름 받아오기
			System.out.println(eventName);
			String id = (String) list.get("id");
			String writer = (String) list.get("writer");	// DB에 담겨있는 작성자
			System.out.println("writer : "+writer);
			String user = (String) list.get("user");		// 현재 로그인한 사용자
			System.out.println("user : "+user);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("title", eventName);
			try{
	            int number = Integer.parseInt(id);
	            System.out.println(number);
	            map.put("id", number);
	        }
	        catch (NumberFormatException ex){
	            ex.printStackTrace();
	        }
			
			if(writer.equals(user)) {
				int delete = calenService.calendelete(map);
				if(delete != 1) {
					System.out.println("삭제 실패");
				}else {
					System.out.println("삭제 성공");
					
				}
			}else {
				System.out.println("일정 작성자와 현재 로그인한 작성자가 다름");
				
			}
			
			
			
		}
		
		return "a/delete";
	}
	

}
