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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nnn.app.service.HelpService;
import com.nnn.app.service.ImageService;
import com.nnn.app.service.MemberService;
import com.nnn.app.service.PointService;
import com.nnn.app.service.PointplusService;
import com.nnn.app.service.TestService;
import com.nnn.app.vo.AjaxResponse;
import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.HelpVo;
import com.nnn.app.vo.Paging;
import com.nnn.app.vo.Pointdetail;
import com.nnn.app.vo.TestVo;
import com.nnn.app.vo.WrittenVo;

@Controller
@RequestMapping(value = "v/*")
public class AmbController {
	private MemberService memberService;
	
	
	@Autowired
	public AmbController(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value="Calendar.do")
	public ModelAndView calendar(ModelAndView mav) {
		
		mav.setViewName("a/Calendar");
		return mav;
	}
}
