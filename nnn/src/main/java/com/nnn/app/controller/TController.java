package com.nnn.app.controller;

import java.security.NoSuchAlgorithmException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.nnn.app.service.CalenService;
import com.nnn.app.service.EvaluationService;
import com.nnn.app.service.HelpService;
import com.nnn.app.service.ImageService;
import com.nnn.app.service.MemberService;
import com.nnn.app.service.PointService;
import com.nnn.app.service.PointplusService;
import com.nnn.app.service.TService;
import com.nnn.app.vo.AjaxResponse;
import com.nnn.app.vo.AjaxResponse5;
import com.nnn.app.vo.AjaxResponse8;
import com.nnn.app.vo.AnswerVo;
import com.nnn.app.vo.CalendarVo;
import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.GoogleOAuthRequest;
import com.nnn.app.vo.GoogleOAuthResponse;
import com.nnn.app.vo.GoogleuserVo;
import com.nnn.app.vo.HelpVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.Paging;
import com.nnn.app.vo.Pointdetail;
import com.nnn.app.vo.SubVo;
import com.nnn.app.vo.TestVo;
import com.nnn.app.vo.TestusersVo;
import com.nnn.app.vo.UserVo;
import com.nnn.app.vo.UseroptionVo;
import com.nnn.app.vo.UsersVo;
import com.nnn.app.vo.WhetherVo;
import com.nnn.app.vo.WrittenVo;

@Controller
@Component
@RequestMapping(value = "t/*")
public class TController {
	private MemberService memberService;
	private PointplusService pointplusService;
	private TService tService;
	private AES256Util aes;
	private ImageService imageService;
	private HelpService helpService;
	private PointService pointService;
	private CalenService calenService;
	private EvaluationService evaluationService;
	
	final static String GOOGLE_AUTH_BASE_URL = "https://accounts.google.com/o/oauth2/v2/auth";
	final static String GOOGLE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/token";
	final static String GOOGLE_REVOKE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/revoke";

	@Value("${api.client_id}")
	String clientId;
	@Value("${api.client_secret}")
	String clientSecret;
	
	@Autowired
	public TController(
		MemberService memberService, 
		PointplusService pointplusService, 
		TService tService, 
		AES256Util aes, 
		ImageService imageService,
		HelpService helpService, 
		PointService pointService, 
		CalenService calenService, 
		EvaluationService evaluationService
		) {
			this.memberService = memberService;
			this.pointplusService = pointplusService;
			this.tService = tService;
			this.aes = aes;
			this.imageService = imageService;
			this.helpService = helpService;
			this.pointService = pointService;
			this.calenService = calenService;
			this.evaluationService = evaluationService;
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
		
		tService.insert(vo);
		
		
		return "redirect:/c/CounselList.do";
	}
	@RequestMapping(value="TestList.do")
	public ModelAndView List(ModelAndView mav
			) throws Exception {
		TestVo vo = new TestVo();
		
		List<TestVo> cslist = tService.list(vo);
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
		List<TestVo> cslist = tService.listsearch(cri);
		
		
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
	@RequestMapping(value="CoreHospitalAuto3")		// 사이드바 메뉴 자동 재생 O (사이드바 너비, 폰트 사이즈 up) 시간초 down 2초
	public ModelAndView testurl2_3(ModelAndView mv) {
		
		mv.setViewName("t/Testurl6");
		return mv;
	}
	@RequestMapping(value="CoreHospitalAuto4")		// 사이드바 메뉴 자동 재생 O (사이드바 너비, 폰트 사이즈 up) 시간초 down 3초
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
	}@RequestMapping(value="test")
	public ModelAndView test(ModelAndView mv) {
		
		mv.setViewName("t/post");
		return mv;
	}
	@RequestMapping(value="Testlogin")
	public ModelAndView testlogin(ModelAndView mv, NoticeVo vo) {
		// 공지사항 영역 리스트로 출력
		Map<String, Object> map = new HashMap<String, Object>();
		List<NoticeVo> list = evaluationService.noticeSelect(map);
		
		mv.addObject("notice", list);
		// 초기 로그인페이지 들어오면 사번/비밀번호로
		mv.addObject("dbpwdOk", true);
		mv.setViewName("t/login");
		return mv;
	}
	
