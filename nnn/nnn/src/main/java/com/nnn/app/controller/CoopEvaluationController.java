package com.nnn.app.controller;

import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.Month;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.nnn.app.service.CoopEvaluationService;
import com.nnn.app.vo.AjaxResponse10;
import com.nnn.app.vo.AjaxResponse11;
import com.nnn.app.vo.AjaxResponse12;
import com.nnn.app.vo.AjaxResponse8;
import com.nnn.app.vo.AnswerVo;
import com.nnn.app.vo.CAnswerVo;
import com.nnn.app.vo.CWhetherVo;
import com.nnn.app.vo.CoopusersVo;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.TargetVo;

@Controller
@RequestMapping(value="d/*")
public class CoopEvaluationController {
	private CoopEvaluationService coopevaluationService;
	

	@Autowired
	public CoopEvaluationController(CoopEvaluationService coopevaluationService) {
		this.coopevaluationService = coopevaluationService;
	}
	
	@RequestMapping(value="Login")
	public ModelAndView login(ModelAndView mv, NoticeVo vo) {
		// 공지사항 영역 리스트로 출력
		Map<String, Object> map = new HashMap<String, Object>();
		List<NoticeVo> list = coopevaluationService.noticeSelect(map);
		
		mv.addObject("notice", list);
		// 초기 로그인페이지 들어오면 사번/비밀번호로
		mv.addObject("dbpwdOk", true);
		mv.setViewName("d/login");
		return mv;
	}

	@RequestMapping(value="Loginprev")
	public ModelAndView login2(ModelAndView mv, NoticeVo vo) {
		// 공지사항 영역 리스트로 출력
		Map<String, Object> map = new HashMap<String, Object>();
		List<NoticeVo> list = coopevaluationService.noticeSelect(map);
		
		mv.addObject("notice", list);
		// 초기 로그인페이지 들어오면 사번/비밀번호로
		mv.addObject("dbpwdOk", true);
		mv.setViewName("d/prevlogin");
		return mv;
	}
	
	@RequestMapping(value="loginAction", method = RequestMethod.POST)
	public String loginaction(CoopusersVo vo, HttpSession session, Model md, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 비밀번호 복호화
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("#########################################");
		
		
		
		
		
		System.out.println("id : "+vo.getId());
		System.out.println("name : "+vo.getName());
		// 비밀번호 복호화
		
		// 유저가 입력한 비밀번호
		String password = vo.getPwd();
		
		// 비밀번호 암호화
        String cryptogram = aes128.encrypt(password); 
        System.out.println(cryptogram);
        // 암호화된 비밀번호로 DB와 일치하는지 체크
		vo.setPwd(cryptogram);
        //비밀번호 일치 여부
		System.out.println("#########################################");
		int loginMember = coopevaluationService.login(vo);
		String name = vo.getName();
		System.out.println("_________________________________________");
		/*
		 * 로그인 시 아이디와 비밀번호가 사번과 이름의 조합일 경우 비밀번호 변경페이지로 이동해야 한다.
		 * 아니면 ajax로 하단에 비밀번호 변경 영역이 생성되면 좋을거같다.
		 * */
		
		// 먼저 사번이 DB에 있는지 검색
		int Dbcheck = coopevaluationService.dbcheck(vo);
		if (Dbcheck == 0) {
			System.out.println(Dbcheck);
			System.out.println("Db에 id 없음");
			request.setAttribute("msg", "2023년도 직원근무평가 대상직원이 아닙니다.");
			request.setAttribute("url", "d/Login");
			return "alert5";
		}else {

			//아이디 혹은 비밀번호가 일치하지 않는 경우
			if(loginMember == 0) {
				request.setAttribute("msg", "사번/비밀번호로 체크 후 로그인해주세요.\\n아이디 혹은 비밀번호를 확인해 주세요");
				request.setAttribute("url", "d/Login");
				System.out.println("아이디 혹은 비밀번호를 확인해 주세요");
				return "alert5";
			}
			// 정보가 있을 경우 
			else if(loginMember == 1) {
				CoopusersVo info2 = coopevaluationService.info2(vo);
				int idx = info2.getIdx();
				System.out.println("info : "+info2);
				System.out.println("info2.idx : "+info2.getIdx());
				System.out.println("입력한 비번 : "+ vo.getPwd());
				// 아이디와 이름으로 로그인 성공 후 비밀번호가 설정되어있지 않는 경우 
				

				
				
				if(info2.getPwd() == null) {
					session.setAttribute("loginmember", vo.getId());
					request.setAttribute("msg", "현재 비밀번호가 설정되어 있지 않습니다. \\n비밀번호 설정 페이지로 이동합니다");
					request.setAttribute("url", "d/Pwd/"+idx);
					System.out.println( "현재 비밀번호가 설정되어 있지 않습니다. 비밀번호 설정 페이지로 이동합니다");
					// 로그인 한 유저 ip 알아내기
//					HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
//					String ip = req.getHeader("X-FORWARDED-FOR");
//					if (ip == null) {
//						ip = req.getRemoteAddr();
//					}
//					map.put("ip", ip);
//					System.out.println(ip);
//					coopevaluationService.loginlog(map);
					return "alert5";
				// DB에 비밀번호가 있는데 이름으로 로그인 한 경우
				}else if(info2.getPwd() != null && name != null){
					String dbpwdOk = "true"; 
					md.addAttribute("dbpwdOk", dbpwdOk);
					request.setAttribute("msg", "현재 비밀번호가 설정되어 있습니다. 비밀번호로 로그인을 해주세요");
					request.setAttribute("url", "d/Login");
					return "alert5";
				}else {
					System.out.println("#########################################");
					System.out.println("로그인 성공");
					//로그인 기록 저장
					map.put("id", vo.getId());
					map.put("name", info2.getName());
					System.out.println("#########################################");
					md.addAttribute("info", coopevaluationService.info(idx));
					// 로그인 한 유저 ip 알아내기
//					HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
//					String ip = req.getHeader("X-FORWARDED-FOR");
//					if (ip == null) {
//						ip = req.getRemoteAddr();
//					}
//					map.put("ip", ip);
//					System.out.println(ip);
//					coopevaluationService.loginlog(map);
					// 세션 저장
					
					session.setAttribute("loginmember", vo.getId());
					if(info2.getName().equals("관리자")) {
						return "redirect:/d/admin";
					}else {
						return "redirect:/d/Info/"+idx;
					}
					
				}
				
			}
		}
		return "";
	}
	
