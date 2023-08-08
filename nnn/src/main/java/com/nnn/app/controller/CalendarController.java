package com.nnn.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nnn.app.service.CalenService;
import com.nnn.app.vo.CalendarVo;

@Controller
@RequestMapping(value = "a/fullcalendar")
public class CalendarController {
	
	
	@Autowired(required = false)
	private CalenService calenService;

	
	@GetMapping(params="method=list")
	public String list(Model d, CalendarVo calendarVo) {
		d.addAttribute("list", calenService.calenList(calendarVo));
		return "a/fullcalendar";
	}
	
	@ResponseBody
	@GetMapping(params = "method=data", produces = "application/json")
	public String data(Model d, CalendarVo calendarVo) {
		d.addAttribute("list", calenService.calenList(calendarVo));
		return "pageJsonReport";
	}

}