	@RequestMapping(value="Findpwd")
	public ModelAndView findpwd(ModelAndView mv, NoticeVo vo) {
		mv.setViewName("t/findpwd");
		return mv;
	}
	// 비밀번호 찾기 전 회원정보 일치하는지 ajax
	@ResponseBody
	@RequestMapping(value="FindpwdAjax")
	public AjaxResponse5 per1(HttpSession session, HttpServletRequest request, @RequestParam("id")String id, @RequestParam("ph")String ph) throws Exception {
		AjaxResponse5 response = new AjaxResponse5();
		response.setResult("N");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("ph", ph);
		
//		List<UsersVo> list = evaluationService.users1(map);
		
		int phOne = evaluationService.phOne(map);
		
		if(phOne == 1) {
			response.setResult("Y");
		}else {
			response.setResult("N");
		}
		
		/*
		private String result;
		private List<UsersVo> users;
		private List<UserPh> userph;
		private List<UsersVo> listpwd1;
		*/
		response.setUserph(phOne);
		
		
		return response;
	}
	@ResponseBody
	@RequestMapping(value="PwdActAjax/{id}")
	public AjaxResponse8 pwdActAjax(UsersVo vo, HttpSession session, @PathVariable("id") String id, Model md) throws NoSuchAlgorithmException {
		AjaxResponse8 response = new AjaxResponse8();
		response.setResult("N");
//		// 암호화
//		SHA256 sha256 = new SHA256();
//		//비밀번호
//        String password = vo.getPwd();
//        //SHA256으로 암호화된 비밀번호
//        String cryptogram = sha256.encrypt(password);
//        
//        System.out.println(cryptogram);
//		//담은 변수를 DB에 넘겨준다.
//		vo.setPwd(cryptogram);
//		System.out.println("암호화된 페스워드 : "+cryptogram);
		
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("pwd", cryptogram);
		map.put("pwd", vo.getPwd());
		map.put("id", vo.getId());
		
		int flag = evaluationService.pwdajax(map);
		
		if(flag >= 1) {
			System.out.println(flag);
			response.setResult("Y");
			return response;
		} else {
			return response;
		}
	}
	@RequestMapping(value="loginAction", method = RequestMethod.POST)
	public String testloginaction(TestusersVo vo, HttpSession session, Model md, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 비밀번호 복호화
//		SHA256 sha256 = new SHA256();
//		String password = vo.getPwd();
//		//	SHA256으로 암호화된 비밀번호
//        String cryptogram = sha256.encrypt(password);
//        System.out.println(cryptogram);
//        //비밀번호 일치 여부
//        boolean pwdcheck = cryptogram.equals(sha256.encrypt(password));
//		System.out.println(pwdcheck);
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("#########################################");
		System.out.println("id : "+vo.getId());
		System.out.println("name : "+vo.getName());
		System.out.println("pwd : "+vo.getPwd());
		System.out.println("#########################################");
		int loginMember = tService.login(vo);
		String name = vo.getName();
		System.out.println("_________________________________________");
		/*
		 * 로그인 시 아이디와 비밀번호가 사번과 이름의 조합일 경우 비밀번호 변경페이지로 이동해야 한다.
		 * 아니면 ajax로 하단에 비밀번호 변경 영역이 생성되면 좋을거같다.
		 * */
		
		
		//아이디 혹은 비밀번호가 일치하지 않는 경우
		if(loginMember == 0) {
			request.setAttribute("msg", "아이디 혹은 비밀번호를 확인해 주세요");
			request.setAttribute("url", "t/Testlogin");
			System.out.println("아이디 혹은 비밀번호를 확인해 주세요");
			return "alert";
		}
		// 정보가 있을 경우 
		else if(loginMember == 1) {
			TestusersVo info2 = tService.info2(vo);
			int idx = info2.getIdx();
			System.out.println("info : "+info2);
			System.out.println("info2.idx : "+info2.getIdx());
			// 아이디와 이름으로 로그인 성공 후 비밀번호가 설정되어있지 않는 경우 
			if(info2.getPwd() == null) {
				
				request.setAttribute("msg", "현재 비밀번호가 설정되어 있지 않습니다. 비밀번호 설정 페이지로 이동합니다");
				request.setAttribute("url", "t/Testpwd/"+idx);
				System.out.println( "현재 비밀번호가 설정되어 있지 않습니다. 비밀번호 설정 페이지로 이동합니다");
				return "alert";
			// DB에 비밀번호가 있는데 이름으로 로그인 한 경우
			}else if(info2.getPwd() != null && name != null){
				String dbpwdOk = "true"; 
				md.addAttribute("dbpwdOk", dbpwdOk);
				request.setAttribute("msg", "현재 비밀번호가 설정되어 있습니다. 비밀번호로 로그인을 해주세요");
				request.setAttribute("url", "t/Testlogin");
				return "alert";
			}else {
				System.out.println("#########################################");
				System.out.println("로그인 성공");
				//로그인 기록 저장
				map.put("id", vo.getId());
				map.put("name", info2.getName());
				tService.loginlog(map);
				System.out.println("#########################################");
				return "redirect:/t/Testinfo/"+idx;
			}
			
		}
		return "";
		
		
		
	}
	@RequestMapping(value="Testinfo/{idx}")
	public ModelAndView testinfo(TestusersVo vo, ModelAndView mv, HttpSession session, @PathVariable("idx") Integer idx, HttpServletRequest request) {
		session.getAttribute("loginMember");
		System.out.println("#########################1");
		Map<String, Object> map = new HashMap<String, Object>();

		String vtf = tService.info(idx).getHspt_V();
		String ktf = tService.info(idx).getHspt_K();
		String btf = tService.info(idx).getHspt_B();
		String xtf = tService.info(idx).getHspt_X();
		String ztf = tService.info(idx).getHspt_Z();
		String hsptname = tService.info(idx).getHspt_name();
		String hsptpo = tService.info(idx).getHspt_position();
		String hsptsub = tService.info(idx).getHspt_sub();
		String po = tService.info(idx).getHspt_position();
		
		System.out.println("############################1.5");

		System.out.println("info : "+ tService.info(idx));
		System.out.println("시간 출력 : "+ tService.info(idx).getReg_date());
		System.out.println("경혁팀 여부 : "+vtf);
		System.out.println("경혁팀장 여부 : "+ktf);
		System.out.println("부서장 여부 : "+btf);
		System.out.println("1인부서 여부 : "+xtf);
		System.out.println("진료팀장 여부 : "+ztf);
		if (po.equals("T")) {
			boolean position = true;
			map.put("position", position);
			System.out.println("position : "+position);
		}else {
			boolean position = false;
			map.put("position", position);
			System.out.println("position : "+position);
		}
		
		if(vtf.equals("T")) {
			boolean v = true;
			map.put("v", v);
			System.out.println("경혁팀여부v : "+v);
		}else {
			boolean v = false;
			map.put("v", v);
			System.out.println("경혁팀여부v : "+v);
		}
		
		if(ktf.equals("T")) {
			boolean v = true;
			map.put("k", v);
			System.out.println("경혁팀장여부k : "+v);
		}else {
			boolean v = false;
			map.put("k", v);
			System.out.println("경혁팀장여부k : "+v);
		}
		
		if(btf.equals("T")) {
			boolean v = true;
			map.put("b", v);
			System.out.println("부서장여부b : "+v);
		}else {
			boolean v = false;
			map.put("b", v);
			System.out.println("부서장여부b : "+v);
		}
		
		if(xtf.equals("T")) {
			boolean v = true;
			map.put("x", v);
			System.out.println("1인부서여부x : "+v);
		}else {
			boolean v = false;
			map.put("x", v);
			System.out.println("인부서여부x : "+v);
		}
		
		if(ztf.equals("T")) {
			boolean v = true;
			map.put("z", v);
			System.out.println("진료팀장여부z : "+v);
		}else {
			boolean v = false;
			map.put("z", v);
			System.out.println("진료팀장여부z : "+v);
		}
		map.put("hspt_name",hsptname);
		map.put("hspt_position",hsptpo);
		map.put("hspt_sub",hsptsub);
		map.put("idx",vo.getIdx());
		System.out.println("info.hsptname : "+ hsptname);
		System.out.println("info.hsptposition : "+ hsptpo);
		System.out.println("info.hsptsub : "+ hsptsub);
		System.out.println(vo.getIdx());
		System.out.println(tService.info(idx));
		System.out.println(tService.evaluationtarget(map));
		System.out.println("#########################2");
		mv.addObject("info", tService.info(idx));
		// 평가 대상 출력
		List<TestusersVo> list1 = new ArrayList<TestusersVo>();
		list1 = tService.evaluationtarget(map);
		mv.addObject("target", list1);
		System.out.println(list1);
		// 평가 완료한 리스트 출력?		join해서 필요 없음.
		List<WhetherVo> list2 = new ArrayList<WhetherVo>();
		list2 = tService.whetherSelect(map);
		System.out.println("평가 완료 리스트 출력 : "+list2);
		mv.addObject("endlist", list2);
//		// 부서장 쿼리 출력
//		List<TestusersVo> list2 = new ArrayList<TestusersVo>();
//		list2 = tService.BTlist(map);
//		mv.addObject("BTlist", list2);
//		System.out.println(list2);
//		// 부서원 쿼리 출력
//		List<TestusersVo> list3 = new ArrayList<TestusersVo>();
//		list3 = tService.BFlist(map);
//		mv.addObject("BFlist", list3);
//		System.out.println(list3);
		
		mv.setViewName("t/testinfo");
		return mv;
	}
	@RequestMapping(value="Testpwd/{idx}")
	public ModelAndView testpwd(ModelAndView mv, HttpSession session, @PathVariable("idx") Integer idx, HttpServletRequest request) {
		session.getAttribute("loginMember");
		mv.addObject("info", tService.info(idx));
		
		
		
		mv.setViewName("t/testpwd");
		return mv;
	}
	@RequestMapping(value="pwdAction/{idx}")
	public String pwdAction(TestusersVo vo, HttpSession session, @PathVariable("idx") int idx, HttpServletRequest request, HttpServletResponse response, Model md) throws NoSuchAlgorithmException {
		session.getAttribute("loginMember");
		md.addAttribute("info", tService.info(idx));
		
//		// 암호화
//		SHA256 sha256 = new SHA256();
//		//비밀번호
//        String password = vo.getPwd();
//        //SHA256으로 암호화된 비밀번호
//        String cryptogram = sha256.encrypt(password);
//        
//        System.out.println(cryptogram);
//		//담은 변수를 DB에 넘겨준다.
//		vo.setPwd(cryptogram);
//		System.out.println("암호화된 페스워드 : "+cryptogram);
		
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("pwd", cryptogram);
		map.put("pwd", vo.getPwd());
		map.put("idx", vo.getIdx());
		
		int flag = tService.pwdinsert(map);
		
		if(flag >= 1) {
			System.out.println(flag);
			request.setAttribute("msg", "비밀번호 변경이 완료되었습니다.");
			request.setAttribute("url", "t/Testinfo/"+idx);
			return "alert";
		} else {
			request.setAttribute("msg", "비밀번호 변경중 오류가 발생했습니다. 다시 시도해 주세요.");
			request.setAttribute("url", "t/Testpwd/"+idx);
			return "alert";
		}
	}
	@RequestMapping(value="Testform/{idx}/{idx2}/{team}")
	public ModelAndView testform(ModelAndView mv, HttpSession session, 
			HttpServletRequest request, @PathVariable("idx") int idx, @PathVariable("idx2") int idx2, 
			@PathVariable("team") String team) {
		session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		mv.addObject("info", tService.info(idx));
		System.out.println("++++++++++++++++++++++++++++++++++++++++++");
		System.out.println( tService.info(idx));
		System.out.println( tService.info(idx2));
		System.out.println(team);
		System.out.println("++++++++++++++++++++++++++++++++++++++++++");
		mv.addObject("target", tService.info(idx2));
		// 진료부, 경혁팀, 부서장 영역
		if(team.equals("A") || team.equals("B") || team.equals("C")) {
			String ev = "AA";
			System.out.println("ev : " + ev);
			map.put("d2",ev);
		}
		// 부서원 영역
		else if (team.equals("D")) {
			String ev = "AB";
			System.out.println("ev : " + ev);
			map.put("d2",ev);
		}
		List<EvaluationVo> list1 = new ArrayList<EvaluationVo>();
		list1 = tService.evlist(map);
		
		
		mv.addObject("evf", list1);
		mv.setViewName("t/Testform");
		return mv;
	}
	// 평가 후 Db저장
	@RequestMapping(value="formAction/{idx}/{idx2}/{team}")
	public String fromAction(AnswerVo vo, HttpSession session, @PathVariable(name="idx") int infoidx, @PathVariable(name="idx2") int targetidx, @PathVariable("team") String team,
			HttpServletRequest request, HttpServletResponse response, Model md,
			@RequestParam(name="a1", required = false) String a1, @RequestParam(name="a2", required = false) String a2, @RequestParam(name="b3", required = false) String b3, 
			@RequestParam(name="b4", required = false) String b4, @RequestParam(name="c5", required = false) String c5, @RequestParam(name="c6", required = false) String c6, 
			@RequestParam(name="d7", required = false) String d7, @RequestParam(name="d8", required = false) String d8, @RequestParam(name="e9", required = false) String e9, 
			@RequestParam(name="e10", required = false) String e10, @RequestParam(name="f11", required = false) String f11, @RequestParam(name="a12", required = false) String a12, 
			@RequestParam(name="a13", required = false) String a13, @RequestParam(name="a14", required = false) String a14, @RequestParam(name="a15", required = false) String a15, 
			@RequestParam(name="a16", required = false) String a16, @RequestParam(name="a17", required = false) String a17, @RequestParam(name="a18", required = false) String a18, 
			@RequestParam(name="b19", required = false) String b19, @RequestParam(name="b20", required = false) String b20, @RequestParam(name="b21", required = false) String b21, 
			@RequestParam(name="b22", required = false) String b22, @RequestParam(name="b23", required = false) String b23, @RequestParam(name="c24", required = false) String c24, 
			@RequestParam(name="c25", required = false) String c25, @RequestParam(name="c26", required = false) String c26, @RequestParam(name="c27", required = false) String c27, 
			@RequestParam(name="d28", required = false) String d28, @RequestParam(name="d29", required = false) String d29, @RequestParam(name="e30", required = false) String e30, 
			@RequestParam(name="e31", required = false) String e31, @RequestParam(name="f32", required = false) String f32
			) throws NoSuchAlgorithmException {
		session.getAttribute("loginMember");
		md.addAttribute("info", tService.info(infoidx));
		md.addAttribute("target", tService.info(targetidx));
		md.addAttribute("team", team);
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		String u1 = tService.info(infoidx).getHspt_name();		// 기관명
		String u2 = tService.info(infoidx).getHspt_sub();		// 평가자 부서명
		String u3 = tService.info(infoidx).getHspt_position();	// 직급/직책
		String u4 = tService.info(infoidx).getName();			// 평가자 이름
		String u5 = tService.info(infoidx).getId();				// 평가자 사번
		String t1 = tService.info(targetidx).getHspt_sub();		// 평가대상자 부서
		String t2 = tService.info(targetidx).getHspt_position();	// 평가대상자 직책
		String t3 = tService.info(targetidx).getName();			// 평가대상자 이름
		String t4 = tService.info(targetidx).getId();			// 평가대상자 사번

		// 평가 시작하면 whether 테이블에 평가자와 평가 대상자 , 진행 여부 insert
		map2.put("d1", infoidx);
		map2.put("d2", targetidx);
		System.out.println(a1);
		System.out.println(a2);
		System.out.println(b3);
		System.out.println(b4);
		System.out.println(c5);
		System.out.println(c6);
		System.out.println(d7);
		System.out.println(d8);
		System.out.println(e9);
		System.out.println(e10);
		System.out.println(f11);
		System.out.println(a12);
		System.out.println(a13);
		System.out.println(a14);
		System.out.println(a15);
		System.out.println(a16);
		System.out.println(a17);
		System.out.println(a18);
		System.out.println(b19);
		System.out.println(b20);
		System.out.println(b21);
		System.out.println(b22);
		System.out.println(b23);
		System.out.println(c24);
		System.out.println(c25);
		System.out.println(c26);
		System.out.println(c27);
		System.out.println(d28);
		System.out.println(d29);
		System.out.println(e30);
		System.out.println(e31);
		System.out.println(f32);
		
		map.put("u1", u1);
		map.put("u2", u2);
		map.put("u3", u3);
		map.put("u4", u4);
		map.put("u5", u5);
		map.put("t1", t1);
		map.put("t2", t2);
		map.put("t3", t3);
		map.put("t4", t4);
		// 진료부, 경혁팀, 부서장 영역
		if(team.equals("A") || team.equals("B") || team.equals("C")) {
			String ev = "AA";
			System.out.println("ev : " + ev);
			map.put("ev",ev);
			String d1 = a1+","+a2+","+b3+","+b4+","+c5+","+c6+","+d7+","+d8+","+e9+","+e10+","+f11;
			System.out.println(d1);
			
			map.put("d1", d1);
		}
		// 부서원 영역
		else if (team.equals("D")) {
			String ev = "AB";
			System.out.println("ev : " + ev);
			map.put("ev",ev);
			String d1 = a12+","+a13+","+a14+","+a15+","+a16+","+a17+","+a18+","+b19+","+b20+","+b21+","+b22+","+b23+","+c24+
					","+c25+","+c26+","+c27+","+d28+","+d29+","+e30+","+e31+","+f32;
			map.put("d1", d1);
		}
		List<AnswerVo> list = new ArrayList<AnswerVo>();
		
		// 나중에 암호화 해야함
		
//		// 암호화
//		SHA256 sha256 = new SHA256();
//		//비밀번호
//        String password = vo.getPwd();
//        //SHA256으로 암호화된 비밀번호
//        String cryptogram = sha256.encrypt(password);
//        
//        System.out.prIntegerln(cryptogram);
//		//담은 변수를 DB에 넘겨준다.
//		vo.setPwd(cryptogram);
//		System.out.println("암호화된 페스워드 : "+cryptogram);
		
		
		
		
		System.out.println("###########################################################");
		System.out.println();
		System.out.println(infoidx);
		System.out.println(targetidx);
		System.out.println("###########################################################");
		int flag = tService.frominsert(map);
		 ///db 전송 이후 
		if(flag >= 1) {
			request.setAttribute("msg", "평가가 완료되었습니다.");
			request.setAttribute("url", "t/formEnd/"+infoidx+"/"+targetidx);
			// view 단에서 미평가, 평가 진행중, 평가 완료 에 따라 값을 다르게 주면 각각 다른 메세지를 띄워줄 수 있음
			// 먼저 평가페이지에 들어온 기록이 있는지 (테이블에 평가자와 평가 대상자가 있는지 검색)
			// 검색 후 기록이 없으면 insert, 
			int flag2 = tService.whether(map2);
			// 평가 진행후 
			System.out.println("평가 진행 여부 table insert  :  "+flag2);
			return "alert";
		} else {

			request.setAttribute("msg", "오류발생");
			request.setAttribute("url", "t/Testinfo/"+infoidx);
			return "alert";
		}
	}
	

