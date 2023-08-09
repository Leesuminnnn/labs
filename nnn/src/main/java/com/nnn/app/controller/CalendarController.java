package com.nnn.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value = "input")
	public ModelAndView input(ModelAndView mv) {
		
		
		mv.setViewName("a/input");
		return mv;
	}
	
//	
//	@ResponseBody
//	@GetMapping(params = "method=data", produces = "application/json")
//	public String data(Model d, CalendarVo calendarVo) {
//		d.addAttribute("list", calenService.calenList());
//		return "pageJsonReport";
//	}

}
