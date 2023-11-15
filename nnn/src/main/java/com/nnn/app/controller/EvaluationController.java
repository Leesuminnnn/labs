package com.nnn.app.controller;

import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.EvaluationService;
import com.nnn.app.vo.AnswerVo;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.UsersVo;
import com.nnn.app.vo.WhetherVo;

@Controller
@RequestMapping(value="e/*")
public class EvaluationController {
	private EvaluationService evaluationService;
	

	@Autowired
	public EvaluationController(EvaluationService evaluationService) {
		this.evaluationService = evaluationService;
	}
	
	@RequestMapping(value="Login")
	public ModelAndView login(ModelAndView mv, NoticeVo vo) {
		// 공지사항 영역 리스트로 출력
		Map<String, Object> map = new HashMap<String, Object>();
		List<NoticeVo> list = evaluationService.noticeSelect(map);
		
		mv.addObject("notice", list);
		// 초기 로그인페이지 들어오면 사번/비밀번호로
		mv.addObject("dbpwdOk", true);
		mv.setViewName("e/login");
		return mv;
	}

	@RequestMapping(value="loginAction", method = RequestMethod.POST)
	public String loginaction(UsersVo vo, HttpSession session, Model md, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		int loginMember = evaluationService.login(vo);
		String name = vo.getName();
		System.out.println("_________________________________________");
		/*
		 * 로그인 시 아이디와 비밀번호가 사번과 이름의 조합일 경우 비밀번호 변경페이지로 이동해야 한다.
		 * 아니면 ajax로 하단에 비밀번호 변경 영역이 생성되면 좋을거같다.
		 * */
		
		// 먼저 사번이 DB에 있는지 검색
		int Dbcheck = evaluationService.dbcheck(vo);
		if (Dbcheck == 0) {
			System.out.println(Dbcheck);
			System.out.println("Db에 id 없음");
			request.setAttribute("msg", "2023년도 직원근무평가 대상직원이 아닙니다.");
			request.setAttribute("url", "e/Login");
			return "alert5";
		}else {

			//아이디 혹은 비밀번호가 일치하지 않는 경우
			if(loginMember == 0) {
				request.setAttribute("msg", "사번/비밀번호로 체크 후 로그인해주세요.\\n아이디 혹은 비밀번호를 확인해 주세요");
				request.setAttribute("url", "e/Login");
				System.out.println("아이디 혹은 비밀번호를 확인해 주세요");
				return "alert5";
			}
			// 정보가 있을 경우 
			else if(loginMember == 1) {
				UsersVo info2 = evaluationService.info2(vo);
				int idx = info2.getIdx();
				System.out.println("info : "+info2);
				System.out.println("info2.idx : "+info2.getIdx());
				// 아이디와 이름으로 로그인 성공 후 비밀번호가 설정되어있지 않는 경우 
				if(info2.getPwd() == null) {
					
					request.setAttribute("msg", "현재 비밀번호가 설정되어 있지 않습니다. \\n비밀번호 설정 페이지로 이동합니다");
					request.setAttribute("url", "e/Pwd/"+idx);
					System.out.println( "현재 비밀번호가 설정되어 있지 않습니다. 비밀번호 설정 페이지로 이동합니다");
					return "alert5";
				// DB에 비밀번호가 있는데 이름으로 로그인 한 경우
				}else if(info2.getPwd() != null && name != null){
					String dbpwdOk = "true"; 
					md.addAttribute("dbpwdOk", dbpwdOk);
					request.setAttribute("msg", "현재 비밀번호가 설정되어 있습니다. 비밀번호로 로그인을 해주세요");
					request.setAttribute("url", "e/Login");
					return "alert5";
				}else {
					System.out.println("#########################################");
					System.out.println("로그인 성공");
					//로그인 기록 저장
					map.put("id", vo.getId());
					map.put("name", info2.getName());
					System.out.println("#########################################");
					// 로그인 한 유저 ip 알아내기
					HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
					String ip = req.getHeader("X-FORWARDED-FOR");
					if (ip == null) {
						ip = req.getRemoteAddr();
					}
					map.put("ip", ip);
					System.out.println(ip);
					evaluationService.loginlog(map);
					// 세션 저장
					session.setAttribute("loginmember", vo.getId());
					if(info2.getHspt_name().equals("관리자")) {
						return "redirect:/e/admin";
					}else {
						return "redirect:/e/Info/"+idx;
					}
					
				}
				
			}
		}
		return "";
	}
	
