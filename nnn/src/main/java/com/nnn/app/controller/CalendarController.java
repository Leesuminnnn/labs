package com.nnn.app.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
	
	@RequestMapping(value = "fullcalendar")
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
	public String input(@RequestBody List<Map<String, Object>> param) throws Exception {
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		
		for (Map<String, Object> list : param) {
//			for (Map.Entry<String, Object> entry : list.entrySet()) {
//				
//				String key = entry.getKey();
//				Object value = entry.getValue();
//				
//			}
			
			String eventName = (String) list.get("title"); // 이름 받아오기
			String startDateString = (String) list.get("start");
			String endDateString = (String) list.get("end");

			System.out.println("**============================");
			System.out.println(list.get("start"));
			System.out.println(list.get("end"));
			System.out.println("**============================");
			System.out.println("============================**");
			System.out.println(startDateString);
			System.out.println(endDateString);
			System.out.println("============================**");
			LocalDateTime startDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
			LocalDateTime endDate = LocalDateTime.parse(endDateString, dateTimeFormatter);
			System.out.println("============================");
			System.out.println(eventName);
			System.out.println(startDate);
			System.out.println(endDate);
			System.out.println("============================");
			
			
		}
		
		
		return "/a/input";
		
	}
	
//	
//	@ResponseBody
//	@GetMapping(params = "method=data", produces = "application/json")
//	public String data(Model d, CalendarVo calendarVo) {
//		d.addAttribute("list", calenService.calenList());
//		return "pageJsonReport";
//	}

}
