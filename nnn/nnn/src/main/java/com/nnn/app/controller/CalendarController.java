package com.nnn.app.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.CalenService;
import com.nnn.app.service.MemberService;
import com.nnn.app.vo.AjaxResponse15;
import com.nnn.app.vo.AjaxResponse17;
import com.nnn.app.vo.AjaxResponse19;
import com.nnn.app.vo.CalendarVo;

@Controller
@RequestMapping(value = "a/*")
public class CalendarController {
	
	
	@Autowired(required = false)
	private CalenService calenService;
	private MemberService memberService;

	
//	@GetMapping(params="method=list")
//	public String list(Model d, CalendarVo calendarVo) {
//		d.addAttribute("list", calenService.calenList(calendarVo));
//		return "a/fullcalendar";
//	}
	
	@RequestMapping(value = "Calendar.do")
	public ModelAndView list(ModelAndView mv, HttpServletRequest request, HttpSession session) throws Exception{
		List<CalendarVo> calendar = null;
		try {
			calendar = calenService.calenList();
			request.setAttribute("calendarList", calendar);
			System.out.println("calendar : "+ calendar);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<CalendarVo> list2 = calenService.calenlist2();
		mv.addObject("list", list2);
		System.out.println(list2);
		System.out.println(session.getAttribute("name"));
//		mv.addObject("detail", memberService.detail2((String)session.getAttribute("name")));
		// 시연용
		session.getAttribute("loginMember");
		session.getAttribute("email");
    	session.getAttribute("name");
    	session.getAttribute("m_status");
    	session.getAttribute("midx");
    	session.getAttribute("userId");
    	session.getAttribute("m_no");
    	session.getAttribute("m_point");
    	session.getAttribute("m_in");
    	session.getAttribute("m_de");
    	mv.addObject("calendar", calendar);
		mv.setViewName("a/fullcalendar");
		return mv;
	}
	

	
	@RequestMapping(value = "input", method = RequestMethod.POST)
	public String input(@RequestBody CalendarVo CalendarVo/*List<Map<String, Object>> calendarData*/, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
//		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		System.out.println("input ajax");
		System.out.println("Received Request Body: " + CalendarVo);
		System.out.println(CalendarVo.getAmb());
		System.out.println(CalendarVo.getWriter());
		System.out.println(CalendarVo.getContent());
		System.out.println(CalendarVo.getRun());
		System.out.println(CalendarVo.getAgency());
		System.out.println(CalendarVo.getPrepare());
		System.out.println(CalendarVo.getPatientName());
		System.out.println(CalendarVo.getPatientRoom());
		System.out.println(CalendarVo.getPatientNumber());
		System.out.println(CalendarVo.getStarttime());
		System.out.println(CalendarVo.getEndtime());
		System.out.println(CalendarVo.getStartdate());
		System.out.println(CalendarVo.getEnddate());
		System.out.println(CalendarVo.toString());
		
//		String[] testprepare = request.getParameterValues("prepare");
//		System.out.println("testprepare =    "+testprepare);
		String eventName = (String) CalendarVo.getAmb();
		String writer = (String) CalendarVo.getWriter();
		String content = (String) CalendarVo.getContent();
		String run = (String) CalendarVo.getRun();
		String agency = (String) CalendarVo.getAgency();
//		List<String> prepare = CalendarVo.getPrepare();
		String prepare = (String) CalendarVo.getPrepare();
		String patientName = (String) CalendarVo.getPatientName();
		String patientRoom = (String) CalendarVo.getPatientRoom();
		String patientNumber = (String) CalendarVo.getPatientNumber();
		String starttime = (String) CalendarVo.getStarttime();
		String endtime = (String) CalendarVo.getEndtime();
		String startdate = CalendarVo.getStartdate();
		String enddate = CalendarVo.getEnddate();
				
				
				
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", eventName);
		map.put("writer", writer);
		map.put("content", content);
		map.put("run", run);
		map.put("agency", agency);
		map.put("prepare", prepare);
		map.put("patientName", patientName);
		map.put("patientRoom", patientRoom);
		map.put("patientNumber", patientNumber);
		map.put("starttime", starttime);
		map.put("endtime", endtime);
		map.put("startdate", startdate);
		map.put("enddate", enddate);
		
		
		int select = calenService.calenselect(map);
		System.out.println(select);
		if(select != 1) {
			System.out.println("DB에 중복없음");
			int result = calenService.caleninput(map);
			System.out.println(result);
			if (result >= 1) {
				// 성공
				System.out.println("성공");
	//			response.setContentType("text/html; charset=UTF-8");
	  //          PrintWriter out = response.getWriter();
	 //           out.println("<script>alert('등록완료'); location.href = 'a/Calendar.do';</script>");
	//            out.flush(); 
//				request.setAttribute("msg", "등록이 완료되었습니다.");
//	    		request.setAttribute("url", "a/Calendar.do");
//	    		return "alertAndGo";
			}else {
				// 실패
				System.out.println("실패");
			}
			
		}else {
			System.out.println("중복");
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('중복'); history.go(-1);</script>");
            out.flush(); 
		}
		
		
		return "a/input";
		
	}
	
	@RequestMapping(value = "delete", consumes = "application/json")
	public String delete(@RequestBody List<Map<String, Object>> data, HttpServletRequest request) throws Exception {
		for (Map<String, Object> list : data) {
			request.setCharacterEncoding("UTF-8");
			System.out.println("delete  - ajax");
//			
			String id = (String) list.get("id");
			String writer = (String) list.get("writer");	// DB에 담겨있는 작성자
			System.out.println("writer : "+writer);
			String user = (String) list.get("user");		// 현재 로그인한 사용자
			System.out.println("user : "+user);
			Map<String, Object> map = new HashMap<String, Object>();
			try{
	            int number = Integer.parseInt(id);
	            System.out.println(number);
	            map.put("id", number);
	        }
	        catch (NumberFormatException ex){
	            ex.printStackTrace();
	        }
			
			if(writer.equals(user)) {
				int delete = calenService.calendelete(map);
				if(delete != 1) {
					System.out.println("삭제 실패");
				}else {
					System.out.println("삭제 성공");
					
				}
			}else {
				System.out.println("일정 작성자와 현재 로그인한 작성자가 다름");
				
			}
			
			
			
		}
		
		return "a/delete";
	}
	
	@RequestMapping("/calendar2")
	public ModelAndView claendar2(ModelAndView mv) {
		mv.setViewName("a/fullcalendar2");
		
		return mv;
	}
	
	@RequestMapping("/calendar3")
	public ModelAndView claendar3(ModelAndView mv) {
		mv.setViewName("a/fullcalendar");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="selectCalendar/{startStr}")
	public AjaxResponse15 selectCalendar(@PathVariable("startStr") String startStr, HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse15 response = new AjaxResponse15();
		response.setResult("Y");		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startStr", startStr);
		List<CalendarVo> list = calenService.selectCalendar(map);
		System.out.println(list);
		response.setSelectCalendar(list);
		
		return response;
	}
	
	@RequestMapping(value="amb")
	public ModelAndView amb(ModelAndView mv) {
		
		
		
		mv.setViewName("a/amb");
		return mv;
	}

	@RequestMapping(value="amb2")
	public ModelAndView amb2(ModelAndView mv, HttpSession session) {
		session.getAttribute("loginMember");
		List<CalendarVo> calendar = calenService.calenList();
		
		
		mv.addObject("calendar",calendar);
		mv.setViewName("a/amb2");
		return mv;
	}
	
	@RequestMapping(value="insert")
	@ResponseBody
	public String calendarInsert(@RequestBody CalendarVo vo) {
		String response = "";
		Map<String, Object> map = new HashMap<String, Object>();
		String agency = vo.getAgency();			// 호성전주병원
		String content = vo.getContent();			// 
		String enddate = vo.getEnddate();			// 2024-1-29
		String endtime = vo.getEndtime();			// 
		String patientName = vo.getPatientName();		// 
		String patientNumber = vo.getPatientNumber();	// 
		String patientRoom = vo.getPatientRoom();		// 
		String prepare = vo.getPrepare();			// 산소, 석션
		String run = vo.getRun();				// 외진
		String startdate = vo.getStartdate();		// 2024-1-29
		String starttime = vo.getStarttime();		// 
		String sub = vo.getSub();				// 
		String writer = vo.getWriter();			// 
		String amb = vo.getAmb();				// 
		
		map.put("agency", agency);
		map.put("content", content);
		map.put("enddate", enddate);
		map.put("endtime", endtime);
		map.put("patientName", patientName);
		map.put("patientNumber", patientNumber);
		map.put("patientRoom", patientRoom );
		map.put("prepare", prepare);
		map.put("run", run);
		map.put("startdate", startdate);
		map.put("starttime", starttime);
		map.put("sub", sub);
		map.put("writer", writer);
		map.put("amb", amb);
		
		int flag = 0;
		flag = calenService.caleninput(map);
		
		
		
		return response;
	}
	
	@RequestMapping(value="")
	@ResponseBody
	public AjaxResponse17 ambList(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse17 response = new AjaxResponse17();
		response.setResult("Y");
		
		
		return response;
	}
	
	
}
