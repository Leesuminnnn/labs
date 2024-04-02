package com.nnn.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.MemberService;

@Controller
@RequestMapping(value = "v/*")
public class AmbController {
	private MemberService memberService;
	
	
	@Autowired
	public AmbController(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value="Calendar.do")
	public ModelAndView calendar(ModelAndView mav) {
		
		mav.setViewName("a/Calendar");
		return mav;
	}
}
