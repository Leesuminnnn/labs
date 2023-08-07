package com.nnn.app.controller;

import java.net.URLDecoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nnn.app.service.HelpService;
import com.nnn.app.service.MemberService;
import com.nnn.app.service.PointService;
import com.nnn.app.service.PointplusService;
import com.nnn.app.vo.AjaxResponse2;
import com.nnn.app.vo.AjaxResponse3;
import com.nnn.app.vo.CustomerVo;
import com.nnn.app.vo.HelpVo;
import com.nnn.app.vo.MemberVo;
import com.nnn.app.vo.Pointdetail;

@Controller
@RequestMapping(value = "m/*")
public class MemberController {
	
//	MemberLoginService memberLoginService;
//	MemberDetailService memberDetailService;
	private MemberService memberService;
	private PointplusService pointplusService;
	private PointService pointService;
	private HelpService helpService;
	
	@Autowired
	public MemberController(MemberService memberService, PointplusService pointplusService, PointService pointService, HelpService helpService) {
		this.memberService = memberService;
		this.pointplusService = pointplusService;
		this.pointService = pointService;
		this.helpService = helpService;
	}
	
	

	@RequestMapping(value = "Login.do")
	public String login(Model model, HttpSession session) {

		System.out.println("Login 페이지");
		
		
		return "m/Login";
	}

	@RequestMapping(value = "Login_check.do", method = RequestMethod.POST)
	public String login_check(CustomerVo vo, MemberVo memberVo, HttpSession session, Model model, HttpServletRequest request) throws Exception {
	    
//		MemberVo loginMember = memberService.login(vo);
	    // 시연용
		CustomerVo loginMember = memberService.login2(vo);

	    if (loginMember == null) {
	        //model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
	        request.setAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			request.setAttribute("url", "m/Login.do");
	        return "alert";
	    }else if(loginMember.getM_status().equals("2")){
	    	session.setAttribute("loginMember", loginMember);
	    	session.setAttribute("email", loginMember.getM_email());
	    	session.setAttribute("name", loginMember.getM_name());
	    	session.setAttribute("m_status", loginMember.getM_status());
	    	session.setAttribute("midx", loginMember.getMidx());
	    	session.setAttribute("userId", loginMember.getM_id());
	    	session.setAttribute("m_no", loginMember.getM_no());
	    	session.setAttribute("m_point", loginMember.getM_point());
	    	session.setAttribute("m_in", loginMember.getM_in());
	    	session.setAttribute("m_de", loginMember.getM_de());
	    	System.out.println("loginMember : " + loginMember);
//	    	List<MemberVo> mlist = new ArrayList<MemberVo>();
	    	// 시연용
	    	List<CustomerVo> mlist = new ArrayList<CustomerVo>();
			System.out.println(loginMember.getM_email());
			mlist = memberService.Memberlist2(vo);
			model.addAttribute("mlist", mlist);
			System.out.println("mlist 값 : "+mlist);
	    	return "redirect:/m/Admin.do";
	    }
	    
	    // 로그인이 완료되면 이전 페이지로 이동하기	-- 정상 작동 되지 않음 해결해야함!!
	    String referer = request.getHeader("referer"); // referer 정보 가져오기
	    System.out.println("referer : "+referer);
	    session.setAttribute("loginMember", loginMember);
    	session.setAttribute("email", loginMember.getM_email());
    	session.setAttribute("name", loginMember.getM_name());
    	session.setAttribute("m_status", loginMember.getM_status());
    	session.setAttribute("midx", loginMember.getMidx());
    	session.setAttribute("userId", loginMember.getM_id());
    	session.setAttribute("m_no", loginMember.getM_no());
    	session.setAttribute("m_point", loginMember.getM_point());
		session.setAttribute("m_in", loginMember.getM_in());
		session.setAttribute("m_de", loginMember.getM_de());
    	
    	
    	
    	model.addAttribute("loginMember", loginMember);
        
    	System.out.println("loginMember : "+loginMember);
    	System.out.println("email : "+loginMember.getM_email());
    	System.out.println("name : "+loginMember.getM_name());
    	System.out.println("m_status : "+loginMember.getM_status());
    	System.out.println("midx : "+loginMember.getMidx());
    	System.out.println("userId : "+loginMember.getM_id());
    	/*
		Logininterceptor에서 저장한 세션을 불러오고 
	
		 */
		String h_name = (String)session.getAttribute("h_name");
		String h_no = (String)session.getAttribute("h_no");
		String h_number = (String)session.getAttribute("h_number");
		System.out.println("#################################");
		System.out.println("h_name : "+h_name);
		System.out.println("h_no : "+h_no);
		System.out.println("h_number : "+h_number);
		if(h_name != null && h_no != null && h_number != null) {
			try {
	        	System.out.println("#################################");
	        	return "redirect:/h/Insert.do?h_name="+h_name+"&h_no="+h_no+"&h_number="+h_number;			        	
			} catch (Exception e) {
				
			}
			
	
		}
		return "redirect:/h/Main.do";	
	    	
	}
	
	
//	    if (referer != null && !referer.contains("m/Login")) { // 이전 페이지가 null이 아니고 로그인 페이지가 아닌 경우
//	        return "redirect:" + referer; // 이전 페이지로 이동
//	    } else {
//	        return "redirect:/h/Main.do"; // 메인 페이지로 이동
//	    }
//	}
	
