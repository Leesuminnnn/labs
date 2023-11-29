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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.CoopEvaluationService;
import com.nnn.app.vo.AjaxResponse4;
import com.nnn.app.vo.AjaxResponse5;
import com.nnn.app.vo.AjaxResponse6;
import com.nnn.app.vo.AjaxResponse7;
import com.nnn.app.vo.AnswerVo;
import com.nnn.app.vo.CoopusersVo;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.LoginlogVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.TargetVo;
import com.nnn.app.vo.UserPh;
import com.nnn.app.vo.WhetherVo;

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
		List<WhetherVo> list2 = new ArrayList<WhetherVo>();
		list2 = coopevaluationService.whetherSelect(map);
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
//	@RequestMapping(value="pwdActAjax/{id}")
//	public String pwdActAjax(CoopusersVo vo, HttpSession session, @PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response, Model md) throws NoSuchAlgorithmException {
////		// 암호화
////		SHA256 sha256 = new SHA256();
////		//비밀번호
////        String password = vo.getPwd();
////        //SHA256으로 암호화된 비밀번호
////        String cryptogram = sha256.encrypt(password);
////        
////        System.out.println(cryptogram);
////		//담은 변수를 DB에 넘겨준다.
////		vo.setPwd(cryptogram);
////		System.out.println("암호화된 페스워드 : "+cryptogram);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
////		map.put("pwd", cryptogram);
//		map.put("pwd", vo.getPwd());
//		map.put("id", vo.getId());
//		
//		int flag = coopevaluationService.pwdajax(map);
//		
//		if(flag >= 1) {
//			System.out.println(flag);
//			return "alert5";
//		} else {
//			return "alert5";
//		}
//	}
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
		// 진료부, 경혁팀, 부서장 영역
		if(team.equals("A") || team.equals("B") || team.equals("C")) {
			String ev = "AA";
			System.out.println("ev : " + ev);
			map.put("d2",ev);
			mv.addObject("ev", team);
		}
		// 부서원 영역
		else if (team.equals("D")) {
			String ev = "AB";
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
	public String fromAction(AnswerVo vo, HttpSession session, @PathVariable(name="idx") int infoidx, @PathVariable(name="idx2") int targetidx, @PathVariable("team") String team,
			HttpServletRequest request, HttpServletResponse response, Model md,
			@RequestParam(name="a1", required = false) String a1, @RequestParam(name="a2", required = false) String a2, @RequestParam(name="b3", required = false) String b3, 
			@RequestParam(name="b4", required = false) String b4, @RequestParam(name="c5", required = false) String c5, @RequestParam(name="c6", required = false) String c6, 
			@RequestParam(name="d7", required = false) String d7, @RequestParam(name="d8", required = false) String d8, @RequestParam(name="e9", required = false) String e9, 
			@RequestParam(name="e10", required = false) String e10, @RequestParam(name="f11", required = false) String f11, @RequestParam(name="a12", required = false) String a12, 
			@RequestParam(name="a13", required = false) String a13, @RequestParam(name="a14", required = false) String a14, @RequestParam(name="a15", required = false) String a15, 
			@RequestParam(name="a16", required = false) String a16, @RequestParam(name="a17", required = false) String a17, @RequestParam(name="a18", required = false) String a18, 
			@RequestParam(name="b19", required = false) String b19, @RequestParam(name="b20", required = false) String b20, @RequestParam(name="b21", required = false) String b21, 
			@RequestParam(name="b22", required = false) String b22, @RequestParam(name="c23", required = false) String c23, @RequestParam(name="c24", required = false) String c24, 
			@RequestParam(name="c25", required = false) String c25, @RequestParam(name="c26", required = false) String c26, @RequestParam(name="c27", required = false) String c27, 
			@RequestParam(name="d28", required = false) String d28, @RequestParam(name="d29", required = false) String d29, @RequestParam(name="e30", required = false) String e30, 
			@RequestParam(name="e31", required = false) String e31, @RequestParam(name="f32", required = false) String f32
			) throws Exception {
		session.getAttribute("loginMember");
		md.addAttribute("info", coopevaluationService.info(infoidx));
		md.addAttribute("target", coopevaluationService.info(targetidx));
		md.addAttribute("team", team);
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		
//		String u1 = coopevaluationService.info(infoidx).getHspt_name();		// 기관명
		String u2 = coopevaluationService.info(infoidx).getId();				// 평가자 사번
		String t1 = coopevaluationService.info(targetidx).getId();			// 평가대상자 사번
	

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
		System.out.println(c23);
		System.out.println(c24);
		System.out.println(c25);
		System.out.println(c26);
		System.out.println(c27);
		System.out.println(d28);
		System.out.println(d29);
		System.out.println(e30);
		System.out.println(e31);
		System.out.println(f32);
		
//		map.put("u1", u1);
		map.put("u2", u2);
		map.put("t1", t1);
		map.put("team", team);
		map2.put("team",team);
		// 진료부, 경혁팀, 부서장 영역
		if(team.equals("A") || team.equals("B") || team.equals("C")) {
			String ev = "AA";
			System.out.println("ev : " + ev);
			String d1 = a1+","+a2+","+b3+","+b4+","+c5+","+c6+","+d7+","+d8+","+e9+","+e10+","+f11;
			System.out.println(d1);
			map.put("ev", ev);
			map2.put("ev", ev);
			map.put("d1", d1);
		}
		// 부서원 영역
		else if (team.equals("D")) {
			String ev = "AB";
			System.out.println("ev : " + ev);
			String d1 = a12+","+a13+","+a14+","+a15+","+a16+","+a17+","+a18+","+b19+","+b20+","+b21+","+b22+","+c23+","+c24+
					","+c25+","+c26+","+c27+","+d28+","+d29+","+e30+","+e31+","+f32;
			map.put("d1", d1);
			map2.put("ev", ev);
			map.put("ev", ev);
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
//		List<CoopusersVo> list1 = coopevaluationService.users1(map);
//		List<CoopusersVo> list2 = coopevaluationService.users2(map);
//		List<CoopusersVo> list3 = coopevaluationService.users3(map);
//		List<CoopusersVo> listpwd1 = coopevaluationService.users1pwd(map);
//		List<CoopusersVo> listpwd2 = coopevaluationService.users2pwd(map);
//		List<CoopusersVo> listpwd3 = coopevaluationService.users3pwd(map);
//		List<LoginlogVo> log = coopevaluationService.log(map);
//		List<UserPh> ph = coopevaluationService.ph(map);
//		
//		
//		int hspt1 = coopevaluationService.hsptselect1(map);
//		int hspt2 = coopevaluationService.hsptselect2(map);
//		int hspt3 = coopevaluationService.hsptselect3(map);
//
//		int hsptpwdselect1 = coopevaluationService.hsptpwdselect1(map);
//		int hsptpwdselect2 = coopevaluationService.hsptpwdselect2(map);
//		int hsptpwdselect3 = coopevaluationService.hsptpwdselect3(map);
		
		mv.addObject("users", list);
		request.setAttribute("users", list);
//		mv.addObject("users1", list1);
//		request.setAttribute("users1", list1);
//		mv.addObject("users2", list2);
//		request.setAttribute("users2", list2);
//		mv.addObject("users3", list3);
//		request.setAttribute("users3", list3);
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
//		mv.addObject("h1", hspt1);
//		mv.addObject("h2", hspt2);
//		mv.addObject("h3", hspt3);
//		mv.addObject("p1", hsptpwdselect1);
//		mv.addObject("p2", hsptpwdselect2);
//		mv.addObject("p3", hsptpwdselect3);
//		request.setAttribute("h1", hspt1);
//		request.setAttribute("h2", hspt2);
//		request.setAttribute("h3", hspt3);
//		request.setAttribute("p1", hsptpwdselect1);
//		request.setAttribute("p2", hsptpwdselect2);
//		request.setAttribute("p3", hsptpwdselect3);
		
		mv.setViewName("d/admin");
		return mv;
	}
	
//	@ResponseBody
//	@RequestMapping(value="pwdreset/{id}")
//	public AjaxResponse6 pwdreset(HttpSession session, HttpServletRequest request, @PathVariable(name="id") int id) throws Exception {
//		AjaxResponse6 response = new AjaxResponse6();
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("id", id);
//		int flag = evaluationService.pwdreset(map);
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
//	@RequestMapping(value="pwdreset/{id}")
//	public String pwdreset(HttpSession session, HttpServletRequest request, @PathVariable(name="id") int id) throws Exception {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("id", id);
//		int flag = coopevaluationService.pwdreset(map);
//		
//		if(flag == 1) {
//			request.setAttribute("msg", "초기화 완료");
//			request.setAttribute("url", "d/admin");
//			return "alert";
//		}else {
//			request.setAttribute("msg", "오류발생");
//			return "alert";
//		}
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="pwdreset1/{id}")
//	public AjaxResponse6 pwdreset1(HttpSession session, HttpServletRequest request, @PathVariable(name="id") int id) throws Exception {
//		AjaxResponse6 response = new AjaxResponse6();
//		
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
//	public AjaxResponse6 pwdreset2(HttpSession session, HttpServletRequest request, @PathVariable(name="id") int id) throws Exception {
//		AjaxResponse6 response = new AjaxResponse6();
//		
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
//	public AjaxResponse6 pwdreset3(HttpSession session, HttpServletRequest request, @PathVariable(name="id") int id) throws Exception {
//		AjaxResponse6 response = new AjaxResponse6();
//		
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
//	@ResponseBody
//	@RequestMapping(value="usersAll")
//	public AjaxResponse4 usersall(HttpSession session, HttpServletRequest request) throws Exception {
//		AjaxResponse4 response = new AjaxResponse4();
//		response.setResult("Y");		
//		Map<String, Object> map = new HashMap<String, Object>();
//		List<CoopusersVo> list = coopevaluationService.users(map);
//		request.setAttribute("users", list);
////		response.setUsersall(list);
//
//		List<UserPh> ph = coopevaluationService.ph(map);
//		request.setAttribute("ph", ph);
//		response.setUserphList(ph);
//		
//		return response;
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="users1")
//	public AjaxResponse5 users1(HttpSession session, HttpServletRequest request, Model md) throws Exception {
//		AjaxResponse5 response = new AjaxResponse5();
//		response.setResult("Y");		
//		Map<String, Object> map = new HashMap<String, Object>();
//		List<CoopusersVo> list = coopevaluationService.users1(map);
//		List<CoopusersVo> listpwd1 = coopevaluationService.users1pwd(map);
//		request.setAttribute("userspwd1", listpwd1);
//		request.setAttribute("users", list);
//		response.setUsers(list);
//		response.setListpwd1(listpwd1);
//		
//		List<UserPh> ph = coopevaluationService.ph(map);
//		request.setAttribute("ph", ph);
//		response.setUserphList(ph);
//		
//		return response;
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="users2")
//	public AjaxResponse5 users2(HttpSession session, HttpServletRequest request) throws Exception {
//		AjaxResponse5 response = new AjaxResponse5();
//		response.setResult("Y");		
//		Map<String, Object> map = new HashMap<String, Object>();
//		List<CoopusersVo> list = coopevaluationService.users2(map);
//		request.setAttribute("users", list);
//		response.setUsers(list);
//		
//		List<UserPh> ph = coopevaluationService.ph(map);
//		request.setAttribute("ph", ph);
//		response.setUserphList(ph);
//		
//		return response;
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="users3")
//	public AjaxResponse5 users3(HttpSession session, HttpServletRequest request) throws Exception {
//		AjaxResponse5 response = new AjaxResponse5();
//		response.setResult("Y");		
//		Map<String, Object> map = new HashMap<String, Object>();
//		List<CoopusersVo> list = coopevaluationService.users3(map);
//		request.setAttribute("users", list);
//		response.setUsers(list);
//		
//		List<UserPh> ph = coopevaluationService.ph(map);
//		request.setAttribute("ph", ph);
//		response.setUserphList(ph);
//		
//		return response;
//	}
//
//	
//	
//	@ResponseBody
//	@RequestMapping(value="perall")
//	public AjaxResponse7 perall(HttpSession session, HttpServletRequest request) throws Exception {
//		AjaxResponse7 response = new AjaxResponse7();
//		response.setResult("Y");
//		Map<String, Object> map = new HashMap<String, Object>();
//		List<CoopusersVo> list = coopevaluationService.users(map);
//		List<TargetVo> target = coopevaluationService.target(map);
//		List<AnswerVo> answer = coopevaluationService.answerselect(map);
//		response.setUsersall(list);
//		response.setTarget(target);
//		response.setAnswer(answer);
//		
//		
//		return response;
//	}
//	
//	
//	@ResponseBody
//	@RequestMapping(value="per1")
//	public AjaxResponse7 per1(HttpSession session, HttpServletRequest request) throws Exception {
//		AjaxResponse7 response = new AjaxResponse7();
//		response.setResult("Y");
//		Map<String, Object> map = new HashMap<String, Object>();
//		List<CoopusersVo> list = coopevaluationService.users1(map);
//		List<TargetVo> target = coopevaluationService.target(map);
//		List<AnswerVo> answer = coopevaluationService.answerselect(map);
//		response.setUsersall(list);
//		response.setTarget(target);
//		response.setAnswer(answer);
//		
//		return response;
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="per2")
//	public AjaxResponse7 per2(HttpSession session, HttpServletRequest request) throws Exception {
//		AjaxResponse7 response = new AjaxResponse7();
//		response.setResult("Y");
//		Map<String, Object> map = new HashMap<String, Object>();
//		List<CoopusersVo> list = coopevaluationService.users2(map);
//		List<TargetVo> target = coopevaluationService.target(map);
//		List<AnswerVo> answer = coopevaluationService.answerselect(map);
//		response.setUsersall(list);
//		response.setTarget(target);
//		response.setAnswer(answer);
//		
//		return response;
//	}
//	
//	@ResponseBody
//	@RequestMapping(value="per3")
//	public AjaxResponse7 per3(HttpSession session, HttpServletRequest request) throws Exception {
//		AjaxResponse7 response = new AjaxResponse7();
//		response.setResult("Y");		
//		Map<String, Object> map = new HashMap<String, Object>();
//		List<CoopusersVo> list = coopevaluationService.users3(map);
//		List<TargetVo> target = coopevaluationService.target(map);
//		List<AnswerVo> answer = coopevaluationService.answerselect(map);
//		response.setUsersall(list);
//		response.setTarget(target);
//		response.setAnswer(answer);
//		
//		return response;
//	}
//	
	
	
}
