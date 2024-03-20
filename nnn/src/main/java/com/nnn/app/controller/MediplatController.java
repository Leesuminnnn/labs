package com.nnn.app.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.DemoService;
import com.nnn.app.service.MediplatService;
import com.nnn.app.vo.LoginAjaxResponse;
import com.nnn.app.vo.Mediplat;
import com.nnn.app.vo.MediplatMenu;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.UsersVo;

@Controller
@RequestMapping(value="mediplat**")
public class MediplatController {
	private MediplatService medi;
	private DemoService demo;
	
	@Autowired
	public MediplatController (MediplatService medi, DemoService demo) {
		this.medi = medi;
		this.demo = demo;
	}
	@RequestMapping(value="/Login")
	public ModelAndView login(ModelAndView mv, NoticeVo vo) throws Exception {
		// 공지사항 영역 리스트로 출력
		Map<String, Object> map = new HashMap<String, Object>();
		List<NoticeVo> list = medi.noticeSelect(map);
		
		mv.addObject("notice", list);
		System.out.println(list);
		
		mv.setViewName("mediplat/login");
		return mv;
	}
	@RequestMapping(value="")
	public ModelAndView login2(ModelAndView mv, NoticeVo vo) throws Exception {
		// 공지사항 영역 리스트로 출력
		Map<String, Object> map = new HashMap<String, Object>();
		List<NoticeVo> list = medi.noticeSelect(map);
		
		mv.addObject("notice", list);
		System.out.println(list);
		
		mv.setViewName("mediplat/login");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="/loginAction", method = RequestMethod.POST)
	public LoginAjaxResponse loginaction(UsersVo vo, HttpSession session, Model md, HttpServletRequest request) throws Exception {
		LoginAjaxResponse response = new LoginAjaxResponse();
		response.setResult("0");
		// 비밀번호 복호화
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 유저가 입력한 비밀번호
		String password = vo.getPwd();
		System.out.println("vo.getPwd() " + vo.getPwd());
		System.out.println("vo.getName() " + vo.getName());
		// 비밀번호 암호화
        String cryptogram = aes128.encrypt(password); 
//        System.out.println(cryptogram);
        // 암호화된 비밀번호로 DB와 일치하는지 체크
//        if(vo.getPwd() != null) {
//     		vo.setPwd(cryptogram);
//     		System.out.println(vo.getPwd());
//        }
 		//비밀번호 일치 여부
		System.out.println("#########################################");
		int loginMember = medi.login(vo);
		String name = vo.getName();
		System.out.println("_________________________________________");
		// 먼저 사번이 DB에 있는지 검색
		int Dbcheck = medi.dbcheck(vo);
		if (Dbcheck == 0) {
			System.out.println(Dbcheck);
			response.setResult("0");
			System.out.println("Db에 id 없음");
			request.setAttribute("msg", "2023년도 직원근무평가 대상직원이 아닙니다.");
			request.setAttribute("url", "mediplat/Login");
			return response;
		}else {
			System.out.println(Dbcheck);
			System.out.println("DB에 id 있음");
			if(vo.getPwd() == null) {
				// 이름으로 로그인
				System.out.println("이름으로 로그인");
				if (loginMember == 1) {
					// 이름으로 로그인 성공
					UsersVo info2 = medi.info2(vo);
					String UserPwd = info2.getPwd();
					System.out.println(info2);
					if (UserPwd == null) {
						// DB에 비밀번호 없음
						int idx = info2.getIdx();
						response.setIdx(idx);
						response.setResult("5");
						return response;
						
					} else {
						// DB에 비밀번호 있음
						response.setResult("2");
						return response;
					}
				} else {
					// 정보 일치 X
					response.setResult("3");
					return response;
				}
			}else if (vo.getName() == null) {
				// 비밀번호로 로그인
				System.out.println("비밀번호로 로그인");
				if(loginMember == 1) {
					// 로그인 성공
					UsersVo info2 = medi.info2(vo);
					int idx = info2.getIdx();
					response.setResult("4");
					response.setIdx(idx);
					//로그인 기록 저장
					map.put("id", vo.getId());
					map.put("name", info2.getName());
					md.addAttribute("info", medi.info(idx));
					// 로그인 한 유저 ip를 DB에 저장
					HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
					String ip = req.getHeader("X-FORWARDED-FOR");
					if (ip == null) {
						ip = req.getRemoteAddr();
					}
					map.put("ip", ip);
					medi.loginlog(map);
					// 세션 저장
					session.setAttribute("loginmember", vo.getId());
					return response;
				} else {
					// 비밀번호 불일치
					response.setResult("1");
					return response;
				}
			}
		}
		return response;
	}
	@RequestMapping("/Logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {

		session.invalidate();
		mav.setViewName("redirect:/mediplat/Login");
		return mav;

	}
	@RequestMapping(value="/Main/{idx}")
	public ModelAndView Main(@PathVariable("idx") Integer idx, ModelAndView mv, Mediplat mp, HttpSession session) throws Exception {
		// 로그인 후 세션 불러옴
		session.getAttribute("loginMember");
		
		// 메디플랫 메인 페이지
		List<Mediplat> title = new ArrayList<Mediplat>();
		title = medi.mediTitleSelect();
		
		List<MediplatMenu> menu = new ArrayList<MediplatMenu>();
		menu = medi.mediMenuSelect();
		
		
		System.out.println(title);
		System.out.println(menu);
		mv.addObject("info", demo.info(idx));
		mv.addObject("title", title);
		mv.addObject("menu", menu);
		mv.setViewName("mediplat/Main");
		return mv;
	}
	
}
