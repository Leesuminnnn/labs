package com.nnn.app.service;

import java.util.ArrayList;
import java.util.List;

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
	
	public List<CalendarVo> calenList(CalendarVo calendarVo){
		return calenDao.calenList(calendarVo);
	}
	
}