	@RequestMapping("Logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {

		session.invalidate();
		mav.setViewName("redirect:/d/Login");
		return mav;

	}
	
	
	@RequestMapping(value="Info/{idx}")
	public ModelAndView info(CoopusersVo vo, ModelAndView mv, HttpSession session, @PathVariable("idx") Integer idx, HttpServletRequest request) {
		session.getAttribute("loginMember");
		
		System.out.println("#########################1");
		Map<String, Object> map = new HashMap<String, Object>();

		String cname1 = coopevaluationService.info(idx).getC_name();
		String cname2 = coopevaluationService.info(idx).getC_name2();
		String csubcode = coopevaluationService.info(idx).getC_subcode();
		String csubname = coopevaluationService.info(idx).getC_subname();
		String po = coopevaluationService.info(idx).getC_position();
		String grade = coopevaluationService.info(idx).getGrade();
		String cm = coopevaluationService.info(idx).getC_M();
		String ph = coopevaluationService.info(idx).getPhone();
		
		System.out.println("############################1.5");

		System.out.println("info : "+ coopevaluationService.info(idx));
		System.out.println("시간 출력 : "+ coopevaluationService.info(idx).getReg_date());
		System.out.println("기관명 : "+cname1);
		System.out.println("소속기관명 : "+cname2);
		System.out.println("직급/직책 : "+po);
		System.out.println("등급 : "+grade);
		
		if (cm.equals("T")) {
			boolean management = true;
			map.put("management", management);
			System.out.println("management : "+management);
		}else {
			boolean management = false;
			map.put("management", management);
			System.out.println("management : "+management);
		}
//		
		map.put("cname1",cname1);
		map.put("cname2",cname2);
		map.put("csubcode",csubcode);
		map.put("csubname",csubname);
		map.put("po",po);
		map.put("grade",grade);
		map.put("ph",ph);
		map.put("idx",vo.getIdx());
		System.out.println(vo.getIdx());
		System.out.println(coopevaluationService.info(idx));
//		System.out.println(coopevaluationService.evaluationtarget(map));
		System.out.println("#########################2");
		mv.addObject("info", coopevaluationService.info(idx));
		// 평가 대상 출력		다른 사람이 평가완료 했을 경우 평가 받은사람이 여러개가 뜸. -> 
		List<CoopusersVo> list1 = new ArrayList<CoopusersVo>();
		list1 = coopevaluationService.coopevaluationtarget(map);
		System.out.println("#############################");
		mv.addObject("target", list1);
//		System.out.println(list1);
		System.out.println("#############################");
		// 평가 완료한 리스트 출력?		
		List<CWhetherVo> list2 = new ArrayList<CWhetherVo>();
		list2 = coopevaluationService.whetherSelect(map);
		System.out.println("평가 완료 리스트 출력 : "+list2);
		mv.addObject("endlist", list2);
		
		LocalDateTime now = LocalDateTime.now();
		mv.addObject("now", now);
		System.out.println(now);
		// 비교할 특정 날짜 설정 (예: 2023년 1월 1일)
        LocalDateTime specificDate = LocalDateTime.of(2023, Month.DECEMBER, 6, 0, 0);
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
		
//		// 부서장 쿼리 출력
//		List<TestusersVo> list2 = new ArrayList<TestusersVo>();
//		list2 = testService.BTlist(map);
//		mv.addObject("BTlist", list2);
//		System.out.println(list2);
//		// 부서원 쿼리 출력
//		List<TestusersVo> list3 = new ArrayList<TestusersVo>();
//		list3 = testService.BFlist(map);
//		mv.addObject("BFlist", list3);
//		System.out.println(list3);
		
		mv.setViewName("d/info");
		return mv;
	}
	@RequestMapping(value="Pwd/{idx}")
	public ModelAndView pwd(ModelAndView mv, HttpSession session, @PathVariable("idx") Integer idx, HttpServletRequest request) {
		session.getAttribute("loginMember");
		mv.addObject("info", coopevaluationService.info(idx));
		
		
		
		mv.setViewName("d/pwd");
		return mv;
	}
	@RequestMapping(value="Findpwd")
	public ModelAndView findpwd(ModelAndView mv, NoticeVo vo) {
		mv.setViewName("d/findpwd");
		return mv;
	}
	
