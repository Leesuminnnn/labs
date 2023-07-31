package com.nnn.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.BoardService;
import com.nnn.app.service.HelpService;
import com.nnn.app.service.MemberService;
import com.nnn.app.service.PointplusService;
import com.nnn.app.vo.BoardVo;


@RequestMapping(value="b/*")
@Component
@Controller
public class BoardController {
	
	private HelpService helpService;
	private MemberService memberService;
	private PointplusService pointplusService;
	private BoardService boardService;
	
	@Autowired
	public BoardController(HelpService helpService, MemberService memberService, PointplusService pointplusService, BoardService boardService) {
		this.helpService = helpService;
		this.memberService = memberService;
		this.pointplusService = pointplusService;
		this.boardService = boardService;
	}

	@RequestMapping(value="List.do")
	public ModelAndView list2(ModelAndView mav, HttpSession session, 
			BoardVo boardVo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		

		List<BoardVo> boardlist = boardService.boardlist(map);
		mav.addObject("boardlist", boardlist);
		mav.addObject("detail", memberService.detail2((String) session.getAttribute("name")));
		mav.setViewName("b/List");

		mav.addObject("midx", session.getAttribute("midx"));
		mav.addObject("loginMember", session.getAttribute("loginMember"));
		
		System.out.println("--------------8");
		return mav;
	}
	