	@ResponseBody
	@RequestMapping(value = "Info", method = RequestMethod.POST)
	public AjaxResponse3 approveMember(@RequestParam("midx") Integer midx, MemberVo vo) throws Exception {
		System.out.println("########################");
		System.out.println("midx : "+midx);
		AjaxResponse3 response = new AjaxResponse3();
		response.setResult("N");
		List<MemberVo> mlist = memberService.Memberlist(vo);
		
		int flag = memberService.selectMember(midx);
		System.out.println(flag);
		response.setMemberlist(mlist);
		if(flag == 1) {
			response.setResult("Y");
			memberService.approveMember(midx);
		}
		
		return response;
	}

	// 회원 정보보기

	@RequestMapping(value = "Detail.do/{m_name}")
	public ModelAndView detail( HttpSession session,@PathVariable("m_name") String m_name, ModelAndView mav) throws Exception {
		
//		mav.addObject("detail", memberService.detail2(m_name));
		//  시연용
		mav.addObject("detail", memberService.detail3(m_name));
		
		String h_name = (String)session.getAttribute("h_name");
    	String h_no = (String)session.getAttribute("h_no");
    	String h_number = (String)session.getAttribute("h_number");
    	System.out.println("#################################");
    	System.out.println("h_name : "+h_name);
    	System.out.println("h_no : "+h_no);
    	System.out.println("h_number : "+h_number);
		
		LocalDate endDate = LocalDate.now();
		System.out.println("endDate : "+endDate);
		LocalDate startDate = endDate.minusMonths(1);
		System.out.println("startDate: "+startDate);
		mav.addObject("end", endDate);
		mav.addObject("start", startDate);
		
		session.getAttribute("midx");
		session.getAttribute("name");
		session.getAttribute("loginMember");
		mav.setViewName("m/Detail");
		return mav;

	}
	// 회원 정보 업데이트
	@RequestMapping(value = "DetailAction.do/{midx}")
	public String detailAction(HttpSession session,@PathVariable("midx") Integer midx, Model model, CustomerVo vo, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		session.getAttribute("loginMember");

//		memberService.detailAction(memverVo);
		// 시연용
		memberService.detailAction2(vo);
		String h_name = (String)session.getAttribute("h_name");
    	String h_no = (String)session.getAttribute("h_no");
    	String h_number = (String)session.getAttribute("h_number");
    	System.out.println("#################################");
    	session.getAttribute("loginMember");
    	session.setAttribute("m_in", vo.getM_in());
    	session.setAttribute("m_de", vo.getM_de());
    	session.setAttribute("m_no", vo.getM_no());
    	session.setAttribute("name", vo.getM_name());
		System.out.println(vo.getM_in());
		System.out.println(vo.getM_de());
		System.out.println(vo.getM_no());
		System.out.println(vo.getM_name());
    	System.out.println("h_name : "+h_name);
    	System.out.println("h_no : "+h_no);
    	System.out.println("h_number : "+h_number);
    	// 이전 페이지 URL 가져오기
    	String previousUrl = request.getHeader("referer");
    	if(previousUrl != null) {
    		// 디코딩
			String decoderUrl = URLDecoder.decode(previousUrl, "UTF-8");

			session.setAttribute("decoderUrl : ", decoderUrl);
		}
    	Map<String, String[]> params = request.getParameterMap();
		session.setAttribute("previousUrl : ", previousUrl);
		session.setAttribute("params", params);
		if(previousUrl == request.getContextPath()+"/m/Login.do") {
			
		}
		
    	if(h_name != null && h_no != null && h_number != null) {
    		try {
	        	System.out.println("#################################11111");
	        	request.setAttribute("msg", "변경이 완료되었습니다. \\n이전화면으로 돌아갑니다.");
	    		request.setAttribute("url", "h/Insert.do?h_name="+h_name+"&h_no="+h_no+"&h_number="+h_number);
			} catch (Exception e) {
				
			}
    		return "alert2";

    	}else {
    		System.out.println("#################################22222");
    		request.setAttribute("msg", "변경이 완료되었습니다.");
    		request.setAttribute("url", "h/Main.do");
    	}
		return "alert";

	}
	@RequestMapping(value = "Mypage.do/{midx}")
	public ModelAndView mypage( HttpSession session,@PathVariable("midx") Integer midx, ModelAndView mav) throws Exception {
		session.getAttribute("loginMember");
		session.getAttribute("name");
//		session.getAttribute("midx");
		
		LocalDate endDate = LocalDate.now();
		System.out.println("endDate : "+endDate);
		LocalDate startDate = endDate.minusMonths(1);
		System.out.println("startDate: "+startDate);
		mav.addObject("end", endDate);
		mav.addObject("start", startDate);
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put(m_name, session.getAttribute("name"));
		map.put("midx", midx);
//		mav.addObject("detail", memberService.detail(midx));
		mav.addObject("detail", memberService.detail4(midx));
		
		mav.setViewName("m/Mypage");
		return mav;

	}
	
	
	// 회원 포인트내역 보기
	@RequestMapping(value = "Point.do/{midx}")
	public ModelAndView point( HttpSession session,HttpServletRequest request,@PathVariable("midx") Integer midx, ModelAndView mav,
			@RequestParam(name = "start") String start,
			@RequestParam(name = "end") String end, @RequestParam(name="select")String select ) throws Exception {
		session.getAttribute("midx");
		session.getAttribute("name");
		String userId = (String)session.getAttribute("userId");
//		mav.addObject("detail", memberService.detail(midx));
		// 시연용
		mav.addObject("detail", memberService.detail4(midx));
		session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<String, Object>();
		// start, end 가  , 찍히는 오류때문에 substring 이용
		System.out.println("start 가공 전 : "+start);
		System.out.println("end 가공 전 : "+end);
		System.out.println("select 가공 전 : "+select);
		System.out.println("문자열 길이 체크1 " + start.length());
		System.out.println("문자열 길이 체크2 " + end.length());
		System.out.println("문자열 길이 체크3 " + select.length());
		if(start.length() >= 11) {
			String substart = start.substring(11);
			System.out.println("substart: "+substart);
			map.put("startDate", substart);
			mav.addObject("start", substart);
		}else {
			System.out.println("start 길이 11보다 작음 : "+start);
			map.put("startDate", start);
			mav.addObject("start", start);
		}
		if(end.length() >= 11) {
			String subend = end.substring(11);
			System.out.println("subend : "+subend);
			map.put("endDate", subend);
			mav.addObject("end", subend);
		}else {
			System.out.println("end 길이 11보다 작음 : "+end);
			map.put("endDate", end);
			mav.addObject("end", end);
		}
		if(select.length() >= 14) {
			String subselect = select.substring(14);
			System.out.println("subselect : "+subselect);
			map.put("select", subselect);
			mav.addObject("select", subselect);
		}else {
			System.out.println("select 길이 14보다 작음 : "+select);
			map.put("select", select);
			mav.addObject("select", select);
		}
		
		System.out.println("################################");
		System.out.println("point 접속");
		
		map.put("midx", session.getAttribute("midx"));
//		map.put("m_name", m_name);
		map.put("userId", userId);
		// 여기
		List<Pointdetail> pointlist = pointService.pointlist(map);
		request.setAttribute("pointlist", pointlist);
		mav.addObject("pointlist",pointlist);
		ArrayList<Pointdetail> list = new ArrayList<>();
		list.addAll(pointlist);
		request.setAttribute("list", list);
		System.out.println("list :  "+list);
		
		
//		mav.addObject("start", start);
//		mav.addObject("end", end);
		System.out.println("pointlist : "+pointlist);
		System.out.println("##########################2");
		mav.setViewName("m/Point");
		return mav;

	}
	
