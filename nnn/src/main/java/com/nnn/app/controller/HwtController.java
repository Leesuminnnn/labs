package com.nnn.app.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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

import com.nnn.app.service.HwtService;
import com.nnn.app.service.ImageService;
import com.nnn.app.vo.AjaxResponse20;
import com.nnn.app.vo.AjaxResponse4;
import com.nnn.app.vo.AjaxResponse5;
import com.nnn.app.vo.AjaxResponse6;
import com.nnn.app.vo.AjaxResponse8;
import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.ImageEntity;
import com.nnn.app.vo.LoginAjaxResponse;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.Paging;
import com.nnn.app.vo.UserPh;
import com.nnn.app.vo.UsersVo;
import com.nnn.app.vo.WrittenVo;

@Controller
@RequestMapping(value = "hwt/*")
public class HwtController {
	
	private HwtService hwtService;
	private ImageService imageService;
	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	public HwtController(HwtService hwtService, ImageService imageService) {
		this.hwtService = hwtService;
		this.imageService = imageService;
	}
	@RequestMapping(value="Login")
	public ModelAndView login(ModelAndView mv, NoticeVo vo) throws Exception {
		// 공지사항 영역 리스트로 출력
		Map<String, Object> map = new HashMap<String, Object>();
		
		mv.setViewName("hwt/login");
		
		return mv;
	}
	@RequestMapping(value="Findpwd")
	public ModelAndView findpwd(ModelAndView mv) {
		mv.setViewName("hwt/findpwd");
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
		System.out.println(id);
		System.out.println(ph);
//			List<UsersVo> list = evaluationService.users1(map);
		
		int phOne = hwtService.phOne(map);
		System.out.println(phOne);
		if(phOne == 1) {
			response.setResult("Y");
		}else {
			response.setResult("N");
		}
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value="pwdAction/{idx}")
	public AjaxResponse8 pwdAction(UsersVo vo, HttpSession session, @PathVariable("idx") int idx, HttpServletRequest request, Model md) throws NoSuchAlgorithmException {
		AjaxResponse8 response = new AjaxResponse8();
		response.setResult("N");
		session.getAttribute("loginMember");
		
		md.addAttribute("info", hwtService.info(idx));
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
//			map.put("pwd", cryptogram);
		map.put("pwd", vo.getPwd());
		map.put("idx", vo.getIdx());
		
		int flag = hwtService.pwdinsert(map);
		
		if(flag >= 1) {
			System.out.println(flag);
			request.setAttribute("msg", "비밀번호 변경이 완료되었습니다.</p><p>사번/비밀번호로 체크 후 로그인해주세요");
			request.setAttribute("url", "hwt/Login");
			response.setResult("Y");
			return response;
		} else {
			request.setAttribute("msg", "비밀번호 변경중 오류가 발생했습니다. 다시 시도해 주세요.");
			request.setAttribute("url", "hwt/Pwd/"+idx);
			response.setResult("N");
			return response;
		}
	}
	@ResponseBody
	@RequestMapping(value="PwdActAjax/{id}")
	public AjaxResponse8 pwdActAjax(UsersVo vo, HttpSession session, @PathVariable("id") String id, HttpServletRequest request,  Model md) throws NoSuchAlgorithmException {
		AjaxResponse8 response = new AjaxResponse8();
		response.setResult("N");
//			// 암호화
//			SHA256 sha256 = new SHA256();
//			//비밀번호
//	        String password = vo.getPwd();
//	        //SHA256으로 암호화된 비밀번호
//	        String cryptogram = sha256.encrypt(password);
//	        
//	        System.out.println(cryptogram);
//			//담은 변수를 DB에 넘겨준다.
//			vo.setPwd(cryptogram);
//			System.out.println("암호화된 페스워드 : "+cryptogram);
		
		Map<String, Object> map = new HashMap<String, Object>();
//			map.put("pwd", cryptogram);
		map.put("pwd", vo.getPwd());
		map.put("id", vo.getId());
		
		int flag = hwtService.pwdajax(map);
		
		if(flag >= 1) {
			response.setResult("Y");
		} else {
			response.setResult("N");
		}
		return response;
	}
	@ResponseBody
	@RequestMapping(value="loginAction", method = RequestMethod.POST)
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
		int loginMember = hwtService.login(vo);
		String name = vo.getName();
		System.out.println("_________________________________________");
		// 먼저 사번이 DB에 있는지 검색
		int Dbcheck = hwtService.dbcheck(vo);
		if (Dbcheck == 0) {
			System.out.println(Dbcheck);
			response.setResult("0");
			System.out.println("Db에 id 없음");
			request.setAttribute("msg", "2023년도 직원근무평가 대상직원이 아닙니다.");
			request.setAttribute("url", "demo/Login");
			return response;
		}else {
			System.out.println(Dbcheck);
			System.out.println("DB에 id 있음");
			if(vo.getPwd() == null) {
				// 이름으로 로그인
				System.out.println("이름으로 로그인");
				if (loginMember == 1) {
					// 이름으로 로그인 성공
					UsersVo info2 = hwtService.info2(vo);
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
					UsersVo info2 = hwtService.info2(vo);
					int idx = info2.getIdx();
					String subname = info2.getHspt_subname();
					response.setResult("4");
					response.setIdx(idx);
					response.setSubname(subname);
					//로그인 기록 저장
					map.put("id", vo.getId());
					map.put("name", info2.getName());
					md.addAttribute("info", hwtService.info(idx));
					// 로그인 한 유저 ip를 DB에 저장
					HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
					String ip = req.getHeader("X-FORWARDED-FOR");
					if (ip == null) {
						ip = req.getRemoteAddr();
					}
					map.put("ip", ip);
					hwtService.loginlog(map);
					// 세션 저장
					session.setAttribute("loginmember", vo.getId());
					session.setAttribute("idx", idx);
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
	@RequestMapping("Logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {

		session.invalidate();
		mav.setViewName("redirect:/hwt/Login");
		return mav;

	}

	@ResponseBody
	@RequestMapping(value="usersAll")
	public AjaxResponse4 usersall(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse4 response = new AjaxResponse4();
		response.setResult("Y");		
		Map<String, Object> map = new HashMap<String, Object>();
		List<UsersVo> list = hwtService.users(map);
		request.setAttribute("users", list);
		response.setUsersall(list);

		List<UserPh> ph = hwtService.ph(map);
		request.setAttribute("ph", ph);
		response.setUserphList(ph);
		
		return response;
	}
	@RequestMapping(value = "WrittenView/{cs_idx}", method = RequestMethod.GET, produces = MediaType.APPLICATION_PDF_VALUE)
	public ModelAndView WrittenViewpage(@PathVariable("cs_idx") Integer cs_idx, HttpSession session, HttpServletResponse response, ModelAndView mav) {
	    System.out.println("WrittenView 페이지 for PDF");
	    System.out.println("cs_idx : " + cs_idx);
	    
	    mav.setViewName("hwt/WrittenView");
	    
	    return mav;
	}
	@RequestMapping(value = "WrittenViewimage/{cs_idx}", method = RequestMethod.GET, produces = MediaType.APPLICATION_PDF_VALUE)
	@ResponseBody
	public void WrittenView(@PathVariable("cs_idx") Integer cs_idx, HttpSession session, HttpServletResponse response) {
	    System.out.println("WrittenView 페이지 for PDF");
	    System.out.println("cs_idx : " + cs_idx);
	    
	    try {
	        Map<String, Object> map = new HashMap<>();
	        map.put("cs_idx", cs_idx);
	        ImageEntity img = imageService.getImageData(map);
	        byte[] pdfData = img.getImageData();
	        response.setContentType(MediaType.APPLICATION_PDF_VALUE);
	        
	        // try-with-resources 구문을 사용하여 OutputStream을 자동으로 닫습니다.
	        try (OutputStream outputStream = response.getOutputStream()) {
	            outputStream.write(pdfData);
	            outputStream.flush();
	        } catch (IOException e) {
	            // IOException 처리
	            e.printStackTrace();
	        }
	        
	        System.out.println("--------------------------------------");
	        System.out.println("PDF Data Length: " + (pdfData != null ? pdfData.length : "No Data"));
	        System.out.println("--------------------------------------");
	    } catch (Exception e) {
	        // 다른 종류의 예외 처리
	        e.printStackTrace();
	    }
	}
	
	
	
	
	
	@RequestMapping(value = "Canvas.do")
	public ModelAndView canvas(ModelAndView mav, HttpSession session) throws Exception{

		System.out.println("canvas 페이지");
		
		mav.setViewName("hwt/Canvas");
		return mav;
	}

	
	@RequestMapping(value = "Written")
	public ModelAndView written(ModelAndView mav, HttpSession session, 
			@RequestParam(name="param1", defaultValue = "")String param1, 
			@RequestParam(name="param2", defaultValue = "")String param2,
			@RequestParam(name="param3", defaultValue = "")String param3,
			@RequestParam(name="param4", defaultValue = "")String param4,
			@RequestParam(name="param5", defaultValue = "")String param5,
			@RequestParam(name="param6", defaultValue = "")String param6
			) throws Exception{

		System.out.println("written oath 페이지");
		mav.addObject("param1",param1);
		mav.addObject("param2",param2);
		mav.addObject("param3",param3);
		mav.addObject("param4",param4);
		mav.addObject("param5",param5);
		mav.addObject("param6",param6);
		session.getAttribute("loginmember");
		if(session.getAttribute("loginmember") != null) {
			int idx = (int) session.getAttribute("idx");
			System.out.println(session.getAttribute("loginmember"));
			System.out.println(session.getAttribute("idx"));
			mav.addObject("info", hwtService.info(idx));
		}
		mav.setViewName("hwt/Written");
		return mav;
	}
	@RequestMapping(value = "Written2")
	public ModelAndView written2(ModelAndView mav, HttpSession session, 
			@RequestParam(name="param1", defaultValue = "")String param1, 
			@RequestParam(name="param2", defaultValue = "")String param2,
			@RequestParam(name="param3", defaultValue = "")String param3,
			@RequestParam(name="param4", defaultValue = "")String param4,
			@RequestParam(name="param5", defaultValue = "")String param5,
			@RequestParam(name="param6", defaultValue = "")String param6
			) throws Exception{

		System.out.println("written oath 페이지");
		mav.addObject("param1",param1);
		mav.addObject("param2",param2);
		mav.addObject("param3",param3);
		mav.addObject("param4",param4);
		mav.addObject("param5",param5);
		mav.addObject("param6",param6);
		session.getAttribute("loginmember");
		int idx = (int) session.getAttribute("idx");
		System.out.println(session.getAttribute("loginmember"));
		System.out.println(session.getAttribute("idx"));
		mav.addObject("info", hwtService.info(idx));
		mav.setViewName("hwt/Written2");
		return mav;
	}
	@RequestMapping(value = "WrittenAction")
	public ModelAndView writtenAction(ModelAndView mav, HttpSession session, WrittenVo vo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		// 암호화
		// 256 오류로 인해서 128으로 변경
		//AES256Util aes256 = new AES256Util();
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);

//		session.getAttribute("loginmember");
//		int idx = (int) session.getAttribute("idx");
//		System.out.println(session.getAttribute("loginmember"));
//		System.out.println(session.getAttribute("idx"));
//		mav.addObject("info", hwtService.info(idx));
		
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
		
		hwtService.insert(vo);
		mav.setViewName("redirect:/hwt/CounselList");
		return mav;
	}
	
	@RequestMapping(value = "Written0")
	public ModelAndView written1(ModelAndView mav, HttpSession session) {
		System.out.println("written oath 페이지");
		session.getAttribute("loginmember");
		int idx = (int) session.getAttribute("idx");
		System.out.println(session.getAttribute("loginmember"));
		System.out.println(session.getAttribute("idx"));
		mav.addObject("info", hwtService.info(idx));
		mav.setViewName("hwt/Written");
		return mav;
	}
//
//	// 이미지 저장
//	@RequestMapping(value = "saveImage", method = {RequestMethod.GET, RequestMethod.POST})
//	@ResponseBody
//	public String saveImage(@RequestParam("image") byte[] image, WrittenVo vo, @RequestParam("cs_idx")Integer cs_idx,
//			@RequestParam("cs_data_01")String cs_data_01,@RequestParam("cs_data_02")String cs_data_02,
//			@RequestParam("cs_data_03")String cs_data_03,@RequestParam("cs_data_04")String cs_data_04,
//			@RequestParam("cs_data_05")String cs_data_05,@RequestParam("cs_data_06")String cs_data_06,
//			@RequestParam("cs_data_07")String cs_data_07,@RequestParam("cs_data_08")String cs_data_08,
//			@RequestParam("cs_data_09")String cs_data_09,@RequestParam("cs_data_10")String cs_data_10,
//			@RequestParam("cs_data_11")String cs_data_11,@RequestParam("cs_data_12")String cs_data_12,
//			@RequestParam("cs_data_13")String cs_data_13,@RequestParam("cs_data_14")String cs_data_14,
//			@RequestParam("cs_data_15")String cs_data_15,@RequestParam("cs_data_16")String cs_data_16,
//			@RequestParam("cs_data_17")String cs_data_17,@RequestParam("cs_data_18")String cs_data_18,
//			@RequestParam("cs_data_19")String cs_data_19,@RequestParam("cs_data_20")String cs_data_20,
//			@RequestParam("cs_data_21")String cs_data_21,@RequestParam("cs_data_22")String cs_data_22,
//			@RequestParam("cs_data_23")String cs_data_23,@RequestParam("cs_data_24")String cs_data_24,
//			@RequestParam("cs_data_25")String cs_data_25,@RequestParam("cs_data_26")String cs_data_26,
//			@RequestParam("cs_data_27")String cs_data_27,@RequestParam("cs_data_28")String cs_data_28,
//			@RequestParam("cs_data_29")String cs_data_29
//			
//			) {
//		ImageEntity imageEntity = new ImageEntity();
//		System.out.println("이미지 저장");
//		System.out.println("cs_idx : "+cs_idx);
//		System.out.println("cs_data_01 : "+cs_data_01);
//		// 암호화
//		// 256 오류로 인해서 128으로 변경
//		//AES256Util aes256 = new AES256Util();
//		String key = "This is Key!!!!!";
//		AES128 aes128 = new AES128(key);
//		
//		// view에서 받은 데이터를 담아서 넘겨준다.
//		String text1 = vo.getCs_data_01();
//		String text2 = vo.getCs_data_06();
//		String text3 = vo.getCs_data_07();
//		String text4 = vo.getCs_data_10();
//		String text5 = vo.getCs_data_12();
//		String text6 = vo.getCs_data_15();
//		String text7 = vo.getCs_data_29();
//		
//		System.out.println(text1 + text2 + text3 + text4 + text5 + text6 + text7);
//		// 암호화된 데이터를 변수에 담는다.
//		String cipherText1 = aes128.encrypt(text1);
//		String cipherText2 = aes128.encrypt(text2);
//		String cipherText3 = aes128.encrypt(text3);
//		String cipherText4 = aes128.encrypt(text4);
//		String cipherText5 = aes128.encrypt(text5);
//		String cipherText6 = aes128.encrypt(text6);
//		String cipherText7 = aes128.encrypt(text7);
//		
//		// 담은 변수를 DB에 넘겨준다
//		vo.setCs_data_01(cipherText1);
//		vo.setCs_data_02(cs_data_02);
//		vo.setCs_data_03(cs_data_03);
//		vo.setCs_data_04(cs_data_04);
//		vo.setCs_data_05(cs_data_05);
//		vo.setCs_data_06(cipherText2);
//		vo.setCs_data_07(cipherText3);
//		vo.setCs_data_08(cs_data_08);
//		vo.setCs_data_09(cs_data_09);
//		vo.setCs_data_10(cipherText4);
//		vo.setCs_data_11(cs_data_11);
//		vo.setCs_data_12(cipherText5);
//		vo.setCs_data_13(cs_data_13);
//		vo.setCs_data_14(cs_data_14);
//		vo.setCs_data_15(cipherText6);
//		vo.setCs_data_16(cs_data_16);
//		vo.setCs_data_17(cs_data_17);
//		vo.setCs_data_18(cs_data_18);
//		vo.setCs_data_19(cs_data_19);
//		vo.setCs_data_20(cs_data_20);
//		vo.setCs_data_21(cs_data_21);
//		vo.setCs_data_22(cs_data_22);
//		vo.setCs_data_23(cs_data_23);
//		vo.setCs_data_24(cs_data_24);
//		vo.setCs_data_25(cs_data_25);
//		vo.setCs_data_26(cs_data_26);
//		vo.setCs_data_27(cs_data_27);
//		vo.setCs_data_28(cs_data_28);
//		vo.setCs_data_29(cipherText7);
//		
//		System.out.println("##################################################");
//		System.out.println(text1);
//		System.out.println(cipherText1);
//		System.out.println(aes128.decrypt(cipherText1));
//		System.out.println(text2);
//		System.out.println(cipherText2);
//		System.out.println(aes128.decrypt(cipherText2));
//		System.out.println(text3);
//		System.out.println(cipherText3);
//		System.out.println(aes128.decrypt(cipherText3));
//		System.out.println(text4);
//		System.out.println(cipherText4);
//		System.out.println(aes128.decrypt(cipherText4));
//		System.out.println(text5);
//		System.out.println(cipherText5);
//		System.out.println(aes128.decrypt(cipherText5));
//		System.out.println(text6);
//		System.out.println(cipherText6);
//		System.out.println(aes128.decrypt(cipherText6));
//		System.out.println(text7);
//		System.out.println(cipherText7);
//		System.out.println(aes128.decrypt(cipherText7));
//		System.out.println("##################################################");
//		
//		imageEntity.setImageData(image);
//		imageEntity.setCs_idx(cs_idx);
//		hwtService.saveImage(imageEntity);
//		hwtService.modify(vo);
//		hwtService.update(vo);
//		
//		return "Image saved successfully!";
//	}
	

	// 이미지 저장
	@RequestMapping(value = "saveImage", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView saveImage(@RequestParam("image") byte[] image, WrittenVo vo, @RequestParam("cs_idx")Integer cs_idx, ModelAndView mav,
			@RequestParam("cs_data_01")String cs_data_01,@RequestParam("cs_data_02")String cs_data_02,
			@RequestParam("cs_data_03")String cs_data_03,@RequestParam("cs_data_04")String cs_data_04,
			@RequestParam("cs_data_05")String cs_data_05,@RequestParam("cs_data_06")String cs_data_06,
			@RequestParam("cs_data_07")String cs_data_07,@RequestParam("cs_data_08")String cs_data_08,
			@RequestParam("cs_data_09")String cs_data_09,@RequestParam("cs_data_10")String cs_data_10,
			@RequestParam("cs_data_11")String cs_data_11,@RequestParam("cs_data_12")String cs_data_12,
			@RequestParam("cs_data_13")String cs_data_13,@RequestParam("cs_data_14")String cs_data_14,
			@RequestParam("cs_data_15")String cs_data_15,@RequestParam("cs_data_16")String cs_data_16,
			@RequestParam("cs_data_17")String cs_data_17,@RequestParam("cs_data_18")String cs_data_18,
			@RequestParam("cs_data_19")String cs_data_19,@RequestParam("cs_data_20")String cs_data_20,
			@RequestParam("cs_data_21")String cs_data_21,@RequestParam("cs_data_22")String cs_data_22,
			@RequestParam("cs_data_23")String cs_data_23,@RequestParam("cs_data_24")String cs_data_24,
			@RequestParam("cs_data_25")String cs_data_25,@RequestParam("cs_data_26")String cs_data_26,
			@RequestParam("cs_data_27")String cs_data_27,@RequestParam("cs_data_28")String cs_data_28,
			@RequestParam("cs_data_29")String cs_data_29
			
			) {
	    
		ImageEntity imageEntity = new ImageEntity();
		System.out.println("이미지 저장");
		System.out.println("cs_idx : "+cs_idx);
		System.out.println("cs_data_01 : "+cs_data_01);
		// 암호화
		// 256 오류로 인해서 128으로 변경
		//AES256Util aes256 = new AES256Util();
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
		
		System.out.println(text1 + text2 + text3 + text4 + text5 + text6 + text7);
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
		vo.setCs_data_02(cs_data_02);
		vo.setCs_data_03(cs_data_03);
		vo.setCs_data_04(cs_data_04);
		vo.setCs_data_05(cs_data_05);
		vo.setCs_data_06(cipherText2);
		vo.setCs_data_07(cipherText3);
		vo.setCs_data_08(cs_data_08);
		vo.setCs_data_09(cs_data_09);
		vo.setCs_data_10(cipherText4);
		vo.setCs_data_11(cs_data_11);
		vo.setCs_data_12(cipherText5);
		vo.setCs_data_13(cs_data_13);
		vo.setCs_data_14(cs_data_14);
		vo.setCs_data_15(cipherText6);
		vo.setCs_data_16(cs_data_16);
		vo.setCs_data_17(cs_data_17);
		vo.setCs_data_18(cs_data_18);
		vo.setCs_data_19(cs_data_19);
		vo.setCs_data_20(cs_data_20);
		vo.setCs_data_21(cs_data_21);
		vo.setCs_data_22(cs_data_22);
		vo.setCs_data_23(cs_data_23);
		vo.setCs_data_24(cs_data_24);
		vo.setCs_data_25(cs_data_25);
		vo.setCs_data_26(cs_data_26);
		vo.setCs_data_27(cs_data_27);
		vo.setCs_data_28(cs_data_28);
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
		
		imageEntity.setImageData(image);
		imageEntity.setCs_idx(cs_idx);
		hwtService.saveImage(imageEntity);
		hwtService.modify(vo);
		hwtService.update(vo);
		mav.setViewName("Image saved successfully!");
		return mav;
	}
	
	
	@RequestMapping(value="CounselList")
	public ModelAndView List(ModelAndView mav, Criteria cri, WrittenVo vo, HttpSession session) throws Exception {
		System.out.println("cri = " + cri);
		System.out.println("####################type1 : "+cri.getType1());
		System.out.println("####################keyword1 : "+cri.getKeyword1());
		System.out.println("####################type2 : "+cri.getType2());
		System.out.println("####################keyword2 : "+cri.getKeyword2());
		System.out.println("####################type3 : "+cri.getType3());
		System.out.println("####################keyword3 : "+cri.getKeyword3());
		session.getAttribute("loginmember");
		if(session.getAttribute("loginmember") != null) {
			int idx = (int) session.getAttribute("idx");
			System.out.println(session.getAttribute("loginmember"));
			System.out.println(session.getAttribute("idx"));
			mav.addObject("info", hwtService.info(idx));
		}
		
		// 256 오류로 인해 128으로 변경
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
//		AES256Util aes256 = new AES256Util();
		
		int Cnt = hwtService.Cnt(cri);

		Paging pageMaker = new Paging(); 
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(Cnt);
		System.out.println(Cnt);
		System.out.println(pageMaker.getStartPage());
		
		System.out.println(pageMaker.getEndPage());
//		String keyword1check = keyword1;
//		String keyword2check = keyword2;
//		String keyword3check = keyword3;
		// 빈 문자열 null으로 설정
//		if(keyword1.isEmpty()) {
//			keyword1check = "null";
//		}
//		if(keyword2.isEmpty()) {
//			keyword2check = "null";
//		}
//		if(keyword3.isEmpty()) {
//			keyword3check = "null";
//		}
//		
//		System.out.println("keyword1check : " + keyword1check);
//		System.out.println("keyword2check : " + keyword2check);
//		System.out.println("keyword3check : " + keyword3check);
//		List<Map<String, Object>> cslist = hwtService.listsearch(cri);
//		List<Map<String, Object>> cslist = hwtService.listsearch2(cri);
//		List<Map<String,Object>> cslist = hwtService.list2(cri);
		List<WrittenVo> cslist = hwtService.listsearch2(cri);
///		List<WrittenVo> matchingList = new ArrayList<>();
		// DB데이터 복호화
		// 이상한 오류가 뜨는 이유는 암호화된 데이터가 한개라도 없을 경우 오류가 발생한다.(암호화가 되어있는 데이터와 암호화가 되어있지 않은 데이터가 공존할 경우)
		for (WrittenVo vo1 : cslist) {
			String decryptedCs_data_01 = aes128.decrypt(((WrittenVo) vo1).getCs_data_01());
			String decryptedCs_data_06 = aes128.decrypt(((WrittenVo) vo1).getCs_data_06());
			String decryptedCs_data_07 = aes128.decrypt(((WrittenVo) vo1).getCs_data_07());
			String decryptedCs_data_10 = aes128.decrypt(((WrittenVo) vo1).getCs_data_10());
			String decryptedCs_data_12 = aes128.decrypt(((WrittenVo) vo1).getCs_data_12());
			String decryptedCs_data_15 = aes128.decrypt(((WrittenVo) vo1).getCs_data_15());
			String decryptedCs_data_29 = aes128.decrypt(((WrittenVo) vo1).getCs_data_29());
			
			// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
			((WrittenVo) vo1).setCs_data_01(decryptedCs_data_01);
			((WrittenVo) vo1).setCs_data_06(decryptedCs_data_06);
			((WrittenVo) vo1).setCs_data_07(decryptedCs_data_07);
			((WrittenVo) vo1).setCs_data_10(decryptedCs_data_10);
			((WrittenVo) vo1).setCs_data_12(decryptedCs_data_12);
			((WrittenVo) vo1).setCs_data_15(decryptedCs_data_15);
			((WrittenVo) vo1).setCs_data_29(decryptedCs_data_29);
		}
		
//		mav.addObject("keyword1", keyword1);
//		mav.addObject("keyword2", keyword2);
//		mav.addObject("keyword3", keyword3);		
		mav.addObject("pageMaker", pageMaker);
		
		mav.addObject("cslist", cslist);
		mav.addObject("keyword", "1");
		mav.setViewName("hwt/CounselList");
		System.out.println("cslist : "+cslist);
		
		return mav;
	}
	@RequestMapping(value="CounselListSearch")
	public ModelAndView ListSearch(ModelAndView mav, HttpSession session, @RequestParam(value="keyword1", defaultValue="") String keyword1,
			@RequestParam(value="keyword2", defaultValue="") String keyword2,
			@RequestParam(value="keyword3", defaultValue="") String keyword3,
			@RequestParam(value="type1", defaultValue="") String type1,
			@RequestParam(value="type2", defaultValue="") String type2,
			@RequestParam(value="type3", defaultValue="") String type3,
			Criteria cri, WrittenVo vo
			) throws Exception {
		System.out.println("cri = " + cri);
		System.out.println("####################type1 : "+cri.getType1());
		System.out.println("####################keyword1 : "+cri.getKeyword1());
		System.out.println("####################type2 : "+cri.getType2());
		System.out.println("####################keyword2 : "+cri.getKeyword2());
		System.out.println("####################type3 : "+cri.getType3());
		System.out.println("####################keyword3 : "+cri.getKeyword3());
		session.getAttribute("loginmember");
		if(session.getAttribute("loginmember") != null) {
			int idx = (int) session.getAttribute("idx");
			System.out.println(session.getAttribute("loginmember"));
			System.out.println(session.getAttribute("idx"));
			mav.addObject("info", hwtService.info(idx));
		}
		Map<String, Object> map = new HashMap<String, Object>();
		// 256 오류로 인해 128으로 변경
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		List<WrittenVo> cslist = hwtService.listsearch(cri);
		
		// 검색어가 없을 때 전체 검색
		List<WrittenVo> cslist1 = hwtService.listsearch2(cri);
		for(WrittenVo vo1 : cslist1) {
			if(keyword1.isEmpty() && keyword2.isEmpty() && keyword3.isEmpty()) {
				// 검색어 X
				System.out.println("검색어 X");
					
				String decryptedCs_data_01 = aes128.decrypt(((WrittenVo) vo1).getCs_data_01());
				String decryptedCs_data_06 = aes128.decrypt(((WrittenVo) vo1).getCs_data_06());
				String decryptedCs_data_07 = aes128.decrypt(((WrittenVo) vo1).getCs_data_07());
				String decryptedCs_data_10 = aes128.decrypt(((WrittenVo) vo1).getCs_data_10());
				String decryptedCs_data_12 = aes128.decrypt(((WrittenVo) vo1).getCs_data_12());
				String decryptedCs_data_15 = aes128.decrypt(((WrittenVo) vo1).getCs_data_15());
				String decryptedCs_data_29 = aes128.decrypt(((WrittenVo) vo1).getCs_data_29());
				
				// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
				((WrittenVo) vo1).setCs_data_01(decryptedCs_data_01);
				((WrittenVo) vo1).setCs_data_06(decryptedCs_data_06);
				((WrittenVo) vo1).setCs_data_07(decryptedCs_data_07);
				((WrittenVo) vo1).setCs_data_10(decryptedCs_data_10);
				((WrittenVo) vo1).setCs_data_12(decryptedCs_data_12);
				((WrittenVo) vo1).setCs_data_15(decryptedCs_data_15);
				((WrittenVo) vo1).setCs_data_29(decryptedCs_data_29);
				
				int Cnt = hwtService.Cnt(cri);
				Paging pageMaker = new Paging(); 
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(Cnt);
				mav.addObject("pageMaker", pageMaker);
				mav.addObject("cslist", cslist1);
				System.out.println(cslist1);
				mav.addObject("keyword", "1");
				
			}
			
		}
		// 검색결과를 담을 list 생성
		List<WrittenVo> matchingList = new ArrayList<>();
		String keyword1check = keyword1;
		String keyword2check = keyword2;
		String keyword3check = keyword3;
		// 빈 문자열 null으로 설정
		if(keyword1.isEmpty()) {
			keyword1check = "null";
		}
		if(keyword2.isEmpty()) {
			keyword2check = "null";
		}
		if(keyword3.isEmpty()) {
			keyword3check = "null";
		}
		
		System.out.println("keyword1check : " + keyword1check);
		System.out.println("keyword2check : " + keyword2check);
		System.out.println("keyword3check : " + keyword3check);
		// DB데이터 복호화
		// 이상한 오류가 뜨는 이유는 암호화된 데이터가 한개라도 없을 경우 오류가 발생한다.(암호화가 되어있는 데이터와 암호화가 되어있지 않은 데이터가 공존할 경우)
		
		
		for(WrittenVo vo2 : cslist) {
			// 성명 가져오기
			String str1 = vo2.getCs_data_01();
			System.out.println("str1 : "+ str1);
			// 주보호자성명 가져오기
			String str2 = vo2.getCs_data_07();
			System.out.println("str2 : "+str2);
			// 휴대폰번호 가져오기
			String str3 = vo2.getCs_data_06();
			System.out.println("str3 : "+str3);
			
			// 성명 복호화
			String text1 = aes128.decrypt(str1);
			System.out.println("text1 : "+text1);
			// 주보호자 성명 복호화
			String text2 = aes128.decrypt(str2);
			System.out.println("text2 : " +text2);
			// 휴대폰번호 복호화
			String text3 = aes128.decrypt(str3);
			System.out.println("text3 : "+text3);
			
			// 키워드가 포함된 문자열 이면 true
			
			boolean search1 = aes128.decrypt(str1).contains(keyword1check);
			System.out.println("search1 : "+ search1);
			System.out.println( "");
			
			boolean search2 = aes128.decrypt(str2).contains(keyword2check);
			System.out.println("search2 : "+ search2);
			System.out.println( "");
			
			boolean search3 = aes128.decrypt(str3).contains(keyword3check);
			System.out.println("search3 : "+ search3);
			System.out.println( "");
			if(keyword1.isEmpty()) {// 검색 키워드 성명 X 보호자명 O 휴대폰 번호 O
				System.out.println("검색 키워드 성명 X 보호자명 O 휴대폰 번호 O");
				
				if(keyword2.isEmpty()) {// 검색 키워드 성명 X 보호자명 O 휴대폰 번호 X
					if(search3 == true) {
						System.out.println("검색 키워드 성명 X 보호자명 O 휴대폰 번호 X");
						matchingList.add(vo2);
						String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
						String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
						String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
						String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
						String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
						String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
						String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
						
						// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
						vo2.setCs_data_01(decryptedCs_data_01);
						vo2.setCs_data_06(decryptedCs_data_06);
						vo2.setCs_data_07(decryptedCs_data_07);
						vo2.setCs_data_10(decryptedCs_data_10);
						vo2.setCs_data_12(decryptedCs_data_12);
						vo2.setCs_data_15(decryptedCs_data_15);
						vo2.setCs_data_29(decryptedCs_data_29);
						mav.addObject("matchingList", matchingList);
					}
				}
				else if (keyword3.isEmpty()) {// 검색 키워드 성명 X 보호자명 O 휴대폰 번호 X
					
					if(search2 == true) {
						System.out.println("검색 키워드 성명 X 보호자명 O 휴대폰 번호 X");
						matchingList.add(vo2);
						String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
						String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
						String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
						String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
						String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
						String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
						String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
						
						// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
						vo2.setCs_data_01(decryptedCs_data_01);
						vo2.setCs_data_06(decryptedCs_data_06);
						vo2.setCs_data_07(decryptedCs_data_07);
						vo2.setCs_data_10(decryptedCs_data_10);
						vo2.setCs_data_12(decryptedCs_data_12);
						vo2.setCs_data_15(decryptedCs_data_15);
						vo2.setCs_data_29(decryptedCs_data_29);
						mav.addObject("matchingList", matchingList);
					}
				}
				if(search2 == true && search3 == true) {
					System.out.println("검색 키워드 성명 X 보호자명 O 휴대폰 번호 O");
					matchingList.add(vo2);
					String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
					String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
					String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
					String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
					String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
					String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
					String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
					
					// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
					vo2.setCs_data_01(decryptedCs_data_01);
					vo2.setCs_data_06(decryptedCs_data_06);
					vo2.setCs_data_07(decryptedCs_data_07);
					vo2.setCs_data_10(decryptedCs_data_10);
					vo2.setCs_data_12(decryptedCs_data_12);
					vo2.setCs_data_15(decryptedCs_data_15);
					vo2.setCs_data_29(decryptedCs_data_29);
					mav.addObject("matchingList", matchingList);
				}
				
			
			}else if(keyword2.isEmpty()) {// 검색 키워드 성명 O 보호자명 X 휴대폰 번호 O
				System.out.println("검색 키워드 성명 O 보호자명 X 휴대폰 번호 O");
				// 검색 키워드 성명 O 보호자명 X 휴대폰번호 X
				if(keyword3.isEmpty()) {
					if(search1 == true) {
						System.out.println("검색 키워드 성명 O 보호자명 X 휴대폰번호 X");
						matchingList.add(vo2);
						String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
						String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
						String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
						String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
						String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
						String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
						String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
						
						// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
						vo2.setCs_data_01(decryptedCs_data_01);
						vo2.setCs_data_06(decryptedCs_data_06);
						vo2.setCs_data_07(decryptedCs_data_07);
						vo2.setCs_data_10(decryptedCs_data_10);
						vo2.setCs_data_12(decryptedCs_data_12);
						vo2.setCs_data_15(decryptedCs_data_15);
						vo2.setCs_data_29(decryptedCs_data_29);
						mav.addObject("matchingList", matchingList);
					}
					
				}else if(keyword1.isEmpty()) {// 검색 키워드 성명 X 보호자명 X 휴대폰번호 O
					if(search3 == true) {
						System.out.println("검색 키워드 성명 X 보호자명 X 휴대폰번호 O");
						matchingList.add(vo2);
						String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
						String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
						String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
						String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
						String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
						String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
						String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
						
						// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
						vo2.setCs_data_01(decryptedCs_data_01);
						vo2.setCs_data_06(decryptedCs_data_06);
						vo2.setCs_data_07(decryptedCs_data_07);
						vo2.setCs_data_10(decryptedCs_data_10);
						vo2.setCs_data_12(decryptedCs_data_12);
						vo2.setCs_data_15(decryptedCs_data_15);
						vo2.setCs_data_29(decryptedCs_data_29);
						mav.addObject("matchingList", matchingList);
					}
				}
				
				if(search1 == true && search3 == true) {
					System.out.println("검색 키워드 성명 O 보호자명 X 휴대폰 번호 O");
					matchingList.add(vo2);
					String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
					String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
					String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
					String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
					String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
					String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
					String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
					
					// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
					vo2.setCs_data_01(decryptedCs_data_01);
					vo2.setCs_data_06(decryptedCs_data_06);
					vo2.setCs_data_07(decryptedCs_data_07);
					vo2.setCs_data_10(decryptedCs_data_10);
					vo2.setCs_data_12(decryptedCs_data_12);
					vo2.setCs_data_15(decryptedCs_data_15);
					vo2.setCs_data_29(decryptedCs_data_29);
					mav.addObject("matchingList", matchingList);
				}
				
			}	
			else if(keyword3.isEmpty()) {// 검색 키워드 성명 O 보호자명 O 휴대폰번호 X
				System.out.println("검색 키워드 성명 O 보호자명 O 휴대폰번호 X");
				// 검색 키워드 성명 X 보호자명 O 휴대폰번호 X
				if(keyword1.isEmpty()) {
					if(search2 == true) {
						System.out.println("검색 키워드 성명 X 보호자명 O 휴대폰번호 X");
						matchingList.add(vo2);
						String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
						String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
						String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
						String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
						String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
						String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
						String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
						
						// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
						vo2.setCs_data_01(decryptedCs_data_01);
						vo2.setCs_data_06(decryptedCs_data_06);
						vo2.setCs_data_07(decryptedCs_data_07);
						vo2.setCs_data_10(decryptedCs_data_10);
						vo2.setCs_data_12(decryptedCs_data_12);
						vo2.setCs_data_15(decryptedCs_data_15);
						vo2.setCs_data_29(decryptedCs_data_29);
						mav.addObject("matchingList", matchingList);
					}
					
				}else if(keyword2.isEmpty()) {// 검색키워드 성명O 보호자명 X 휴대폰 번호 X
					if(search1 == true) {
						System.out.println("검색키워드 성명O 보호자명 X 휴대폰 번호 X");
						matchingList.add(vo2);
						String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
						String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
						String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
						String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
						String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
						String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
						String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
						
						// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
						vo2.setCs_data_01(decryptedCs_data_01);
						vo2.setCs_data_06(decryptedCs_data_06);
						vo2.setCs_data_07(decryptedCs_data_07);
						vo2.setCs_data_10(decryptedCs_data_10);
						vo2.setCs_data_12(decryptedCs_data_12);
						vo2.setCs_data_15(decryptedCs_data_15);
						vo2.setCs_data_29(decryptedCs_data_29);
						mav.addObject("matchingList", matchingList);
					}
				}
				if(search1 == true && search2 == true) {
					System.out.println("검색 키워드 성명 O 보호자명 O 휴대폰번호 X");
					matchingList.add(vo2);
					String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
					String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
					String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
					String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
					String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
					String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
					String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
					
					// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
					vo2.setCs_data_01(decryptedCs_data_01);
					vo2.setCs_data_06(decryptedCs_data_06);
					vo2.setCs_data_07(decryptedCs_data_07);
					vo2.setCs_data_10(decryptedCs_data_10);
					vo2.setCs_data_12(decryptedCs_data_12);
					vo2.setCs_data_15(decryptedCs_data_15);
					vo2.setCs_data_29(decryptedCs_data_29);
					mav.addObject("matchingList", matchingList);
				}
			} else if(!keyword1.isEmpty() && !keyword2.isEmpty() && !keyword3.isEmpty()) {
				if(search1 == true && search2 == true && search3 == true) {
					System.out.println("검색키워드 성명O 보호자명 O 휴대폰 번호 O");
					matchingList.add(vo2);
					String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
					String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
					String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
					String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
					String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
					String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
					String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
					
					// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
					vo2.setCs_data_01(decryptedCs_data_01);
					vo2.setCs_data_06(decryptedCs_data_06);
					vo2.setCs_data_07(decryptedCs_data_07);
					vo2.setCs_data_10(decryptedCs_data_10);
					vo2.setCs_data_12(decryptedCs_data_12);
					vo2.setCs_data_15(decryptedCs_data_15);
					vo2.setCs_data_29(decryptedCs_data_29);
					
					mav.addObject("matchingList", matchingList);
					
				}
			
			}
		
		
		}
		mav.addObject("keyword1", keyword1);
		mav.addObject("keyword2", keyword2);
		mav.addObject("keyword3", keyword3);
		
		mav.setViewName("hwt/CounselList");
		
		return mav;
	}
	
	
	@RequestMapping(value = "WrittenModify/{cs_idx}")
	public ModelAndView writtenModify(ModelAndView mav, HttpSession session, 
			@PathVariable(name="cs_idx")Integer cs_idx ) throws Exception{
		System.out.println("written oath 페이지");
		System.out.println("cs_idx : "+cs_idx);
		session.getAttribute("loginmember");
		if(session.getAttribute("loginmember") != null) {
			int idx = (int) session.getAttribute("idx");
			System.out.println(session.getAttribute("loginmember"));
			System.out.println(session.getAttribute("idx"));
			mav.addObject("info", hwtService.info(idx));
		}
		
		System.out.println("########################");
		System.out.println(hwtService.selectone(cs_idx));
		System.out.println("########################");
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		// 256 오류로 인해서 128으로 변경
//		AES256Util aes256 = new AES256Util();
		// DB데이터 복호화
		// 이상한 오류가 뜨는 이유는 암호화된 데이터가 한개라도 없을 경우 오류가 발생한다.(암호화가 되어있는 데이터와 암호화가 되어있지 않은 데이터가 공존할 경우)
		
		String decryptedCs_data_01 = aes128.decrypt(hwtService.selectone(cs_idx).getCs_data_01());
		String decryptedCs_data_06 = aes128.decrypt(hwtService.selectone(cs_idx).getCs_data_06());
		String decryptedCs_data_07 = aes128.decrypt(hwtService.selectone(cs_idx).getCs_data_07());
		String decryptedCs_data_10 = aes128.decrypt(hwtService.selectone(cs_idx).getCs_data_10());
		String decryptedCs_data_12 = aes128.decrypt(hwtService.selectone(cs_idx).getCs_data_12());
		String decryptedCs_data_15 = aes128.decrypt(hwtService.selectone(cs_idx).getCs_data_15());
		String decryptedCs_data_29 = aes128.decrypt(hwtService.selectone(cs_idx).getCs_data_29());
		
		mav.addObject("decryptedCs_data_01",decryptedCs_data_01);
		mav.addObject("decryptedCs_data_06",decryptedCs_data_06);
		mav.addObject("decryptedCs_data_07",decryptedCs_data_07);
		mav.addObject("decryptedCs_data_10",decryptedCs_data_10);
		mav.addObject("decryptedCs_data_12",decryptedCs_data_12);
		mav.addObject("decryptedCs_data_15",decryptedCs_data_15);
		mav.addObject("decryptedCs_data_29",decryptedCs_data_29);
		mav.addObject("cs_data_04", hwtService.selectone(cs_idx).getCs_data_04());
		mav.addObject("vo", hwtService.selectone(cs_idx));
		mav.addObject("cs_idx", cs_idx);
	
   
		
		
		
		mav.setViewName("hwt/WrittenModify");
		return mav;
	}
	@RequestMapping(value = "WrittenModifyAction")
	public String writtenModifyAction(ModelAndView mav, HttpSession session, WrittenVo vo) throws Exception{
		// 암호화
		// 256 오류로 인해서 128으로 변경
		//AES256Util aes256 = new AES256Util();
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		session.getAttribute("loginmember");
		if(session.getAttribute("loginmember") != null) {
			int idx = (int) session.getAttribute("idx");
			System.out.println(session.getAttribute("loginmember"));
			System.out.println(session.getAttribute("idx"));
			mav.addObject("info", hwtService.info(idx));
		}
		
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
		
		hwtService.modify(vo);
		
		
		return "redirect:/hwt/CounselList";
	}
	
	
	
	@RequestMapping(value="CounselList2")
	public ModelAndView List2(ModelAndView mav, HttpSession session, Criteria cri, WrittenVo vo) throws Exception {
		System.out.println("cri = " + cri);
		System.out.println("####################type1 : "+cri.getType1());
		System.out.println("####################keyword1 : "+cri.getKeyword1());
		System.out.println("####################type2 : "+cri.getType2());
		System.out.println("####################keyword2 : "+cri.getKeyword2());
		System.out.println("####################type3 : "+cri.getType3());
		System.out.println("####################keyword3 : "+cri.getKeyword3());
		session.getAttribute("loginmember");
		if(session.getAttribute("loginmember") != null) {
			int idx = (int) session.getAttribute("idx");
			System.out.println(session.getAttribute("loginmember"));
			System.out.println(session.getAttribute("idx"));
			mav.addObject("info", hwtService.info(idx));
		}
		
		// 256 오류로 인해 128으로 변경
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
//		AES256Util aes256 = new AES256Util();
		
		int Cnt = hwtService.Cnt(cri);

		Paging pageMaker = new Paging(); 
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(Cnt);
		System.out.println(Cnt);
		System.out.println(pageMaker.getStartPage());
		
		System.out.println(pageMaker.getEndPage());
//		String keyword1check = keyword1;
//		String keyword2check = keyword2;
//		String keyword3check = keyword3;
		// 빈 문자열 null으로 설정
//		if(keyword1.isEmpty()) {
//			keyword1check = "null";
//		}
//		if(keyword2.isEmpty()) {
//			keyword2check = "null";
//		}
//		if(keyword3.isEmpty()) {
//			keyword3check = "null";
//		}
//		
//		System.out.println("keyword1check : " + keyword1check);
//		System.out.println("keyword2check : " + keyword2check);
//		System.out.println("keyword3check : " + keyword3check);
//		List<Map<String, Object>> cslist = hwtService.listsearch(cri);
//		List<Map<String, Object>> cslist = hwtService.listsearch2(cri);
//		List<Map<String,Object>> cslist = hwtService.list2(cri);
		List<WrittenVo> cslist = hwtService.listsearch2(cri);
///		List<WrittenVo> matchingList = new ArrayList<>();
		// DB데이터 복호화
		// 이상한 오류가 뜨는 이유는 암호화된 데이터가 한개라도 없을 경우 오류가 발생한다.(암호화가 되어있는 데이터와 암호화가 되어있지 않은 데이터가 공존할 경우)
		for (WrittenVo vo1 : cslist) {
			String decryptedCs_data_01 = aes128.decrypt(((WrittenVo) vo1).getCs_data_01());
			String decryptedCs_data_06 = aes128.decrypt(((WrittenVo) vo1).getCs_data_06());
			String decryptedCs_data_07 = aes128.decrypt(((WrittenVo) vo1).getCs_data_07());
			String decryptedCs_data_10 = aes128.decrypt(((WrittenVo) vo1).getCs_data_10());
			String decryptedCs_data_12 = aes128.decrypt(((WrittenVo) vo1).getCs_data_12());
			String decryptedCs_data_15 = aes128.decrypt(((WrittenVo) vo1).getCs_data_15());
			String decryptedCs_data_29 = aes128.decrypt(((WrittenVo) vo1).getCs_data_29());
			
			// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
			((WrittenVo) vo1).setCs_data_01(decryptedCs_data_01);
			((WrittenVo) vo1).setCs_data_06(decryptedCs_data_06);
			((WrittenVo) vo1).setCs_data_07(decryptedCs_data_07);
			((WrittenVo) vo1).setCs_data_10(decryptedCs_data_10);
			((WrittenVo) vo1).setCs_data_12(decryptedCs_data_12);
			((WrittenVo) vo1).setCs_data_15(decryptedCs_data_15);
			((WrittenVo) vo1).setCs_data_29(decryptedCs_data_29);
		}
		
//		mav.addObject("keyword1", keyword1);
//		mav.addObject("keyword2", keyword2);
//		mav.addObject("keyword3", keyword3);		
		mav.addObject("pageMaker", pageMaker);
		
		mav.addObject("cslist", cslist);
		mav.addObject("keyword", "1");
		mav.setViewName("hwt/CounselList2");
		System.out.println("cslist : "+cslist);
		
		return mav;
	}
	@RequestMapping(value="CounselListSearch2")
	public ModelAndView ListSearch2(ModelAndView mav, HttpSession session, @RequestParam(value="keyword1", defaultValue="") String keyword1,
			@RequestParam(value="keyword2", defaultValue="") String keyword2,
			@RequestParam(value="keyword3", defaultValue="") String keyword3,
			@RequestParam(value="type1", defaultValue="") String type1,
			@RequestParam(value="type2", defaultValue="") String type2,
			@RequestParam(value="type3", defaultValue="") String type3,
			Criteria cri, WrittenVo vo
			) throws Exception {
		System.out.println("cri = " + cri);
		System.out.println("####################type1 : "+cri.getType1());
		System.out.println("####################keyword1 : "+cri.getKeyword1());
		System.out.println("####################type2 : "+cri.getType2());
		System.out.println("####################keyword2 : "+cri.getKeyword2());
		System.out.println("####################type3 : "+cri.getType3());
		System.out.println("####################keyword3 : "+cri.getKeyword3());
		session.getAttribute("loginmember");
		if(session.getAttribute("loginmember") != null) {
			int idx = (int) session.getAttribute("idx");
			System.out.println(session.getAttribute("loginmember"));
			System.out.println(session.getAttribute("idx"));
			mav.addObject("info", hwtService.info(idx));
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		// 256 오류로 인해 128으로 변경
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		List<WrittenVo> cslist = hwtService.listsearch(cri);
		
		// 검색어가 없을 때 전체 검색
		List<WrittenVo> cslist1 = hwtService.listsearch2(cri);
		for(WrittenVo vo1 : cslist1) {
			if(keyword1.isEmpty() && keyword2.isEmpty() && keyword3.isEmpty()) {
				// 검색어 X
				System.out.println("검색어 X");
					
				String decryptedCs_data_01 = aes128.decrypt(((WrittenVo) vo1).getCs_data_01());
				String decryptedCs_data_06 = aes128.decrypt(((WrittenVo) vo1).getCs_data_06());
				String decryptedCs_data_07 = aes128.decrypt(((WrittenVo) vo1).getCs_data_07());
				String decryptedCs_data_10 = aes128.decrypt(((WrittenVo) vo1).getCs_data_10());
				String decryptedCs_data_12 = aes128.decrypt(((WrittenVo) vo1).getCs_data_12());
				String decryptedCs_data_15 = aes128.decrypt(((WrittenVo) vo1).getCs_data_15());
				String decryptedCs_data_29 = aes128.decrypt(((WrittenVo) vo1).getCs_data_29());
				
				// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
				((WrittenVo) vo1).setCs_data_01(decryptedCs_data_01);
				((WrittenVo) vo1).setCs_data_06(decryptedCs_data_06);
				((WrittenVo) vo1).setCs_data_07(decryptedCs_data_07);
				((WrittenVo) vo1).setCs_data_10(decryptedCs_data_10);
				((WrittenVo) vo1).setCs_data_12(decryptedCs_data_12);
				((WrittenVo) vo1).setCs_data_15(decryptedCs_data_15);
				((WrittenVo) vo1).setCs_data_29(decryptedCs_data_29);
				
				int Cnt = hwtService.Cnt(cri);
				Paging pageMaker = new Paging(); 
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(Cnt);
				mav.addObject("pageMaker", pageMaker);
				mav.addObject("cslist", cslist1);
				System.out.println(cslist1);
				mav.addObject("keyword", "1");
				
			}
			
		}
		// 검색결과를 담을 list 생성
		List<WrittenVo> matchingList = new ArrayList<>();
		String keyword1check = keyword1;
		String keyword2check = keyword2;
		String keyword3check = keyword3;
		// 빈 문자열 null으로 설정
		if(keyword1.isEmpty()) {
			keyword1check = "null";
		}
		if(keyword2.isEmpty()) {
			keyword2check = "null";
		}
		if(keyword3.isEmpty()) {
			keyword3check = "null";
		}
		
		System.out.println("keyword1check : " + keyword1check);
		System.out.println("keyword2check : " + keyword2check);
		System.out.println("keyword3check : " + keyword3check);
		// DB데이터 복호화
		// 이상한 오류가 뜨는 이유는 암호화된 데이터가 한개라도 없을 경우 오류가 발생한다.(암호화가 되어있는 데이터와 암호화가 되어있지 않은 데이터가 공존할 경우)
		
		
		for(WrittenVo vo2 : cslist) {
			// 성명 가져오기
			String str1 = vo2.getCs_data_01();
			System.out.println("str1 : "+ str1);
			// 주보호자성명 가져오기
			String str2 = vo2.getCs_data_07();
			System.out.println("str2 : "+str2);
			// 휴대폰번호 가져오기
			String str3 = vo2.getCs_data_06();
			System.out.println("str3 : "+str3);
			
			// 성명 복호화
			String text1 = aes128.decrypt(str1);
			System.out.println("text1 : "+text1);
			// 주보호자 성명 복호화
			String text2 = aes128.decrypt(str2);
			System.out.println("text2 : " +text2);
			// 휴대폰번호 복호화
			String text3 = aes128.decrypt(str3);
			System.out.println("text3 : "+text3);
			
			// 키워드가 포함된 문자열 이면 true
			
			boolean search1 = aes128.decrypt(str1).contains(keyword1check);
			System.out.println("search1 : "+ search1);
			System.out.println( "");
			
			boolean search2 = aes128.decrypt(str2).contains(keyword2check);
			System.out.println("search2 : "+ search2);
			System.out.println( "");
			
			boolean search3 = aes128.decrypt(str3).contains(keyword3check);
			System.out.println("search3 : "+ search3);
			System.out.println( "");
			if(keyword1.isEmpty()) {// 검색 키워드 성명 X 보호자명 O 휴대폰 번호 O
				System.out.println("검색 키워드 성명 X 보호자명 O 휴대폰 번호 O");
				
				if(keyword2.isEmpty()) {// 검색 키워드 성명 X 보호자명 O 휴대폰 번호 X
					if(search3 == true) {
						System.out.println("검색 키워드 성명 X 보호자명 O 휴대폰 번호 X");
						matchingList.add(vo2);
						String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
						String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
						String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
						String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
						String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
						String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
						String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
						
						// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
						vo2.setCs_data_01(decryptedCs_data_01);
						vo2.setCs_data_06(decryptedCs_data_06);
						vo2.setCs_data_07(decryptedCs_data_07);
						vo2.setCs_data_10(decryptedCs_data_10);
						vo2.setCs_data_12(decryptedCs_data_12);
						vo2.setCs_data_15(decryptedCs_data_15);
						vo2.setCs_data_29(decryptedCs_data_29);
						mav.addObject("matchingList", matchingList);
					}
				}
				else if (keyword3.isEmpty()) {// 검색 키워드 성명 X 보호자명 O 휴대폰 번호 X
					
					if(search2 == true) {
						System.out.println("검색 키워드 성명 X 보호자명 O 휴대폰 번호 X");
						matchingList.add(vo2);
						String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
						String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
						String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
						String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
						String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
						String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
						String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
						
						// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
						vo2.setCs_data_01(decryptedCs_data_01);
						vo2.setCs_data_06(decryptedCs_data_06);
						vo2.setCs_data_07(decryptedCs_data_07);
						vo2.setCs_data_10(decryptedCs_data_10);
						vo2.setCs_data_12(decryptedCs_data_12);
						vo2.setCs_data_15(decryptedCs_data_15);
						vo2.setCs_data_29(decryptedCs_data_29);
						mav.addObject("matchingList", matchingList);
					}
				}
				if(search2 == true && search3 == true) {
					System.out.println("검색 키워드 성명 X 보호자명 O 휴대폰 번호 O");
					matchingList.add(vo2);
					String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
					String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
					String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
					String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
					String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
					String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
					String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
					
					// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
					vo2.setCs_data_01(decryptedCs_data_01);
					vo2.setCs_data_06(decryptedCs_data_06);
					vo2.setCs_data_07(decryptedCs_data_07);
					vo2.setCs_data_10(decryptedCs_data_10);
					vo2.setCs_data_12(decryptedCs_data_12);
					vo2.setCs_data_15(decryptedCs_data_15);
					vo2.setCs_data_29(decryptedCs_data_29);
					mav.addObject("matchingList", matchingList);
				}
				
			
			}else if(keyword2.isEmpty()) {// 검색 키워드 성명 O 보호자명 X 휴대폰 번호 O
				System.out.println("검색 키워드 성명 O 보호자명 X 휴대폰 번호 O");
				// 검색 키워드 성명 O 보호자명 X 휴대폰번호 X
				if(keyword3.isEmpty()) {
					if(search1 == true) {
						System.out.println("검색 키워드 성명 O 보호자명 X 휴대폰번호 X");
						matchingList.add(vo2);
						String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
						String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
						String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
						String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
						String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
						String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
						String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
						
						// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
						vo2.setCs_data_01(decryptedCs_data_01);
						vo2.setCs_data_06(decryptedCs_data_06);
						vo2.setCs_data_07(decryptedCs_data_07);
						vo2.setCs_data_10(decryptedCs_data_10);
						vo2.setCs_data_12(decryptedCs_data_12);
						vo2.setCs_data_15(decryptedCs_data_15);
						vo2.setCs_data_29(decryptedCs_data_29);
						mav.addObject("matchingList", matchingList);
					}
					
				}else if(keyword1.isEmpty()) {// 검색 키워드 성명 X 보호자명 X 휴대폰번호 O
					if(search3 == true) {
						System.out.println("검색 키워드 성명 X 보호자명 X 휴대폰번호 O");
						matchingList.add(vo2);
						String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
						String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
						String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
						String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
						String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
						String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
						String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
						
						// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
						vo2.setCs_data_01(decryptedCs_data_01);
						vo2.setCs_data_06(decryptedCs_data_06);
						vo2.setCs_data_07(decryptedCs_data_07);
						vo2.setCs_data_10(decryptedCs_data_10);
						vo2.setCs_data_12(decryptedCs_data_12);
						vo2.setCs_data_15(decryptedCs_data_15);
						vo2.setCs_data_29(decryptedCs_data_29);
						mav.addObject("matchingList", matchingList);
					}
				}
				
				if(search1 == true && search3 == true) {
					System.out.println("검색 키워드 성명 O 보호자명 X 휴대폰 번호 O");
					matchingList.add(vo2);
					String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
					String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
					String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
					String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
					String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
					String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
					String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
					
					// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
					vo2.setCs_data_01(decryptedCs_data_01);
					vo2.setCs_data_06(decryptedCs_data_06);
					vo2.setCs_data_07(decryptedCs_data_07);
					vo2.setCs_data_10(decryptedCs_data_10);
					vo2.setCs_data_12(decryptedCs_data_12);
					vo2.setCs_data_15(decryptedCs_data_15);
					vo2.setCs_data_29(decryptedCs_data_29);
					mav.addObject("matchingList", matchingList);
				}
				
			}	
			else if(keyword3.isEmpty()) {// 검색 키워드 성명 O 보호자명 O 휴대폰번호 X
				System.out.println("검색 키워드 성명 O 보호자명 O 휴대폰번호 X");
				// 검색 키워드 성명 X 보호자명 O 휴대폰번호 X
				if(keyword1.isEmpty()) {
					if(search2 == true) {
						System.out.println("검색 키워드 성명 X 보호자명 O 휴대폰번호 X");
						matchingList.add(vo2);
						String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
						String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
						String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
						String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
						String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
						String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
						String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
						
						// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
						vo2.setCs_data_01(decryptedCs_data_01);
						vo2.setCs_data_06(decryptedCs_data_06);
						vo2.setCs_data_07(decryptedCs_data_07);
						vo2.setCs_data_10(decryptedCs_data_10);
						vo2.setCs_data_12(decryptedCs_data_12);
						vo2.setCs_data_15(decryptedCs_data_15);
						vo2.setCs_data_29(decryptedCs_data_29);
						mav.addObject("matchingList", matchingList);
					}
					
				}else if(keyword2.isEmpty()) {// 검색키워드 성명O 보호자명 X 휴대폰 번호 X
					if(search1 == true) {
						System.out.println("검색키워드 성명O 보호자명 X 휴대폰 번호 X");
						matchingList.add(vo2);
						String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
						String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
						String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
						String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
						String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
						String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
						String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
						
						// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
						vo2.setCs_data_01(decryptedCs_data_01);
						vo2.setCs_data_06(decryptedCs_data_06);
						vo2.setCs_data_07(decryptedCs_data_07);
						vo2.setCs_data_10(decryptedCs_data_10);
						vo2.setCs_data_12(decryptedCs_data_12);
						vo2.setCs_data_15(decryptedCs_data_15);
						vo2.setCs_data_29(decryptedCs_data_29);
						mav.addObject("matchingList", matchingList);
					}
				}
				if(search1 == true && search2 == true) {
					System.out.println("검색 키워드 성명 O 보호자명 O 휴대폰번호 X");
					matchingList.add(vo2);
					String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
					String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
					String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
					String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
					String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
					String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
					String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
					
					// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
					vo2.setCs_data_01(decryptedCs_data_01);
					vo2.setCs_data_06(decryptedCs_data_06);
					vo2.setCs_data_07(decryptedCs_data_07);
					vo2.setCs_data_10(decryptedCs_data_10);
					vo2.setCs_data_12(decryptedCs_data_12);
					vo2.setCs_data_15(decryptedCs_data_15);
					vo2.setCs_data_29(decryptedCs_data_29);
					mav.addObject("matchingList", matchingList);
				}
			} else if(!keyword1.isEmpty() && !keyword2.isEmpty() && !keyword3.isEmpty()) {
				if(search1 == true && search2 == true && search3 == true) {
					System.out.println("검색키워드 성명O 보호자명 O 휴대폰 번호 O");
					matchingList.add(vo2);
					String decryptedCs_data_01 = aes128.decrypt(vo2.getCs_data_01());
					String decryptedCs_data_06 = aes128.decrypt(vo2.getCs_data_06());
					String decryptedCs_data_07 = aes128.decrypt(vo2.getCs_data_07());
					String decryptedCs_data_10 = aes128.decrypt(vo2.getCs_data_10());
					String decryptedCs_data_12 = aes128.decrypt(vo2.getCs_data_12());
					String decryptedCs_data_15 = aes128.decrypt(vo2.getCs_data_15());
					String decryptedCs_data_29 = aes128.decrypt(vo2.getCs_data_29());
					
					// 리스트로 뽑기 위해서 꼭 필요한 코드 없으면 리스트로 출력이 안되고 동일한 데이터가 출력된다.
					vo2.setCs_data_01(decryptedCs_data_01);
					vo2.setCs_data_06(decryptedCs_data_06);
					vo2.setCs_data_07(decryptedCs_data_07);
					vo2.setCs_data_10(decryptedCs_data_10);
					vo2.setCs_data_12(decryptedCs_data_12);
					vo2.setCs_data_15(decryptedCs_data_15);
					vo2.setCs_data_29(decryptedCs_data_29);
					
					mav.addObject("matchingList", matchingList);
					
				}
			
			}
		
		
		}
		mav.addObject("keyword1", keyword1);
		mav.addObject("keyword2", keyword2);
		mav.addObject("keyword3", keyword3);
		
		mav.setViewName("hwt/CounselList2");
		
		return mav;
	}
	
	
	@RequestMapping(value = "WrittenModify2/{cs_idx}")
	public ModelAndView writtenModify2(ModelAndView mav, HttpSession session, 
			@PathVariable(name="cs_idx")Integer cs_idx ) throws Exception{
		System.out.println("written oath 페이지");
		System.out.println("cs_idx : "+cs_idx);
		session.getAttribute("loginmember");
		if(session.getAttribute("loginmember") != null) {
			int idx = (int) session.getAttribute("idx");
			System.out.println(session.getAttribute("loginmember"));
			System.out.println(session.getAttribute("idx"));
			mav.addObject("info", hwtService.info(idx));
		}
		
		System.out.println("########################");
		System.out.println(hwtService.selectone(cs_idx));
		System.out.println("########################");
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		// 256 오류로 인해서 128으로 변경
//		AES256Util aes256 = new AES256Util();
		// DB데이터 복호화
		// 이상한 오류가 뜨는 이유는 암호화된 데이터가 한개라도 없을 경우 오류가 발생한다.(암호화가 되어있는 데이터와 암호화가 되어있지 않은 데이터가 공존할 경우)
		
		String decryptedCs_data_01 = aes128.decrypt(hwtService.selectone(cs_idx).getCs_data_01());
		String decryptedCs_data_06 = aes128.decrypt(hwtService.selectone(cs_idx).getCs_data_06());
		String decryptedCs_data_07 = aes128.decrypt(hwtService.selectone(cs_idx).getCs_data_07());
		String decryptedCs_data_10 = aes128.decrypt(hwtService.selectone(cs_idx).getCs_data_10());
		String decryptedCs_data_12 = aes128.decrypt(hwtService.selectone(cs_idx).getCs_data_12());
		String decryptedCs_data_15 = aes128.decrypt(hwtService.selectone(cs_idx).getCs_data_15());
		String decryptedCs_data_29 = aes128.decrypt(hwtService.selectone(cs_idx).getCs_data_29());
		
		mav.addObject("decryptedCs_data_01",decryptedCs_data_01);
		mav.addObject("decryptedCs_data_06",decryptedCs_data_06);
		mav.addObject("decryptedCs_data_07",decryptedCs_data_07);
		mav.addObject("decryptedCs_data_10",decryptedCs_data_10);
		mav.addObject("decryptedCs_data_12",decryptedCs_data_12);
		mav.addObject("decryptedCs_data_15",decryptedCs_data_15);
		mav.addObject("decryptedCs_data_29",decryptedCs_data_29);
		mav.addObject("cs_data_04", hwtService.selectone(cs_idx).getCs_data_04());
		mav.addObject("vo", hwtService.selectone(cs_idx));
		mav.addObject("cs_idx", cs_idx);
	
   
		
		
		
		mav.setViewName("hwt/WrittenModify2");
		return mav;
	}
	@RequestMapping(value = "WrittenModifyAction2")
	public String writtenModifyAction2(ModelAndView mav, HttpSession session, WrittenVo vo) throws Exception{
		// 암호화
		// 256 오류로 인해서 128으로 변경
		//AES256Util aes256 = new AES256Util();
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		session.getAttribute("loginmember");
		if(session.getAttribute("loginmember") != null) {
			int idx = (int) session.getAttribute("idx");
			System.out.println(session.getAttribute("loginmember"));
			System.out.println(session.getAttribute("idx"));
			mav.addObject("info", hwtService.info(idx));
		}
		
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
		
		hwtService.modify(vo);
		
		
		return "redirect:/hwt/CounselList2";
	}
	

	@RequestMapping(value="admin")
	public ModelAndView admin(HttpSession session, ModelAndView mv, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		List<UsersVo> list = hwtService.users(map);
		session.getAttribute("loginmember");
		if(session.getAttribute("loginmember") != null) {
			int idx = (int) session.getAttribute("idx");
			System.out.println(session.getAttribute("loginmember"));
			System.out.println(session.getAttribute("idx"));
			mv.addObject("info", hwtService.info(idx));
		}
		
		
		int hspt1 = hwtService.hsptselect1(map);

		int hsptpwdselect1 = hwtService.hsptpwdselect1(map);
		
		mv.addObject("users", list);
		request.setAttribute("users", list);
		
		
		mv.addObject("h1", hspt1);
		mv.addObject("p1", hsptpwdselect1);
		request.setAttribute("h1", hspt1);
		request.setAttribute("p1", hsptpwdselect1);
		
		mv.setViewName("hwt/admin");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="pwdreset/{id}")
	public AjaxResponse6 demopwdreset(HttpSession session, HttpServletRequest request, @PathVariable(name="id") int id) throws Exception {
		System.out.println("비밀번호 초기화.... 대상 : "+id);
		AjaxResponse6 response = new AjaxResponse6();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		int flag = hwtService.pwdreset(map);
		
		if(flag == 1) {
			response.setResult("Y");
			return response;
		}else {
			response.setResult("N");
			return response;
		}
	}

	@ResponseBody
	@RequestMapping(value="setting")
	public AjaxResponse20 setting(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse20 response = new AjaxResponse20();
		response.setResult("Y");		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<UsersVo> list = hwtService.setting(map);
		List<UsersVo> listall = hwtService.accessAll(map);
		response.setUsers(list);
		response.setAccessAll(listall);
		
		return response;
	}
	@ResponseBody
	@RequestMapping(value="setting__insert")
	public AjaxResponse20 setting__insert(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse20 response = new AjaxResponse20();
		response.setResult("Y");		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<UsersVo> list = hwtService.setting(map);
		List<UsersVo> listall = hwtService.accessAll(map);
		response.setUsers(list);
		response.setAccessAll(listall);
		
		return response;
	
	}
	
	@ResponseBody
	@RequestMapping(value="setting__delete")
	public AjaxResponse20 setting__delete(HttpSession session, HttpServletRequest request) throws Exception {
		AjaxResponse20 response = new AjaxResponse20();
		response.setResult("Y");		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<UsersVo> list = hwtService.setting(map);
		List<UsersVo> listall = hwtService.accessAll(map);
		response.setUsers(list);
		response.setAccessAll(listall);
		
		return response;
	}
}
