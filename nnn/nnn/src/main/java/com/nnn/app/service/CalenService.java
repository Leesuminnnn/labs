package com.nnn.app.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.CalenDao;
import com.nnn.app.vo.CalendarVo;

@Service
public class CalenService {
	
	private CalenDao calenDao;
	@Autowired
	public CalenService(CalenDao calenDao) {
		this.calenDao = calenDao;
	}
	
	public List<CalendarVo> calenList(){
		return calenDao.calenList();
	}

	public List<CalendarVo> calenlist2() {
		return calenDao.calenList2();
	}
	public int caleninput(Map<String, Object> map) {
		int result = 0; // 글쓰기 실패
		
		result = calenDao.caleninput(map);
		System.out.println("---------------------");
		System.out.println("service  ! : "+result);
		System.out.println("---------------------");
		
		return result;
		
	}

	public int calenselect(Map<String, Object> map) {
		int result = 0;
		
		result = calenDao.calenselect(map);
		System.out.println("---------------------");
		System.out.println("service  ! : "+result);
		System.out.println("---------------------");
		return result;
	}
	
	public int calendelete(Map<String, Object> map) {
		int result = 0;
		
		result = calenDao.calendelete(map);
		System.out.println("---------------------");
		System.out.println("service ! : "+result);
		System.out.println("---------------------");
		
		return result;
		
	}

	public List<CalendarVo> selectCalendar(Map<String, Object> map) {
		return calenDao.selectCalendar(map);
	}

}