	@RequestMapping("Logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {

		session.invalidate();
		mav.setViewName("redirect:/");
		return mav;

	}
	
	
	@RequestMapping(value="Info/{idx}")
	public ModelAndView info(UsersVo vo, ModelAndView mv, HttpSession session, @PathVariable("idx") Integer idx, HttpServletRequest request) {
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
        LocalDateTime specificDate = LocalDateTime.of(2023, Month.NOVEMBER, 16, 10, 0);
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
		
		mv.setViewName("e/info");
		return mv;
	}
	@RequestMapping(value="Pwd/{idx}")
	public ModelAndView pwd(ModelAndView mv, HttpSession session, @PathVariable("idx") Integer idx, HttpServletRequest request) {
		session.getAttribute("loginMember");
		mv.addObject("info", evaluationService.info(idx));
		
		
		
		mv.setViewName("e/pwd");
		return mv;
	}
	@RequestMapping(value="pwdAction/{idx}")
	public String pwdAction(UsersVo vo, HttpSession session, @PathVariable("idx") int idx, HttpServletRequest request, HttpServletResponse response, Model md) throws NoSuchAlgorithmException {
		session.getAttribute("loginMember");
		md.addAttribute("info", evaluationService.info(idx));
		
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
		
		int flag = evaluationService.pwdinsert(map);
		
		if(flag >= 1) {
			System.out.println(flag);
			request.setAttribute("msg", "비밀번호 변경이 완료되었습니다. \\n사번/비밀번호로 체크 후 로그인해주세요");
			request.setAttribute("url", "e/Info/"+idx);
			return "alert5";
		} else {
			request.setAttribute("msg", "비밀번호 변경중 오류가 발생했습니다. 다시 시도해 주세요.");
			request.setAttribute("url", "e/Pwd/"+idx);
			return "alert5";
		}
	}
	@RequestMapping(value="Form/{idx}/{idx2}/{team}")
	public ModelAndView form(ModelAndView mv, HttpSession session, 
			HttpServletRequest request, @PathVariable("idx") int idx, @PathVariable("idx2") int idx2, 
			@PathVariable("team") String team) {
		session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		mv.addObject("info", evaluationService.info(idx));
		System.out.println("++++++++++++++++++++++++++++++++++++++++++");
		System.out.println( evaluationService.info(idx));
		System.out.println( evaluationService.info(idx2));
		System.out.println(team);
		System.out.println("++++++++++++++++++++++++++++++++++++++++++");
		mv.addObject("target", evaluationService.info(idx2));
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
		list1 = evaluationService.evlist(map);
		
		
		mv.addObject("evf", list1);
		mv.setViewName("e/form");
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
		md.addAttribute("info", evaluationService.info(infoidx));
		md.addAttribute("target", evaluationService.info(targetidx));
		md.addAttribute("team", team);
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		String u1 = evaluationService.info(infoidx).getHspt_name();		// 기관명
		String u2 = evaluationService.info(infoidx).getId();				// 평가자 사번
		String t1 = evaluationService.info(targetidx).getId();			// 평가대상자 사번
	

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
		
		map.put("u1", u1);
		map.put("u2", u2);
		map.put("t1", t1);
		map.put("team", team);
		map2.put("ev",team);
		// 진료부, 경혁팀, 부서장 영역
		if(team.equals("A") || team.equals("B") || team.equals("C")) {
			String ev = "AA";
			System.out.println("ev : " + ev);
			String d1 = a1+","+a2+","+b3+","+b4+","+c5+","+c6+","+d7+","+d8+","+e9+","+e10+","+f11;
			System.out.println(d1);
			
			map.put("d1", d1);
		}
		// 부서원 영역
		else if (team.equals("D")) {
			String ev = "AB";
			System.out.println("ev : " + ev);
			String d1 = a12+","+a13+","+a14+","+a15+","+a16+","+a17+","+a18+","+b19+","+b20+","+b21+","+b22+","+c23+","+c24+
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
		
		// DB 전송 전 중복 체크
		
		int selectflag = evaluationService.formcheck(map2);
		System.out.println(selectflag);
		if (selectflag == 1) {
			request.setAttribute("msg", "이미 평가가 완료된 대상입니다.");
			request.setAttribute("url", "e/Info/"+infoidx);
			return "alert5";
		}else {
			int flag = evaluationService.frominsert(map);
			 ///db 전송 이후 
			if(flag == 1) {
				request.setAttribute("msg", "평가가 완료되었습니다.");
				request.setAttribute("url", "e/FormEnd/"+infoidx+"/"+targetidx);
				// view 단에서 미평가, 평가 진행중, 평가 완료 에 따라 값을 다르게 주면 각각 다른 메세지를 띄워줄 수 있음
				// 먼저 평가페이지에 들어온 기록이 있는지 (테이블에 평가자와 평가 대상자가 있는지 검색)
				// 검색 후 기록이 없으면 insert, 
				int flag2 = evaluationService.whether(map2);
				// 평가 진행후 
				System.out.println("평가 진행 여부 table insert  :  "+flag2);
				return "alert5";
			} else {

				request.setAttribute("msg", "오류발생");
				request.setAttribute("url", "e/Info/"+infoidx);
				return "alert5";
			}
		}
		
		
		
	}
	

	@RequestMapping(value="FormEnd/{idx}/{idx2}")
	public ModelAndView formend( @PathVariable(name="idx") int infoidx, @PathVariable(name="idx2") int targetidx, HttpSession session, ModelAndView mv) throws Exception {
		
		session.getAttribute("loginMember");
		mv.addObject("info", evaluationService.info(infoidx));
		System.out.println("++++++++++++++++++++++++++++++++++++++++++");
		System.out.println( evaluationService.info(infoidx));
		System.out.println( evaluationService.info(targetidx));
		System.out.println("++++++++++++++++++++++++++++++++++++++++++");
		mv.addObject("target", evaluationService.info(targetidx));
		Map<String, Object> map = new HashMap<String, Object>();
		
		mv.setViewName("e/formend");
		return mv;
	}
	
	@RequestMapping(value="admin")
	public ModelAndView admin(HttpSession session, ModelAndView mv) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<UsersVo> list = evaluationService.users(map);
		
		mv.addObject("users", list);

		
		mv.setViewName("e/admin");
		return mv;
	}
}
