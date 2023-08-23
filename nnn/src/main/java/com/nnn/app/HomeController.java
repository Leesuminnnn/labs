package com.nnn.app;




import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.HelpService;
import com.nnn.app.service.MemberService;
import com.nnn.app.vo.CustomerVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private HelpService helpService;
	private MemberService memberService;
	
	@Autowired
	public HomeController(HelpService helpService, MemberService memberService) {
		this.helpService = helpService;
		this.memberService = memberService;
	}
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home() {
		System.out.println("home");
		
		return "home";
	}
	
	@RequestMapping(value = "/alert.do", method = RequestMethod.GET)
	public String alert(HttpSession session) {
		session.getAttribute("loginMember");
		session.getAttribute("email");
    	session.getAttribute("name");
    	session.getAttribute("userId");
    	session.getAttribute("access_Token");
		session.getAttribute("m_status");
		session.getAttribute("midx");
		return "alert";
	}
	@RequestMapping(value = "/alert3.do", method = RequestMethod.GET)
	public String alert3(HttpSession session) {
		
		return "alert3";
	}
	@RequestMapping(value = "/alert2.do", method = RequestMethod.GET)
	public String alert2(HttpSession session) {
		session.getAttribute("loginMember");
		session.getAttribute("email");
    	session.getAttribute("name");
    	session.getAttribute("userId");
    	session.getAttribute("access_Token");
		session.getAttribute("m_status");
		session.getAttribute("midx");
		return "alert2";
	}
	@RequestMapping(value = "/alert4.do", method = RequestMethod.GET)
	public String alert4(HttpSession session) {
		session.getAttribute("loginMember");
		session.getAttribute("email");
    	session.getAttribute("name");
    	session.getAttribute("userId");
    	session.getAttribute("access_Token");
		session.getAttribute("m_status");
		session.getAttribute("midx");
		return "alert4";
	}
	@RequestMapping(value="/")
	public ModelAndView main2(ModelAndView mav, HttpSession session, CustomerVo vo, HttpServletRequest request) throws Exception {
		System.out.println("-----------------1");
		//저장되어 있는 세션 꺼내오기
		session.getAttribute("email");
    	session.getAttribute("name");
    	session.getAttribute("userId");
    	session.getAttribute("access_Token");
		session.getAttribute("m_status");
		session.getAttribute("midx");
		System.out.println("--------------Main접속");
//		mav.addObject("detail", memberService.detail2((String)session.getAttribute("name")));
		// 시연용
		mav.addObject("detail", memberService.detail3((String)session.getAttribute("name")));
		System.out.println("##########################################################");
		System.out.println("midx : "+session.getAttribute("midx"));
		System.out.println("##########################################################");
		
		LocalDate endDate = LocalDate.now();
		System.out.println("endDate : "+endDate);
		LocalDate startDate = endDate.minusMonths(1);
		System.out.println("startDate: "+startDate);
		
		mav.addObject("midx", vo.getMidx());
		mav.addObject("email", session.getAttribute("email"));
		mav.addObject("h_userName", session.getAttribute("name"));
		mav.addObject("m_name",session.getAttribute("name"));
		mav.addObject("userId", vo.getM_id());
		mav.addObject("m_no", vo.getM_no());
		mav.addObject("m_in", vo.getM_in());
		mav.addObject("m_de", vo.getM_de());
		mav.addObject("m_point", vo.getM_point());
		mav.addObject("m_status", vo.getM_status());
		mav.addObject("end", endDate);
		mav.addObject("start", startDate);
		System.out.println("#####################################");
		System.out.println("mav : "+mav.getModel());
		System.out.println("#####################################");	
		mav.setViewName("h/Main");
		
		return mav;
	}
	
}
