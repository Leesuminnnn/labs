package com.nnn.app.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.CanvasService;
import com.nnn.app.service.ImageService;
import com.nnn.app.service.MemberService;
import com.nnn.app.service.PointplusService;
import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.ImageEntity;
import com.nnn.app.vo.Paging;
import com.nnn.app.vo.WrittenVo;
import com.sun.xml.internal.ws.api.pipe.NextAction;

@Controller
@RequestMapping(value = "c/*")
public class CanvasController {
	
	private MemberService memberService;
	private PointplusService pointplusService;
	private CanvasService canvasService;
	private AES256Util aes;
	private ImageService imageService;
	
	@Autowired
	public CanvasController(MemberService memberService, PointplusService pointplusService, CanvasService canvasService, AES256Util aes, ImageService imageService) {
		this.memberService = memberService;
		this.pointplusService = pointplusService;
		this.canvasService = canvasService;
		this.aes = aes;
		this.imageService = imageService;
	}
	
	
	@RequestMapping(value = "/WrittenView.do/{cs_idx}", method = RequestMethod.GET, produces = MediaType.IMAGE_PNG_VALUE)
	@ResponseBody
	public void WrittenView(@PathVariable("cs_idx") Integer cs_idx, HttpSession session, HttpServletResponse response, ImageEntity image) throws IOException {
		System.out.println("WrittenView 페이지");

		System.out.println("cs_idx : "+cs_idx);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cs_idx", cs_idx);
		ImageEntity img = imageService.getImageData(map);
		// ImageEntity 객체에서 이미지 데이터를 바이트 배열 형태로 가져옵니다.
		byte[] imageData = img.getImageData();
		//가져온 이미지 데이터를 Base64 디코딩하여 바이트 배열 형태로 변환합니다.
		byte[] decodedImageData = Base64.getDecoder().decode(imageData);
		
		// 이미지 출력
		//response 객체의 setContentType() 메서드를 호출하여 이미지의 MIME 타입을 MediaType.IMAGE_PNG_VALUE로 설정합니다.
	    response.setContentType(MediaType.IMAGE_PNG_VALUE);
	    //response 객체의 getOutputStream() 메서드를 호출하여 출력 스트림을 가져옵니다.
	    OutputStream outputStream = response.getOutputStream();
	    //outputStream을 이용하여 이미지를 출력합니다.
	    outputStream.write(decodedImageData);
	    //outputStream 객체를 닫습니다.
	    outputStream.flush();
	    outputStream.close();
	    //즉, 해당 메서드는 idx 값을 이용해 이미지 데이터를 조회하고, Base64 디코딩하여 이미지를 출력하는 역할을 합니다. 이 메서드를 호출하면 해당 idx 값을 가진 이미지가 화면에 출력됩니다.
	    
	 // Add an img tag with a back function
	    String backUrl = "<a href='${pageContext.request.contextPath}/c/CounselList.do'><img src='${pageContext.request.contextPath}/resources/icon/arrow2.png' alt='Image' /></a>";

	    // Print the backUrl
	    System.out.println("backUrl: " + backUrl);
	}
	
	
	
	
	
	@RequestMapping(value = "Canvas.do")
	public ModelAndView canvas(ModelAndView mav, HttpSession session) throws Exception{

		System.out.println("canvas 페이지");
		
		mav.setViewName("c/Canvas");
		return mav;
	}

	
	@RequestMapping(value = "Written.do")
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
		
