package com.nnn.app.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.CalenService;
import com.nnn.app.vo.CalendarVo;

@Controller
@RequestMapping(value = "a/*")
public class CalendarController {
	
	
	@Autowired(required = false)
	private CalenService calenService;

	
//	@GetMapping(params="method=list")
//	public String list(Model d, CalendarVo calendarVo) {
//		d.addAttribute("list", calenService.calenList(calendarVo));
//		return "a/fullcalendar";
//	}
	
	@RequestMapping(value = "Calendar.do")
	public ModelAndView list(ModelAndView mv, HttpServletRequest request) {
		List<CalendarVo> calendar = null;
		try {
			calendar = calenService.calenList();
			request.setAttribute("calendarList", calendar);
			System.out.println("calendar : "+ calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("a/fullcalendar");
		return mv;
	}
	
	
//	@RequestMapping(value = "input")
//	public ModelAndView input(ModelAndView mv, @RequestBody CalendarVo vo) {
//		
//		System.out.println("============================");
//		System.out.println(vo.getTitle());
//		System.out.println(vo.getStart());
//		System.out.println(vo.getEnd());
//		System.out.println("============================");
//		mv.setViewName("a/input");
//		return mv;
//	}
	
	
	@RequestMapping(value = "input")
	public String input(@RequestBody List<Map<String, Object>> param, HttpServletRequest request) throws Exception {
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		
		for (Map<String, Object> list : param) {
//			for (Map.Entry<String, Object> entry : list.entrySet()) {
//				
//				String key = entry.getKey();
//				Object value = entry.getValue();
//				
//			}
			
			String liststart = (String)list.get("start");
			String listend = (String)list.get("end");
			System.out.println("@@");
			System.out.println(liststart);
			System.out.println(listend);
			
			String eventName = (String) list.get("title"); // 이름 받아오기
			String startDateString = (String) list.get("start");
			String endDateString = (String) list.get("end");

			System.out.println("**============================");
			System.out.println(startDateString);
			System.out.println(endDateString);
			System.out.println("**============================");
			System.out.println("============================**");
			System.out.println( );
			System.out.println( );
			System.out.println("============================**");
			LocalDateTime startDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
			LocalDateTime endDate = LocalDateTime.parse(endDateString, dateTimeFormatter);
			// 시, 분, 초를 0으로 만드는?
//			LocalDateTime startDateWithTime = startDate.withHour(0).withMinute(0).withSecond(0);
//			LocalDateTime endDateWithTime = endDate.withHour(0).withMinute(0).withSecond(0);
			System.out.println("============================");
			System.out.println(eventName);
			System.out.println(startDate);
			System.out.println(endDate);
			System.out.println("============================");
//			System.out.println(startDateWithTime);
//			System.out.println(endDateWithTime);
			System.out.println("============================");
			
			
//			String inputDateTimeString = "2023-08-07 00:00"; // Input date-time string
//			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Adjust the pattern
//			LocalDateTime localDateTime = LocalDateTime.parse(inputDateTimeString, formatter);
//			System.out.println(localDateTime);
			
			ZoneOffset koreaOffset = ZoneOffset.of("+09:00");	//  한국 시간대의 오프셋
			startDate = startDate.plusHours(9).atOffset(koreaOffset).toLocalDateTime(); // 날짜와 시간에 9시간을 더함
			endDate = endDate.plusHours(9).atOffset(koreaOffset).toLocalDateTime();		// 날짜와 시간에 9시간을 더함
//			DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
//			String startfor = startDate.format(outputFormatter);
//			String endfor = endDate.format(outputFormatter);
			
//			LocalDate startLocal = LocalDate.parse(startfor,DateTimeFormatter.ofPattern("yyyy/MM/dd"));
//			LocalDate endLocal = LocalDate.parse(endfor,DateTimeFormatter.ofPattern("yyyy/MM/dd"));
			
			
			System.out.println("============================");
			System.out.println("여기");
			System.out.println(startDate);
			System.out.println(endDate);
			System.out.println("============================");
//			System.out.println(startfor);
//			System.out.println(endfor);
			System.out.println("============================");
//			System.out.println(startLocal);
//			System.out.println(endLocal);
			System.out.println("============================");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("title", eventName);
			map.put("start1", startDate);
			map.put("end1", endDate);
//			int select = calenService.calenselect(map);
			
//			System.out.println(select);
			
//			if(select != 1) {
//				System.out.println("DB에 중복없음");
				int result = calenService.caleninput(map);
				System.out.println(result);
				if (result == 1) {
					// 성공
					System.out.println("성공");
//					request.setAttribute("msg", "등록이 완료되었습니다.");
//		    		request.setAttribute("url", "a/input");
//		    		return "alert4";
				}else {
					// 실패
					System.out.println("실패");
				}
				
//			}else {
//				System.out.println("중복");
//				request.setAttribute("msg", "이미 등록이 된 날짜입니다.");
//	    		request.setAttribute("url", "a/input");
//	    		return "alert4";
//			}
			
			
			
		}
		
		
		return "a/input";
		
	}
	
//	
//	@ResponseBody
//	@GetMapping(params = "method=data", produces = "application/json")
//	public String data(Model d, CalendarVo calendarVo) {
//		d.addAttribute("list", calenService.calenList());
//		return "pageJsonReport";
//	}

}
