package com.nnn.app.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.CalenService;
import com.nnn.app.service.HelpService;
import com.nnn.app.service.ImageService;
import com.nnn.app.service.MemberService;
import com.nnn.app.service.PointService;
import com.nnn.app.service.PointplusService;
import com.nnn.app.service.TestService;
import com.nnn.app.vo.AjaxResponse;
import com.nnn.app.vo.CalendarVo;
import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.HelpVo;
import com.nnn.app.vo.Paging;
import com.nnn.app.vo.Pointdetail;
import com.nnn.app.vo.TestVo;
import com.nnn.app.vo.WrittenVo;

@Controller
@RequestMapping(value = "t/*")
public class TestController {
	private MemberService memberService;
	private PointplusService pointplusService;
	private TestService testService;
	private AES256Util aes;
	private ImageService imageService;
	private HelpService helpService;
	private PointService pointService;
	private CalenService calenService;
	
	@Autowired
	public TestController(MemberService memberService, PointplusService pointplusService, TestService testService, AES256Util aes, ImageService imageService,
			HelpService helpService, PointService pointService, CalenService calenService) {
		this.memberService = memberService;
		this.pointplusService = pointplusService;
		this.testService = testService;
		this.aes = aes;
		this.imageService = imageService;
		this.helpService = helpService;
		this.pointService = pointService;
		this.calenService = calenService;
	}

	@RequestMapping(value = "test.do")
	public ModelAndView test(ModelAndView mav, HttpSession session, 
			@RequestParam(name="param1", defaultValue = "")String param1, 
			@RequestParam(name="param2", defaultValue = "")String param2,
			@RequestParam(name="param3", defaultValue = "")String param3,
			@RequestParam(name="param4", defaultValue = "")String param4,
			@RequestParam(name="param5", defaultValue = "")String param5) throws Exception{

		System.out.println("written oath 페이지");
		mav.addObject("param1",param1);
		mav.addObject("param2",param2);
		mav.addObject("param3",param3);
		mav.addObject("param4",param4);
		mav.addObject("param5",param5);
		
		mav.setViewName("t/Test");
		return mav;
	}
	
