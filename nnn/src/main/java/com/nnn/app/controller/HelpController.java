package com.nnn.app.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.HelpService;
import com.nnn.app.service.MemberService;
import com.nnn.app.service.PointService;
import com.nnn.app.service.PointplusService;
import com.nnn.app.vo.AjaxResponse;
import com.nnn.app.vo.CustomerVo;
import com.nnn.app.vo.HelpVo;
import com.nnn.app.vo.CustomerVo;


@RequestMapping(value="h/*")
@Component
@Controller
public class HelpController {
	
	private HelpService helpService;
	private MemberService memberService;
	private PointplusService pointplusService;
	private PointService pointService;
	
	@Autowired
	public HelpController(HelpService helpService, MemberService memberService, PointplusService pointplusService,
			PointService pointService) {
		this.helpService = helpService;
		this.memberService = memberService;
		this.pointplusService = pointplusService;
		this.pointService = pointService;
	}

	@RequestMapping(value="Main.do")
	public ModelAndView main(/* @CookieValue(value="name", required=false) Cookie cookie, */
			ModelAndView mav, HttpSession session, CustomerVo vo, HttpServletRequest request) throws Exception {
		System.out.println("-----------------1");
		
		// -- 여기서 수정 후 HomeController에서 수정하기
		//저장되어 있는 세션 꺼내오기
		session.getAttribute("email");
    	session.getAttribute("name");
    	session.getAttribute("userId");
    	session.getAttribute("access_Token");
		session.getAttribute("m_status");
		session.getAttribute("midx");
		
		System.out.println("--------------Main접속");
//		Cookie[] cookies = request.getCookies();
		
		//이름이 "name"인 쿠기가 존재한다면?
//        if(cookie != null) {
//
//              //cookieValue 변수에 쿠키 값을 저장한다.
//             String cookieValue = cookie.getValue(); 
//             System.out.println(cookieValue);
//        }

//		mav.addObject("detail", memberService.detail((Integer)session.getAttribute("midx")));
//		
//		memberService.detail((Integer)session.getAttribute("midx"));
		
		// 시연용
		
		mav.addObject("detail", memberService.detail4((Integer)session.getAttribute("midx")));
		
		
//		mav.addObject("detail", memberService.detail2((String)session.getAttribute("name")));
		System.out.println("##########################################################");
		System.out.println("midx : "+session.getAttribute("midx"));
		LocalDate endDate = LocalDate.now();
		System.out.println("endDate : "+endDate);
		LocalDate startDate = endDate.minusMonths(1);
		System.out.println("startDate: "+startDate);
		System.out.println("##########################################################");
		
		
		System.out.println("세션 로그인멤버 값" + session.getAttribute("loginMember"));
		
		mav.addObject("midx", session.getAttribute("midx"));
		mav.addObject("email", session.getAttribute("email"));
		mav.addObject("h_userName", session.getAttribute("name"));
		mav.addObject("m_name",session.getAttribute("name"));
		mav.addObject("userId", session.getAttribute("userId"));
		mav.addObject("m_no", session.getAttribute("m_no"));
		mav.addObject("m_in", session.getAttribute("m_in"));
		mav.addObject("m_de", session.getAttribute("m_de"));
		mav.addObject("end", endDate);
		mav.addObject("start", startDate);
		System.out.println("#####################################");
		System.out.println("mav : "+mav.getModel());
		System.out.println("#####################################");	
		
		
		
		
		mav.setViewName("h/Main");
		
		return mav;
	}


	@RequestMapping(value="/SetSessionDuration.do", method=RequestMethod.POST)
	@ResponseBody
	public void setSessionDuration(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
	    Integer duration = 1;	// 기본값 1 설정
	    String durationParam = request.getParameter("duration");
	    if (durationParam != null && !durationParam.isEmpty()) {
	        duration = Integer.parseInt(durationParam);
	    }
	    session.setAttribute("duration", duration);
	    
	    
	}
	
