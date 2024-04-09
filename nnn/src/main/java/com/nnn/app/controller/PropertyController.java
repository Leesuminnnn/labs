package com.nnn.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.PropertyService;
import com.nnn.app.vo.LoginAjaxResponse;

@Controller
@RequestMapping(value = "pro/*")
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
	// 로그인
	@RequestMapping(value="Login")
	public ModelAndView login(ModelAndView mv) throws Exception {
		// 공지사항 영역 리스트로 출력
		Map<String, Object> map = new HashMap<String, Object>();
//		List<NoticeVo> list = propertyService.noticeSelect(map);
		
//		mv.addObject("notice", list);
//		System.out.println(list);
		
		mv.setViewName("property/login");
		return mv;
	}
	
	// 로그인 액션
	// 로그아웃 
	@RequestMapping("Logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {

		session.invalidate();
		mav.setViewName("redirect:/hwt/Login");
		return mav;

	}
	// 메인
	
	// 제품정보 입력
	
	// 제품정보 액션
	
	// 제품정보 - 목록관리 - 제품목록
	
	// 제품정보 - 목록관리 - 제품목록 등록
	
	// 제품정보 - 목록관리 - 제품목록 삭제
	
	// 제품정보 - 목록관리 - 분류목록
	
	// 제품정보 - 목록관리 - 부서목록
	
	// 구매정보 입력

	// 구매정보 액션
	
	// 관리자 입력
	
	// 관리자 액션
	
	// 이력관리 입력
	
	// 이력관리 액션

}