	@RequestMapping(value="Point.do/{midx}/{duration}/{start}/{end}/{select}")
	public ModelAndView point2(ModelAndView mav, HttpSession session, HttpServletRequest request, @PathVariable("midx") Integer midx,@PathVariable("duration") int duration,
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
//		mav.addObject("detail", memberService.detail(midx));
		// 시연용
		mav.addObject("detail", memberService.detail4(midx));
		
		session.getAttribute("loginMember");
		// 여기
		List<Pointdetail> pointlist = pointService.pointlist(map);
		request.setAttribute("pointlist", pointlist);
		ArrayList<Pointdetail> list = new ArrayList<>();
		list.addAll(pointlist);
		request.setAttribute("list", list);
		System.out.println("list :  "+list);
		mav.addObject("pointlist",pointlist);
		mav.addObject("select", select);
		System.out.println("pointlist : "+pointlist);
		System.out.println("duration : "+duration);
		System.out.println("##########################1");
		
		mav.setViewName("m/Point");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="PointAjax")
	public AjaxResponse2 pointAjax(HttpSession session, HttpServletRequest request, Model md,@RequestParam("midx") Integer midx,
			@RequestParam("start") String start, @RequestParam("end") String end, @RequestParam("select") String select,
			@RequestParam("duration") int duration) {
//		String result = "N";
		AjaxResponse2 response = new AjaxResponse2();
		response.setResult("N");
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("Ajax 호출됨");
		System.out.println("select 값 : " + select);
		System.out.println("midx 값 : " + midx);
		System.out.println("start 값 : " + start);
		System.out.println("end 값 : " + end);
		System.out.println("duration 값 : " + duration);
		map.put("midx", midx);
		map.put("startDate", start);
		map.put("endDate", end);
		map.put("select", select);
		map.put("duration", duration);
		List<Pointdetail> pointlist = pointService.pointlist(map);
		ArrayList<Pointdetail> list = new ArrayList<>();
		md.addAttribute("select", select);
		// jsp 에서 java를 사용하기 위해 선언
		request.setAttribute("pointlist", pointlist);
		list.addAll(pointlist);
		System.out.println("list :  "+list);
		response.setPointlist(list);
//		md.addAttribute("pointlist", pointlist);
		request.setAttribute("list", list);
		int flag = pointService.pointresult(map);
//		if(flag == 1) result = "Y";
		if(flag >= 1) response.setResult("Y");
		System.out.println("flag : " + flag);
		System.out.println("result : "+ response.getResult());
//		System.out.println("result : " + result);
		
		return response;
	}
	
