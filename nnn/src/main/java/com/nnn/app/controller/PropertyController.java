package com.nnn.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.PropertyService;

@Controller
@RestController(value = "pro/*")
public class PropertyController {
	private PropertyService propertyService;
	
	@Autowired
	public PropertyController (PropertyService propertyService) {
		this.propertyService = propertyService;
	}
	
	@RequestMapping(value = "test")
	public ModelAndView test(ModelAndView mv) {
		
		mv.setViewName("property/test");
		System.out.println("testPage");
		return mv;
	}
}
