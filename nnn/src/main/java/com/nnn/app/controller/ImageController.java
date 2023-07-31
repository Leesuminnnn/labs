package com.nnn.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nnn.app.service.CanvasService;
import com.nnn.app.service.ImageService;
import com.nnn.app.vo.ImageEntity;
import com.nnn.app.vo.WrittenVo;
@Controller
public class ImageController {

	
	private ImageService imageService;
	private CanvasService canvasService;
	
	@Autowired
	public ImageController(ImageService imageService, CanvasService canvasService) {
		this.imageService = imageService; 
		this.canvasService = canvasService;
	}
	
	@RequestMapping(value = "/saveImage", method = RequestMethod.POST)
	@ResponseBody
	public String saveImage(@RequestParam("image") byte[] image, WrittenVo vo, @RequestParam("cs_idx")Integer cs_idx,
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
		imageService.saveImage(imageEntity);
		canvasService.modify(vo);
		canvasService.update(vo);
		return "Image saved successfully!";
	}
	
	
}