	@RequestMapping(value = "TestAction.do")
	public String TestAction(ModelAndView mav, HttpSession session, TestVo vo) throws Exception{
		// 암호화
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		// view에서 받은 데이터를 담아서 넘겨준다.
		
			
		String text1 = vo.getCs_data_01();
		
		
		String text2 = vo.getCs_data_06();
		String text3 = vo.getCs_data_07();
		String text4 = vo.getCs_data_10();
		String text5 = vo.getCs_data_12();
		String text6 = vo.getCs_data_15();
		String text7 = vo.getCs_data_29();
		
		// 암호화된 데이터를 변수에 담는다.
		String cipherText1 = aes128.encrypt(text1);
		String cipherText2 = aes128.encrypt(text2);
		String cipherText3 = aes128.encrypt(text3);
		String cipherText4 = aes128.encrypt(text4);
		String cipherText5 = aes128.encrypt(text5);
		String cipherText6 = aes128.encrypt(text6);
		String cipherText7 = aes128.encrypt(text7);
		
		// 담은 변수를 DB에 넘겨준다
		vo.setCs_data_01(cipherText1);
		vo.setCs_data_06(cipherText2);
		vo.setCs_data_07(cipherText3);
		vo.setCs_data_10(cipherText4);
		vo.setCs_data_12(cipherText5);
		vo.setCs_data_15(cipherText6);
		vo.setCs_data_29(cipherText7);
		
		System.out.println("##################################################");
		System.out.println(text1);
		System.out.println(cipherText1);
		System.out.println(aes128.decrypt(cipherText1));
		System.out.println(text2);
		System.out.println(cipherText2);
		System.out.println(aes128.decrypt(cipherText2));
		System.out.println(text3);
		System.out.println(cipherText3);
		System.out.println(aes128.decrypt(cipherText3));
		System.out.println(text4);
		System.out.println(cipherText4);
		System.out.println(aes128.decrypt(cipherText4));
		System.out.println(text5);
		System.out.println(cipherText5);
		System.out.println(aes128.decrypt(cipherText5));
		System.out.println(text6);
		System.out.println(cipherText6);
		System.out.println(aes128.decrypt(cipherText6));
		System.out.println(text7);
		System.out.println(cipherText7);
		System.out.println(aes128.decrypt(cipherText7));
		System.out.println("##################################################");
		
		testService.insert(vo);
		
		
		return "redirect:/c/CounselList.do";
	}
	@RequestMapping(value="TestList.do")
	public ModelAndView List(ModelAndView mav
			) throws Exception {
		TestVo vo = new TestVo();
		
		List<TestVo> cslist = testService.list(vo);
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		// DB데이터 복호화
		// 이상한 오류가 뜨는 이유는 암호화된 데이터가 한개라도 없을 경우 오류가 발생한다.(암호화가 되어있는 데이터와 암호화가 되어있지 않은 데이터가 공존할 경우)
		for (TestVo vo1 : cslist) {
			String decryptedCs_data_01 = aes128.decrypt(vo1.getCs_data_01());
			String decryptedCs_data_06 = aes128.decrypt(vo1.getCs_data_06());
			String decryptedCs_data_07 = aes128.decrypt(vo1.getCs_data_07());
			String decryptedCs_data_10 = aes128.decrypt(vo1.getCs_data_10());
			String decryptedCs_data_12 = aes128.decrypt(vo1.getCs_data_12());
			String decryptedCs_data_15 = aes128.decrypt(vo1.getCs_data_15());
			String decryptedCs_data_29 = aes128.decrypt(vo1.getCs_data_29());
			
			System.out.println("vo1.getCs_data_01() : "+vo1.getCs_data_01());
			// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
			vo1.setCs_data_01(decryptedCs_data_01);
			vo1.setCs_data_06(decryptedCs_data_06);
			vo1.setCs_data_07(decryptedCs_data_07);
			vo1.setCs_data_10(decryptedCs_data_10);
			vo1.setCs_data_12(decryptedCs_data_12);
			vo1.setCs_data_15(decryptedCs_data_15);
			vo1.setCs_data_29(decryptedCs_data_29);
		}
   
		mav.addObject("cslist", cslist);
		mav.setViewName("t/TestList");
		System.out.println("cslist : "+cslist);
		
		return mav;
	}
	// list 검색기능
	@RequestMapping(value="TestListsearch.do")
	public ModelAndView Listsearch(ModelAndView mav, @RequestParam(value="keyword1", defaultValue="") String keyword1,
			@RequestParam(value="keyword2", defaultValue="") String keyword2,
			@RequestParam(value="keyword3", defaultValue="") String keyword3,
			@RequestParam(value="type1", defaultValue="") String type1,
			@RequestParam(value="type2", defaultValue="") String type2,
			@RequestParam(value="type3", defaultValue="") String type3
			,
			
			Criteria cri
			) throws Exception {
		System.out.println("cri = " + cri);
		System.out.println("####################type1 : "+cri.getType1());
		System.out.println("####################keyword1 : "+cri.getKeyword1());
		System.out.println("####################type2 : "+cri.getType2());
		System.out.println("####################keyword2 : "+cri.getKeyword2());
		System.out.println("####################type3 : "+cri.getType3());
		System.out.println("####################keyword3 : "+cri.getKeyword3());
		WrittenVo vo = new WrittenVo();
		Map<String, Object> map = new HashMap<String, Object>();
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		Paging pageMaker = new Paging();
		
		
		if(!keyword1.isEmpty()) {
			cri.setKeyword1(aes128.encrypt(keyword1));
			map.put("keyword1", aes128.encrypt(cri.getKeyword1()));
			System.out.println("################################1");
			System.out.println(aes128.encrypt(cri.getKeyword1()));
		}else {
			map.put("keyword1", keyword1);
			System.out.println("################################2");
		}
		if(!keyword2.isEmpty()) {
			cri.setKeyword2(aes128.encrypt(keyword2));
			map.put("keyword2", aes128.encrypt(cri.getKeyword2()));
			System.out.println("################################3");
			System.out.println(aes128.encrypt(cri.getKeyword2()));
		}else {
			map.put("keyword2", keyword2);
			System.out.println("################################4");
		}
		if(!keyword3.isEmpty()) {
			cri.setKeyword3(aes128.encrypt(keyword3));
			map.put("keyword3", aes128.encrypt(cri.getKeyword3()));
			System.out.println("################################5");
			System.out.println(aes128.encrypt(cri.getKeyword3()));
		}else {
			map.put("keyword3", keyword3);
			System.out.println("################################6");
		}
		
//		List<Map<String, Object>> cslist = canvasService.listsearch(cri);
		List<TestVo> cslist = testService.listsearch(cri);
		
		
		// DB데이터 복호화
		// 이상한 오류가 뜨는 이유는 암호화된 데이터가 한개라도 없을 경우 오류가 발생한다.(암호화가 되어있는 데이터와 암호화가 되어있지 않은 데이터가 공존할 경우)
		for (TestVo vo1 : cslist) {
			String decryptedCs_data_01 = aes128.decrypt(vo1.getCs_data_01());
			String decryptedCs_data_06 = aes128.decrypt(vo1.getCs_data_06());
			String decryptedCs_data_07 = aes128.decrypt(vo1.getCs_data_07());
			String decryptedCs_data_10 = aes128.decrypt(vo1.getCs_data_10());
			String decryptedCs_data_12 = aes128.decrypt(vo1.getCs_data_12());
			String decryptedCs_data_15 = aes128.decrypt(vo1.getCs_data_15());
			String decryptedCs_data_29 = aes128.decrypt(vo1.getCs_data_29());
			
			// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
			vo1.setCs_data_01(decryptedCs_data_01);
			vo1.setCs_data_06(decryptedCs_data_06);
			vo1.setCs_data_07(decryptedCs_data_07);
			vo1.setCs_data_10(decryptedCs_data_10);
			vo1.setCs_data_12(decryptedCs_data_12);
			vo1.setCs_data_15(decryptedCs_data_15);
			vo1.setCs_data_29(decryptedCs_data_29);
		}
   
		mav.addObject("keyword1", keyword1);
		mav.addObject("cslist", cslist);
		mav.setViewName("t/TestList");
		System.out.println("cslist : "+cslist);
		
		return mav;
	}
	@RequestMapping(value="Helptest.do/{midx}")
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
		mav.setViewName("t/Helptest");
//		String lastDate = helpService.lastDate(helpVo);
		Date lastDate = helpService.lastDate(map);
		mav.addObject("lastDate", lastDate);
		// 이번 주 데이터를 가져오기 위해 추가
		int weekCount = helpService.weekCount(map);
		// 이번 달 데이터를 가져오기 위해 추가
		int monthCount = helpService.monthCount(map);
		// 이번 년도 데이터를 가져오기 위해 추가
		int yearCount = helpService.yearCount(map);
		mav.addObject("detail", memberService.detail2((String)session.getAttribute("name")));
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

	
	
