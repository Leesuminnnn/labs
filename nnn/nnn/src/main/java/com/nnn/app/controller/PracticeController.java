package com.nnn.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.PracticeService;
import com.nnn.app.vo.SubVo;
import com.nnn.app.vo.UserVo;
import com.nnn.app.vo.UseroptionVo;

@Controller
@RequestMapping(value = "p/*")
public class PracticeController {
	private PracticeService practiceService;
	
	@Autowired
	public PracticeController(PracticeService practiceService) {
			this.practiceService = practiceService;
		}

	@RequestMapping(value="test")
	public ModelAndView test(ModelAndView mv, HttpSession session, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<SubVo> sub = practiceService.subop(map);
		List<UserVo> user = practiceService.userall(map);
		List<UseroptionVo> userop = practiceService.userop(map);
		mv.addObject(sub);
		mv.addObject(user);
		mv.addObject(userop);
		
		System.out.println(user);
		System.out.println();
		mv.setViewName("practice/test");
		return mv;
	}
	
	@RequestMapping(value = "main")
	public ModelAndView main (ModelAndView mv) {
		
		System.out.println("main");
		mv.setViewName("practice/main");
		
		return mv;
		
	}
	@RequestMapping(value = "list")
	public ModelAndView list (ModelAndView mv) {
		
		System.out.println("list");
		mv.setViewName("practice/list");
		
		return mv;
		
	}
	
	@PostMapping("/barcode")
    @ResponseBody
    public String handleBarcode(@RequestBody Map<String, Object> payload) {
        String barcode = (String) payload.get("barcode");
        // Process the barcode value, e.g., save it to the database
        
        return "{\"status\":\"success\"}";
    }
}