	@RequestMapping(value = "Admin.do")
	public ModelAndView admin(/*MemberVo*/ CustomerVo vo, HttpSession session, ModelAndView mav) {
		
		System.out.println("관리자 페이지");
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
		
//		List<MemberVo> mlist = new ArrayList<MemberVo>();
//		mlist = memberService.Memberlist(vo);Memberlist2
		// 시연용
		List<CustomerVo> mlist = new ArrayList<CustomerVo>();
		mlist = memberService.Memberlist2(vo);
		
		mav.addObject("mlist", mlist);
		System.out.println("mlist 값 : "+mlist);
		mav.setViewName("m/Admin");
		
		return mav;
	}
	
	@RequestMapping(value = "HelpList.do")
	public ModelAndView HelpList(MemberVo vo, HttpSession session, ModelAndView mav, HelpVo helpVo) {
		
		System.out.println("식사수발내역 페이지");
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
    	
    	List<HelpVo> helplist = helpService.listAll(helpVo);
    	mav.addObject("list", helplist);
    	System.out.println("리스트 출력" + helplist);
    	mav.setViewName("m/HelpList");
		return mav;
	}
	
	
	
	@RequestMapping("Logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {

		session.invalidate();
		mav.setViewName("redirect:/");
		mav.addObject("message", "logout");
		return mav;

	}
	
	//카카오 로그인 callback 주소
	@RequestMapping(value = "/kakao/callback", method = RequestMethod.GET)
	public String kakaologin(@RequestParam("code") String code, HttpSession session, Model model, HttpServletResponse response, HttpServletRequest request,
			RedirectAttributes redirectAttributes) throws Exception {
		System.out.println("code : " + code);
		
		String access_Token = memberService.getAccessToken(code);
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);
		System.out.println("controller access_Token : " + access_Token);
		