		mav.setViewName("c/Written");
		return mav;
	}
	@RequestMapping(value = "Written2.do")
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
		
		mav.setViewName("c/Written2");
		return mav;
	}
	@RequestMapping(value = "WrittenAction.do")
	public String writtenAction(ModelAndView mav, HttpSession session, WrittenVo vo, HttpServletRequest request, HttpServletResponse response) throws Exception{
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
		
		canvasService.insert(vo);
		return "redirect:/c/CounselList.do";
	}
	
	@RequestMapping(value = "Written0.do")
	public ModelAndView written1(ModelAndView mav) {
		System.out.println("written oath 페이지");
		
		mav.setViewName("c/Written");
		return mav;
	}

	@RequestMapping(value="CounselList.do")
	public ModelAndView List(ModelAndView mav, Criteria cri, WrittenVo vo) throws Exception {
		System.out.println("cri = " + cri);
		System.out.println("####################type1 : "+cri.getType1());
		System.out.println("####################keyword1 : "+cri.getKeyword1());
		System.out.println("####################type2 : "+cri.getType2());
		System.out.println("####################keyword2 : "+cri.getKeyword2());
		System.out.println("####################type3 : "+cri.getType3());
		System.out.println("####################keyword3 : "+cri.getKeyword3());
		
		// 256 오류로 인해 128으로 변경
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
//		AES256Util aes256 = new AES256Util();
		
		int Cnt = canvasService.Cnt(cri);

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
//		List<Map<String, Object>> cslist = canvasService.listsearch(cri);
//		List<Map<String, Object>> cslist = canvasService.listsearch2(cri);
//		List<Map<String,Object>> cslist = canvasService.list2(cri);
		List<WrittenVo> cslist = canvasService.listsearch2(cri);
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
		mav.setViewName("c/CounselList");
		System.out.println("cslist : "+cslist);
		
		return mav;
	}
	@RequestMapping(value="CounselListSearch.do")
	public ModelAndView ListSearch(ModelAndView mav, @RequestParam(value="keyword1", defaultValue="") String keyword1,
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
		
		Map<String, Object> map = new HashMap<String, Object>();
		// 256 오류로 인해 128으로 변경
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		List<WrittenVo> cslist = canvasService.listsearch(cri);
		
		// 검색어가 없을 때 전체 검색
		List<WrittenVo> cslist1 = canvasService.listsearch2(cri);
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
				
				int Cnt = canvasService.Cnt(cri);
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
		
		mav.setViewName("c/CounselList");
		
		return mav;
	}
	
	
	@RequestMapping(value = "WrittenModify.do/{cs_idx}")
	public ModelAndView writtenModify(ModelAndView mav, HttpSession session, 
			@PathVariable(name="cs_idx")Integer cs_idx ) throws Exception{
		System.out.println("written oath 페이지");
		System.out.println("cs_idx : "+cs_idx);
		
		System.out.println("########################");
		System.out.println(canvasService.selectone(cs_idx));
		System.out.println("########################");
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		// 256 오류로 인해서 128으로 변경
//		AES256Util aes256 = new AES256Util();
		// DB데이터 복호화
		// 이상한 오류가 뜨는 이유는 암호화된 데이터가 한개라도 없을 경우 오류가 발생한다.(암호화가 되어있는 데이터와 암호화가 되어있지 않은 데이터가 공존할 경우)
		
		String decryptedCs_data_01 = aes128.decrypt(canvasService.selectone(cs_idx).getCs_data_01());
		String decryptedCs_data_06 = aes128.decrypt(canvasService.selectone(cs_idx).getCs_data_06());
		String decryptedCs_data_07 = aes128.decrypt(canvasService.selectone(cs_idx).getCs_data_07());
		String decryptedCs_data_10 = aes128.decrypt(canvasService.selectone(cs_idx).getCs_data_10());
		String decryptedCs_data_12 = aes128.decrypt(canvasService.selectone(cs_idx).getCs_data_12());
		String decryptedCs_data_15 = aes128.decrypt(canvasService.selectone(cs_idx).getCs_data_15());
		String decryptedCs_data_29 = aes128.decrypt(canvasService.selectone(cs_idx).getCs_data_29());
		
		mav.addObject("decryptedCs_data_01",decryptedCs_data_01);
		mav.addObject("decryptedCs_data_06",decryptedCs_data_06);
		mav.addObject("decryptedCs_data_07",decryptedCs_data_07);
		mav.addObject("decryptedCs_data_10",decryptedCs_data_10);
		mav.addObject("decryptedCs_data_12",decryptedCs_data_12);
		mav.addObject("decryptedCs_data_15",decryptedCs_data_15);
		mav.addObject("decryptedCs_data_29",decryptedCs_data_29);
		mav.addObject("cs_data_04", canvasService.selectone(cs_idx).getCs_data_04());
		mav.addObject("vo", canvasService.selectone(cs_idx));
		mav.addObject("cs_idx", cs_idx);
	
   
		
		
		
		mav.setViewName("c/WrittenModify");
		return mav;
	}
	@RequestMapping(value = "WrittenModifyAction.do")
	public String writtenModifyAction(ModelAndView mav, HttpSession session, WrittenVo vo) throws Exception{
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
		
		canvasService.modify(vo);
		
		
		return "redirect:/c/CounselList.do";
	}
	
	
	
	@RequestMapping(value="CounselList2.do")
	public ModelAndView List2(ModelAndView mav, Criteria cri, WrittenVo vo) throws Exception {
		System.out.println("cri = " + cri);
		System.out.println("####################type1 : "+cri.getType1());
		System.out.println("####################keyword1 : "+cri.getKeyword1());
		System.out.println("####################type2 : "+cri.getType2());
		System.out.println("####################keyword2 : "+cri.getKeyword2());
		System.out.println("####################type3 : "+cri.getType3());
		System.out.println("####################keyword3 : "+cri.getKeyword3());
		
		// 256 오류로 인해 128으로 변경
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
//		AES256Util aes256 = new AES256Util();
		
		int Cnt = canvasService.Cnt(cri);

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
//		List<Map<String, Object>> cslist = canvasService.listsearch(cri);
//		List<Map<String, Object>> cslist = canvasService.listsearch2(cri);
//		List<Map<String,Object>> cslist = canvasService.list2(cri);
		List<WrittenVo> cslist = canvasService.listsearch2(cri);
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
		mav.setViewName("c/CounselList2");
		System.out.println("cslist : "+cslist);
		
		return mav;
	}
	@RequestMapping(value="CounselListSearch2.do")
	public ModelAndView ListSearch2(ModelAndView mav, @RequestParam(value="keyword1", defaultValue="") String keyword1,
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
		
		Map<String, Object> map = new HashMap<String, Object>();
		// 256 오류로 인해 128으로 변경
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		List<WrittenVo> cslist = canvasService.listsearch(cri);
		
		// 검색어가 없을 때 전체 검색
		List<WrittenVo> cslist1 = canvasService.listsearch2(cri);
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
				
				int Cnt = canvasService.Cnt(cri);
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
		
		mav.setViewName("c/CounselList2");
		
		return mav;
	}
	
	
	@RequestMapping(value = "WrittenModify2.do/{cs_idx}")
	public ModelAndView writtenModify2(ModelAndView mav, HttpSession session, 
			@PathVariable(name="cs_idx")Integer cs_idx ) throws Exception{
		System.out.println("written oath 페이지");
		System.out.println("cs_idx : "+cs_idx);
		
		System.out.println("########################");
		System.out.println(canvasService.selectone(cs_idx));
		System.out.println("########################");
		String key = "This is Key!!!!!";
		AES128 aes128 = new AES128(key);
		// 256 오류로 인해서 128으로 변경
//		AES256Util aes256 = new AES256Util();
		// DB데이터 복호화
		// 이상한 오류가 뜨는 이유는 암호화된 데이터가 한개라도 없을 경우 오류가 발생한다.(암호화가 되어있는 데이터와 암호화가 되어있지 않은 데이터가 공존할 경우)
		
		String decryptedCs_data_01 = aes128.decrypt(canvasService.selectone(cs_idx).getCs_data_01());
		String decryptedCs_data_06 = aes128.decrypt(canvasService.selectone(cs_idx).getCs_data_06());
		String decryptedCs_data_07 = aes128.decrypt(canvasService.selectone(cs_idx).getCs_data_07());
		String decryptedCs_data_10 = aes128.decrypt(canvasService.selectone(cs_idx).getCs_data_10());
		String decryptedCs_data_12 = aes128.decrypt(canvasService.selectone(cs_idx).getCs_data_12());
		String decryptedCs_data_15 = aes128.decrypt(canvasService.selectone(cs_idx).getCs_data_15());
		String decryptedCs_data_29 = aes128.decrypt(canvasService.selectone(cs_idx).getCs_data_29());
		
		mav.addObject("decryptedCs_data_01",decryptedCs_data_01);
		mav.addObject("decryptedCs_data_06",decryptedCs_data_06);
		mav.addObject("decryptedCs_data_07",decryptedCs_data_07);
		mav.addObject("decryptedCs_data_10",decryptedCs_data_10);
		mav.addObject("decryptedCs_data_12",decryptedCs_data_12);
		mav.addObject("decryptedCs_data_15",decryptedCs_data_15);
		mav.addObject("decryptedCs_data_29",decryptedCs_data_29);
		mav.addObject("cs_data_04", canvasService.selectone(cs_idx).getCs_data_04());
		mav.addObject("vo", canvasService.selectone(cs_idx));
		mav.addObject("cs_idx", cs_idx);
	
   
		
		
		
		mav.setViewName("c/WrittenModify2");
		return mav;
	}
	@RequestMapping(value = "WrittenModifyAction2.do")
	public String writtenModifyAction2(ModelAndView mav, HttpSession session, WrittenVo vo) throws Exception{
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
		
		canvasService.modify(vo);
		
		
		return "redirect:/c/CounselList2.do";
	}
	
	

}