	@RequestMapping(value="View.do/{bidx}")
	public String View(Model model, HttpSession session, @PathVariable("bidx") Integer bidx, BoardVo vo) {
		
		System.out.println("공지사항 상세");
		System.out.println("bidx  :  " + bidx);
		model.addAttribute("vo", boardService.View(vo));
		
		return "b/View";
	}
	
//	
//	@RequestMapping(value="List.do/{midx}/{duration}/{start}/{end}")
//	public ModelAndView list(ModelAndView mav, HttpSession session, 
//			@PathVariable("midx") int midx,
//			@PathVariable("duration") int duration, HelpVo helpVo, 
//			@PathVariable(name = "start") String start, 
//			@PathVariable(name = "end") String end) throws Exception {
//		System.out.println("-----------------1");
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		
//		if(duration >= 7) {
//			if(duration == 7) {
//				// 금주 누적 데이터 구하기
//				// 이번주 토요일 구하기
//				System.out.println("-----------------2");
//				LocalDate date = LocalDate.now();
//				DayOfWeek dow = date.getDayOfWeek();
//				int daysToAdd = DayOfWeek.SATURDAY.getValue() - dow.getValue();
//				if (daysToAdd < 0) {
//		            daysToAdd += 7;
//		        }
//		        LocalDate endDate = date.plusDays(daysToAdd);
//		        System.out.println("endDate : " + endDate);
//		        LocalDate startDate = endDate.minusDays(7);
//		        System.out.println("startDate: "+startDate);
//				mav.addObject("end", endDate);
//				mav.addObject("start", startDate);
//				map.put("startDate", startDate);
//				map.put("endDate", endDate);
//				map.put("duration", duration);
//			}else if(duration == 30) {
//				System.out.println("-----------------3");
//				// 금월 누적 데이터 구하기
//				// 이번 달을 나타내는 YearMonth 객체 생성
//				YearMonth thisMonth = YearMonth.now();
//				// 이번 달의 첫 날짜와 마지막 날짜 계산
//				LocalDate startDate = thisMonth.atDay(1);
//				LocalDate endDate = thisMonth.atEndOfMonth();
//				mav.addObject("end", endDate);
//				mav.addObject("start", startDate);
//				map.put("startDate", startDate);
//				map.put("endDate", endDate);
//				map.put("duration", duration);
//			}else if(duration == 365) {
//				System.out.println("-----------------4");
//				// 연간 누적 데이터 구하기
//				LocalDate now = LocalDate.now();
//				LocalDate startDate = now.withDayOfYear(1);
//				LocalDate endDate = now.withDayOfYear(now.lengthOfYear());
//				mav.addObject("end", endDate);
//				mav.addObject("start", startDate);
//				mav.addObject("duration", duration);
//				map.put("startDate", startDate);
//				map.put("endDate", endDate);
//				map.put("duration", duration);
//				
//			}
//			System.out.println("-----------------5");
//			//저장되어 있는 세션 꺼내오기
//			session.getAttribute("loginMember");
//			session.getAttribute("email");
//	    	session.getAttribute("nickname");
//	    	session.getAttribute("access_Token");
//			session.getAttribute("m_status");
//			session.getAttribute("midx");
//			
//			map.put("midx", midx);
//			map.put("duration", duration);
//
//			mav.addObject("duration", duration);
//			List<HelpVo> helplist = helpService.list(map);
//			mav.addObject("helplist", helplist);
//		}else if(duration <= 6 && duration >=1){
//			System.out.println("-----------------6");
//			// 1개월, 3개월, 6개월 검색
//			LocalDate endDate = LocalDate.now();
//			System.out.println("endDate : "+endDate);
//			LocalDate startDate = endDate.minusMonths(duration);
//			System.out.println("startDate: "+startDate);
//			mav.addObject("end", endDate);
//			mav.addObject("start", startDate);
//			mav.addObject("duration", duration);
//			System.out.println("end: "+end);
//			System.out.println("start: "+start);
//			System.out.println("duration: "+duration);
//			session.setAttribute("start", startDate);
//			session.setAttribute("end", endDate);
//			//저장되어 있는 세션 꺼내오기
//			session.getAttribute("loginMember");
//			session.getAttribute("email");
//	    	session.getAttribute("name");
//	    	session.getAttribute("userId");
//	    	session.getAttribute("access_Token");
//			session.getAttribute("m_status");
//			session.getAttribute("midx");
//			
//			map.put("midx", midx);
//			map.put("startDate", startDate);
//			map.put("endDate", endDate);
//			map.put("duration", duration);
//
//			List<HelpVo> helplist = helpService.list(map);
//			mav.addObject("helplist", helplist);
//		}else {
//			System.out.println("-----------------7");
//			// duration 값이 0이면(직접설정)
//			
//			System.out.println("duration : "+duration);
//			System.out.println("start: "+start);
//			System.out.println("end : "+end);
//
//			LocalDate endDate = LocalDate.parse(end, DateTimeFormatter.ISO_DATE);
//	        System.out.println("endDate : " + endDate);
//	        LocalDate startDate = LocalDate.parse(start, DateTimeFormatter.ISO_DATE);
//	        System.out.println("startDate: "+startDate);
//			mav.addObject("end", endDate);
//			mav.addObject("start", startDate);
//			map.put("startDate", startDate);
//			map.put("endDate", endDate);
//			map.put("midx", midx);
//	
//			List<HelpVo> helplist = helpService.list(map);
//			mav.addObject("helplist", helplist);
//		}
//		
//		mav.setViewName("h/List");
////		String lastDate = helpService.lastDate(helpVo);
//		Date lastDate = helpService.lastDate(helpVo);
//		mav.addObject("lastDate", lastDate);
//		mav.addObject("duration", duration);
//		// 이번 주 데이터를 가져오기 위해 추가
//		int weekCount = helpService.weekCount(helpVo);
//		// 이번 달 데이터를 가져오기 위해 추가
//		int monthCount = helpService.monthCount(helpVo);
//		// 이번 년도 데이터를 가져오기 위해 추가
//		int yearCount = helpService.yearCount(helpVo);
//		mav.addObject("midx", session.getAttribute("midx"));
//		mav.addObject("email", session.getAttribute("email"));
//		mav.addObject("name", session.getAttribute("name"));
//		mav.addObject("userId", session.getAttribute("userId"));
//		mav.addObject("loginMember", session.getAttribute("loginMember"));
//		mav.addObject("weekCount", weekCount);
//		mav.addObject("monthCount", monthCount);
//		mav.addObject("yearCount", yearCount);
//		
//		System.out.println("--------------8");
//		return mav;
//	}
	
}