	@RequestMapping(value="Helptest.do/{midx}/{duration}/{start}/{end}")
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
			request.setAttribute("start", start);
			request.setAttribute("end", end);
			System.out.println("start 값 : "+start);
			System.out.println("end 값 : "+end);
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
			request.setAttribute("startTime", startDate.toString());
			System.out.println("gdgdgd###############   "+startDate.toString());
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
			request.setAttribute("start", start);
			request.setAttribute("end", end);
			System.out.println("start 값 : "+start);
			System.out.println("end 값 : "+end);
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
			request.setAttribute("start", start);
			request.setAttribute("end", end);
			System.out.println("start 값 : "+start);
			System.out.println("end 값 : "+end);
		}
		
		mav.setViewName("t/Helptest");
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
		mav.addObject("detail", memberService.detail2((String)session.getAttribute("name")));
		mav.addObject("weekCount", weekCount);
		mav.addObject("monthCount", monthCount);
		mav.addObject("yearCount", yearCount);
		request.setAttribute("weekCount", weekCount);
		request.setAttribute("monthCount", monthCount);
		request.setAttribute("yearCount", yearCount);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		
		System.out.println("start 값 : "+start);
		System.out.println("end 값 : "+end);
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
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		System.out.println("helplist" + helplist);
		System.out.println("start 값 : "+start);
		System.out.println("end 값 : "+end);
		int flag = helpService.listselect(map);
		if(flag >= 1) response.setResult("Y");
//		if(flag >= 1) result = ("Y");
		System.out.println("flag : "+ flag);
		System.out.println("result : "+ response.getResult());
//		System.out.println("result : "+ result);
		return response;
	}	
	
	@RequestMapping(value="TestPoint.do/{midx}/{duration}/{start}/{end}/{select}")
	public ModelAndView TestPoint(ModelAndView mav, HttpSession session, HttpServletRequest request, @PathVariable("midx") Integer midx,@PathVariable("duration") int duration,
			@PathVariable("start") String start,HelpVo helpVo, 
			@PathVariable("end") String end, @PathVariable("select") String select) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("##########################1");
		System.out.println("point 접속2");
		LocalDate endDate = LocalDate.now();
		System.out.println("endDate : "+endDate);
		LocalDate startDate = endDate.minusMonths(duration);
		System.out.println("startDate: "+startDate);
		mav.addObject("end", endDate);
		mav.addObject("start", startDate);
		mav.addObject("duration", duration);
		System.out.println("end: "+end);
		System.out.println("start: "+start);
		System.out.println("duration: "+duration);
		System.out.println("select : "+ select);
		
			
		
		session.getAttribute("loginMember");
		session.getAttribute("email");
    	session.getAttribute("nickname");
    	session.getAttribute("access_Token");
		session.getAttribute("m_status");
		session.getAttribute("midx");