		// Set the access token in a cookie
	    Cookie accessTokenCookie = new Cookie("access_token", access_Token);
	    accessTokenCookie.setMaxAge(60 * 60 * 24 * 7); // Set the cookie to expire in 1 week (adjust as needed)
	    accessTokenCookie.setPath("/"); // Set the cookie to be accessible from all paths
	    response.addCookie(accessTokenCookie);
		
		
		//	    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email")!= null) {
        	 // 이메일로 해당 회원 정보를 가져옵니다.
 //           MemberVo memberVo = memberService.getMemberByEmail((String) userInfo.get("email"));
        	// 시연용
            CustomerVo customerVo = memberService.getMemberByEmail2((String) userInfo.get("email"));
            if(customerVo == null) {
            	customerVo = new CustomerVo();
            	customerVo.setM_email((String) userInfo.get("email"));
            	customerVo.setM_name((String) userInfo.get("nickname"));
            	customerVo.setM_id((String) userInfo.get("email"));
            	System.out.println("vo에 담긴 m_name : "+customerVo.getM_name());
                System.out.println("vo에 담긴 m_email : "+customerVo.getM_email());
                System.out.println("vo에 담긴 midx :"+customerVo.getMidx());
            	memberService.getKakaoInfo2(customerVo);
            }
            
//            if(memberVo == null) { // DB에 해당 정보가 없다면, 정보를 추가합니다.
//                memberVo = new MemberVo();
//                memberVo.setM_email((String) userInfo.get("email"));
//                memberVo.setM_name((String) userInfo.get("nickname"));
//                memberVo.setM_id((String) userInfo.get("email"));
//                System.out.println("vo에 담긴 m_name : "+memberVo.getM_name());
//                System.out.println("vo에 담긴 m_email : "+memberVo.getM_email());
//                System.out.println("vo에 담긴 midx :"+memberVo.getMidx());
//                memberService.getKakaoInfo(memberVo);
//            }
            
	        	
	        	
            System.out.println("###################################12");
        	
//			session.setAttribute("loginMember", memberVo);
//        	session.setAttribute("email", memberVo.getM_email());
//        	session.setAttribute("name", memberVo.getM_name());
//        	session.setAttribute("m_status", memberVo.getM_status());
//        	session.setAttribute("midx", memberVo.getMidx());
//        	session.setAttribute("userId", memberVo.getM_id());
//        	session.setAttribute("m_no", memberVo.getM_no());
//        	session.setAttribute("m_point", memberVo.getM_point());
//        	session.setAttribute("m_in", memberVo.getM_in());
//        	session.setAttribute("m_de", memberVo.getM_de());
        	
        	// 시연용
        	session.setAttribute("loginMember", customerVo);
        	session.setAttribute("email", customerVo.getM_email());
        	session.setAttribute("name", customerVo.getM_name());
        	session.setAttribute("m_status", customerVo.getM_status());
        	session.setAttribute("midx", customerVo.getMidx());
        	session.setAttribute("userId", customerVo.getM_id());
        	session.setAttribute("m_point", customerVo.getM_point());
        	session.setAttribute("m_in", customerVo.getM_in());
        	session.setAttribute("m_de", customerVo.getM_de());
        	session.setAttribute("m_no", customerVo.getM_no());
        	
        	session.setAttribute("access_Token", access_Token);
        	
//			model.addAttribute("vo", memberVo);
        	
        	// 시연용
        	model.addAttribute("vo", customerVo);
        	
        	
//    		System.out.println("loginMember : "+memberVo);
//    		System.out.println("email : "+memberVo.getM_email());
//    		System.out.println("name : "+memberVo.getM_name());
//    		System.out.println("m_status : "+memberVo.getM_status());
//    		System.out.println("midx : "+memberVo.getMidx());
//    		System.out.println("userId : "+memberVo.getM_id());
    		
        	// 시연용
    		System.out.println("loginMember : "+customerVo);
    		System.out.println("email : "+customerVo.getM_email());
    		System.out.println("name : "+customerVo.getM_name());
    		System.out.println("m_status : "+customerVo.getM_status());
    		System.out.println("midx : "+customerVo.getMidx());
    		System.out.println("userId : "+customerVo.getM_id());
    		System.out.println("m_in : "+customerVo.getM_in());
    		System.out.println("m_de : "+customerVo.getM_de());
    		System.out.println("m_no : "+customerVo.getM_no());
    		
        	/*
        		Logininterceptor에서 저장한 세션을 불러오고 
        	
        	 */
        	String h_name = (String)session.getAttribute("h_name");
        	String h_no = (String)session.getAttribute("h_no");
        	String h_number = (String)session.getAttribute("h_number");
        	System.out.println("#################################");
        	System.out.println("h_name : "+h_name);
        	System.out.println("h_no : "+h_no);
        	System.out.println("h_number : "+h_number);
        	if(h_name != null && h_no != null && h_number != null) {
        		try {
		        	System.out.println("#################################");
		        	return "redirect:/h/Insert.do?h_name="+h_name+"&h_no="+h_no+"&h_number="+h_number;			        	
				} catch (Exception e) {
					
				}
        		

        	}
	        	
	        	
        }
		return "redirect:/h/Main.do";
	}
	
	@RequestMapping("KakaoLogout.do")
	public String kakaologout(HttpSession session) {
		memberService.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.invalidate();
		return "redirect:/";

	}

}