	// 비밀번호 찾기 전 회원정보 일치하는지 ajax
	@ResponseBody
	@RequestMapping(value="FindpwdAjax")
	public AjaxResponse10 per1(HttpSession session, HttpServletRequest request, @RequestParam("id")String id, @RequestParam("ph")String ph) throws Exception {
		AjaxResponse10 response = new AjaxResponse10();
		response.setResult("N");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("ph", ph);
		System.out.println(id);
		System.out.println(ph);
//			List<UsersVo> list = evaluationService.users1(map);
		
		int phOne = coopevaluationService.phOne(map);
		
		if(phOne == 1) {
			response.setResult("Y");
		}else {
			response.setResult("N");
		}
		
		
		
		return response;
	}
	@RequestMapping(value="pwdAction/{idx}")
	public String pwdAction(CoopusersVo vo, HttpSession session, @PathVariable("idx") int idx, HttpServletRequest request, HttpServletResponse response, Model md) throws NoSuchAlgorithmException {
		session.getAttribute("loginMember");
		md.addAttribute("info", coopevaluationService.info(idx));
		
		// 암호화
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		//비밀번호
        String password = vo.getPwd();
        //aes128으로 암호화된 비밀번호
        String cryptogram = aes128.encrypt(password);
        
        System.out.println(cryptogram);
		//담은 변수를 DB에 넘겨준다.
		vo.setPwd(cryptogram);
		System.out.println("암호화된 페스워드 : "+cryptogram);
		
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("pwd", cryptogram);
		map.put("pwd", vo.getPwd());
		map.put("idx", vo.getIdx());
		
		int flag = coopevaluationService.pwdinsert(map);
		
		if(flag >= 1) {
			System.out.println(flag);
			request.setAttribute("msg", "비밀번호 변경이 완료되었습니다. \\n사번/비밀번호로 체크 후 로그인해주세요");
			request.setAttribute("url", "d/Info/"+idx);
			return "alert5";
		} else {
			request.setAttribute("msg", "비밀번호 변경중 오류가 발생했습니다. 다시 시도해 주세요.");
			request.setAttribute("url", "d/Pwd/"+idx);
			return "alert5";
		}
		
		
	}
	@ResponseBody
	@RequestMapping(value="PwdActAjax/{id}")
	public AjaxResponse8 pwdActAjax(CoopusersVo vo, HttpSession session, @PathVariable("id") String id, HttpServletRequest request, Model md) throws NoSuchAlgorithmException {
		AjaxResponse8 response = new AjaxResponse8();
		response.setResult("N");
		// 암호화
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		//비밀번호
        String password = vo.getPwd();
        //aes128으로 암호화된 비밀번호
        String cryptogram = aes128.encrypt(password);
        
        System.out.println(cryptogram);
		//담은 변수를 DB에 넘겨준다.
		vo.setPwd(cryptogram);
		System.out.println("암호화된 페스워드 : "+cryptogram);
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pwd", cryptogram);
//		map.put("pwd", vo.getPwd());
		map.put("id", vo.getId());
		
		int flag = coopevaluationService.pwdajax(map);
		
		if(flag >= 1) {
			response.setResult("Y");
		} else {
			response.setResult("N");
		}
		return response;
	}
	@RequestMapping(value="Form/{idx}/{idx2}/{team}")
	public ModelAndView form(ModelAndView mv, HttpSession session, 
			HttpServletRequest request, @PathVariable("idx") int idx, @PathVariable("idx2") int idx2, 
			@PathVariable("team") String team) {
		session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		mv.addObject("info", coopevaluationService.info(idx));
		System.out.println("++++++++++++++++++++++++++++++++++++++++++");
		System.out.println( coopevaluationService.info(idx));
		System.out.println( coopevaluationService.info(idx2));
		System.out.println(team);
		System.out.println("++++++++++++++++++++++++++++++++++++++++++");
		mv.addObject("target", coopevaluationService.info(idx2));
		// 운영진, 부서장 영역
		if(team.equals("A") || team.equals("B") || team.equals("C") || team.equals("E")) {
			String ev = "AC";
			System.out.println("ev : " + ev);
			map.put("d2",ev);
			mv.addObject("ev", team);
		}
		// 정성/사랑모아 부서원 영역
		else if (team.equals("D")) {
			String ev = "AD";
			System.out.println("ev : " + ev);
			mv.addObject("ev", team);
			map.put("d2",ev);
		}
		// 장례문화원, 조이, 핵심, 자야 부서원 영역
		else if (team.equals("F")) {
			String ev = "AE";
			System.out.println("ev : " + ev);
			mv.addObject("ev", team);
			map.put("d2",ev);
		}
		List<EvaluationVo> list1 = new ArrayList<EvaluationVo>();
		list1 = coopevaluationService.evlist(map);
		
		
		mv.addObject("evf", list1);
		mv.setViewName("d/form");
		return mv;
	}
	// 평가 후 Db저장
	@RequestMapping(value="formAction/{idx}/{idx2}/{team}")
	public String fromAction(CAnswerVo vo, HttpSession session, @PathVariable(name="idx") int infoidx, @PathVariable(name="idx2") int targetidx, @PathVariable("team") String team,
			HttpServletRequest request, HttpServletResponse response, Model md,
			@RequestParam(name="a33", required = false) String a33,
			@RequestParam(name="a34", required = false) String a34,
			@RequestParam(name="b35", required = false) String b35,
			@RequestParam(name="b36", required = false) String b36,
			@RequestParam(name="c37", required = false) String c37,
			@RequestParam(name="c38", required = false) String c38,
			@RequestParam(name="d39", required = false) String d39,
			@RequestParam(name="d40", required = false) String d40,
			@RequestParam(name="e41", required = false) String e41,
			@RequestParam(name="e42", required = false) String e42,
			@RequestParam(name="a43", required = false) String a43,
			@RequestParam(name="a44", required = false) String a44,
			@RequestParam(name="a45", required = false) String a45,
			@RequestParam(name="a46", required = false) String a46,
			@RequestParam(name="a47", required = false) String a47,
			@RequestParam(name="a48", required = false) String a48,
			@RequestParam(name="a49", required = false) String a49,
			@RequestParam(name="a50", required = false) String a50,
			@RequestParam(name="a51", required = false) String a51,
			@RequestParam(name="a52", required = false) String a52,
			@RequestParam(name="b53", required = false) String b53,
			@RequestParam(name="b54", required = false) String b54,
			@RequestParam(name="b55", required = false) String b55,
			@RequestParam(name="b56", required = false) String b56,
			@RequestParam(name="b57", required = false) String b57,
			@RequestParam(name="c58", required = false) String c58,
			@RequestParam(name="c59", required = false) String c59,
			@RequestParam(name="c60", required = false) String c60,
			@RequestParam(name="c61", required = false) String c61,
			@RequestParam(name="c62", required = false) String c62,
			@RequestParam(name="a63", required = false) String a63,
			@RequestParam(name="a64", required = false) String a64,
			@RequestParam(name="a65", required = false) String a65,
			@RequestParam(name="a66", required = false) String a66,
			@RequestParam(name="a67", required = false) String a67,
			@RequestParam(name="a68", required = false) String a68,
			@RequestParam(name="a69", required = false) String a69,
			@RequestParam(name="a70", required = false) String a70,
			@RequestParam(name="a71", required = false) String a71,
			@RequestParam(name="a72", required = false) String a72,
			@RequestParam(name="b73", required = false) String b73,
			@RequestParam(name="b74", required = false) String b74,
			@RequestParam(name="b75", required = false) String b75,
			@RequestParam(name="b76", required = false) String b76,
			@RequestParam(name="b77", required = false) String b77,
			@RequestParam(name="c78", required = false) String c78,
			@RequestParam(name="c79", required = false) String c79,
			@RequestParam(name="c80", required = false) String c80,
			@RequestParam(name="c81", required = false) String c81,
			@RequestParam(name="c82", required = false) String c82,
			@RequestParam(name="g83", required = false) String g83,
			@RequestParam(name="g84", required = false) String g84,
			@RequestParam(name="g85", required = false) String g85			) throws Exception {
		session.getAttribute("loginMember");
		md.addAttribute("info", coopevaluationService.info(infoidx));
		md.addAttribute("target", coopevaluationService.info(targetidx));
		md.addAttribute("team", team);
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		String u1 = coopevaluationService.info(infoidx).getC_name();		// 기관명
		String u2 = coopevaluationService.info(infoidx).getId();				// 평가자 사번
		String t1 = coopevaluationService.info(targetidx).getId();			// 평가대상자 사번
	

		// 평가 시작하면 whether 테이블에 평가자와 평가 대상자 , 진행 여부 insert
		map2.put("d1", infoidx);
		map2.put("d2", targetidx);
		System.out.println(a33);
		System.out.println(a34);
		System.out.println(b35);
		System.out.println(b36);
		System.out.println(c37);
		System.out.println(c38);
		System.out.println(d39);
		System.out.println(d40);
		System.out.println(e41);
		System.out.println(e42);
		
		System.out.println(a43);
		System.out.println(a44);
		System.out.println(a45);
		System.out.println(a46);
		System.out.println(a47);
		System.out.println(a48);
		System.out.println(a49);
		System.out.println(a50);
		System.out.println(a51);
		System.out.println(a52);
		System.out.println(b53);
		System.out.println(b54);
		System.out.println(b55);
		System.out.println(b56);
		System.out.println(b57);
		System.out.println(c58);
		System.out.println(c59);
		System.out.println(c60);
		System.out.println(c61);
		System.out.println(c62);
		
		System.out.println(a63);
		System.out.println(a64);
		System.out.println(a65);
		System.out.println(a66);
		System.out.println(a67);
		System.out.println(a68);
		System.out.println(a69);
		System.out.println(a70);
		System.out.println(a71);
		System.out.println(a72);
		System.out.println(b73);
		System.out.println(b74);
		System.out.println(b75);
		System.out.println(b76);
		System.out.println(b77);
		System.out.println(c78);
		System.out.println(c79);
		System.out.println(c80);
		System.out.println(c81);
		System.out.println(c82);
		
		System.out.println(g83);
		System.out.println(g84);
		System.out.println(g85);
		
		map.put("u1", u1);
		map.put("u2", u2);
		map.put("t1", t1);
		map.put("team", team);
		map2.put("team",team);
		// 진료부, 경혁팀, 부서장 영역
		if(team.equals("A") || team.equals("B") || team.equals("C") || team.equals("E")) {
			String ev = "AA";
			System.out.println("ev : " + ev);
			String d1 =a33+","+a34+","+b35+","+b36+","+c37+","+c38+","+d39+","+d40+","+e41+","+e42+","+g83;
			System.out.println(d1);
			map.put("ev", ev);
			map2.put("ev", ev);
			map.put("d1", d1);
		}
		// 부서원 영역
		else if (team.equals("D")) {
			String ev = "AB";
			System.out.println("ev : " + ev);
			String d1 =a43+","+a44+","+a45+","+a46+","+a47+","+a48+","+a49+","+a50+","+a51+","+a52+","+b53+","+b54+","+b55+","+b56+","+b57+","+c58+","+c59+","+c60+","+c61+","+c62+","+g84;									
			map.put("d1", d1);
			map2.put("ev", ev);
			map.put("ev", ev);
		}// 장례문화원, 조이, 핵심, 자야 부서원 영역
		else if (team.equals("F")) {
			String ev = "AE";
			System.out.println("ev : " + ev);
			String d1 =a63+","+a64+","+a65+","+a66+","+a67+","+a68+","+a69+","+a70+","+a71+","+a72+","+b73+","+b74+","+b75+","+b76+","+b77+","+c78+","+c79+","+c80+","+c81+","+c82+","+g85;
			map.put("d1", d1);
			map2.put("ev", ev);
			map.put("ev", ev);
		}
		
		List<CAnswerVo> list = new ArrayList<CAnswerVo>();
		
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
		
		// DB 전송 전 중복 체크
		
		int selectflag = coopevaluationService.formcheck(map2);
		System.out.println(selectflag);
		if (selectflag == 1) {
			request.setAttribute("msg", "이미 평가가 완료된 대상입니다.");
			request.setAttribute("url", "d/Info/"+infoidx);
			return "alert5";
		}else {
			int flag = coopevaluationService.frominsert(map);
			 ///db 전송 이후 
			if(flag == 1) {
				request.setAttribute("msg", "평가가 완료되었습니다.");
				request.setAttribute("url", "d/FormEnd/"+infoidx+"/"+targetidx);
				// view 단에서 미평가, 평가 진행중, 평가 완료 에 따라 값을 다르게 주면 각각 다른 메세지를 띄워줄 수 있음
				// 먼저 평가페이지에 들어온 기록이 있는지 (테이블에 평가자와 평가 대상자가 있는지 검색)
				// 검색 후 기록이 없으면 insert, 
				int flag2 = coopevaluationService.whether(map2);
				// 평가 진행후 
				System.out.println("평가 진행 여부 table insert  :  "+flag2);
				return "alert5";
			} else {

				request.setAttribute("msg", "오류발생");
				request.setAttribute("url", "d/Info/"+infoidx);
				return "alert5";
			}
		}
		
		
		
	}
	