//		map.put("m_name", m_name);
		map.put("midx", midx);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("duration", duration);
		map.put("select", select);
		mav.addObject("detail", memberService.detail(midx));
		session.getAttribute("loginMember");
		List<Pointdetail> pointlist = pointService.pointlist(map);
		request.setAttribute("pointlist", pointlist);
		mav.addObject("pointlist",pointlist);
		mav.addObject("select", select);
		System.out.println("pointlist : "+pointlist);
		System.out.println("duration : "+duration);
		System.out.println("##########################1");
		
		mav.setViewName("t/TestPoint");
		return mav;
	}
	@ResponseBody
	@RequestMapping(value="PointAjax.do")
	public String pointAjax(HttpSession session, HttpServletRequest request, Model md,@RequestParam("midx") Integer midx,
			@RequestParam("start") String start, @RequestParam("end") String end, @RequestParam("select") String select) {
		String result = "N";
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("Ajax 호출됨");
		System.out.println("select 값 : " + select);
		System.out.println("midx 값 : " + midx);
		System.out.println("start 값 : " + start);
		System.out.println("end 값 : " + end);
		map.put("midx", midx);
		map.put("startDate", start);
		map.put("endDate", end);
		map.put("select", select);
		List<Pointdetail> pointlist = pointService.pointlist(map);
		md.addAttribute("select", select);
		// jsp 에서 java를 사용하기 위해 선언
		request.setAttribute("pointlist", pointlist);
//		md.addAttribute("pointlist", pointlist);
		int flag = pointService.pointresult(map);
		if(flag == 1) result = "Y";
		System.out.println("flag : " + flag);
		System.out.println("result : " + result);
		return result;
	}
	
	@RequestMapping(value="random.do")
	public ModelAndView random(ModelAndView mav) {
		
		mav.setViewName("t/random");
		return mav;
	}
	
	@RequestMapping(value="TestCalendar.do")
	public ModelAndView calendar(ModelAndView mav) {
		
		mav.setViewName("t/TestCalendar");
		return mav;
	}
	
	
	@RequestMapping(value = "TestCalendar2.do")
	public ModelAndView claendar(ModelAndView mv, HttpServletRequest request, HttpSession session) throws Exception {
		List<CalendarVo> calendar = null;
		try {
			calendar = calenService.calenList();
			request.setAttribute("calendarList", calendar);
			System.out.println("calendar : "+ calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
		
		mv.setViewName("t/TestCalendar2");
		return mv;
	}
	
	@GetMapping(value = "getCalendarData", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<CalendarVo>> getCalendarData() {
		List<CalendarVo> calendarList;
		try {
			calendarList = calenService.calenList();
			return ResponseEntity.ok(calendarList);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	@RequestMapping(value="Testurl")
	public ModelAndView testurl(ModelAndView mv) {
		
		mv.setViewName("t/Testurl");
		return mv;
	}
	@RequestMapping(value="CoreHospital")		// 사이드바 메뉴 자동 재생 X
	public ModelAndView testurl3(ModelAndView mv) {
		
		mv.setViewName("t/Testurl");
		return mv;
	}
	
	@RequestMapping(value="CoreHospitalAuto")		// 사이드바 메뉴 자동 재생 O
	public ModelAndView testurl2(ModelAndView mv) {
		
		mv.setViewName("t/Testurl2");
		return mv;
	}
	@RequestMapping(value="CoreHospitalAuto2")		// 사이드바 메뉴 자동 재생 O (사이드바 너비, 폰트 사이즈 up)
	public ModelAndView testurl2_2(ModelAndView mv) {
		
		mv.setViewName("t/Testurl4");
		return mv;
	}
	@RequestMapping(value="CoreHospitalAuto3")		// 사이드바 메뉴 자동 재생 O (사이드바 너비, 폰트 사이즈 up) 시간초 dwon 2초
	public ModelAndView testurl2_3(ModelAndView mv) {
		
		mv.setViewName("t/Testurl6");
		return mv;
	}
	@RequestMapping(value="CoreHospitalAuto4")		// 사이드바 메뉴 자동 재생 O (사이드바 너비, 폰트 사이즈 up) 시간초 dwon 3초
	public ModelAndView testurl2_4(ModelAndView mv) {
		
		mv.setViewName("t/Testurl7");
		return mv;
	}
	@RequestMapping(value="CoreHospital2")			// 사이드바 메뉴 자동 재생 X (사이드바 너비, 폰트 사이즈 up)
	public ModelAndView testurltest(ModelAndView mv) {
		
		mv.setViewName("t/Testurl3");
		return mv;
	}
	@RequestMapping(value="Testurl4")			// 사이드바 메뉴 자동 재생 X (너비 커스텀)
	public ModelAndView testurltest2(ModelAndView mv) {
		
		mv.setViewName("t/Testurl5");
		return mv;
	}
	@RequestMapping(value="Testsum")
	public ModelAndView testsum(ModelAndView mv) {
		
		mv.setViewName("t/Testsum");
		return mv;
	}
	@RequestMapping(value="Testform")
	public ModelAndView testform(ModelAndView mv) {
		
		mv.setViewName("t/testform");
		return mv;
	}
}
