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

	public int caleninput(Map<String, Object> map) {
		int result = 0; // 글쓰기 실패
		
		result = calenDao.caleninput(map);
		
		return result;
		
	}
	
}