	@RequestMapping(value="FormEnd/{idx}/{idx2}")
	public ModelAndView formend( @PathVariable(name="idx") int infoidx, @PathVariable(name="idx2") int targetidx, HttpSession session, ModelAndView mv) throws Exception {
		
		session.getAttribute("loginMember");
		mv.addObject("info", coopevaluationService.info(infoidx));
		System.out.println("++++++++++++++++++++++++++++++++++++++++++");
		System.out.println( coopevaluationService.info(infoidx));
		System.out.println( coopevaluationService.info(targetidx));
		System.out.println("++++++++++++++++++++++++++++++++++++++++++");
		mv.addObject("target", coopevaluationService.info(targetidx));
		Map<String, Object> map = new HashMap<String, Object>();
		
		mv.setViewName("d/formend");
		return mv;
	}
	
	@RequestMapping(value="admin")
	public ModelAndView admin(HttpSession session, ModelAndView mv, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.users(map);
		List<CoopusersVo> list1 = coopevaluationService.user1(map);
		List<CoopusersVo> list2 = coopevaluationService.user2(map);
		List<CoopusersVo> list3 = coopevaluationService.user3(map);
		List<CoopusersVo> list4 = coopevaluationService.user4(map);
		List<CoopusersVo> list5 = coopevaluationService.user5(map);
		List<CoopusersVo> list6 = coopevaluationService.user6(map);
		List<CoopusersVo> list7 = coopevaluationService.user7(map);

		// 업체별 직원 전체 수(비밀번호 설정해야 하는인원)
		int coop1 = coopevaluationService.usercnt1(map);
		int coop2 = coopevaluationService.usercnt2(map);
		int coop3 = coopevaluationService.usercnt3(map);
		int coop4 = coopevaluationService.usercnt4(map);
		int coop5 = coopevaluationService.usercnt5(map);
		int coop6 = coopevaluationService.usercnt6(map);
		int coop7 = coopevaluationService.usercnt7(map);
		
		// 업체별 직원 비밀번호 설정한 인원
		int userpwd1 = coopevaluationService.userpwd1(map);
		int userpwd2 = coopevaluationService.userpwd2(map);
		int userpwd3 = coopevaluationService.userpwd3(map);
		int userpwd4 = coopevaluationService.userpwd4(map);
		int userpwd5 = coopevaluationService.userpwd5(map);
		int userpwd6 = coopevaluationService.userpwd6(map);
		int userpwd7 = coopevaluationService.userpwd7(map);
		
//		List<CoopusersVo> listpwd1 = coopevaluationService.userpwd1(map);
//		List<CoopusersVo> listpwd2 = coopevaluationService.userpwd2(map);
//		List<CoopusersVo> listpwd3 = coopevaluationService.userpwd3(map);
//		List<CoopusersVo> listpwd4 = coopevaluationService.userpwd4(map);
//		List<CoopusersVo> listpwd5 = coopevaluationService.userpwd5(map);
//		List<CoopusersVo> listpwd6 = coopevaluationService.userpwd6(map);
//		List<CoopusersVo> listpwd7 = coopevaluationService.userpwd7(map);
		
		
		
		mv.addObject("users", list);
		request.setAttribute("users", list);
		mv.addObject("users1", list1);
		request.setAttribute("users1", list1);
		mv.addObject("users2", list2);
		request.setAttribute("users2", list2);
		mv.addObject("users3", list3);
		request.setAttribute("users3", list3);
		mv.addObject("users3", list4);
		request.setAttribute("users4", list4);
		mv.addObject("users3", list5);
		request.setAttribute("users5", list5);
		mv.addObject("users3", list6);
		request.setAttribute("users6", list6);
		mv.addObject("users3", list7);
		request.setAttribute("users7", list7);
//		
//		mv.addObject("userspwd1", listpwd1);
//		request.setAttribute("userspwd1", listpwd1);
//		mv.addObject("userspwd2", listpwd2);
//		request.setAttribute("users2pwd", listpwd2);
//		mv.addObject("userspwd3", listpwd3);
//		request.setAttribute("userspwd3", listpwd3);
//		
//		mv.addObject("log", log);
//		request.setAttribute("log",log);
//		mv.addObject("ph",ph);
//		request.setAttribute("ph", ph);
		mv.addObject("h1", coop1);
		mv.addObject("h2", coop2);
		mv.addObject("h3", coop3);
		mv.addObject("h4", coop4);
		mv.addObject("h5", coop5);
		mv.addObject("h6", coop6);
		mv.addObject("h7", coop7);
		mv.addObject("p1", userpwd1);
		mv.addObject("p2", userpwd2);
		mv.addObject("p3", userpwd3);
		mv.addObject("p4", userpwd4);
		mv.addObject("p5", userpwd5);
		mv.addObject("p6", userpwd6);
		mv.addObject("p7", userpwd7);
		
		request.setAttribute("h1", coop1);
		request.setAttribute("h2", coop2);
		request.setAttribute("h3", coop3);
		request.setAttribute("h4", coop4);
		request.setAttribute("h5", coop5);
		request.setAttribute("h6", coop6);
		request.setAttribute("h7", coop7);
//		request.setAttribute("p1", hsptpwdselect1);
//		request.setAttribute("p2", hsptpwdselect2);
//		request.setAttribute("p3", hsptpwdselect3);
		
		mv.setViewName("d/admin");
		return mv;
	}
	