	@RequestMapping(value="Insert.do/{midx}")
	public String insert(Model model, HttpSession session, @PathVariable("midx") Integer midx,HelpVo helpVo,HttpServletRequest request,
			@ModelAttribute("h_userId")String h_userId, @ModelAttribute("h_userName")String h_userName) throws Exception {
		System.out.println("#########################");
		System.out.println("insert접속");
		//저장되어 있는 세션 꺼내오기
		session.getAttribute("loginMember");
		session.getAttribute("email");
    	session.getAttribute("name");
    	session.getAttribute("userId");
    	session.getAttribute("access_Token");
		session.getAttribute("m_status");
		session.getAttribute("midx");
//		String currentUrl = request.getRequestURL().toString();
//		session.setAttribute("previousUrl", currentUrl);
//		
//		System.out.println("previousUrl"+currentUrl);
		
//		String previousUrl = (String) session.getAttribute("previousUrl");
//		String queryString = request.getQueryString();
//		System.out.println("#########################");
//		System.out.println("previousUrl : "+previousUrl);
//		System.out.println("queryString : "+queryString);
//		if (queryString != null && !queryString.isEmpty()) {
//		    previousUrl += "?" + queryString;
//		}
//		
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("h_userName", m_name);
//		map.put("midx", midx);
//		map.put("midx",memberService.detail2((String)session.getAttribute("name")).getMidx());
//		model.addAttribute("detail", memberService.detail2((String)session.getAttribute("name")));
		
		//시연용
		map.put("midx", midx);
		model.addAttribute("detail", memberService.detail3((String)session.getAttribute("name")));
		
		List<HelpVo> recentlist = helpService.recentlist(map);
		List<HelpVo> startlist = helpService.startlist(map);
		List<HelpVo> endlist = helpService.endlist(map);
		model.addAttribute("startlist", startlist);
		model.addAttribute("endlist", endlist);
		model.addAttribute("recentlist",recentlist);
		model.addAttribute("h_userId",session.getAttribute("userId"));
		model.addAttribute("h_userName",session.getAttribute("name"));
		model.addAttribute("m_name",session.getAttribute("name"));
		System.out.println("sessionid : "+session.getAttribute("userId"));
		System.out.println("sessionname : "+session.getAttribute("name"));
		System.out.println(midx);
		System.out.println("recentlist : "+recentlist);
		System.out.println("endlist : "+endlist);
		System.out.println("startlist : "+startlist);
		System.out.println("#########################");
		
		return "h/Insert";
	}
	