	@RequestMapping(value="formEnd/{idx}/{idx2}")
	public ModelAndView formend( @PathVariable(name="idx") int infoidx, @PathVariable(name="idx2") int targetidx, HttpSession session, ModelAndView mv) throws Exception {
		
		session.getAttribute("loginMember");
		mv.addObject("info", tService.info(infoidx));
		System.out.println("++++++++++++++++++++++++++++++++++++++++++");
		System.out.println( tService.info(infoidx));
		System.out.println( tService.info(targetidx));
		System.out.println("++++++++++++++++++++++++++++++++++++++++++");
		mv.addObject("target", tService.info(targetidx));
		Map<String, Object> map = new HashMap<String, Object>();
		
		mv.setViewName("t/Testformend");
		return mv;
	}
	
	@RequestMapping(value="GLtest")
	public ModelAndView gltest(ModelAndView mv) throws Exception {
		
		
		mv.setViewName("t/GLtest");
		return mv;
	}
	@RequestMapping(value="google")
	public ModelAndView index(ModelAndView mv) throws Exception {
		
		
		mv.setViewName("t/google");
		return mv;
	}
	@GetMapping("google/auth")
	public String googleAuth(Model model, @RequestParam(value = "code") String authCode)
			throws JsonProcessingException {
		
		//HTTP Request를 위한 RestTemplate
		RestTemplate restTemplate = new RestTemplate();

		//Google OAuth Access Token 요청을 위한 파라미터 세팅
		GoogleOAuthRequest googleOAuthRequestParam = GoogleOAuthRequest
				.builder()
				.clientId(clientId)
				.clientSecret(clientSecret)
				.code(authCode)
				.redirectUri("http://localhost:8090/app/t/google")
				.grantType("authorization_code").build();

		
		//JSON 파싱을 위한 기본값 세팅
		//요청시 파라미터는 스네이크 케이스로 세팅되므로 Object mapper에 미리 설정해준다.
		ObjectMapper mapper = new ObjectMapper();
		mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
		mapper.setSerializationInclusion(Include.NON_NULL);

		//AccessToken 발급 요청
		ResponseEntity<String> resultEntity = restTemplate.postForEntity(GOOGLE_TOKEN_BASE_URL, googleOAuthRequestParam, String.class);

		//Token Request
		GoogleOAuthResponse result = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleOAuthResponse>() {
		});