	@RequestMapping(value="pwdreset/{id}")
	public String pwdreset(HttpSession session, HttpServletRequest request, @PathVariable(name="id") int id) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		int flag = coopevaluationService.pwdreset(map);
		
		if(flag == 1) {
			request.setAttribute("msg", "초기화 완료");
			request.setAttribute("url", "d/admin");
			return "alert";
		}else {
			request.setAttribute("msg", "오류발생");
			return "alert";
		}
	}
//	
//	@ResponseBody
//	@RequestMapping(value="pwdreset1/{id}")
//	public AjaxResponse pwdreset1(HttpSession session, HttpServletRequest request, @PathVariable(name="id") int id) throws Exception {
//		AjaxResponse response = new AjaxResponse6();
//		//AjaxResponse10 이후로 써야함 효사랑그룹이랑 계열사 직원 DB다름
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("id", id);
//		int flag = coopevaluationService.pwdreset1(map);
//		
//		if(flag == 1) {
//			response.setResult("Y");
//			return response;
//		}else {
//			response.setResult("N");
//			return response;
//		}
//	}
//	@ResponseBody
//	@RequestMapping(value="pwdreset2/{id}")
//	public AjaxResponse pwdreset2(HttpSession session, HttpServletRequest request, @PathVariable(name="id") int id) throws Exception {
//		AjaxResponse response = new AjaxResponse6();
//		//AjaxResponse10 이후로 써야함 효사랑그룹이랑 계열사 직원 DB다름
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("id", id);
//		int flag = coopevaluationService.pwdreset2(map);
//		
//		if(flag == 1) {
//			response.setResult("Y");
//			return response;
//		}else {
//			response.setResult("N");
//			return response;
//		}
//	}
//	@ResponseBody
//	@RequestMapping(value="pwdreset3/{id}")
//	public AjaxResponse pwdreset3(HttpSession session, HttpServletRequest request, @PathVariable(name="id") int id) throws Exception {
//		AjaxResponse response = new AjaxResponse6();
//		//AjaxResponse10 이후로 써야함 효사랑그룹이랑 계열사 직원 DB다름
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("id", id);
//		int flag = coopevaluationService.pwdreset3(map);
//		
//		if(flag == 1) {
//			response.setResult("Y");
//			return response;
//		}else {
//			response.setResult("N");
//			return response;
//		}
//	}
//	
	@ResponseBody
	@RequestMapping(value="usersAll")
	public AjaxResponse11 usersall(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse11 response = new AjaxResponse11();
		//AjaxResponse10 이후로 써야함 효사랑그룹이랑 계열사 직원 DB다름
		response.setResult("Y");		
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.users(map);
		request.setAttribute("users", list);
		response.setUsers(list);

		return response;
	}
	
	@ResponseBody
	@RequestMapping(value="users1")
	public AjaxResponse11 users1(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse11 response = new AjaxResponse11();
		response.setResult("Y");		
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user1(map);
		request.setAttribute("users", list);
		response.setUsers(list);
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value="users2")
	public AjaxResponse11 users2(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse11 response = new AjaxResponse11();
		response.setResult("Y");		
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user2(map);
		request.setAttribute("users", list);
		response.setUsers(list);
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value="users3")
	public AjaxResponse11 users3(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse11 response = new AjaxResponse11();
		response.setResult("Y");		
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user3(map);
		request.setAttribute("users", list);
		response.setUsers(list);
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value="users4")
	public AjaxResponse11 users4(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse11 response = new AjaxResponse11();
		response.setResult("Y");		
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user4(map);
		request.setAttribute("users", list);
		response.setUsers(list);
		
		return response;
	}
	@ResponseBody
	@RequestMapping(value="users5")
	public AjaxResponse11 users5(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse11 response = new AjaxResponse11();
		response.setResult("Y");		
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user5(map);
		request.setAttribute("users", list);
		response.setUsers(list);
		
		return response;
	}

	@ResponseBody
	@RequestMapping(value="users6")
	public AjaxResponse11 users6(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse11 response = new AjaxResponse11();
		response.setResult("Y");		
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user6(map);
		request.setAttribute("users", list);
		response.setUsers(list);
		
		return response;
	}

	@ResponseBody
	@RequestMapping(value="users7")
	public AjaxResponse11 users7(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse11 response = new AjaxResponse11();
		response.setResult("Y");		
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user7(map);
		request.setAttribute("users", list);
		response.setUsers(list);
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value="perall")
	public AjaxResponse12 perall(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse12 response = new AjaxResponse12();
		response.setResult("Y");
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user(map);
		List<TargetVo> target = coopevaluationService.target(map);
		List<CAnswerVo> answer = coopevaluationService.answerselect(map);
		int targetsum = coopevaluationService.targetsum(map);
		int answersum = coopevaluationService.answersum(map);
		response.setUsers(list);
		response.setTarget(target);
		response.setAnswer(answer);
		response.setTargetsum(targetsum);
		response.setAnswersum(answersum);
		
		return response;
	}
	

	@ResponseBody
	@RequestMapping(value="per1")
	public AjaxResponse12 per1(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse12 response = new AjaxResponse12();
		response.setResult("Y");
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user1(map);
		int targetsum = coopevaluationService.targetsum1(map);
		int answersum = coopevaluationService.answersum1(map);
		List<TargetVo> target = coopevaluationService.target1(map);
		List<CAnswerVo> answer = coopevaluationService.answerselect(map);
		response.setUsers(list);
		response.setTargetsum(targetsum);
		response.setAnswersum(answersum);
		response.setTarget(target);
		response.setAnswer(answer);
		
		return response;
	}

	@ResponseBody
	@RequestMapping(value="per2")
	public AjaxResponse12 per2(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse12 response = new AjaxResponse12();
		response.setResult("Y");
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user2(map);
		int targetsum = coopevaluationService.targetsum2(map);
		int answersum = coopevaluationService.answersum2(map);
		List<TargetVo> target = coopevaluationService.target2(map);
		List<CAnswerVo> answer = coopevaluationService.answerselect(map);
		response.setUsers(list);
		response.setTargetsum(targetsum);
		response.setAnswersum(answersum);
		response.setTarget(target);
		response.setAnswer(answer);
		
		return response;
	}

	@ResponseBody
	@RequestMapping(value="per3")
	public AjaxResponse12 per3(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse12 response = new AjaxResponse12();
		response.setResult("Y");
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user3(map);
		int targetsum = coopevaluationService.targetsum3(map);
		int answersum = coopevaluationService.answersum3(map);
		List<TargetVo> target = coopevaluationService.target3(map);
		List<CAnswerVo> answer = coopevaluationService.answerselect(map);
		response.setUsers(list);
		response.setTargetsum(targetsum);
		response.setAnswersum(answersum);
		response.setTarget(target);
		response.setAnswer(answer);
		
		return response;
	}

	@ResponseBody
	@RequestMapping(value="per4")
	public AjaxResponse12 per4(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse12 response = new AjaxResponse12();
		response.setResult("Y");
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user4(map);
		int targetsum = coopevaluationService.targetsum4(map);
		int answersum = coopevaluationService.answersum4(map);
		List<TargetVo> target = coopevaluationService.target4(map);
		List<CAnswerVo> answer = coopevaluationService.answerselect(map);
		response.setUsers(list);
		response.setTargetsum(targetsum);
		response.setAnswersum(answersum);
		response.setTarget(target);
		response.setAnswer(answer);
		
		return response;
	}

	@ResponseBody
	@RequestMapping(value="per5")
	public AjaxResponse12 per5(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse12 response = new AjaxResponse12();
		response.setResult("Y");
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user5(map);
		int targetsum = coopevaluationService.targetsum5(map);
		int answersum = coopevaluationService.answersum5(map);
		List<TargetVo> target = coopevaluationService.target5(map);
		List<CAnswerVo> answer = coopevaluationService.answerselect(map);
		response.setUsers(list);
		response.setTargetsum(targetsum);
		response.setAnswersum(answersum);
		response.setTarget(target);
		response.setAnswer(answer);
		
		return response;
	}

	@ResponseBody
	@RequestMapping(value="per6")
	public AjaxResponse12 per6(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse12 response = new AjaxResponse12();
		response.setResult("Y");
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user6(map);
		int targetsum = coopevaluationService.targetsum6(map);
		int answersum = coopevaluationService.answersum6(map);
		List<TargetVo> target = coopevaluationService.target6(map);
		List<CAnswerVo> answer = coopevaluationService.answerselect(map);
		response.setUsers(list);
		response.setTargetsum(targetsum);
		response.setAnswersum(answersum);
		response.setTarget(target);
		response.setAnswer(answer);
		
		return response;
	}

	@ResponseBody
	@RequestMapping(value="per7")
	public AjaxResponse12 per7(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse12 response = new AjaxResponse12();
		response.setResult("Y");
		Map<String, Object> map = new HashMap<String, Object>();
		List<CoopusersVo> list = coopevaluationService.user7(map);
		int targetsum = coopevaluationService.targetsum7(map);
		int answersum = coopevaluationService.answersum7(map);
		List<TargetVo> target = coopevaluationService.target7(map);
		List<CAnswerVo> answer = coopevaluationService.answerselect(map);
		response.setUsers(list);
		response.setTargetsum(targetsum);
		response.setAnswersum(answersum);
		response.setTarget(target);
		response.setAnswer(answer);
		
		return response;
	}
	
}
