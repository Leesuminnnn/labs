package com.nnn.app.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.MediplatService;
import com.nnn.app.vo.Mediplat;
import com.nnn.app.vo.MediplatMenu;

@Controller
@RequestMapping(value="mediplat/*")
public class MediplatController {
	private MediplatService medi;
	
	@Autowired
	public MediplatController (MediplatService medi) {
		this.medi = medi;
	}
	
	@RequestMapping(value="Main")
	public ModelAndView Main(ModelAndView mv, Mediplat mp) throws Exception {
		// 메디플랫 메인 페이지
		List<Mediplat> title = new ArrayList<Mediplat>();
		title = medi.mediTitleSelect();
		
		List<MediplatMenu> menu = new ArrayList<MediplatMenu>();
		menu = medi.mediMenuSelect();
		
		
		System.out.println(title);
		System.out.println(menu);
		mv.addObject("title", title);
		mv.addObject("menu", menu);
		mv.setViewName("mediplat/Main");
		return mv;
	}
	
}