		//ID Token만 추출 (사용자의 정보는 jwt로 인코딩 되어있다)
		String jwtToken = result.getIdToken();
		String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo")
		.queryParam("id_token", jwtToken).toUriString();
		
		String resultJson = restTemplate.getForObject(requestUrl, String.class);
		
		Map<String,String> userInfo = mapper.readValue(resultJson, new TypeReference<Map<String, String>>(){});
		model.addAllAttributes(userInfo);
		model.addAttribute("token", result.getAccessToken());
		System.out.println(userInfo);
		
		// Save user information to the database
        GoogleuserVo user = new GoogleuserVo();
        user.setGoogleId(userInfo.get("sub"));
        user.setEmail(userInfo.get("email"));
        // Set other user fields as needed

        tService.guserinsert(user);
		

		return "/google";

	}
	@RequestMapping(value="testalert")
	public ModelAndView testalert(ModelAndView mv) throws Exception {
		
		
		mv.setViewName("t/testalert");
		return mv;
	}
	
	@RequestMapping(value="Info2/{idx}")
	public ModelAndView info2(UsersVo vo, ModelAndView mv, HttpSession session, @PathVariable("idx") Integer idx, HttpServletRequest request) throws Exception {
session.getAttribute("loginMember");
		
		System.out.println("#########################1");
		Map<String, Object> map = new HashMap<String, Object>();

		String vtf = evaluationService.info(idx).getHspt_V();
		String ktf = evaluationService.info(idx).getHspt_K();
		String btf = evaluationService.info(idx).getHspt_B();
		String xtf = evaluationService.info(idx).getHspt_X();
		String ztf = evaluationService.info(idx).getHspt_Z();
		String hsptname = evaluationService.info(idx).getHspt_name();
		String hsptpo = evaluationService.info(idx).getHspt_position();
		String hsptsubcode = evaluationService.info(idx).getHspt_subcode();
		String hsptsubname = evaluationService.info(idx).getHspt_subname();
		String po = evaluationService.info(idx).getHspt_position();
		
		System.out.println("############################1.5");

		System.out.println("info : "+ evaluationService.info(idx));
		System.out.println("시간 출력 : "+ evaluationService.info(idx).getReg_date());
		System.out.println("경혁팀 여부 : "+vtf);
		System.out.println("경혁팀장 여부 : "+ktf);
		System.out.println("부서장 여부 : "+btf);
		System.out.println("1인부서 여부 : "+xtf);
		System.out.println("진료팀장 여부 : "+ztf);
		if (po.equals("T")) {
			boolean position = true;
			map.put("position", position);
			System.out.println("position : "+position);
		}else {
			boolean position = false;
			map.put("position", position);
			System.out.println("position : "+position);
		}
		
		if(vtf.equals("T")) {
			boolean v = true;
			map.put("v", v);
			System.out.println("경혁팀여부v : "+v);
		}else {
			boolean v = false;
			map.put("v", v);
			System.out.println("경혁팀여부v : "+v);
		}
		
		if(ktf.equals("T")) {
			boolean v = true;
			map.put("k", v);
			System.out.println("경혁팀장여부k : "+v);
		}else {
			boolean v = false;
			map.put("k", v);
			System.out.println("경혁팀장여부k : "+v);
		}
		
		if(btf.equals("T")) {
			boolean v = true;
			map.put("b", v);
			System.out.println("부서장여부b : "+v);
		}else {
			boolean v = false;
			map.put("b", v);
			System.out.println("부서장여부b : "+v);
		}
		
		if(xtf.equals("T")) {
			boolean v = true;
			map.put("x", v);
			System.out.println("1인부서여부x : "+v);
		}else {
			boolean v = false;
			map.put("x", v);
			System.out.println("인부서여부x : "+v);
		}
		
		if(ztf.equals("T")) {
			boolean v = true;
			map.put("z", v);
			System.out.println("진료팀장여부z : "+v);
		}else {
			boolean v = false;
			map.put("z", v);
			System.out.println("진료팀장여부z : "+v);
		}
		map.put("hspt_name",hsptname);
		map.put("hspt_position",hsptpo);
		map.put("hspt_subcode",hsptsubcode);
		map.put("idx",vo.getIdx());
		System.out.println("info.hsptname : "+ hsptname);
		System.out.println("info.hsptposition : "+ hsptpo);
		System.out.println("info.hsptsubcode : "+ hsptsubcode);
		System.out.println(vo.getIdx());
		System.out.println(evaluationService.info(idx));
		System.out.println(evaluationService.evaluationtarget(map));
		System.out.println("#########################2");
		mv.addObject("info", evaluationService.info(idx));
		// 평가 대상 출력		다른 사람이 평가완료 했을 경우 평가 받은사람이 여러개가 뜸. -> 
		List<UsersVo> list1 = new ArrayList<UsersVo>();
		list1 = evaluationService.evaluationtarget(map);
		System.out.println("#############################");
		mv.addObject("target", list1);
		System.out.println(list1);
		System.out.println("#############################");
		// 평가 완료한 리스트 출력?		
		List<WhetherVo> list2 = new ArrayList<WhetherVo>();
		list2 = evaluationService.whetherSelect(map);
		System.out.println("평가 완료 리스트 출력 : "+list2);
		mv.addObject("endlist", list2);
		
		LocalDateTime now = LocalDateTime.now();
		mv.addObject("now", now);
		System.out.println(now);
		// 비교할 특정 날짜 설정 (예: 2023년 1월 1일)
        LocalDateTime specificDate = LocalDateTime.of(2023, Month.DECEMBER, 1, 0, 0);
        // 현재 시간이 특정 날짜를 넘었는지 확인
        if (now.isAfter(specificDate)) {
        	// 넘김
            System.out.println("0");
            mv.addObject("specificDate", "0");
        } else {
        	// 안넘김
            System.out.println("1");
            mv.addObject("specificDate", "1");
        }
		
		mv.setViewName("t/info2");
		return mv;
	}
}