	@RequestMapping(value="Insert.do")
	public String insert2(Model model, HttpSession session,HelpVo helpVo,HttpServletRequest request,
			@ModelAttribute("h_name")String h_name, @ModelAttribute("h_no")String h_no, @ModelAttribute("h_number")String h_number) throws Exception {
		System.out.println("#########################");
		System.out.println("insert접속");
		//저장되어 있는 세션 꺼내오기
		session.getAttribute("loginMember");
		session.getAttribute("email");
    	session.getAttribute("name");
    	session.getAttribute("userId");
    	session.getAttribute("access_Token");
		session.getAttribute("m_status");
		session.getAttribute("midx");
		session.getAttribute("start");
		session.getAttribute("end");
		
		
//		model.addAttribute("detail", memberService.detail2((String)session.getAttribute("name")));
		// 시연용
		model.addAttribute("detail", memberService.detail3((String)session.getAttribute("name")));
		
		model.addAttribute("h_userName",session.getAttribute("name"));
		model.addAttribute("m_name",session.getAttribute("name"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("h_userName", session.getAttribute("name"));
		
//		map.put("midx",memberService.detail2((String)session.getAttribute("name")).getMidx());
		// 시연용
		map.put("midx",memberService.detail3((String)session.getAttribute("name")).getMidx());
		List<HelpVo> recentlist = helpService.recentlist(map);
		model.addAttribute("h_name", h_name);
		model.addAttribute("h_no", h_no);
		model.addAttribute("h_number", h_number);
		model.addAttribute("recentlist",recentlist);
		List<HelpVo> startlist = helpService.startlist(map);
		List<HelpVo> endlist = helpService.endlist(map);
		model.addAttribute("startlist", startlist);
		model.addAttribute("endlist", endlist);
//		model.addAttribute("h_userId",session.getAttribute("userId"));
//		model.addAttribute("h_userName",session.getAttribute("name"));
		System.out.println("sessionid : "+session.getAttribute("userId"));
		System.out.println("sessionname : "+session.getAttribute("name"));
		System.out.println(memberService.detail3((String)session.getAttribute("name")).getMidx());
		System.out.println("recentlist : "+recentlist);
		System.out.println("endlist : "+endlist);
		System.out.println("startlist : "+startlist);
		System.out.println("#########################");
		return "h/Insert";
	}
	
	
//	@ResponseBody
	@RequestMapping(value = "Insertajax/{midx}", method = RequestMethod.POST)
	public String addHelp(HelpVo helpVo, HttpSession session, Model model, @PathVariable("midx") Integer midx,
			@RequestParam("h_userId")String h_userId, @RequestParam("h_userName")String h_userName,HttpServletRequest request, 
			@RequestParam("h_name")String h_name, @RequestParam("h_no")String h_no, @RequestParam("h_number")String h_number) {
		System.out.println("--------------insertajax접속");
		// 요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는 경우 전달된 값을 그 객체에 매핑시켜줌
		// 이러한 객체를 커맨드 객체라고 함.
		//저장되어 있는 세션 꺼내오기
		session.getAttribute("loginMember");
		session.getAttribute("email");
    	session.getAttribute("name");
    	session.getAttribute("userId");
    	session.getAttribute("access_Token");
		session.getAttribute("m_status");
		session.getAttribute("midx");
		
//		model.addAttribute("detail", memberService.detail2((String)session.getAttribute("name")));
		// 시연용
		model.addAttribute("detail", memberService.detail3((String)session.getAttribute("name")));
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("h_userName",session.getAttribute("name"));
		map.put("midx", midx);
		map.put("h_userId",session.getAttribute("userId"));
		map.put("h_number",h_number);
		map.put("h_no",h_no);
		map.put("h_name",h_name);
//		map.put("midx", memberService.detail2((String)session.getAttribute("name")).getMidx());
		
		model.addAttribute("h_name", h_name);
		model.addAttribute("h_no", h_no);
		model.addAttribute("h_number", h_number);
		model.addAttribute("h_userId", session.getAttribute("userId"));
		model.addAttribute("h_userName",session.getAttribute("name"));
		model.addAttribute("m_name",session.getAttribute("name"));
		
		System.out.println("#########################");
		System.out.println("insertajax접속");
//		System.out.println("m_name : "+m_name);
		System.out.println("h_name : "+h_name);
		System.out.println("h_no : "+h_no);
		System.out.println("h_number : "+h_number);
		System.out.println("h_userId : "+session.getAttribute("userId"));
		System.out.println("h_userName : "+session.getAttribute("name"));
		System.out.println("#########################");
		
		// 수발 시작한 시간 별로 나누기 (아침, 점심, 저녁)
		
		LocalDateTime now = LocalDateTime.now();								// 현재 시간을 불러옴
		System.out.println("now : "+now);
		LocalDate date = LocalDate.now();
		System.out.println("date : "+date);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");		// 현재 시간과 분을 추출
		System.out.println("formatter : "+formatter);
		String formattedDateTime = now.format(formatter);
		System.out.println("formattedDateTime : "+formattedDateTime);
		// 아침
		LocalTime BstartTime = LocalTime.parse("08:30", formatter);				// 08시 부터
		System.out.println("BstartTime : "+BstartTime);
		LocalTime BendTime = LocalTime.parse("11:30", formatter);				// 08시 30분까지
		System.out.println("BendTime : "+BendTime);
		// 점심
		LocalTime LstartTime = LocalTime.parse("11:30", formatter);				// 12시 부터
		System.out.println("LstartTime : "+LstartTime);
		LocalTime LendTime = LocalTime.parse("17:30", formatter);				// 12시 30분까지
		System.out.println("LendTime : "+LendTime);
		// 저녁
		LocalTime DstartTime = LocalTime.parse("17:30", formatter);				// 18시 부터
		System.out.println("DstartTime : "+DstartTime);
		LocalTime DendTime = LocalTime.parse("18:30", formatter);				// 18시 30분까지
		System.out.println("DendTime : "+DendTime);
		
		LocalTime checkTime = LocalTime.parse(formattedDateTime, formatter);
		System.out.println("checkTime : "+checkTime);
		map.put("checkTime",checkTime);
		map.put("date",date);
		boolean bcheck = checkTime.isAfter(BstartTime) && checkTime.isBefore(BendTime);
		boolean Lcheck = checkTime.isAfter(LstartTime) && checkTime.isBefore(LendTime);
		boolean Dcheck = checkTime.isAfter(DstartTime) && checkTime.isBefore(DendTime);
		
		System.out.println("bcheck : "+bcheck);
		System.out.println("Lcheck : "+Lcheck);
		System.out.println("Dcheck : "+Dcheck);
		
		String viewPage = null;
		
		if (bcheck == true) {		// 08시 부터 08시 30분 까지의 값일 때
		    System.out.println("The time is between 08:00 and 08:30.");
		    helpVo.setH_dayTime("B");
		    map.put("h_dayTime",helpVo.getH_dayTime());
		    System.out.println("h_dayTime : " + helpVo.getH_dayTime());
		    // 침상 유효성
		    int selectresult = helpService.selectHelp(map);
		    // 회원 유효성
		    int selectresult2 = helpService.selectHelp2(map);
			System.out.println("selectresult : "+selectresult);
		    
			// 시연용으로 침상 유효성 삭제
//		    if(selectresult == 0) {
		    	
		    	if(selectresult2 == 0){
		    		int result = helpService.addHelp(map);
			    	if (result == 1) {
			    		request.setAttribute("msg", "수발 등록이 완료되었습니다.");
			    		request.setAttribute("url", "h/Insert.do/"+midx);
					} else {
						request.setAttribute("msg", "수발 등록이 실패하였습니다.");
			    		request.setAttribute("url", "h/Insert.do/"+midx);
					}
					return "alert";
		    	}else {
		    		request.setAttribute("msg", "이미 식사수발 기록이 있습니다.");
		    		request.setAttribute("url", "h/Main.do");
		    		return "alert";
		    	}
		    	
		    	// 시연용으로 침상 유효성 삭제
//		    }else {
//		    	request.setAttribute("msg", "이미 수발중이거나 완료한 침상입니다.");
//				request.setAttribute("url", "h/Main.do");
//		    	return "alert";
//		    }
			
		} else if (Lcheck == true) {
			System.out.println("The time is between 12:00 and 12:30.");
			helpVo.setH_dayTime("L");
		    map.put("h_dayTime",helpVo.getH_dayTime());
		    System.out.println("h_dayTime : " + helpVo.getH_dayTime());
			int selectresult = helpService.selectHelp(map);
		    int selectresult2 = helpService.selectHelp2(map);
			System.out.println("selectresult : "+selectresult);
			System.out.println("selectresult2 : "+selectresult2);
			
			// 시연용으로 침상 유효성 삭제
//			if(selectresult == 0) {
				if(selectresult2 == 0){
		    		int result = helpService.addHelp(map);
			    	if (result == 1) {
			    		request.setAttribute("msg", "수발 등록이 완료되었습니다.");
			    		request.setAttribute("url", "h/Insert.do/"+midx);
					} else {
						request.setAttribute("msg", "수발 등록이 실패하였습니다.");
			    		request.setAttribute("url", "h/Insert.do/"+midx);
					}
					return "alert";
		    	}else {
		    		request.setAttribute("msg", "이미 식사수발 기록이 있습니다.");
		    		request.setAttribute("url", "h/Main.do");
		    		return "alert";
		    	}
				// 시연용으로 침상 유효성 삭제
//		    }else {
//		    	request.setAttribute("msg", "이미 수발중이거나 완료한 침상입니다.");
//				request.setAttribute("url", "h/Main.do");
//		    	return "alert";
//		    }
			
		} else if (Dcheck == true) {
			System.out.println("The time is between 18:00 and 18:30.");
			helpVo.setH_dayTime("D");
		    map.put("h_dayTime",helpVo.getH_dayTime());
		    System.out.println("h_dayTime : " + helpVo.getH_dayTime());
			int selectresult = helpService.selectHelp(map);
		    int selectresult2 = helpService.selectHelp2(map);
			System.out.println("selectresult : "+selectresult);
			System.out.println("selectresult2 : "+selectresult2);
			// 시연용으로 침상 유효성 삭제
//			if(selectresult == 0) {
				if(selectresult2 == 0){
		    		int result = helpService.addHelp(map);
			    	if (result == 1) {
			    		request.setAttribute("msg", "수발 등록이 완료되었습니다.");
			    		request.setAttribute("url", "h/Insert.do/"+midx);
					} else {
						request.setAttribute("msg", "수발 등록이 실패하였습니다.");
			    		request.setAttribute("url", "h/Insert.do/"+midx);
					}
					return "alert";
		    	}else {
		    		request.setAttribute("msg", "이미 식사수발 기록이 있습니다.");
		    		request.setAttribute("url", "h/Main.do");
		    		return "alert";
		    	}
				// 시연용으로 침상 유효성 삭제
//		    }else {
//		    	request.setAttribute("msg", "이미 수발중이거나 완료한 침상입니다.");
//				request.setAttribute("url", "h/Main.do");
//		    	return "alert";
//		    }
		}
		
		else {
			System.out.println("The time is not between 07:30 and 08:30 or 11:30 and 12:30 or 17:30 and 18:30.");		// 08시 부터 08시 30분 까지의 값이 아닐 때
			request.setAttribute("msg", "현재 등록 가능한 시간이 아닙니다.");
			request.setAttribute("url", "h/Main.do");
			return "alert";
		}
		
		
		
//		return viewPage;

		
	}

	@RequestMapping(value = "end.do/{midx}", method = {RequestMethod.GET, RequestMethod.POST})
	public String endHelp(HttpServletRequest httpServletRequest, HelpVo helpVo, HttpSession session, Model model,HttpServletRequest request,
			@PathVariable("midx") Integer midx/*,@ModelAttribute("h_name")String h_name, 
			@ModelAttribute("h_no")String h_no, @ModelAttribute("h_number")String h_number,
			@ModelAttribute("h_userId")String h_userId, @ModelAttribute("h_userName")String h_userName,
			@ModelAttribute("h_comm")String h_comm*/) {
		// 요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는 경우 전달된 값을 그 객체에 매핑시켜줌
		// 이러한 객체를 커맨드 객체라고 함.
		//저장되어 있는 세션 꺼내오기
		session.getAttribute("loginMember");
		session.getAttribute("email");
    	session.getAttribute("name");
    	session.getAttribute("userId");
    	session.getAttribute("access_Token");
		session.getAttribute("m_status");
		session.getAttribute("midx");
		LocalDateTime now = LocalDateTime.now();								// 현재 시간을 불러옴
		System.out.println("now : "+now);
		LocalDate date = LocalDate.now();
		System.out.println("date : "+date);
		DayOfWeek dow = date.getDayOfWeek();
		int daysToAdd = DayOfWeek.SATURDAY.getValue() - dow.getValue();
		LocalDate endDate = date.plusDays(daysToAdd);
        System.out.println("endDate : " + endDate);
        LocalDate startDate = endDate.minusDays(7);
        System.out.println("startDate: "+startDate);
        model.addAttribute("end", endDate);
        model.addAttribute("start", startDate);
        model.addAttribute("duration", "1");
        
		String h_userId = (String)session.getAttribute("userId");
		String h_userName = (String)session.getAttribute("name");
		String h_name = (String)httpServletRequest.getParameter("h_name");
		String h_no = (String)httpServletRequest.getParameter("h_no");
		String h_number = (String)httpServletRequest.getParameter("h_number");
		String h_comm = (String)httpServletRequest.getParameter("h_comm");
		

		// 수발 시작한 시간 별로 나누기 (아침, 점심, 저녁)
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");		// 현재 시간과 분을 추출
		System.out.println("formatter : "+formatter);
		String formattedDateTime = now.format(formatter);
		System.out.println("formattedDateTime : "+formattedDateTime);
		// 아침
		LocalTime BstartTime = LocalTime.parse("08:30", formatter);				// 08시 부터
		System.out.println("BstartTime : "+BstartTime);
		LocalTime BendTime = LocalTime.parse("11:30", formatter);				// 08시 30분까지
		System.out.println("BendTime : "+BendTime);
		// 점심
		LocalTime LstartTime = LocalTime.parse("11:30", formatter);				// 12시 부터
		System.out.println("LstartTime : "+LstartTime);
		LocalTime LendTime = LocalTime.parse("17:30", formatter);				// 12시 30분까지
		System.out.println("LendTime : "+LendTime);
		// 저녁
		LocalTime DstartTime = LocalTime.parse("17:30", formatter);				// 18시 부터
		System.out.println("DstartTime : "+DstartTime);
		LocalTime DendTime = LocalTime.parse("18:30", formatter);				// 18시 30분까지
		System.out.println("DendTime : "+DendTime);
		
		LocalTime checkTime = LocalTime.parse(formattedDateTime, formatter);
		System.out.println("checkTime : "+checkTime);
		
		boolean bcheck = checkTime.isAfter(BstartTime) && checkTime.isBefore(BendTime);
		boolean Lcheck = checkTime.isAfter(LstartTime) && checkTime.isBefore(LendTime);
		boolean Dcheck = checkTime.isAfter(DstartTime) && checkTime.isBefore(DendTime);
		
		System.out.println("bcheck : "+bcheck);
		System.out.println("Lcheck : "+Lcheck);
		System.out.println("Dcheck : "+Dcheck);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		

		if (bcheck == true) {		// 08시 부터 08시 30분 까지의 값일 때
		    System.out.println("The time is between 08:00 and 08:30.");
		    map.put("h_dayTime", "B");
		} else if (Lcheck == true) {
			System.out.println("The time is between 12:00 and 12:30.");
			map.put("h_dayTime", "L");
		} else if (Dcheck == true) {
			System.out.println("The time is between 18:00 and 18:30.");
			map.put("h_dayTime", "D");
		}
		map.put("date", date);
//		map.put("m_name",m_name);
		map.put("h_userId",h_userId);
		map.put("h_userName",h_userName);
		map.put("h_number",h_number);
		map.put("h_no",h_no);
		map.put("h_name",h_name);
		map.put("h_comm",h_comm);
//		map.put("midx",memberService.detail2((String)session.getAttribute("name")).getMidx());
		map.put("midx",memberService.detail3((String)session.getAttribute("name")).getMidx());
		map.put("checkTime",checkTime);
		
//		model.addAttribute("midx", midx);
		
//		model.addAttribute("detail", memberService.detail2((String)session.getAttribute("name")));
		// 시연용
		model.addAttribute("detail", memberService.detail3((String)session.getAttribute("name")));
		model.addAttribute("h_name", h_name);
		model.addAttribute("h_no", h_no);
		model.addAttribute("h_number", h_number);
		model.addAttribute("h_userId", session.getAttribute("userId"));
		model.addAttribute("h_userName",session.getAttribute("name"));
		model.addAttribute("m_name",session.getAttribute("name"));
		model.addAttribute("h_comm", h_comm);
		
		System.out.println("#########################");
		System.out.println("end 접속");
		System.out.println("h_comm : "+h_comm);
//		System.out.println("midx : "+midx);
		System.out.println("h_name : "+h_name);
		System.out.println("h_no : "+h_no);
		System.out.println("h_number : "+h_number);
		System.out.println("h_userId : "+h_userId);
		System.out.println("h_userName : "+h_userName);
		System.out.println("#########################");
		
		int result1 = helpService.selectend(map);
		System.out.println("result1 : "+result1);
		// 글쓰기 전 유효성 검사
		// 시연용으로 삭제
//		if (result1 == 0) {
			// 유효성 한번더
			int result2 = helpService.selectend2(map);
			System.out.println("result2 : "+result2);
			if(result2 >= 1) {
				helpService.endHelp(map);
				memberService.updatePoint(map);
				int result = pointplusService.pointplus(map);
				int result3 = pointService.pointdetail(map);
				if (result == 1 && result3 == 1) {
					return "redirect:/h/List.do/{midx}/{duration}/{start}/{end}";
				}
			}else {
				request.setAttribute("msg", "수발 등록을 먼저 해주세요");
				request.setAttribute("url", "h/Insert.do/"+midx);
				return "alert";
			}
			
//		}else {
//			request.setAttribute("msg", "이미 수발 완료한 침상입니다.");
//			request.setAttribute("url", "h/Main.do");
//			return "alert";
//		}
		
		return "redirect:/h/List.do/{midx}/{duration}/{start}/{end}";
	}
//	
	@RequestMapping(value="List.do/{midx}")
	public ModelAndView list2(ModelAndView mav, HttpSession session, HttpServletRequest request,
			@PathVariable("midx") Integer midx,HelpVo helpVo, 
			@RequestParam(name = "start") String start, 
			@RequestParam(name = "end") String end) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		LocalDate endDate = LocalDate.parse(end, DateTimeFormatter.ISO_DATE);
        System.out.println("endDate : " + endDate);
        LocalDate startDate = LocalDate.parse(start, DateTimeFormatter.ISO_DATE);
        System.out.println("startDate: "+startDate); 
		mav.addObject("end", endDate);
		mav.addObject("start", startDate);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("midx", midx);
		
		// 여기
		
		List<HelpVo> helplist = helpService.list(map);
		request.setAttribute("helplist", helplist);
		mav.addObject("helplist", helplist);
		System.out.println("helplist : "+helplist);
		ArrayList<HelpVo> aList = new ArrayList<>();
		aList.addAll(helplist);
		request.setAttribute("aList", aList);
		System.out.println("aList : "+aList);
		List<HelpVo> listInsert = helpService.listInsert(map);
		mav.addObject("listInsert", listInsert);
		System.out.println("listInsert : "+listInsert);
		mav.setViewName("h/List");
//		String lastDate = helpService.lastDate(helpVo);
		Date lastDate = helpService.lastDate(map);
		mav.addObject("lastDate", lastDate);
		// 이번 주 데이터를 가져오기 위해 추가
		int weekCount = helpService.weekCount(map);
		// 이번 달 데이터를 가져오기 위해 추가
		int monthCount = helpService.monthCount(map);
		// 이번 년도 데이터를 가져오기 위해 추가
		int yearCount = helpService.yearCount(map);
		
//		mav.addObject("detail", memberService.detail2((String)session.getAttribute("name")));
		// 시연용
		mav.addObject("detail", memberService.detail3((String)session.getAttribute("name")));
		mav.addObject("midx", session.getAttribute("midx"));
		mav.addObject("email", session.getAttribute("email"));
		mav.addObject("m_name", session.getAttribute("name"));
		mav.addObject("h_userName",session.getAttribute("name"));
		mav.addObject("userId", session.getAttribute("userId"));
		mav.addObject("loginMember", session.getAttribute("loginMember"));
		mav.addObject("weekCount", weekCount);
		mav.addObject("monthCount", monthCount);
		mav.addObject("yearCount", yearCount);

		session.removeAttribute("h_name");
		session.removeAttribute("h_no");
		session.removeAttribute("h_number");
		System.out.println("--------------8");
		return mav;
	}

	
	
	@RequestMapping(value="List.do/{midx}/{duration}/{start}/{end}")
	public ModelAndView list(ModelAndView mav, HttpSession session, HttpServletRequest request, 
			@PathVariable("midx") Integer midx,
			@PathVariable("duration") int duration, HelpVo helpVo, 
			@PathVariable(name = "start") String start, 
			@PathVariable(name = "end") String end) throws Exception {
		System.out.println("-----------------1");
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		if(duration >= 7) {
			if(duration == 7) {
				// 금주 누적 데이터 구하기
				// 이번주 토요일 구하기
				System.out.println("-----------------2");
				LocalDate date = LocalDate.now();
				DayOfWeek dow = date.getDayOfWeek();
				int daysToAdd = DayOfWeek.SATURDAY.getValue() - dow.getValue();
				if (daysToAdd < 0) {
		            daysToAdd += 7;
		        }
		        LocalDate endDate = date.plusDays(daysToAdd);
		        System.out.println("endDate : " + endDate);
		        LocalDate startDate = endDate.minusDays(7);
		        System.out.println("startDate: "+startDate);
				mav.addObject("end", endDate);
				mav.addObject("start", startDate);
				map.put("startDate", startDate);
				map.put("endDate", endDate);
				map.put("duration", duration);
			}else if(duration == 30) {
				System.out.println("-----------------3");
				// 금월 누적 데이터 구하기
				// 이번 달을 나타내는 YearMonth 객체 생성
				YearMonth thisMonth = YearMonth.now();
				// 이번 달의 첫 날짜와 마지막 날짜 계산
				LocalDate startDate = thisMonth.atDay(1);
				LocalDate endDate = thisMonth.atEndOfMonth();
				mav.addObject("end", endDate);
				mav.addObject("start", startDate);
				request.setAttribute("start", startDate);
				request.setAttribute("end", endDate);
				map.put("startDate", startDate);
				map.put("endDate", endDate);
				map.put("duration", duration);
			}else if(duration == 365) {
				System.out.println("-----------------4");
				// 연간 누적 데이터 구하기
				LocalDate now = LocalDate.now();
				LocalDate startDate = now.withDayOfYear(1);
				LocalDate endDate = now.withDayOfYear(now.lengthOfYear());
				mav.addObject("end", endDate);
				mav.addObject("start", startDate);
				request.setAttribute("start", startDate);
				request.setAttribute("end", endDate);
				mav.addObject("duration", duration);
				map.put("startDate", startDate);
				map.put("endDate", endDate);
				map.put("duration", duration);
				
			}
			System.out.println("-----------------5");
			//저장되어 있는 세션 꺼내오기
			session.getAttribute("loginMember");
			session.getAttribute("email");
	    	session.getAttribute("nickname");
	    	session.getAttribute("access_Token");
			session.getAttribute("m_status");
//			session.getAttribute("midx");
			session.getAttribute("name");
			map.put("midx", midx);
			map.put("duration", duration);

			mav.addObject("duration", duration);
			
			//여기
			
			List<HelpVo> helplist = helpService.list(map);
			mav.addObject("helplist", helplist);
			request.setAttribute("helplist", helplist);
			ArrayList<HelpVo> aList = new ArrayList<>();
			aList.addAll(helplist);
			request.setAttribute("aList", aList);
			System.out.println("aList : "+aList);
			System.out.println("helplist : "+helplist);
		}else if(duration <= 6 && duration >=1){
			System.out.println("-----------------6");
			// 1개월, 3개월, 6개월 검색
			LocalDate endDate = LocalDate.now();
			System.out.println("endDate : "+endDate);
			LocalDate startDate = endDate.minusMonths(duration);
			System.out.println("startDate: "+startDate);
			mav.addObject("end", endDate);
			mav.addObject("start", startDate);
			mav.addObject("duration", duration);
			request.setAttribute("start", startDate);
			request.setAttribute("end", endDate);
			System.out.println("end: "+end);
			System.out.println("start: "+start);
			System.out.println("duration: "+duration);
			session.setAttribute("start", startDate);
			session.setAttribute("end", endDate);
			//저장되어 있는 세션 꺼내오기
			session.getAttribute("loginMember");
			session.getAttribute("email");
	    	session.getAttribute("name");
	    	session.getAttribute("userId");
	    	session.getAttribute("access_Token");
			session.getAttribute("m_status");
			session.getAttribute("midx");
			
			map.put("midx", midx);
			map.put("startDate", startDate);
			map.put("endDate", endDate);
			map.put("duration", duration);
			
			// 여기
			
			List<HelpVo> helplist = helpService.list(map);
			mav.addObject("helplist", helplist);
			request.setAttribute("helplist", helplist);
			ArrayList<HelpVo> aList = new ArrayList<>();
			aList.addAll(helplist);
			request.setAttribute("aList", aList);
			System.out.println("aList : "+aList);
			System.out.println("helplist : "+helplist);
		}else {
			System.out.println("-----------------7");
			// duration 값이 0이면(직접설정)
			
			System.out.println("duration : "+duration);
			System.out.println("start: "+start);
			System.out.println("end : "+end);
			
			LocalDate endDate = LocalDate.parse(end, DateTimeFormatter.ISO_DATE);
	        System.out.println("endDate : " + endDate);
	        LocalDate startDate = LocalDate.parse(start, DateTimeFormatter.ISO_DATE);
	        System.out.println("startDate: "+startDate);
			mav.addObject("end", endDate);
			mav.addObject("start", startDate);
			request.setAttribute("start", startDate);
			request.setAttribute("end", endDate);
			map.put("startDate", startDate);
			map.put("endDate", endDate);
			map.put("midx", midx);
			
			// 여기
			
			List<HelpVo> helplist = helpService.list(map);
			mav.addObject("helplist", helplist);
			ArrayList<HelpVo> aList = new ArrayList<>();
			aList.addAll(helplist);
			request.setAttribute("aList", aList);
			System.out.println("aList : "+aList);
			request.setAttribute("helplist", helplist);
			System.out.println("helplist : "+helplist);
		}
		
		mav.setViewName("h/List");
		List<HelpVo> listInsert = helpService.listInsert(map);
		mav.addObject("listInsert", listInsert);
		System.out.println("listInsert : "+listInsert);
		
//		String lastDate = helpService.lastDate(helpVo);
		Date lastDate = helpService.lastDate(map);
		mav.addObject("lastDate", lastDate);
		mav.addObject("duration", duration);
		// 이번 주 데이터를 가져오기 위해 추가
		int weekCount = helpService.weekCount(map);
		// 이번 달 데이터를 가져오기 위해 추가
		int monthCount = helpService.monthCount(map);
		// 이번 년도 데이터를 가져오기 위해 추가
		int yearCount = helpService.yearCount(map);
//		mav.addObject("detail", memberService.detail2((String)session.getAttribute("name")));
		// 시연용
		mav.addObject("detail", memberService.detail3((String)session.getAttribute("name")));
		mav.addObject("weekCount", weekCount);
		mav.addObject("monthCount", monthCount);
		mav.addObject("yearCount", yearCount);
		request.setAttribute("weekCount", weekCount);
		request.setAttribute("monthCount", monthCount);
		request.setAttribute("yearCount", yearCount);
		
		session.removeAttribute("h_name");
		session.removeAttribute("h_no");
		session.removeAttribute("h_number");
		System.out.println("--------------8");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="ListAjax")
	public AjaxResponse listAjax(HttpSession session, HttpServletRequest request, Model md, @RequestParam("midx") Integer midx,
			@RequestParam("start") String start, @RequestParam("end") String end, @RequestParam("duration") int duration) {
		AjaxResponse response = new AjaxResponse();
		response.setResult("N");		
//		String result = "N";

		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("Ajax 호출됨");
		
		System.out.println("midx 값 : " + midx);
		System.out.println("start 값 : " + start);
		System.out.println("end 값 : " + end);
		System.out.println("duration 값 : " + duration);
		map.put("midx", midx);
		map.put("startDate", start);
		map.put("endDate", end);
		map.put("duration", duration);
		
		List<HelpVo> helplist = helpService.list(map);
		ArrayList<HelpVo> aList = new ArrayList<>();
		// list 생성 / 초기화
		System.out.println("초기 aList : "+aList);
		// 수발 리스트 넣음
		aList.addAll(helplist);
		request.setAttribute("aList", aList);
		System.out.println("마지막 aList : " + aList);
//		response.setHelplist(Helplist);
		response.setHelplist(aList);
		request.setAttribute("helplist", helplist);
		System.out.println("helplist" + helplist);
		
		int flag = helpService.listselect(map);
		if(flag >= 1) response.setResult("Y");
//		if(flag >= 1) result = ("Y");
		System.out.println("flag : "+ flag);
		System.out.println("result : "+ response.getResult());
//		System.out.println("result : "+ result);
		return response;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
