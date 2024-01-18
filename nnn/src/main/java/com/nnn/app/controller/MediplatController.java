package com.nnn.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.DemoService;
import com.nnn.app.service.MediplatService;
import com.nnn.app.vo.Mediplat;
import com.nnn.app.vo.MediplatMenu;

@Controller
@RequestMapping(value="mediplat/*")
public class MediplatController {
	private MediplatService medi;
	private DemoService demo;
	
	@Autowired
	public MediplatController (MediplatService medi, DemoService demo) {
		this.medi = medi;
		this.demo = demo;
	}
	
	@RequestMapping(value="Main/{idx}")
	public ModelAndView Main(@PathVariable("idx") Integer idx, ModelAndView mv, Mediplat mp, HttpSession session) throws Exception {
		// 로그인 후 세션 불러옴
		session.getAttribute("loginMember");
		
		// 메디플랫 메인 페이지
		List<Mediplat> title = new ArrayList<Mediplat>();
		title = medi.mediTitleSelect();
		
		List<MediplatMenu> menu = new ArrayList<MediplatMenu>();
		menu = medi.mediMenuSelect();
		
		
		System.out.println(title);
		System.out.println(menu);
		mv.addObject("info", demo.info(idx));
		mv.addObject("title", title);
		mv.addObject("menu", menu);
		mv.setViewName("mediplat/Main");
		return mv;
	}
	
}
